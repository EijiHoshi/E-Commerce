<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Cache\RateLimiter;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ApiRateLimit
{
    protected $limiter;

    public function __construct(RateLimiter $limiter)
    {
        $this->limiter = $limiter;
    }

    public function handle(Request $request, Closure $next): Response
    {
        $key = $this->resolveRequestSignature($request);

        if ($this->limiter->tooManyAttempts($key, $this->maxAttempts())) {
            return $this->buildResponse($key);
        }

        $this->limiter->hit($key, $this->decayMinutes() * 60);

        $response = $next($request);

        return $this->addHeaders(
            $response,
            $this->maxAttempts(),
            $this->calculateRemainingAttempts($key),
            $this->decayMinutes()
        );
    }

    protected function resolveRequestSignature(Request $request): string
    {
        return sha1(implode('|', [
            $request->ip(),
            $request->user()?->id ?? 'guest',
            $request->path()
        ]));
    }

    protected function maxAttempts(): int
    {
        return 60; // 60 requests per minute
    }

    protected function decayMinutes(): int
    {
        return 1; // 1 minute
    }

    protected function buildResponse(string $key): Response
    {
        $response = response()->json([
            'message' => 'Too Many Attempts.',
            'retry_after' => $this->limiter->availableIn($key)
        ], 429);

        return $this->addHeaders(
            $response,
            $this->maxAttempts(),
            $this->calculateRemainingAttempts($key),
            $this->decayMinutes()
        );
    }

    protected function addHeaders(Response $response, int $maxAttempts, int $remainingAttempts, int $retryAfter): Response
    {
        $response->headers->add([
            'X-RateLimit-Limit' => $maxAttempts,
            'X-RateLimit-Remaining' => $remainingAttempts,
            'X-RateLimit-Reset' => $retryAfter * 60,
        ]);

        return $response;
    }

    protected function calculateRemainingAttempts(string $key): int
    {
        return $this->limiter->retriesLeft($key, $this->maxAttempts());
    }
} 
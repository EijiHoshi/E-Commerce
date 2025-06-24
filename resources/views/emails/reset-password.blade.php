<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            padding: 20px 0;
            background-color: #FFD700;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .content {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #FFD700;
            color: #000;
            text-decoration: none;
            border-radius: 25px;
            font-weight: bold;
            margin: 20px 0;
        }
        .footer {
            text-align: center;
            font-size: 12px;
            color: #666;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Reset Password</h1>
    </div>
    
    <div class="content">
        <p>Halo!</p>
        
        <p>Kami menerima permintaan untuk mereset password akun Efabli Anda. Jika Anda tidak melakukan permintaan ini, Anda dapat mengabaikan email ini.</p>
        
        <p>Untuk mereset password Anda, silakan klik tombol di bawah ini:</p>
        
        <div style="text-align: center;">
            <a href="{{ $actionUrl }}" class="button">Reset Password</a>
        </div>
        
        <p>Atau Anda dapat menyalin dan menempelkan URL berikut ke browser Anda:</p>
        <p style="word-break: break-all;">{{ $actionUrl }}</p>
        
        <p>Link reset password ini akan kadaluarsa dalam 60 menit.</p>
        
        <p>Jika Anda mengalami masalah, silakan hubungi tim dukungan kami.</p>
    </div>
    
    <div class="footer">
        <p>© {{ date('Y') }} E-Fabli. All rights reserved.</p>
        <p>Email ini dikirim secara otomatis, mohon tidak membalas email ini.</p>
    </div>
</body>
</html> 
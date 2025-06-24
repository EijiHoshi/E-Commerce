# Script download gambar produk baru (update link alternatif terbaru)
$images = @(
    @{url = 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80'; name = 'headphone-wireless.jpg' },
    @{url = 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=400&q=80'; name = 'smartwatch-fit.jpg' },
    @{url = 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80'; name = 'kamera-mirrorless.jpg' },
    @{url = 'https://images.unsplash.com/photo-1517263904808-5dc0d6a2b43c?auto=format&fit=crop&w=400&q=80'; name = 'sepatu-sneakers.jpg' },
    @{url = 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=80'; name = 'jaket-hoodie.jpg' },
    @{url = 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=400&q=80'; name = 'celana-jeans.jpg' },
    @{url = 'https://images.unsplash.com/photo-1588776814546-ec7e5e5b4b6e?auto=format&fit=crop&w=400&q=80'; name = 'masker-medis.jpg' },
    @{url = 'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80'; name = 'vitamin-c.jpg' },
    @{url = 'https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80'; name = 'alat-pijat-elektrik.jpg' },
    @{url = 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80'; name = 'blender.jpg' },
    @{url = 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80'; name = 'setrika-uap.jpg' },
    @{url = 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80'; name = 'dispenser-air.jpg' }
)

$folder = "public/images/products"
if (!(Test-Path $folder)) {
    New-Item -ItemType Directory -Path $folder | Out-Null
}

foreach ($img in $images) {
    $output = Join-Path $folder $img.name
    Invoke-WebRequest -Uri $img.url -OutFile $output
    Write-Host "Downloaded $($img.name)"
} 
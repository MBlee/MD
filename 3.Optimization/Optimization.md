## Image

```shell
# Webp/AVIF
# Srcset (Responsive)
# Lazy Loading
```

## Font

```shell
# SystemFont/Needed
# Font-display:swap
```

## CSS/JS

```shell
# PurgeCSS/Tailwind JIT
# Dynamic Import JS(Needed)
# Chrome Devtools > Coverage
```

## Cache

```shell
# Gzip/Brotli
location ~* \.(js|css|png|jpg|jpeg|gif|woff2?)$ {
    expires 1y;
    add_header Cache-Control "public";
    gzip_static on;
}
```

## Defer

```shell
# Defer/Async/Footer
- Analytics
- ChatWidgests
- Ads
```


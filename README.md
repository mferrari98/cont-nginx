# Nginx (Proxy)

Proxy reverso para el stack de servicios. Enruta trafico HTTP/HTTPS hacia los
contenedores internos.

## Configuracion
- `conf.d/sistema-guardias.conf`: rutas y upstreams.
- `ssl/`: certificados (self-signed o futuros).
- `htpasswd`: usuarios para basic auth.

## Logs
Se escriben en `/var/log/nginx` (montado en `logs/nginx` en el repo principal).

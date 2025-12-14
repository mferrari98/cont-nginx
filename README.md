# Nginx Infraestructura - Configuración del Proxy Reverso

Este repositorio contiene la configuración de Nginx utilizada como proxy reverso para el proyecto.

## 📁 Estructura

```
nginx-infra/
├── nginx/
│   ├── nginx.conf          # Configuración principal de Nginx
│   └── conf.d/
│       └── sistema-guardias.conf  # Configuración de virtual hosts
└── ssl/                    # Directorio para certificados SSL (futuro)
```

## ⚙️ Configuración

### Virtual Hosts

El archivo `conf.d/sistema-guardias.conf` define:

- **Portal Servicios** (`/`) - Aplicación React SPA
- **Sistema Guardias** (`/guardias/`) - Aplicación Flask
- **Archivos Estáticos** (`/static/`) - Servidos directamente por Nginx

### Configuración Principal

`nginx.conf` contiene:
- Worker processes y configuración básica
- Logs de acceso y error
- Inclusion de configuraciones de `conf.d/`

## 🚀 Despliegue

Esta configuración es utilizada automáticamente por el contenedor Docker definido en el repositorio `infra-docker`.

No se requiere configuración manual adicional.

## 🔧 Personalización

### Agregar Nuevo Servicio

1. Crear nuevo archivo en `conf.d/nuevo-servicio.conf`
2. Configurar location blocks para el nuevo servicio
3. Actualizar `docker-compose.yml` en `infra-docker/` para incluir el nuevo servicio

Ejemplo:
```nginx
server {
    listen 80;
    server_name _;

    location /nuevo-servicio/ {
        proxy_pass http://nuevo-servicio:3000/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## 🔒 SSL (Futuro)

Para configurar HTTPS:

1. Colocar certificados en `ssl/`
2. Modificar configuración para usar puerto 443
3. Configurar redirección HTTP → HTTPS

## 📊 Logs

Los logs de Nginx se guardan en el volumen configurado en `infra-docker/logs/nginx/`.

## 🐛 Troubleshooting

### Ver Configuración
```bash
# Verificar sintaxis
docker exec nginx-proxy nginx -t

# Ver configuración activa
docker exec nginx-proxy nginx -T
```

### Recargar Configuración
```bash
# Recargar sin downtime
docker exec nginx-proxy nginx -s reload
```
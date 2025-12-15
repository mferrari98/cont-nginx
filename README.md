# Nginx Proxy Reverso

Servidor web Nginx configurado como proxy reverso para enrutar y gestionar el tráfico entre los diferentes servicios de la infraestructura.

## ¿Qué es?
Proxy inverso basado en Nginx Alpine que distribuye el tráfico HTTP/HTTPS entrante hacia los contenedores internos de la aplicación.

## ¿Cómo funciona?
- **Proxy Reverso**: Enruta peticiones a los contenedores apropiados
- **Balanceador**: Distribuye carga entre servicios
- **Servidor Estático**: Sirve archivos estáticos directamente
- **Enrutamiento**:
  - `/` → Portal de Servicios React (cont-portal:80)
  - `/guardias/` → Sistema de Guardias Flask (cont-guardias:5000)
  - `/static/` → Archivos estáticos del sistema de guardias

Nginx escucha en los puertos 80/443 y utiliza la red interna Docker `proyectos_network` para comunicarse con los otros contenedores.
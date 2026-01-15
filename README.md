# Servidor DNS con BIND

Un servidor DNS basado en BIND (Berkeley Internet Name Domain) ejecutado en un contenedor Docker. Este repositorio proporciona una configuración completa para un servidor DNS local con zonas personalizadas.

## Descripción

Este proyecto implementa un servidor DNS autorizado utilizando BIND 9, el software DNS más popular y ampliamente utilizado en Internet. La configuración está dockerizada para facilitar el despliegue y la consistencia entre diferentes entornos.

## Características

- **BIND 9**: Servidor DNS de nivel empresarial
- **Docker Compose**: Orquestación sencilla del contenedor
- **Zonas personalizadas**: Configuración de zonas locales para `waytoit.test` y redes internas
- **Gestión automática**: Volúmenes de caché para persistencia de datos
- **Fácil despliegue**: Todo configurado para ejecutarse con `docker-compose`

## Estructura del proyecto

```bash
.
├── Dockerfile              # Imagen Docker para BIND
├── docker-compose.yml      # Configuración de Docker Compose
├── README.md               # Este archivo
├── bind/
│   ├── named.conf.local    # Configuración local de BIND
│   ├── named.conf.options  # Opciones globales de BIND
│   └── zones/              # Archivos de zona DNS
│       ├── db.192.168.1    # Zona de DNS inverso
│       └── db.waytoit.test # Zona para waytoit.test
└── cache/                  # Directorio de caché de BIND
    ├── managed-keys.bind
    └── managed-keys.bind.jnl
```

## Requisitos

- Docker
- Docker Compose

## Uso

1. **Clonar el repositorio**:

   ```bash
   git clone <url-del-repositorio>
   cd DNS
   ```

2. **Iniciar el servidor DNS**:

   ```bash
   docker-compose up -d
   ```

3. **Verificar el estado**:

   ```bash
   docker-compose ps
   ```

4. **Ver logs**:

   ```bash
   docker-compose logs -f
   ```

## Configuración

### Zonas DNS

Las zonas están configuradas en `bind/named.conf.local`. Puedes agregar nuevas zonas modificando este archivo.

### Recordes DNS

Los recordes DNS están definidos en los archivos dentro de `bind/zones/`:

- `db.waytoit.test`: Contiene registros A, AAAA, MX, etc. para el dominio
- `db.192.168.1`: Zona inversa para resolución inversa

## Detener el servidor

```bash
docker-compose down
```

## Notas

- Los datos de caché se persisten en el volumen `cache/`
- La configuración es editable en vivo; reinicia BIND después de cambios

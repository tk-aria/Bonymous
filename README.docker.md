# Docker Setup for Bonymous

## Quick Start

### Prerequisites
- Docker
- Docker Compose

### Setup Environment Variables
1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` file with your values:
   - `SECRET`: Your secret key for session management
   - `GOOGLE`: Google OAuth configuration as JSON string
   - `MONGO_ROOT_USERNAME`: MongoDB root username
   - `MONGO_ROOT_PASSWORD`: MongoDB root password
   - `POSTGRES_PASSWORD`: PostgreSQL password

### Production Environment
Run the application in production mode:
```bash
docker-compose up -d
```

### Development Environment
Run the application in development mode with hot reload:
```bash
docker-compose -f docker-compose.dev.yml up -d
```

## Configuration Files

### Production (`docker-compose.yml`)
- **Database**: PostgreSQL + MongoDB
- **Build**: Multi-stage optimized build
- **Environment**: Production settings
- **Volumes**: Persistent data storage

### Development (`docker-compose.dev.yml`)
- **Database**: SQLite (default) + MongoDB
- **Build**: Development build with hot reload
- **Environment**: Development settings
- **Volumes**: Source code mounting for hot reload

## Services

### Application (`app`)
- **Port**: 4000
- **Framework**: Node.js + Express + React
- **Database**: MongoDB (primary) + PostgreSQL/SQLite (files)

### MongoDB (`mongodb`)
- **Port**: 27017
- **Database**: `bonymous` (production) / `bonymous_dev` (development)
- **Initialization**: `init-mongo.js`

### PostgreSQL (`postgresql`)
- **Port**: 5432
- **Database**: `bonymous` (production) / `bonymous_dev` (development)
- **Initialization**: `init-postgres.sql`

### Frontend (`frontend` - development only)
- **Port**: 3000
- **Framework**: React development server
- **Hot Reload**: Enabled

## Volumes

### Named Volumes
- `mongodb_data`: MongoDB data persistence
- `postgresql_data`: PostgreSQL data persistence

### Bind Mounts
- `./uploads`: File uploads storage
- `./src`: Source code (development only)
- `./public`: Frontend code (development only)

## Commands

### Start Services
```bash
# Production
docker-compose up -d

# Development
docker-compose -f docker-compose.dev.yml up -d
```

### Stop Services
```bash
# Production
docker-compose down

# Development
docker-compose -f docker-compose.dev.yml down
```

### View Logs
```bash
# Production
docker-compose logs -f

# Development
docker-compose -f docker-compose.dev.yml logs -f
```

### Rebuild Services
```bash
# Production
docker-compose up -d --build

# Development
docker-compose -f docker-compose.dev.yml up -d --build
```

## Troubleshooting

### Database Connection Issues
1. Check if databases are running:
   ```bash
   docker-compose ps
   ```

2. Check database logs:
   ```bash
   docker-compose logs mongodb
   docker-compose logs postgresql
   ```

### Application Issues
1. Check application logs:
   ```bash
   docker-compose logs app
   ```

2. Restart application:
   ```bash
   docker-compose restart app
   ```

### Environment Variables
Make sure all required environment variables are set in `.env` file:
- `SECRET`
- `GOOGLE`
- `MONGO_ROOT_USERNAME`
- `MONGO_ROOT_PASSWORD`
- `POSTGRES_PASSWORD`
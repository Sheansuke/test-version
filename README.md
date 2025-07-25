This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Docker Deployment Options

Este proyecto incluye dos opciones de despliegue con Docker:

### 1. Modo Standalone

El modo standalone genera una aplicación completamente autónoma que no requiere dependencias de Node.js externas para ejecutarse.

#### Configuración

Para habilitar el modo standalone, asegúrate de que tu `next.config.mjs` incluya:

```javascript
const nextConfig = {
  // otras configuraciones...
  output: 'standalone'
};
```

#### Construcción y ejecución

```bash
# Construir la imagen
docker build -t nextjs-standalone -f Dockerfile .

# Ejecutar el contenedor
docker run -p 3000:3000 nextjs-standalone
```

### 2. Modo Regular

El modo regular mantiene la estructura de archivos estándar de Next.js y utiliza `npm start` para ejecutar la aplicación.

#### Configuración

Para el modo regular, asegúrate de que tu `next.config.mjs` NO incluya la opción `output: 'standalone'`.

#### Construcción y ejecución

```bash
# Construir la imagen
docker build -t nextjs-regular -f Dockerfile.regular .

# Ejecutar el contenedor
docker run -p 3000:3000 nextjs-regular
```

### Comparación

| Característica | Modo Standalone | Modo Regular |
|----------------|-----------------|---------------|
| Tamaño de imagen | Menor | Mayor |
| Dependencias | Autónomo | Requiere node_modules |
| Proceso de inicio | `node server.js` | `npm start` |
| Tiempo de construcción | Similar | Similar |
| Rendimiento | Similar | Similar |

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

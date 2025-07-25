# Etapa de construcción
FROM node:18-alpine AS builder

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración
COPY package.json package-lock.json ./

# Instalar dependencias
RUN npm ci

# Copiar código fuente
COPY . .

# Asegurarse de que la carpeta public existe
RUN mkdir -p public

# Construir la aplicación en modo standalone
RUN npm run build

# Etapa de producción
FROM node:18-alpine AS runner
WORKDIR /app

# Establecer variables de entorno para producción
ENV NODE_ENV=production

# Añadir usuario no-root para producción
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copiar archivos necesarios desde la etapa de construcción
COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Cambiar al usuario no-root
USER nextjs

# Exponer el puerto que utiliza Next.js
EXPOSE 3000

# Establecer la variable de host para aceptar conexiones externas
ENV HOSTNAME="0.0.0.0"

# Comando para iniciar la aplicación
CMD ["node", "server.js"]
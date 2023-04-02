# Second image, that creates an image for production
FROM node:18.8-alpine3.15 AS prod-image
WORKDIR /app
COPY --from=build-image ./app/dist ./dist
COPY package* ./
COPY migrations ./migrations
COPY migrateUpWithWrapper.mjs ./migrateUpWithWrapper.mjs
RUN npm ci --omit=dev
ENV NODE_ENV=production
CMD [ "npm", "run", "start:prd" ]

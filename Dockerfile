# Étape 1: Build de l'application Angular
FROM node:16-bullseye AS builder

WORKDIR /app/frontend

# Copier les fichiers de dépendances
COPY frontend/package*.json ./

# Installer les dépendances avec prise en compte des dépendances legacy
RUN npm install --legacy-peer-deps

# Copier le code source du frontend
COPY frontend/ .

# Build de l'application Angular en mode production
RUN npm run build

# Étape 2: Configuration du serveur
FROM node:16-alpine

WORKDIR /app

# Copier les fichiers de dépendances du backend
COPY backend/package*.json ./

# Installer les dépendances du backend
RUN npm install --production

# Copier le code source du backend
COPY backend/ .

# Créer le dossier public et copier les fichiers buildés d'Angular
RUN mkdir -p public
COPY --from=builder /app/frontend/dist/frontend ./public

# Exposer le port utilisé par Express.js
EXPOSE 3000

# Commande de démarrage
CMD ["node", "server.js"]

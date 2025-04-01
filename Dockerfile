# Étape 1: Build de l'application Angular
FROM node:19-bullseye as builder

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY frontend/package*.json ./

# Installer les dépendances avec prise en compte des dépendances legacy
RUN npm install --legacy-peer-deps

# Copier le code source du frontend
COPY frontend/ .

# Build de l'application Angular en mode production
RUN npm run build --prod

# Étape 2: Configuration du serveur
FROM node:16-alpine

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances du backend
COPY backend/package*.json ./

# Installer les dépendances du backend
RUN npm install

# Copier le code source du backend
COPY backend/ .

# Copier les fichiers buildés d'Angular depuis l'étape précédente
COPY --from=builder /app/dist/frontend ./public

# Exposer le port utilisé par Express.js
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "start"]

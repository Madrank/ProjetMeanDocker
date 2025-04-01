# MEAN Stack Docker Project

Ce projet est une application MEAN Stack (MongoDB, Express.js, Angular, Node.js) conteneurisée avec Docker.

## Prérequis

- Docker
- Docker Compose

## Structure du Projet

```
.
├── frontend/          # Application Angular
├── backend/           # API Express.js
├── mongo/            # Configuration MongoDB
│   └── init-db.d/    # Scripts d'initialisation de la base de données
├── Dockerfile        # Configuration de build pour Express et Angular
└── docker-compose.yml # Configuration des services Docker
```

## Installation

1. Cloner le repository :
```bash
git clone https://github.com/Madrank/ProjetMeanDocker.git
cd ProjetMeanDocker
```

2. Lancer l'application avec Docker Compose :
```bash
docker-compose up
```

L'application sera accessible sur :
- Frontend + Backend : http://localhost:3000
- MongoDB : localhost:27017

## Fonctionnalités

- Architecture MEAN Stack complète
- Authentification utilisateur
- API RESTful
- Base de données MongoDB avec données initiales
- Interface utilisateur Angular moderne

## Technologies Utilisées

- MongoDB 
- Express.js 4.17.1
- Angular 16.0.1
- Node.js 19 (build) et 16 (production)
- Docker & Docker Compose

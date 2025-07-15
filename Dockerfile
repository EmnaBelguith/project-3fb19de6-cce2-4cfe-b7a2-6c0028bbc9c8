# Utilisez une image Python légère comme base
FROM python:3.7-slim-buster

# Définissez le répertoire de travail dans le conteneur
# C'est ici que votre application sera copiée et exécutée
WORKDIR /app

# Copiez le fichier requirements.txt depuis le dossier 'python_project'
# vers le répertoire de travail du conteneur (/app)
COPY python_project/requirements.txt ./

# Installez les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiez le fichier app.py depuis le dossier 'python_project'
# vers le répertoire de travail du conteneur (/app)
COPY python_project/app.py ./

# Exposez le port sur lequel l'application Flask écoute
# Assurez-vous que ce port correspond à celui configuré dans votre application Flask (généralement 5000)
EXPOSE 5000

# Définissez la variable d'environnement FLASK_APP
ENV FLASK_APP=app.py

# Commande pour exécuter l'application Flask avec Gunicorn
# 'app:app' signifie que Gunicorn doit trouver l'instance 'app' dans le module 'app.py'
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]

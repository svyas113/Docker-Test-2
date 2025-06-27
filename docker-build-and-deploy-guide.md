# Docker Build and Deployment Guide for postgres-copilot

This guide provides step-by-step instructions for building the postgres-copilot Docker image, pushing it to Docker Hub, and creating a GitHub repository for distribution.

## Prerequisites

- Docker installed on your system
- Docker Hub account (username: shivam124)
- GitHub account
- Git installed on your system

## Step 1: Build the Docker Image

1. Navigate to the project directory:
   ```bash
   cd /path/to/postgres-copilot
   ```

2. Build the Docker image with the correct tag:
   ```bash
   docker build -t shivam124/postgres-copilot:latest .
   ```

3. Verify the image was built successfully:
   ```bash
   docker images | grep postgres-copilot
   ```

## Step 2: Push the Image to Docker Hub

1. Log in to Docker Hub:
   ```bash
   docker login
   ```
   Enter your Docker Hub username (shivam124) and password when prompted.

2. Push the image to Docker Hub:
   ```bash
   docker push shivam124/postgres-copilot:latest
   ```

3. Verify the image is available on Docker Hub by visiting:
   https://hub.docker.com/r/shivam124/postgres-copilot

## Step 3: Create the GitHub Repository

1. Go to GitHub and create a new repository:
   - Repository name: postgres-copilot-docker
   - Description: Docker distribution of PostgreSQL Co-Pilot
   - Visibility: Public
   - Initialize with a README: No
   - Add .gitignore: None
   - Add license: Choose the same license as your original project

2. Create a local directory for the repository:
   ```bash
   mkdir postgres-copilot-docker
   cd postgres-copilot-docker
   ```

3. Initialize the Git repository:
   ```bash
   git init
   ```

## Step 4: Prepare the Distribution Files

1. Copy the necessary files to the repository directory:
   ```bash
   # Copy the run.sh script
   cp /path/to/postgres-copilot/run.sh .
   
   # Copy the distribution docker-compose.yml
   cp /path/to/postgres-copilot/docker-compose.dist.yml docker-compose.yml
   
   # Copy the LICENSE file
   cp /path/to/postgres-copilot/LICENSE .
   
   # Copy the distribution README
   cp /path/to/postgres-copilot/README.md.dist README.md
   ```

2. Make the run.sh script executable:
   ```bash
   chmod +x run.sh
   ```

## Step 5: Commit and Push to GitHub

1. Add the files to Git:
   ```bash
   git add run.sh docker-compose.yml LICENSE README.md
   ```

2. Commit the changes:
   ```bash
   git commit -m "Initial commit of postgres-copilot Docker distribution"
   ```

3. Add the GitHub repository as a remote:
   ```bash
   git remote add origin https://github.com/shivam124/postgres-copilot-docker.git
   ```

4. Push to GitHub:
   ```bash
   git push -u origin main
   ```

## Step 6: Verify and Share

1. Visit your GitHub repository to verify all files are present:
   https://github.com/shivam124/postgres-copilot-docker

2. Test the distribution by cloning the repository and running the application:
   ```bash
   git clone https://github.com/shivam124/postgres-copilot-docker.git
   cd postgres-copilot-docker
   chmod +x run.sh
   ./run.sh
   ```

3. Share the GitHub repository URL with users who want to use postgres-copilot.

## Maintenance

To update the Docker image:

1. Make changes to the original postgres-copilot code
2. Rebuild the Docker image:
   ```bash
   docker build -t shivam124/postgres-copilot:latest .
   ```
3. Push the updated image to Docker Hub:
   ```bash
   docker push shivam124/postgres-copilot:latest
   ```

Users will automatically get the updated image the next time they run the application with `./run.sh`.

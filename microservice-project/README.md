2-Tier Architecture Microservice Deployment using Docker, Nginx & Node.js
📌 Project Overview

This project demonstrates the implementation of a 2-Tier Microservice Architecture using Docker, Nginx Reverse Proxy, and Node.js.

The application consists of multiple independent Node.js microservices deployed inside Docker containers. Nginx acts as a reverse proxy and routes incoming HTTP requests to the appropriate backend service using proxy_pass.

Docker Compose is used to build, manage, and deploy all containers efficiently.

🏗️ Architecture
text
                  Client / Browser
                         |
                         | HTTP Request
                         v
                 +---------------+
                 |     NGINX     |
                 | Reverse Proxy |
                 |   Port: 80    |
                 +---------------+
                         |
                    proxy_pass
                         |
              +----------+----------+
              |                     |
              v                     v
       +--------------+      +----------------+
       | User Service |      | Product Service|
       |   Node.js    |      |    Node.js     |
       |  Port: 3001  |      |   Port: 3002   |
       +--------------+      +----------------+
              |                     |
              +----------+----------+
                         |
                   Docker Network

🚀 Technologies Used
Node.js – Backend application development.
Express.js – REST API framework.
Nginx – Reverse proxy and request routing.
Docker – Containerization.
Docker Compose – Multi-container orchestration.
Linux – Deployment environment.
📂 Project Structure
text
microservice-project/
│
├── nginx/
│   └── nginx.conf
│
├── user-service/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
├── product-service/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
├── docker-compose.yml
│
└── README.md

⚙️ Architecture Components
1. Nginx Reverse Proxy

Nginx receives client requests on port 80 and forwards them to the appropriate Node.js microservice using proxy_pass.

Endpoint	Backend Service
/users	User Service
/products	Product Service
2. User Service

A Node.js microservice responsible for handling user-related requests.

Port: 3001

Endpoint:

http
GET /users


Sample Response:

json
[
  {
    "id": 1,
    "name": "John"
  },
  {
    "id": 2,
    "name": "David"
  }
]

3. Product Service

A Node.js microservice responsible for handling product-related requests.

Port: 3002

Endpoint:

http
GET /products


Sample Response:

json
[
  {
    "id": 101,
    "name": "Laptop"
  },
  {
    "id": 102,
    "name": "Mobile"
  }
]

🛠️ Prerequisites

Before deploying the project, install:

Docker
Docker Compose (Docker Compose V2 plugin)
Git
Linux / Ubuntu / Windows with Docker Desktop

Verify installations:

bash
docker --version
docker compose version
git --version

🚀 Deployment Instructions
Step 1: Clone the Repository
bash
git clone https://github.com/YOUR_USERNAME/microservice-project.git

cd microservice-project


Replace YOUR_USERNAME with your GitHub username.

Step 2: Build Docker Images
bash
docker compose build

Step 3: Start Containers
bash
docker compose up -d

Step 4: Verify Running Containers
bash
docker ps


Expected containers:

Container	Service	Port
nginx-proxy	Nginx	80
user-service	Node.js	3001 (internal)
product-service	Node.js	3002 (internal)
Step 5: Check Container Logs
bash
docker compose logs -f

🧪 Application Testing

After successful deployment, test the following endpoints.

1. Nginx Reverse Proxy

bash
curl http://localhost/


Expected output:

text
Nginx Reverse Proxy is Running!


2. User Service

bash
curl http://localhost/users


Expected output:

json
[
  {"id":1,"name":"John"},
  {"id":2,"name":"David"}
]


3. Product Service

bash
curl http://localhost/products


Expected output:

json
[
  {"id":101,"name":"Laptop"},
  {"id":102,"name":"Mobile"}
]

🐳 Docker Commands
Command	Description
docker ps	View running containers
docker images	List Docker images
docker compose up -d	Start containers
docker compose down	Stop and remove containers
docker compose restart	Restart containers
docker compose logs -f	View application logs
docker compose build	Build Docker images
docker compose down --rmi local	Remove project containers and local images
docker exec -it nginx-proxy sh	Access Nginx container
🔄 Request Flow
Client sends an HTTP request to Nginx on port 80.
Nginx receives the incoming request.
Nginx checks the URL path.
Based on the URL, Nginx forwards the request to the corresponding Node.js microservice.
The microservice processes the request.
The backend sends a response to Nginx.
Nginx returns the response to the client.
🔐 Security & Best Practices

For production deployment, consider implementing:

HTTPS using SSL/TLS certificates.
Nginx security headers.
Health checks for containers.
Docker resource limits.
Environment variables for sensitive configuration.
Centralized logging and monitoring.
Non-root Docker containers.
Regular Docker image updates.
🎯 Project Objectives
Understand 2-Tier Architecture.
Implement microservices using Node.js.
Configure Nginx Reverse Proxy.
Understand Nginx proxy_pass.
Containerize applications using Docker.
Deploy multiple services using Docker Compose.
Understand Docker networking and service discovery.
Test API routing through a single entry point.
🔮 Future Enhancements
Integrate MongoDB for persistent data storage.
Implement load balancing with multiple backend replicas.
Configure HTTPS using Let's Encrypt.
Integrate Jenkins for CI/CD automation.
Deploy the application on AWS EC2.
Implement Prometheus and Grafana monitoring.
Add automated testing and health checks.
👨‍💻 Author

Adnan Attar

DevOps | Docker | Kubernetes | AWS | Linux | Jenkins | CI/CD

GitHub: https://github.com/AdnanAttar001

⭐ If you find this project useful, consider giving this repository a star!

Note: This project is intended for learning and demonstrating Docker-based microservice deployment and Nginx reverse proxy configuration.

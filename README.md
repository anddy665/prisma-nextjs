# Next.js with Prisma and Docker

This is a sample project that demonstrates how to use Next.js with Prisma and Docker. The project includes API routes for managing coaches in a MySQL database.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Docker
- Docker Compose
- Node.js (v14.x or later)
- npm (v6.x or later)

## Installation

1. Clone the repository:

```sh
git clone https://github.com/yourusername/my-nextjs-app.git
cd my-nextjs-app
```

2. Install dependencies:

```sh
npm install
```

3. Create a .env file in the root directory and add the following environment variables:

```sh
MYSQL_ROOT_PASSWORD=rootpassword
MYSQL_DATABASE=prisma
MYSQL_USER=prisma
MYSQL_PASSWORD=prismapassword
DATABASE_URL=mysql://prisma:prismapassword@db:3306/prisma
PORT=3000
```

## Usage

# Running the Application with Docker

1. Build and start the Docker containers:

```sh
docker-compose up --build
```

2. Open your browser and go to http://localhost:3000.

# Running the Application Locally

1. Start the MySQL database using Docker:

```sh
docker-compose up db
```

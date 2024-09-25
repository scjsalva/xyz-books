## Project Overview

This project is a simple website for XYZ Books and their book catalogue based on ISBN-13 and ISBN-10. It is built using Ruby on Rails and includes various dependencies and deployment instructions.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Docker and Docker Compose.
- You have a compatible operating system (Linux, macOS, Windows).

## Ruby Version

This project uses Ruby version 3.2.5.

## Rails Version

This project uses Rails version 7.0.

## System Dependencies

The project requires the following system dependencies:

- All dependencies listed in the `Gemfile`.
- Docker (external dependency).

## Installation

To install the project, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/scjsalva/xyz-books.git
    cd xyz-books
    ```

2. Build and run the application using Docker Compose:
    ```sh
    docker-compose up --build
    ```

## Deployment Instructions

To deploy this project, follow these steps:

1. Ensure all dependencies are installed.
2. Build the Docker image:
    ```sh
    docker-compose build
    ```
3. Run the Docker container:
    ```sh
    docker-compose up
    ```

## Usage

To use the application, open your web browser and navigate to `http://localhost:3000`.

## Contributing

To contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/your-feature`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature`
5. Create a pull request.

## Contact

If you want to contact me, you can reach me at [scjsalva@gmail.com].
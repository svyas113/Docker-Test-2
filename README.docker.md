# PostgreSQL Co-Pilot Docker Edition

This is the Docker-based distribution of PostgreSQL Co-Pilot, a command-line application designed to assist users in interacting with PostgreSQL databases using natural language.

## Quick Start

1. **Prerequisites**:
   - Docker installed on your system
   - Docker Compose installed on your system

2. **Download and Run**:
   ```bash
   # Clone the repository or download the files
   git clone https://github.com/your-username/postgres-copilot-docker.git
   cd postgres-copilot-docker
   
   # Make the run script executable
   chmod +x run.sh
   
   # Start the application
   ./run.sh
   ```

3. **First Run Setup**:
   - On first run, you'll be prompted to select an LLM provider (OpenAI, Google Gemini, Anthropic, AWS Bedrock, DeepSeek, or OpenRouter)
   - Enter your API key and model ID for the selected provider
   - The application will automatically create the necessary directories in the `./data` folder

## Data Persistence

All data is stored in the `./data` directory, which is mounted as a volume in the Docker container. This ensures that your configuration, memory, and approved queries persist between runs.

The data directory structure is:
- `./data/config/` - Contains the configuration file
- `./data/memory/` - Contains feedback, insights, schema, conversation history, and LanceDB vector stores
- `./data/approved_sql/` - Contains approved NLQ-SQL pairs

## Commands

Once the application is running, you can use the following commands:

- `/generate_sql: <your question>` - Generate SQL from a natural language question
- `/feedback: <your feedback>` - Provide feedback on the generated SQL
- `/approved` - Approve the current SQL query
- `/revise: <your revision instructions>` - Revise the current SQL query
- `/approve_revision` - Approve the revised SQL query
- `/change_model` - Change the LLM provider and model
- `/change_database` - Connect to a different database
- `/help` - Show help information
- `/exit` - Exit the application

## Building Your Own Image

If you want to build your own Docker image:

1. Clone the full repository
2. Modify the code as needed
3. Build and push the image:
   ```bash
   docker build -t your-username/postgres-copilot:latest .
   docker push your-username/postgres-copilot:latest
   ```

4. Update the `docker-compose.yml` file to use your image

## Troubleshooting

- **Permission Issues**: The `run.sh` script automatically sets the container to run with your user ID and group ID to avoid permission problems.
- **API Key Issues**: If you encounter authentication errors, use the `/change_model` command to update your API key.
- **Database Connection Issues**: Ensure your PostgreSQL server is accessible from the Docker container.

## License

See the LICENSE file for details.

# Use the official Ruby image from the Docker Hub
FROM ruby:3.2.5

# Install Node.js 18 and ensure npm is installed
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest # Ensure npm is up-to-date

# Install PostgreSQL client
RUN apt-get update -y && apt-get install -y postgresql-client

# Set the working directory
WORKDIR /app

# Install Rails
RUN gem install rails -v 7.0.0

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Install npm dependencies (like Tailwind CSS)
RUN npm install

# Run the Tailwind CSS installation
RUN bundle exec rails tailwindcss:install

# Remove pre-existing server PID file and start the server
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]

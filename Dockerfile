# Use the official Ruby image from the Docker Hub
FROM ruby:3.2.5

# Install Node.js and Yarn for Tailwind
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs yarn

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

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
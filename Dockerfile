# Dockerfile
FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip git \
    && docker-php-ext-install pdo pdo_mysql zip

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Create app directory
WORKDIR /var/www/html

# Copy Yii2 app source
COPY . .

# Install Yii2 PHP dependencies
RUN composer install

# Permissions (important for Yii2)
RUN chown -R www-data:www-data /var/www/html

# Expose port (not necessary for FPM but conventionally 9000)
EXPOSE 9000

CMD ["php-fpm"]

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:9000 || exit 1

FROM yiisoftware/yii2-php:7.4-apache

WORKDIR /app

# Copy composer files first to leverage Docker cache
COPY composer.json ./

# Install composer dependencies before copying app
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Now copy the rest of the application
COPY . .

# Set permissions
RUN chown -R www-data:www-data /app/runtime /app/web/assets

EXPOSE 80
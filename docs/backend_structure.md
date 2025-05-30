Backend Folder Structure
backend/
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── AuthController.php
│   │   │   ├── ListingController.php
│   │   ├── Middleware/
│   │   │   ├── Authenticate.php
│   │   │   ├── JwtMiddleware.php
│   ├── Models/
│   │   ├── User.php
│   │   ├── Listing.php
├── config/
│   ├── app.php
│   ├── auth.php
│   ├── database.php
├── database/
│   ├── migrations/
│   │   ├── 2014_10_12_000000_create_users_table.php
│   │   ├── 2023_05_29_113739_create_listings_table.php
│   ├── seeders/
│   │   ├── DatabaseSeeder.php
│   │   ├── ListingSeeder.php
├── public/
│   ├── assets/
│   │   ├── images/
│   │   │   ├── property1.jpg
│   │   │   ├── ...
│   │   │   ├── property20.jpg
│   │   │   ├── default.jpg
│   ├── .htaccess
│   ├── index.php
├── routes/
│   ├── api.php
│   ├── web.php
├── storage/
│   ├── logs/
│   │   ├── laravel.log
├── .env
├── composer.json
├── artisan


app/: Core application logic.
Http/Controllers/: Handles API requests (e.g., ListingController for listings).
Models/: Eloquent models (User, Listing).
database/: Migrations and seeders for database setup.
public/: Static assets (images) and entry point (index.php).
routes/: API routes (api.php).
storage/logs/: Laravel logs.


# Worksquare Fullstack Developer Task

## Setup Instructions

### Backend (Laravel 12.16.0)
1. Navigate to `backend/`.
2. Install dependencies: `composer install`.
3. Copy `.env.example` to `.env` and configure MySQL.
4. Run migrations: `php artisan migrate`.
5. Seed data: `php artisan db:seed --class=ListingsSeeder`.
6. Generate JWT secret: `php artisan jwt:secret`.
7. Start server: `php artisan serve`.
8. API docs: `http://localhost:8000/api/documentation`.

### Frontend (Vue.js)
1. Navigate to `frontend/`.
2. Install dependencies: `npm install`.
3. Start development server: `npm run serve`.
4. Access at `http://localhost:8080`.

## Tools and Libraries
- **Backend**: Laravel 12.16.0, PHP 8.4.0, MySQL, tymon/jwt-auth, l5-swagger
- **Frontend**: Vue 3, Vue Router, Axios, Tailwind CSS
- **Template**: ThemeForest HTML template (assets in `frontend/public/assets`)

## Code Notes
- **Approach**: Modular architecture with reusable components and RESTful API.
- **Decisions**:
  - Laravel for robust backend features.
  - Vue.js for lightweight, component-based UI.
  - MySQL for efficient data querying.
- **Trade-offs**: Used MySQL instead of direct JSON file reads for performance.
- **Improvements**: Add caching (Redis) and unit tests with more time.
- **Navigation**: Limited to Home, Property, and Contact pages as per requirements.

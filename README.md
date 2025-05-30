# DreamDrealEstates

A full-stack real estate listing platform with user authentication, property listings, filtering, and pagination.

## Author
**Chijindu Nwokeohuru**  
Email: chijindu.nwokeohuru@gmail.com

### Backend

1. Clone the repository:
```bash
git https://github.com/Chi-G/worksquare-fullstack-task.git
cd worksquare-fullstack-task/backend
```

2. Install dependencies:
```bash
composer install
```

3. Configure `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=dreamdrealestates
DB_USERNAME=root
DB_PASSWORD=
JWT_SECRET=your_jwt_secret
```

4. Run migrations and seeders:
```bash
php artisan migrate
php artisan db:seed
```

5. Start the server:
```bash
php artisan serve
```

### Frontend

1. Navigate to the frontend:
```bash
cd ../frontend
```

2. Install dependencies:
```bash
npm install
```

3. Configure `.env`:
```env
VITE_APIBACKEND=http://127.0.0.1:8000/api
VITE_BACKEND_URL=http://127.0.0.1:8000
```

4. Start the development server:
```bash
npm run dev
```

## Tools and Libraries

### Backend
- Laravel 10
- PHP 8.4.0
- MySQL
- tymon/jwt-auth
- l5-swagger

### Frontend
- Vue 3
- Vue Router
- Axios
- Tailwind CSS
- ThemeForest HTML template (assets in `frontend/public/assets`)

## API Documentation

### Swagger Docs
Available at: `http://localhost:8000/api/documentation`

### Endpoints
- `/api/login`
- `/api/logout`
- `/api/listings`
- `/api/listings/filter`

## Code Notes

### Development Approach
- **Iterative**: Fixed issues incrementally (response structure, image URLs, pagination)
- **Debugging**: Used Console logs and Network tab to diagnose image and API issues
- **Testing**: Manual testing with Postman and browser DevTools

### Engineering Decisions
- **Stack**: Laravel for rapid API development; Vue.js for reactive UI
- **Auth**: JWT for stateless API auth, with token stored in localStorage
- **Images**: Served from public/ for simplicity; CDN would improve scalability
- **Status**: JSON status parsed in frontend due to database design; a string column would be better

### Trade-offs
- **Security**: localStorage for tokens is less secure than cookies
- **Pagination**: Different page sizes (index: 6, filter: 10) could be standardized
- **Filtering**: JSON status complicates filtering; a dedicated column would simplify

### Improvements
- Use HttpOnly cookies for tokens
- Standardize pagination sizes
- Add Redis caching for listings
- Use AWS S3 for images
- Implement automated tests (PHPUnit, Vitest)

## Navigation
Limited to Home, Property, and Contact pages as per requirements.
Engineering Decisions
Technology Stack

Backend: Laravel (PHP) for rapid API development, Eloquent ORM, and JWT authentication.
Why: Laravel’s ecosystem simplifies routing, middleware, and database management. JWT is lightweight for API auth.


Frontend: Vue.js with Vue Router and Axios.
Why: Vue.js is lightweight, reactive, and ideal for SPAs. Axios handles API calls efficiently.


Database: MySQL for relational data.
Why: MySQL is robust, widely supported, and integrates seamlessly with Laravel.



Authentication and Security

JWT Authentication: Users receive a token on login, stored in localStorage and sent via Authorization: Bearer.
Implementation: Laravel’s JWTAuth package protects /api/listings routes.
Security: Tokens expire, and the frontend clears localStorage on logout. API routes are middleware-protected.


Frontend: Unauthenticated users see a login prompt on /property. The Property button is hidden without a user.
Trade-offs: localStorage is vulnerable to XSS; a more secure approach (e.g., HttpOnly cookies) was not implemented due to time constraints.

Scalability and Maintainability

Backend:
Scalability: Laravel’s pagination reduces database load. Query scopes in Listing model optimize filtering.
Maintainability: Controllers are modular, and Eloquent models use scopes for reusable queries.


Frontend:
Scalability: Vue components (NavBar, PropertyPage) are reusable. Axios interceptors centralize token handling.
Maintainability: Separated API logic into src/services/api.js. Used environment variables for URLs.


Improvements: Add caching (Redis) for listings and optimize database queries for larger datasets.

Trade-offs

Status Field: Stored as JSON (e.g., {"type": "house", "status": "rent"}). Parsing in the frontend works, but a dedicated status column would simplify filtering.
Image Storage: Static images in public/ are simple but not scalable. A CDN or cloud storage (e.g., AWS S3) would be better.
Pagination: index (6 items) and filter (10 items) differ; standardizing would improve consistency.

Visual Diagram
System Architecture Diagram

Note: Create using draw.io, showing Vue.js frontend, Laravel backend, MySQL, and API interactions.


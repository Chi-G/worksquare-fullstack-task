
# Worksquare Senior Fullstack Developer Vetting Task

Welcome to the vetting assessment for Fullstack Developers at Worksquare!

This task is designed to evaluate your skills in building both a backend API and a frontend interface, with strong attention to architecture, decision-making, and code clarity.

---

## Objective

Build a fullstack housing listings app that allows users to browse available properties using filters and search options. Focus on clean architecture, good engineering decisions, and thoughtful documentation.

---

## Requirements

### Backend (Choose One)

* Stack Options: Node.js (Express), Laravel, Django, Flask
* Serve data from a provided `listings.json` file
* Create a RESTful API with the following endpoints:

  * Paginated listings
  *  Filter by location/type
  *  Get a single listing by ID
  * JWT Authentication: Protect at least one route 
  * Rate Limiting: Prevent abuse (e.g., 100 requests per hour per IP)
  * Middleware: Log incoming requests
  * Error Handling: Use consistent and structured error responses
  * API Documentation: Swagger or OpenAPI

### Frontend (Choose One)

* Frameworks: React, Vue.js, or Angular
* Build a responsive UI that:

  * Fetches data from your API
  * Displays listings in a user-friendly layout
  * Includes search/filter functionality
  * Shows loading and empty states
* Styling: Tailwind CSS, CSS Modules, or equivalent

---

## Architectural Design (Required)

Before you start coding, design your system architecture. You will be evaluated on how you structure and plan your work.

Include the following in a `docs/` folder or within the README:

* Database and API Design (ER Diagram or JSON model schema)
* Backend folder structure breakdown
* Brief explanation of your engineering decisions:

  * Why you chose your stack
  * How you handled authentication and security
  * How you approached scalability and maintainability
* Visual diagrams (use tools like draw\.io, Excalidraw, or markdown-based diagrams)

---

## Documentation

In your `README.md`, include:

* Setup instructions for both frontend and backend
* Tools and libraries used
* Link to Swagger or API docs
* A “Code Notes” section covering:

  * Your development approach
  * Engineering decisions made and why
  * Trade-offs or improvements you would make with more time

---

## What We’re Looking For

* Clean fullstack architecture
* Solid engineering thinking
* Proper API and frontend integration
* Good Git practices: meaningful commits and clear structure
* Developer Experience (DX): clear setup, organized structure
* Quality UI/UX

---

## Submission Guidelines

1. Fork this repo
2. Create two folders: `/frontend` and `/backend`
3. Push your completed task to your forked repo
4. Email your repo link via email

### Deadline

Submit within 72 hours of receiving this task.

---

## Listings Data

You will receive the `listings.json` file separately. Please create this file inside your backend project and use it locally to serve data.

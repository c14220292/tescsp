# Employee Portal Application

A modern, secure employee portal built with Next.js 16, Supabase, and TypeScript. This application demonstrates best practices for authentication, route protection, and server-side rendering using React Server Components.

## Features

- User registration and authentication
- Protected routes with middleware
- Server-side rendering with React Server Components
- Server Actions for form handling
- Modern UI with Tailwind CSS
- Type-safe with TypeScript
- Real-time announcements dashboard

## Tech Stack

- **Framework**: Next.js 16 (App Router)
- **Authentication & Database**: Supabase (@supabase/ssr)
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **Validation**: Zod

## Prerequisites

- Node.js 18+ installed
- A Supabase account and project

## Environment Setup

1. Create a `.env.local` file in the root directory
2. Add your Supabase credentials:

```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key_here
```

## Getting Supabase Credentials

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Create a new project or select an existing one
3. Go to Settings > API
4. Copy the following values:
   - **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
   - **anon/public key** → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## Database Setup

The database schema has been automatically created with the following table:

### announcements Table
- `id` (uuid, primary key)
- `title` (text)
- `content` (text)
- `created_at` (timestamptz)

The table includes Row Level Security (RLS) policies that allow authenticated users to view announcements.

## Installation

Install dependencies:

```bash
npm install
```

## Running the Application

Development mode:

```bash
npm run dev
```

Build for production:

```bash
npm run build
```

Start production server:

```bash
npm start
```

## Application Routes

- `/` - Redirects to login page
- `/register` - User registration page
- `/login` - User login page
- `/dashboard` - Protected dashboard (requires authentication)

## Architecture Highlights

### Server Actions
All authentication operations use Server Actions, ensuring secure server-side processing:
- `login()` - Handles user login
- `register()` - Handles user registration
- `logout()` - Handles user logout

### Middleware Protection
The middleware automatically:
- Refreshes user sessions
- Redirects unauthenticated users trying to access `/dashboard` to `/login`
- Redirects authenticated users trying to access `/login` to `/dashboard`

### Server Components
The dashboard uses React Server Components to fetch data directly on the server, providing:
- Better performance
- Reduced client-side JavaScript
- Automatic loading states with Suspense

## Project Structure

```
├── actions/
│   └── auth.ts                 # Server Actions for authentication
├── app/
│   ├── dashboard/
│   │   └── page.tsx           # Protected dashboard page
│   ├── login/
│   │   └── page.tsx           # Login page
│   ├── register/
│   │   └── page.tsx           # Registration page
│   └── page.tsx               # Home page (redirects to login)
├── components/
│   ├── auth/
│   │   ├── login-form.tsx     # Client component for login form
│   │   ├── register-form.tsx  # Client component for registration form
│   │   └── submit-button.tsx  # Reusable submit button
│   └── dashboard/
│       └── logout-button.tsx  # Client component for logout
├── utils/
│   └── supabase/
│       ├── client.ts          # Supabase client for client components
│       ├── server.ts          # Supabase client for server components
│       └── middleware.ts      # Supabase utilities for middleware
└── middleware.ts              # Route protection middleware
```

## Security Features

- Email/password authentication via Supabase
- Row Level Security (RLS) on all database tables
- Protected routes with middleware
- Secure session management
- Server-side form validation with Zod
- HTTPS-only cookies

## Usage Guide

### 1. Register a New Account
1. Navigate to `/register`
2. Enter your email and password (minimum 6 characters)
3. Click "Create Account"
4. You will be redirected to the login page

### 2. Login
1. Navigate to `/login`
2. Enter your registered email and password
3. Click "Sign In"
4. You will be redirected to the dashboard

### 3. View Dashboard
- See your email address
- View company announcements
- Click "Logout" to end your session

## Troubleshooting

### "Invalid login credentials" error
- Ensure you have registered an account first
- Check that your email and password are correct

### Dashboard shows no announcements
- Verify your database connection
- Check that the announcements table has data
- Ensure RLS policies are properly configured

### Build errors
- Ensure all environment variables are set
- Run `npm install` to ensure all dependencies are installed
- Check that your Node.js version is 18+

## License

This project is built for educational purposes.

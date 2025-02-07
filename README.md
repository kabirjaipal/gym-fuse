# GymFuse 💪

GymFuse is a comprehensive fitness platform that combines workout routines, personalized diet plans, and gym location services all in one place. Built with modern web technologies, it provides an intuitive interface for fitness enthusiasts to plan their workouts, follow diet plans, and find nearby gyms.

## Features 🌟

- **Workout Plans**: Detailed exercise routines with sets, reps, and instructions
- **Diet Plans**: Personalized nutrition guides with meal plans and calorie tracking
- **Gym Locator**: Find and explore nearby gyms with detailed information
- **Responsive Design**: Works seamlessly across desktop and mobile devices

## Tech Stack 🛠️

- **Backend**: Node.js with Express.js
- **Frontend**: EJS templates with Bootstrap 5
- **Database**: MySQL with Prisma ORM
- **Authentication**: JWT (planned)
- **Deployment**: Vercel

## Getting Started 🚀

1. Clone the repository:
```sh
git clone https://github.com/kabirjaipal/gymfuse.git
cd gymfuse
```

2. Install dependencies:
```sh
npm install
```

3. Set up environment variables:
   - Copy `.env.example` to `.env`
   - Update `DATABASE_URL` with your MySQL connection string

4. Setup database:
```sh
npm run prisma:generate
npm run prisma:migrate
```

5. Run the development server:
```sh
npm run dev
```

## Project Structure 📁

- `controllers` - Request handlers and business logic
- `views` - EJS templates for rendering pages
- `routes` - Express route definitions
- `public` - Static assets (CSS, images)
- `prisma` - Database schema and migrations
- `lib` - Shared utilities and configurations

## Scripts 📝

- `npm run dev` - Start development server
- `npm start` - Start production server
- `npm run prisma:migrate` - Run database migrations
- `npm run prisma:generate` - Generate Prisma client
- `npm run prisma:studio` - Open Prisma Studio

## Contributing 🤝

Contributions are welcome! Please feel free to submit a Pull Request.

## License 📄

This project is licensed under the ISC License.

## Authors ✨

- Kabir Jaipal
- Manish Upadhay
- Prakhar Bhatnagar
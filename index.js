import express from "express";
import dotenv from "dotenv";
import expressEjsLayouts from "express-ejs-layouts";

dotenv.config();

const app = express();

app.set("view engine", "ejs");
app.set("views", "views");
app.use(expressEjsLayouts);

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));

// Routes
import dietsRouter from "./routes/diets.js";
import gymsRouter from "./routes/gyms.js";
import workoutsRouter from "./routes/workouts.js";
import homeRouter from "./routes/home.js";

// Set EJS as view engine
app.set("view engine", "ejs");

// Routes
app.use("/", homeRouter);
app.use("/diets", dietsRouter);
app.use("/gyms", gymsRouter);
app.use("/workouts", workoutsRouter);

// Start Server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});

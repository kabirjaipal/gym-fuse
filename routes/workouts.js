import express from "express";
import { getWorkouts, getWorkout } from "../controllers/workouts.js";

const router = express.Router();

router.get("/", getWorkouts);
router.get("/:id", getWorkout);

export default router;

import { prisma } from "../lib/prisma.js";

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getWorkouts = async (req, res) => {
  // fetch workouts
  const workouts = await prisma.m_workout.findMany({
    include: {
      workout_plan: true,
      tips: true,
      additional_resources: true,
    },
  });

  res.render("workouts", { title: "Workouts", workouts });
};

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getWorkout = async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res.status(400).send("Workout ID is required");
  }

  const workout = await prisma.m_workout.findUnique({
    where: {
      id: parseInt(id),
    },
    include: {
      workout_plan: {
        include: {
          exercises: true,
        },
      },
      tips: true,
      additional_resources: true,
    },
  });

  if (!workout) {
    return res.status(404).send("Workout not found");
  }

  res.render("workout", { title: `${workout.name} Workout`, workout });
};

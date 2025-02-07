import { prisma } from "../lib/prisma.js";

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getHome = async (req, res) => {
  // fetch 5 diets
  const diets = await prisma.m_diet.findMany({
    take: 5,
    include: {
      benefits: true,
      meal_plans: true,
      faq: true,
    },
  });

  // fetch 5 gyms
  const gyms = await prisma.m_gym.findMany({
    take: 5,
  });

  // fetch 5 workouts
  const workouts = await prisma.m_workout.findMany({
    take: 5,
    include: {
      workout_plan: true,
      tips: true,
      additional_resources: true,
    },
  });

  res.render("home", { title: "Gym Fuse", diets, gyms, workouts });
};

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getAboutUS = async (req, res) => {
  res.render("about-us", { title: "About Us" });
};

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getPing = async (req, res) => {
  res.json({ message: "pong" });
};

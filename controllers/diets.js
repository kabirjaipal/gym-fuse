import { prisma } from "../lib/prisma.js";

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getDiets = async (req, res) => {
  // fetch diets
  const diets = await prisma.m_diet.findMany({
    include: {
      benefits: true,
      meal_plans: true,
      faq: true,
    },
  });

  res.render("diets", { title: "Diets", diets });
};

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getDiet = async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res.status(400).send("Diet ID is required");
  }

  const diet = await prisma.m_diet.findUnique({
    where: {
      id: parseInt(id),
    },
    include: {
      benefits: true,
      meal_plans: true,
      faq: true,
    },
  });

  if (!diet) {
    return res.status(404).send("Diet not found");
  }

  res.render("diet", { title: `${diet.name} Diet`, diet });
};

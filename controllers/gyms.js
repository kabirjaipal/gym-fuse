import { prisma } from "../lib/prisma.js";

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getGyms = async (req, res) => {
  // fetch 5 gyms
  const gyms = await prisma.m_gym.findMany();

  res.render("gyms", { title: "Gyms", gyms });
};

/**
 *
 * @param {import("express").Request} req
 * @param {import("express").Response} res
 */
export const getGym = async (req, res) => {
  const { id } = req.params;

  if (!id) {
    return res.status(400).json({ error: "Please provide a gym id" });
  }

  const gym = await prisma.m_gym.findUnique({
    where: {
      id: parseInt(id),
    },
  });

  if (!gym) {
    return res.status(404).json({ error: "Gym not found" });
  }

  res.render("gym", { title: gym.name, gym });
};

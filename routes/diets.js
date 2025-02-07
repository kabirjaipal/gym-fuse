import express from "express";
import { getDiets, getDiet } from "../controllers/diets.js";

const router = express.Router();

router.get("/", getDiets);
router.get("/:id", getDiet);

export default router;

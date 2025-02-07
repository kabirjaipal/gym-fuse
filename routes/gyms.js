import express from "express";
import { getGyms, getGym } from "../controllers/gyms.js";

const router = express.Router();

router.get("/", getGyms);
router.get("/:id", getGym);

export default router;

import express from "express";
import { getHome, getAboutUS } from "../controllers/home.js";

const router = express.Router();

router.get("/", getHome);
router.get("/about-us", getAboutUS);

export default router;

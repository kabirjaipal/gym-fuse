import express from "express";
import { getHome, getAboutUS, getPing } from "../controllers/home.js";

const router = express.Router();

router.get("/", getHome);
router.get("/about-us", getAboutUS);
router.get("/ping", getPing);

export default router;

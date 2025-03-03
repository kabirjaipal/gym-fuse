import express from "express";
import {
  getHome,
  getAboutUS,
  getContactUS,
  getPing,
} from "../controllers/home.js";

const router = express.Router();

router.get("/", getHome);
router.get("/about-us", getAboutUS);
router.get("/contact-us", getContactUS);
router.get("/ping", getPing);

export default router;

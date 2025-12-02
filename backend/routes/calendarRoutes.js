import express from "express";
import multer from "multer";
import { saveDay, getDay, getMonth } from "../controllers/calendarController.js";

const router = express.Router();

// pic storage
const storage = multer.diskStorage({
    destination: "uploads/",
    filename: (req, file, cb) => {
        cb(null, Date.now() + "-" + file.originalname);
    }
});
const upload = multer({ storage });

// save/ update day entry
router.post("/save", upload.single("photo"), saveDay);

router.get("/day", getDay);

router.get("/month", getMonth);

export default router;
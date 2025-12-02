import CalendarEntry from "../models/CalendarEntry.js";

export const saveDay = async (req, res) => {
    try {
        const { userId, date, mood, summary } = req.body;
        const photoUrl = req.file ? `/uploads/${req.file.filename}` : null;

        let entry = await CalendarEntry.findOne({ userId, date });

        if (entry) {
            entry.mood = mood;
            entry.summary = summary;
            entry.photoUrl = photoUrl ?? entry.photoUrl;
        } else {
            entry = new CalendarEntry({
                userId,
                date,
                mood,
                summary,
                photoUrl
            });
        }

        await entry.save();
        res.json(entry);

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

export const getDay = async (req, res) => {
    try {
        const { userId, date } = req.query;
        const entry = await CalendarEntry.findOne({ userId, date });

        if (!entry) return res.json(null);

        res.json(entry);

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

export const getMonth = async (req, res) => {
    try {
        const { userId, month } = req.query;

        const entries = await CalendarEntry.find({
            userId,
            date: { $regex: `^${month}` } // example "2025-12"
        });

        res.json(entries);

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
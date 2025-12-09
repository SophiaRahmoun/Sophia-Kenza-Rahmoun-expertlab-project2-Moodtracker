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
        console.log("GET /month called with:", { userId, month });


        const query = {
            // ⚠️ TEMPORAIRE : on commente userId pour tester
            // userId,
            date: { $regex: `^${month}` } // "2025-12"
        };

        const entries = await CalendarEntry.find(query);

        console.log("Entries found:", entries.length);


        res.json(entries);

    } catch (err) {
        console.error("Error in getMonth:", err);
        res.status(500).json({ error: err.message });
    }
};
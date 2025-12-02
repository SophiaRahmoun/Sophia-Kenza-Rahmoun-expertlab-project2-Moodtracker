import mongoose from "mongoose";

const CalendarEntrySchema = new mongoose.Schema({
    userId: {
        type: String,
        required: true,

    },
    date: {
        type: String,
        required: true,
    },
    mood: {
        type: String,
        default: null
    },
    summary: {
        type: String,
        default: ""
    },
    photoUrl: {
        type: String, 
        default: null
    }
});

export default mongoose.model("CalendarEntry", CalendarEntrySchema);
import express from "express";
import cors from "cors";
import dotenv from "dotenv";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

import authRouter from "./routes/authRouter.js";
import urlsRouter from "./routes/urlsRouter.js";

app.use(authRouter);
app.use(urlsRouter);

const port = process.env.PORT;
app.listen(port, () => console.log(`Server running in port ${port}`));

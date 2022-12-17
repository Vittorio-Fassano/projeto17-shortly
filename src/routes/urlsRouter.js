import { Router } from "express";

import { validatingSession } from "../middlewares/sessionMiddleware.js";
import { validatingUrlPost } from "../middlewares/urlsMiddleware.js";
import { shortUrl } from "../controllers/urlsController.js";

const urlsRouter = Router();
urlsRouter.post("/urls/shorten", validatingSession, validatingUrlPost, shortUrl);

export default urlsRouter;

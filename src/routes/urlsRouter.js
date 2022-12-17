import { Router } from "express";

import { validatingSession } from "../middlewares/sessionMiddleware.js";
import { validatingUrlPost, validatingUrlGet } from "../middlewares/urlsMiddleware.js";
import { shortUrl, getUrl } from "../controllers/urlsController.js";

const urlsRouter = Router();
urlsRouter.post("/urls/shorten", validatingSession, validatingUrlPost, shortUrl);
urlsRouter.get("/urls/:id", validatingUrlGet, getUrl);

export default urlsRouter;

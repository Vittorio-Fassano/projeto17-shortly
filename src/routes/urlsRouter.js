import { Router } from "express";

import { validatingSession } from "../middlewares/sessionMiddleware.js";
import {
  validatingUrlPost,
  validatingUrlGet,
  validatingUrlShort,
  validatingUrlDelete,
} from "../middlewares/urlsMiddleware.js";
import {
  shortUrl,
  getUrl,
  getUrlShort,
  deleteUrl,
} from "../controllers/urlsController.js";

const urlsRouter = Router();
urlsRouter.post(
  "/urls/shorten",
  validatingSession,
  validatingUrlPost,
  shortUrl
);
urlsRouter.get("/urls/:id", validatingUrlGet, getUrl);
urlsRouter.get("/urls/open/:shortUrl", validatingUrlShort, getUrlShort);
urlsRouter.delete(
  "/urls/:id",
  validatingSession,
  validatingUrlDelete,
  deleteUrl
);

export default urlsRouter;

import { Router } from "express";

import { validatingSession } from "../middlewares/sessionMiddleware.js";
import { validatingUser } from "../middlewares/userMiddleware.js";
import { user, ranking } from "../controllers/userController.js";

const userRouter = Router();
userRouter.get("/users/:id", validatingSession, validatingUser, user);
userRouter.get("/ranking", ranking);

export default userRouter;

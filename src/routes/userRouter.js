import {Router} from 'express';

import { validatingSession } from "../middlewares/sessionMiddleware.js";
import { validatingUser } from '../middlewares/userMiddleware.js';
import { user } from '../controllers/userController.js';

const userRouter = Router();
userRouter.get("/users/me", validatingSession, validatingUser, user);

export default userRouter;

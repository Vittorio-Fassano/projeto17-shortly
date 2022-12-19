import {Router} from 'express';

import { validatingSession } from "../middlewares/sessionMiddleware.js";
import { validatingUser } from '../middlewares/userMiddleware.js';
import { user, ranking } from '../controllers/userController.js';

const userRouter = Router();
//route bellow with problem to getById by params in validatingUser middleware and pass to user controller
userRouter.get("/users/me", validatingSession, validatingUser, user); 

//route bellow is incomplete, because it's ranking only by linkCount, missing ranking by visitCount
userRouter.get("/ranking", ranking); 

export default userRouter;

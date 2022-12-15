import {Router} from 'express';

import { signUp, signIn } from '../controllers/authController.js';
import { validatingSignUp, validatingSignIn} from '../middlewares/authMiddleware.js';

const authRouter = Router();
authRouter.post("/signup", validatingSignUp, signUp);
authRouter.post("/sigin", validatingSignIn, signIn);

export default authRouter;

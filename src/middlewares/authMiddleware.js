import bcrypt from "bcrypt";
import { connectionDB } from "../database/db.js";

import { signUpSchema } from "../models/authSchema.js";
import { signInSchema } from "../models/authSchema.js";

export async function validatingSignUp(req, res, next) {
  const { email } = req.body;
  const { error } = signUpSchema.validate(req.body, { abortEarly: false });

  if (error) {
    return res.status(400).send(error.details.map((detail) => detail.message));
  }

  try {
    const emailAlreadyExist = await connectionDB.query(
      `SELECT * 
      FROM users 
      WHERE email = $1;`,
      [email]
    );

    if (emailAlreadyExist.rows[0]) {
      return res.sendStatus(409);
    }

    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}

export async function validatingSignIn(req, res, next) {
  const { email, password } = req.body;
  const { error } = signInSchema.validate(req.body, { abortEarly: false });

  if (error) {
    return res.status(400).send(error.details.map((detail) => detail.message));
  }

  try {
    const user = await connectionDB.query(
      `SELECT * 
      FROM users 
      WHERE email = $1;`,
      [email]
    );

    const validatingPassword = bcrypt.compareSync(
      password,
      user.rows[0].password
    );

    if (!user.rows[0] || !validatingPassword) {
      return res.sendStatus(401);
    }

    res.locals.user = user;
    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}

import bcrypt from "bcrypt";
import { connectionDB } from "../database/db.js";

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
    
}

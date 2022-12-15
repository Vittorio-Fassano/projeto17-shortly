import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";

import connectionDB from "../database/db.js";

export async function signUp(req, res) {
  const { name, email, password } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    await connectionDB.query(
      `INSERT INTO users (name, email, password, "confirmPassword") 
      VALUES ($1, $2, $3, $4);`,
      [name, email, passwordHash, passwordHash]
    );

    res.sendStatus(201);
  } catch (err) {
    return res.sendStatus(422);
  }
}

export async function signIn(req, res) {
  const { email } = req.body;

  try {
    const token = uuidv4();

    const user = await connectionDB.query(
      `SELECT * 
      FROM users 
      WHERE email = $1;`,
      [email]
    );

    await connectionDB.query(
      `INSERT INTO sessions (token, "userId") 
      VALUES ($1, $2);`,
      [token, user.rows[0].id]
    );

    res.sendStatus(200);
  } catch (err) {
    return res.sendStatus(422);
  }
}

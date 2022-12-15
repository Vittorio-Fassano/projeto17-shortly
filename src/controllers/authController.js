import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";

import { connectionDB } from "../database/db.js";

export async function signUp(req, res) {
  const { name, email, password } = req.body;
  const passwordHash = bcrypt.hashSync(password, 10);

  try {
    await connectionDB.query(
      `INSERT INTO users (name, email, password) 
      VALUES ($1, $2, $3);`,
      [name, email, passwordHash]
    );

    res.sendStatus(201);
  } catch (err) {
    return res.status(422).send(err);
  }
}

export async function signIn(req, res) {}

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

export async function signIn(req, res) {
  try {
    const { user } = res.locals;
    const token = uuidv4();

    await connectionDB.query(
      `INSERT INTO sessions (token, "userId") 
      VALUES ($1, $2);`,
      [token, user.id]
    );

    const session = await connectionDB.query(
      `SELECT * 
      FROM sessions 
      WHERE "userId" = $1;`,
      [user.id]
    );

    res.send(session.rows[0].token).status(200);
  } catch (err) {
    return res.status(422).send(err);
  }
}

import { nanoid } from "nanoid";
import connectionDB from "../database/db.js";

export async function shortUrl(req, res) {
  const { url } = req.body;
  const shortUrl = nanoid();
  const { session } = res.locals;

  try {
    const sessionId = await connectionDB.query(
      `SELECT * 
      FROM sessions
      WHERE "userId" = $1;`,
      [session.rows[0].userId]
    );

    await connectionDB.query(
      `INSERT INTO urls (url, "shortUrl", "userId") 
      VALUES ($1, $2, $3);`,
      [url, shortUrl, sessionId.rows[0].userId]
    );

    res.status(201).send(shortUrl);
  } catch (e) {
    return res.sendStatus(422);
  }
}

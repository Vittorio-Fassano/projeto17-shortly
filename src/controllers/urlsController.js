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

export async function getUrl(req, res) {
  const { id } = req.params;
  try {
    const url = await connectionDB.query(
      `SELECT urls.id, urls."shortUrl", urls.url 
      FROM urls
      WHERE id = $1;`,
      [id]
    );

    res.status(200).send(url.rows[0]);
  } catch (e) {
    return res.sendStatus(422);
  }
}

export async function getUrlShort(req, res) {
  const { shortUrl } = req.params;
  try {
    const url = await connectionDB.query(
      `SELECT * 
      FROM urls 
      WHERE "shortUrl" = $1;`,
      [shortUrl]
    );

    let totalViews = url.rows[0].views + 1;
    await connectionDB.query(
      `UPDATE urls
      SET views = $1 
      WHERE "shortUrl" = $2;`,
      [totalViews, shortUrl]
    );

    return res.redirect(url.rows[0].url);
  } catch (err) {
    return res.sendStatus(500);
  }
}

export async function deleteUrl(req, res) {
  const { id } = req.params;
  try {
    await connectionDB.query(
      `DELETE 
      FROM urls 
      WHERE id = $1;`,
      [id]
    );

    res.sendStatus(204);
  } catch (e) {
    return res.sendStatus(422);
  }
}

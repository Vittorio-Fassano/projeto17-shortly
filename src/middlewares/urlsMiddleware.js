import { urlsSchema } from "../models/urlsSchema.js";
import connectionDB from "../database/db.js";

export async function validatingUrlPost(req, res, next) {
  const { error } = urlsSchema.validate(req.body, { abortEarly: false });
  if (error) {
    return res.status(400).send(error.details.map((detail) => detail.message));
  }

  next();
}

export async function validatingUrlGet(req, res, next) {
  const { id } = req.params;
  try {
    const urlAlreadyExist = await connectionDB.query(
      `SELECT * 
      FROM urls 
      WHERE id = $1;`,
      [id]
    );

    if (urlAlreadyExist.rowCount === 0) {
      return res.sendStatus(409);
    }

    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}

export async function validatingUrlShort(req, res, next) {
  const { shortUrl } = req.params;
  try {
    const urlAlreadyExist = await connectionDB.query(
      `SELECT * 
      FROM urls 
      WHERE "shortUrl" = $1;`,
      [shortUrl]
    );

    if (urlAlreadyExist.rowCount === 0) {
      return res.sendStatus(404);
    }

    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}

export async function validatingUrlDelete(req, res, next) {
  const { session } = res.locals;
  const { id } = req.params;
  try {
    const shortUrlAlreadyExist = await connectionDB.query(
      `SELECT * 
      FROM urls 
      WHERE "id" = $1;`,
      [id]
    );
    
    if (!shortUrlAlreadyExist.rows[0]) {
      return res.sendStatus(404);
    }
    if (shortUrlAlreadyExist.rows[0].userId !== session.rows[0].userId) {
      return res.sendStatus(401);
    }

    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}

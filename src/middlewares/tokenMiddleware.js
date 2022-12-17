import connectionDB from "../database/db.js";

export async function validatingToken(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }
  
  try {
    const sessionAlreadyExist = await connectionDB.query(
      `SELECT * 
      FROM sessions 
      WHERE token = $1;`,
      [token]
    );

    if (!sessionAlreadyExist.rows[0]) {
      return res.sendStatus(409);
    }

    res.locals.session = session;
    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}
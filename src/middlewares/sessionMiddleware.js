import connectionDB from "../database/db.js";

export async function validatingSession(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    return res.sendStatus(401);
  }
  
  try {
    const sessionExist = await connectionDB.query(
      `SELECT * 
      FROM sessions 
      WHERE token = $1;`,
      [token]
    );

    if (!sessionExist.rows[0]) {
      return res.sendStatus(401);
    }

    res.locals.session = sessionExist;
    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}
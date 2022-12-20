import connectionDB from "../database/db.js";

export async function validatingUser(req, res, next) {
  const { id } = req.params;
  const { session } = res.locals;
  try {
    const userAlreadyExist = await connectionDB.query(
      `SELECT * 
      FROM users 
      WHERE id = $1;`,
      [id]
    );
    console.log(userAlreadyExist.rows.id);

    if (!userAlreadyExist.rows[0]) {
      return res.sendStatus(404);
    }
    if (id != session.rows[0].userId) {
      return res.sendStatus(401);
    }

    next();
  } catch (err) {
    return res.sendStatus(500);
  }
}

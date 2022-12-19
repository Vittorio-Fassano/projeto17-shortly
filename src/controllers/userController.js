import connectionDB from "../database/db.js";

export async function user(req, res) {
  const { id } = req.params;
  try {
    //it's missing to add the total number of views of the user in all the posts together
    const userId = await connectionDB.query(
      `SELECT users.id, users.name 
      FROM users 
      WHERE users.id = $1 
      GROUP BY users.id;`,
      [id]
    );
    const user = userId.rows[0];

    const shortId = await connectionDB.query(
        `SELECT urls.id, urls."shortUrl", urls.url, urls.views AS "visitCount"
        FROM urls 
        WHERE "userId" = $1;`,
        [id]
      );
      const short = shortId.rows;

      const result = {...user, short}
      return res.status(200).send(result);
  } catch (err) {
    return res.sendStatus(500);
  }
}

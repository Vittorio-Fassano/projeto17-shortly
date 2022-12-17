import { urlsSchema } from "../models/urlsSchema.js";

export async function validatingUrlPost(req, res, next) {
  const { error } = urlsSchema.validate(req.body, { abortEarly: false });

  if (error) {
    return res.status(400).send(error.details.map((detail) => detail.message));
  }
  
  next();
}

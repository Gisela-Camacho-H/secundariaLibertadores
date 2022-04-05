function authMiddleware(req, res, next) {
    if (!req.session.userLogged) {
      res.locals.isLogged = false;
    }
    next();
  }
  
  module.exports = authMiddleware;
  
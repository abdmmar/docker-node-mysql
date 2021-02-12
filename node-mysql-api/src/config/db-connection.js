require("dotenv").config();
const mysql2 = require("mysql2");
const {
  DATABASE_HOST,
  MYSQL_USER,
  MYSQL_ROOT_PASSWORD,
  MYSQL_DATABASE,
  MYSQL_PORT,
} = process.env;

class DBConnection {
  constructor() {
    this.db = mysql2.createPool({
      host: DATABASE_HOST,
      port: MYSQL_PORT,
      user: MYSQL_USER,
      password: MYSQL_ROOT_PASSWORD,
      database: MYSQL_DATABASE,
    });

    this.checkConnection();
  }

  checkConnection() {
    this.db.getConnection((err, connection) => {
      if (err) {
        if (err.code === "PROTOCOL_CONNECTION_LOST") {
          console.error("Database connection was close");
        }
        if (err.code === "ER_CON_COUNT_ERROR") {
          console.error("Database has too many connection");
        }
        if (err.code === "ECONNREFUSED") {
          console.error("Database connection was refused");
        }
        console.error("Host :" + DATABASE_HOST);
      }

      if (connection) {
        connection.release();
      }
      return;
    });
  }

  query = async (sql, values) => {
    return new Promise((resolve, reject) => {
      const callback = (error, result) => {
        if (error) {
          reject(error);
          return;
        }

        resolve(result);
      };

      this.db.execute(sql, values, callback);
    }).catch((err) => {
      const mysqlErrorList = Object.keys(HttpStatusCodes);

      err.status = mysqlErrorList.includes(err.code)
        ? HttpStatusCodes[err.code]
        : err.status;

      throw err;
    });
  };
}

const HttpStatusCodes = Object.freeze({
  ER_TRUNCATED_WRONG_VALUE_FOR_FIELD: 422,
  ER_DUP_ENTRY: 409,
});

module.exports = new DBConnection().query;

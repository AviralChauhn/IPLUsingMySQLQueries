const sql = require("mysql2/promise");
const matches = require("./data/matches.json");

const connection = sql.createPool({
  host: "localhost",
  user: "root",
  database: "IPL",
});
const createMatchesTable = `
        CREATE TABLE IF NOT EXISTS matches(
            id INT AUTO_INCREMENT PRIMARY KEY,
            season YEAR(4) NOT NULL,
            city VARCHAR(255) NOT NULL,
            date DATE NOT NULL,
            team1 varchar(255) NOT NULL,
            team2 varchar(255) NOT NULL,
            toss_winner varchar(255) NOT NULL,
            toss_decision varchar(255) NOT NULL,
            result varchar(255) NOT NULL,
            dl_applied INT NOT NULL,
            winner varchar(255) NOT NULL,
            win_by_runs INT NOT NULL,
            win_by_wickets INT NOT NULL,
            player_of_match varchar(255) NOT NULL,
            venue varchar(255) NOT NULL,
            umpire1 varchar(255) NOT NULL,
            umpire2 varchar(255) NOT NULL,
            umpire3 varchar(255)
        )
    `;
const insertDataIntoTable = `INSERT INTO matches VALUES ?`;

connection
  .getConnection()
  .then(() => {
    console.log("Database connected");
    return connection.query(createMatchesTable);
  })
  .then(() => {
    return connection.query(insertDataIntoTable, [
      matches.map((ele) => Object.values(ele)),
    ]);
  })
  .catch((err) => {
    console.log(err.message);
  })
  .finally(() => {
    connection.end();
  });

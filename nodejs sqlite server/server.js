const express = require('express');
const app = express();
app.use(express.json());

const sqlite3 = require('sqlite3').verbose();
const dbName = 'game.db';
const db = new sqlite3.Database(dbName, (err) => {
    if (err) console.error(err.message);
    console.log(`Connected to database: '${dbName}'`);
});

const server = app.listen(80, () => {
    const host = server.address().address;
    const port = server.address().port;

    console.log(`Listening at http://${host}:${port}`);

    const sql = `CREATE TABLE IF NOT EXISTS Scores(
        score_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        score_session_time INTERGER NOT NULL,
        score_stages INTEGER NOT NULL,
        score_lives INTEGER NOT NULL,
        score_end INTEGER NOT NULL
    );`;

    db.run(sql, [], (err) => {
        if(err) console.error(err.message);
        
        return;
    });
});

app.post('/scores/', (req, res) => {
    let sql = `INSERT INTO Scores (score_session_time, score_stages, score_lives, score_end)
                VALUES (?, ?, ?, ?);`;
    let params = [req.body.session_time, req.body.stages, req.body.lives, req.body.end];
    db.run(sql, params, (err) =>{
        if (err) {
            console.error(err.message);
            return;
        }
        console.log(`New score added to the database!`);
        res.send('success');
    });
});

app.get('/scores/', (req, res) => {
    let sql = `SELECT * FROM Scores ORDER BY score_end DESC, score_stages DESC, score_lives ASC, score_session_time ASC LIMIT 5;`;
    const params = [];
        db.all(sql, params, (err, rows) => {
            if (err) {
                console.error(err.message);
                return;
            }

            res.end(JSON.stringify(rows));
    });
});
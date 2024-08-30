const { Client } = require('pg');
const client = new Client({
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'test24',
});


async function start(params) {
    try {
        await client.connect();
        const response = await client.query('CREATE TABLE "from_js"("id"serial PRIMARY KEY);');
        console.log(response);
        await client.end();
    } catch (error) {
      console.log(error);
    }
}
start()
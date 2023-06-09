// Database migration schemas.
const createTable = """
    CREATE TABLE words_table (id INTEGER AUTOINCREMENT, word TEXT PRIMARY KEY, translation TEXT)
  """;

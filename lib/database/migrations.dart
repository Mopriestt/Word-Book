// Database migration schemas.
const createTable = """
    CREATE TABLE words_table (id INTEGER PRIMARY KEY AUTOINCREMENT, word TEXT, translation TEXT, comment TEXT)
  """;

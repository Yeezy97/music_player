import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SongDatabase {
  static final SongDatabase instance = SongDatabase._init();

  static Database? _database;

  SongDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('songs.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        artist TEXT
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await instance.database;

    return await db.query(table);
  }

  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await instance.database;

    return await db.insert(table, data);
  }

  Future<int> delete(String table, int id) async {
    final db = await instance.database;

    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}

/// In the SongDatabase class, we create a singleton instance of the database and provide methods to initialize, query, insert, and delete data. The _initDB method initializes the database and creates a favorites table with id, title, and artist columns. The query, insert, and delete methods use the sqflite API to interact with the database.
///
/// Update the toggleFavorite method to insert or delete the selected song from the favorites table:
///
void toggleFavorite(SongModel song) async {
  if (isFavorite(song)) {
    await SongDatabase.instance.delete('favorites', song.title.hashCode);
  } else {
    final data = {'title': song.title, 'artist': song.artist};
    await SongDatabase.instance.insert('favorites', data);
  }

  setState(() {
    if (isFavorite(song)) {
      favorites.remove(song);
    } else {
      favorites.add(song);
    }
  });
}
/// In the modified toggleFavorite method, we use the SongDatabase instance to insert or delete the selected song from the favorites table based on its current selection state. We use the title.hashCode as the primary key to uniquely identify each song in the table.
///
/// Update the build method to load the favorited songs from the favorites table and initialize the favorites list:
///
@override
void initState() {
  super.initState();
  _loadFavorites();
}

void _loadFavorites() async {
  final favorites = await SongDatabase.instance.query('favorites');

  setState(() {
    this.favorites.clear();
    favorites.forEach((favorite) {
      this.favorites.add(SongModel(
        title: favorite['title'],
        artist: favorite['artist'],
      ));
    });
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Song List')),
    body: ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index];
        return ListTile(
          title: Text(song.title),
          subtitle: Text(song.artist),
          trailing: IconButton(
            icon: isFavorite(song) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () => toggleFavorite(song),
          ),
        );
      },
    ),
  );
}
/// In the modified initState method, we use the SongDatabase instance to load the favorited songs from the favorites table and initialize the favorites list. We clear the existing favorites list and add each song retrieved from the table as a new SongModel instance.
///
/// In the modified build method, we update the trailing property of each ListTile to display a solid heart icon if the song is in the favorites list or an outlined heart icon if not. We use the isFavorite method to determine if the current song is in the favorites list.
///
/// That's it! With these modifications, the app will now persist the favorited songs in a local SQLite database so they won't be cleared on closing the app.
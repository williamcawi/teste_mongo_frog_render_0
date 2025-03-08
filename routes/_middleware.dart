import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Db? _db;

Future<Db> getDatabase() async {
  _db ??= await Db.create(
      "mongodb+srv://williamcawi:02021997@dart-frog-prisma-render.widfn.mongodb.net/?retryWrites=true&w=majority&appName=dart-frog-prisma-render-0");

  if (!_db!.isConnected) {
    await _db!.open();
  }

  return _db!;
}

Handler middleware(Handler handler) {
  return (context) async {
    final db = await getDatabase();
    return handler.use(provider<Db>((_) => db)).call(context);
  };
}

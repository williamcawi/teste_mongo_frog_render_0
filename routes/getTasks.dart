import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) async {
  final tasks = await context.read<Db>().collection('tasks').find().toList();

  return Response.json(body: {'result': tasks});
}

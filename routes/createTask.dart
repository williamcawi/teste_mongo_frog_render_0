import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) async {
  await context.read<Db>().collection('tasks').insertOne(
    {
      'title': 'terceira tarefa',
      'description': 'a minha terceira tarefa',
    },
  );

  final tasks = await context.read<Db>().collection('tasks').find().toList();

  return Response.json(body: {'result': tasks});
}

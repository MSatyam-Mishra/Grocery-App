import 'dart:async';
import 'dart:io';

import 'package:cat_repo/cat_repo.dart';
import 'package:dart_frog/dart_frog.dart';

// categories/ endpoint

FutureOr<Response> onRequest(
  RequestContext context,
) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.put:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.post:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final categoryRepo = context.read<CategoryRepo>();
  final categories = await categoryRepo.getCategories();
  return Response.json(body: {'categories': categories});
}

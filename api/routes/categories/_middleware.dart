import 'package:cat_repo/cat_repo.dart';

import 'package:dart_frog/dart_frog.dart';

final _categoryRepo = CategoryRepo();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<CategoryRepo>((_) => _categoryRepo));
}

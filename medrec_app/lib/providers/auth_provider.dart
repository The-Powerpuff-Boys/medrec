import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../apis/authentication.dart';

final authProvider = Provider<Authentication>((ref) {
  return Authentication();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medrec_app/models/doctor.dart';

final doctorProvider = StateProvider<Doctor>((ref) {
  return Doctor(
      fullName: 'Dr. Alex',
      email: 'alex@fortis.com',
      imgUrl:
          'https://images.unsplash.com/photo-1622253694238-3b22139576c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1965&q=80',
      specialization: 'M.B.B.S',
      phoneNumber: 7852319102,
      verified: true);
});

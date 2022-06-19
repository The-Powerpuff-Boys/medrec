import 'package:flutter/material.dart';
import 'package:medrec_app/screens/add_disease_screen.dart';
import 'package:medrec_app/screens/add_patient_record_screen.dart';
import 'package:medrec_app/screens/add_prescription_screen.dart';
import 'package:medrec_app/screens/disease_screen.dart';
import 'package:medrec_app/screens/form_confirm_submit_page.dart';
import 'package:medrec_app/screens/login_page.dart';
import 'package:medrec_app/screens/patient_screen.dart';
import 'package:medrec_app/screens/search_screen.dart';

import '../screens/coming_soon.dart';
import '../screens/home_page.dart';

class MedRecRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        );
      case LoginPage.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const LoginPage(),
        );
      case FormConfirmSubmitPage.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const FormConfirmSubmitPage(),
        );
      case ComingSoonScreen.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const ComingSoonScreen(),
        );
      case SearchScreen.routname:
        return MaterialPageRoute<void>(
          builder: (context) => const SearchScreen(),
        );
      case AddPatientRecordScreen.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const AddPatientRecordScreen(),
        );
      case PatientScreen.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const PatientScreen(),
        );
      case DiseaseScreen.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const DiseaseScreen(),
        );
      case AddDiseaseScreen.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const AddDiseaseScreen(),
        );
      case AddPrescriptionScreen.routename:
        return MaterialPageRoute<void>(
          builder: (context) => const AddPrescriptionScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

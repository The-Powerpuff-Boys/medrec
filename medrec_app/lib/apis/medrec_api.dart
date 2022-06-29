import "package:http/http.dart" as http;

void main() async {
  await MedRecAPI.addPatient();
}

class MedRecAPI {
  static const String baseUrl =
      "https://nameless-depths-37165.herokuapp.com/flutter";

  static Future<void> getDisesaes(String abhaId) async {
    final Uri uri = Uri.parse("$baseUrl/disease/$abhaId");

    try {
      final response = await http.get(uri);
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> getPatientInfo(String abhaId) async {
    final Uri uri = Uri.parse("$baseUrl/patientinfo/$abhaId");

    try {
      final response = await http.get(uri);
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> getPrescriptionInfo(String prescriptionId) async {
    final Uri uri = Uri.parse("$baseUrl/pres/$prescriptionId");

    try {
      final response = await http.get(uri);
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addDisease(String abhaId, String disease) async {
    final Uri uri = Uri.parse("$baseUrl/newdisease/");

    try {
      final response = await http.post(uri, body: {
        "name": disease,
        "abha": abhaId,
      });
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addPrescription(String doctorId, String diseaseId) async {
    final Uri uri = Uri.parse("$baseUrl/addpres/$diseaseId");

    try {
      final response = await http.post(uri, body: {
        "date": "21/12/2019",
        "patientdesc": "Ooh lala",
        "doctordesc": "Zinda hai tu",
        "doctorid": doctorId,
        "medicines": "Crocin"
      });
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> addPatient() async {
    final Uri uri = Uri.parse("$baseUrl/addpatient");

    try {
      final response = await http.post(uri, body: {
        "fname": "Chaman Chaprasi",
        "age": "21",
        "abha": "696969696969",
        "gender": "Male"
      });
      print(response.body);
    } catch (e) {
      rethrow;
    }
  }
}

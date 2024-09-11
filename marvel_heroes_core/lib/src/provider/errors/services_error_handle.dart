import 'dart:convert';

class ServicesErrorHandle {
  static String decodeError(dynamic e) {
    const genericError =
        'Aconteceu algum problema, por favor, tente novamente mais tarde.';
    try {
      if (e.response != null) {
        var jsonContent = jsonDecode(e.error.toString());
        return jsonContent["title"] ?? genericError;
      }
      return genericError;
    } catch (e) {
      return genericError;
    }
  }
}

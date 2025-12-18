abstract class DatabaseServices {

  // Add Data to Database
  Future<void> addData({
    required String path,
    String? docId,
    required Map<String, dynamic> data,
  });

  // Get Data from Database
  Future<dynamic> getData({
    String? docId,
    Map<String, dynamic>? query,
    required String path,
  });

  // Check Data Exists in Database
  Future<bool> checkDataExists({
    required String docId,
    required String path,
  });
}

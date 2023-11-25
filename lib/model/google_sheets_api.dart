
import 'package:feedback/model/feedback_fields.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class FeedbackSheetAPI{
 static const spreadsheetId = '1idgEzrMrE57mmlc8WaTfILdTdpMlRMuxvuJxfIFf6_8';
 //==============================>>>> JSON GoogleSheet
 static const credential = r'''{
  "type": "service_account",
  "project_id": "feedback-400109",
  "private_key_id": "e492f1e92d833969822e832b6bea0aec904a77d0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDUsHG13VQ4fvdG\nDmh/qAGiMPcErHWZbo2dVsBRPUUL1LALIcG2UWLcKnM7DOGIB1euOi3QtWsn16v9\nDHLpEh27nu/u0av8JmkBCGHB14lFm7XZnBZ3XNxwaLSlTG4fTJ2u2EeNEgLyjxnR\nSAtdKiJaItpKgTZIfx98Ig22IMlJ+vtNzvEpU9s+inIDF4vgGrAinAAr6eE349LC\nV2TdZUCl9AU6hpkssKX1B4QUVHQ5eBUbs8IB/6a8SAs2AV4fl7vYyyyxctPE5JaN\nEBwmocKg26K733KjgJ8p98YhcwrooFzds+iQR/usI1exH+6fMM+OZRgayA241vEw\n/gmQ7I8DAgMBAAECggEAEFktrGKCXkNYI3DpFGLoGTz1R80vzubiCMWJy9TPUVz8\nWSazmp1/4Vd7+v5++XNDCJfdPK0tOudHh5Bk5shnM6xAWhWQyDV1ncg0p283VHvn\nCv6F9Y/UO+m4dPo+frZnanCic1P+mQFp5R3KDdO2x0HlkJOFBiaLV4HQlv7HKiH2\nOGwhbnfQh4JAewyE/uvO9hhBIWpTYFJ/RYsBg4F3CoBcgBukawh679M+cUqOAksa\nptt+uKNuHUfy7yBQ5J7TJnh9fMJtAyAY+RRi55aLA0RfMP5Z8OIMlgw+XxFULM/h\n1QWzf9j4F2B0/k5X/MiLOPr9D7pmWAyPT8Dmijlq8QKBgQDyPMWYMNkSR4q94yqQ\nAZpY1sPiqASj7quaEnEFE3AW1jxKZ39i8fVFhTVLPJu3ywjYwbvEc+Azu4dZnJvB\n/MxzeX6v84EJNkJK/9MvG4j2FVHI+U3n3mBj32h+TytZyRyx03xeilzz3EkrLMMg\navRQFBA6qxQ3H7E+Ma/yWCgeEwKBgQDgxeiNKBWa1I4FuXmSbEu/3GmzKwp5jLan\na1tHsz4jB16K51k07LRqgkJdm7rn8Kbvne51Og+ONKk0WjDiZW6TSianntKGGf/F\ne4jmpDd9DHJF1UsIw3MK4aCdJ+ZPhLEXxY8ZVG9QqyiYD9FX968enapQlLNaEbhL\nFQtzyC4pUQKBgQDuC8CV7bLz3rA+KIYEHD8kfHDlRP3CZ2HlN6gvN8nX91IqQAkU\nH/hLCDu2IupXtEOOVtwBk2nJDMlWy6rY+GemNsfDewTcG6EL+Nj8mw993LeRS0U+\nze5lVv9l2MEeK59yNQUsFsZ/soOI1SUvr0tFgmHsdYCZJyDToJpqCi3qVwKBgHcK\nucgQg6i1i+YiPe27Zz7cqCpY0DphuNbgN764gl8g5wRf1FIATujdxfI3qPxv6qmb\nFhCFyHlDEJ4Gaj9tAuwE6IX7ynl1SY24iF/GdxDGR7sOZKfmg4YuytaQrBxPJU92\ntPvwSOgLTfuC3RdeuSNY0zvMFVTNb7JsGd2fFjuRAoGAT5pIFIIheGXZehu1dXYY\nFF6AOf+TG1s+4HQuVpeBHGNmJrtuJEmp9jMlwdaDzlPXZOXTb74rFx6lE94m8eI8\nwSkr4KuN2KRHFCdWmK28QcWjsq61dH0TAN5PIvbe4afBP2U2GD8veihf7zWVNFxU\ncZBuZacGTmLt9Q/udfaYLfo=\n-----END PRIVATE KEY-----\n",
  "client_email": "feedback@feedback-400109.iam.gserviceaccount.com",
  "client_id": "102873799589624446595",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/feedback%40feedback-400109.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';
//==============================>>>> initail value
 static final gsheets = GSheets(credential);
 static Worksheet? feedbackSheet;
//==============================>>>> Function init
 static Future init()async{ 
try{
   final spreadsheet = await gsheets.spreadsheet(spreadsheetId);
  feedbackSheet = await getWorksheet(spreadsheet,  title: 'feedbacksheet');
  final firstRow = FeedbackFields().getFields();
  feedbackSheet?.values.insertRow( 1, firstRow);
}catch(e){
 debugPrint('Print Error $e');
}
 }
//==============================>>>> getWorksheet Function
 static Future<Worksheet> getWorksheet(Spreadsheet spreadsheet,{required String title})async{
try{
  return  await spreadsheet.addWorksheet(title);
  }catch(e){
   return spreadsheet.worksheetByTitle(title)!;
  }
 }
//==============================>>>> Inset Row
 static Future<void> insert(List<Map<String, dynamic>> rowList) async {
    if (feedbackSheet == null) return;
    await feedbackSheet?.values.map.appendRows(rowList);
    debugPrint('=======> UserSheet1 $feedbackSheet');
    debugPrint('=======> UserSheet2 $rowList');
  }
//==============================>>>> get Row
  static Future<int> getRowCount() async {
    if (feedbackSheet == null) return 0;
    final lastRow = await feedbackSheet!.values.lastRow();
    return int.tryParse(lastRow!.first) ?? 0;
  }
}

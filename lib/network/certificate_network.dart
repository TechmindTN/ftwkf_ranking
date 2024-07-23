import 'package:dio/dio.dart';
import 'apis.dart';

class CertificateNetwork{
  Apis apis = Apis();

  getCertificateByUser(int id) async {
    Response res = await apis.dio.get("${apis.baseUrl+apis.getCertificateByUser+id.toString()}/",
    options: Options(
      // headers: {
      //   // "Authorization":Apis.tempToken
      // }
    )
    );
    return res;
  }

  uploadImage(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.uploadImage,
        options: Options(
            contentType:
                "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            // headers: {"Authorization": Apis.tempToken}
            ),
        data: data);
    return res;
  }

  addCertificate(data) async {
    print("${apis.baseUrl+apis.addCertificate}/");
    Response res = await apis.dio.post("${apis.baseUrl+apis.addCertificate}",
    data: data,
    options: Options(
      // headers: {
      //   // "Authorization":Apis.tempToken
      // }
    )
    );
    return res;
  }
  }
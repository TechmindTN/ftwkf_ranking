import 'package:dio/dio.dart';
import 'package:mobile_ftwkf_ranking/network/apis.dart';

class LicenceNetwork {
  Apis apis = Apis();
  login(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.login,
        data: data
    );
    return res;
  }

  simpleLogin(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.simpleLogin,
        data: data
    );
    return res;
  }

  createUser(data) async {
    print(apis.baseUrl + apis.createUser);
     Response res = await apis.dio.post(apis.baseUrl + apis.createUser,
        
        data: data);
    return res;
  }

  getLicenceListInfo(clubid,pageNumber) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.paginatedLicenceListInfo,
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: {'userid': 274,
        // 'club':clubid,
        'page_size':10,
        'page_number':pageNumber
        });
    return res;
  }

  getParameters() async {
    Response res = await apis.dio.get(
      apis.baseUrl + apis.getParameters,
      // options: Options(headers: {"Authorization": Apis.tempToken}
      // ),
    );
    return res;
  }

  deleteLicence(id) async {
    Response res=await apis.dio.delete("${apis.baseUrl}${apis.deleteLicence}$id/",
        options: Options(headers: {"Authorization": Apis.tempToken}),);
        return res;
  }

  addFullLicence(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.addFullLicence,
        // options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }
  addSimpleFullLicence(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.addSimpleFullLicence,
        // options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
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

  editProfile(data,id) async {
    Response res = await apis.dio.put("${apis.baseUrl}${apis.editProfile}$id/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  editAthleteLicence(data) async {
    Response res = await apis.dio.put(apis.baseUrl + apis.editAthleteLicence,
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  compareLicence(data) async {
    Response res = await apis.dio.post(apis.baseUrl+apis.compareLicence,
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  editAthleteProfile(data,id) async {
    Response res = await apis.dio.put("${apis.baseUrl}${apis.editAthleteProfile}$id/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  editArbitratorProfile(data,id) async {
    Response res = await apis.dio.put("${apis.baseUrl}${apis.editArbitratorProfile}$id/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

 editArbitratorLicence(data) async {
    Response res = await apis.dio.put(apis.baseUrl + apis.editArbitratorLicence,
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  editCoachLicence(data) async {
    Response res = await apis.dio.put(apis.baseUrl + apis.editCoachLicence,
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  editCoachProfile(data,id) async {
    Response res = await apis.dio.put("${apis.baseUrl}${apis.editCoachProfile}$id/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }
  
  editAthleteImages(data,id) async {
    Response res = await apis.dio.put("${apis.baseUrl}${apis.editAthlete}$id/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }

  renewLicence(data,id) async {
    try{
      Response res = await apis.dio.put("${apis.baseUrl + apis.renewLicence+id}/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }
  catch(e){
    //print(e);
  }
  }

  renewArbitratorLicence(data,id) async {
    try{
      Response res = await apis.dio.put("${apis.baseUrl + apis.renewArbitratorLicence+id}/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }
  catch(e){
    //print(e);
  }
  }

  renewCoachLicence(data,id) async {
    try{
      Response res = await apis.dio.put("${apis.baseUrl + apis.renewCoachLicence+id}/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        data: data);
    return res;
  }
  catch(e){
    //print(e);
  }
  }

  validateLicence(licenceId) async {
    Response res = await apis.dio.put("${apis.baseUrl + apis.validateLicence+licenceId}/",
        options: Options(headers: {"Authorization": Apis.tempToken}),
        );
    return res;
  }

  getLicenceById(id) async {
    Response res = await apis.dio.get("${apis.baseUrl+apis.licenceById+id}/",
    options: Options(
      headers: {
        "Authorization":Apis.tempToken
      }
    )
    );
    return res;
  }

  searchLicences(id,role) async {
    Response res = await apis.dio.post("${apis.baseUrl+apis.searchLicences+id}/",
    options: Options(
      headers: {
        "Authorization":Apis.tempToken,

      },    
    ),
    data: {"userid":274,
    "role":role
    }
    );
    return res;
  }

  filterLicences(data,pageSize,pageNumber) async {
    Response res = await apis.dio.post(apis.baseUrl+apis.paginatedLicenceListInfo,
    options: Options(
      headers: {
        "Authorization":Apis.tempToken,

      },    
    ),
    data: data
    );
    return res;
  }

  getStats() async {
    Response res = await apis.dio.get(apis.baseUrl+apis.getStats,
    options: Options(
      headers: {
        "Authorization":Apis.tempToken,

      },    
    ),
    );
    return res;
  }

  getClubStats(id) async {
    Response res = await apis.dio.get("${apis.baseUrl+apis.getClubStats+id}/",
    options: Options(
      headers: {
        "Authorization":Apis.tempToken,

      },    
    ),
    );
    return res;
  }
}

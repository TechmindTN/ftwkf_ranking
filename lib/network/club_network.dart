import 'package:dio/dio.dart';
import 'apis.dart';

class ClubNetwork{
  Apis apis = Apis();
  editClub(data,id) async {
    Response res = await apis.dio.put("${apis.baseUrl}${apis.editClub}$id/",
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );   
    return res;
  }

  addClub(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.addClub,
        data: data
    );
    return res;
  }
  changeClubPassword(data,id) async {
    Response res=await apis.dio.put("${apis.baseUrl+apis.changeClubPassword+id}/",
    options: Options(
      headers: {"Authorization":Apis.tempToken}
    ),
    data: data
    );
    return res;

  }

  changePassword(data,id) async {
    Response res=await apis.dio.put("${apis.baseUrl+apis.changePassword+id}/",
    options: Options(
      headers: {"Authorization":Apis.tempToken}
    ),
    data: data
    );
    return res;

  }
}
import 'package:dio/dio.dart';
import 'apis.dart';

class ParameterNetwork{
  Apis apis = Apis();
  addLigue(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.ligue,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  addCategory(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.category,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  addDegree(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.degree,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  addGrade(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.grade,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  addDiscipline(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.discipline,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  addWeight(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.weight,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  addSeason(data) async {
    Response res = await apis.dio.post(apis.baseUrl + apis.season,
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
        data: data
    );
    return res;
  }

  deleteLigue(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.ligue}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  deleteDegree(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.degree}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  deleteGrade(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.grade}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  deleteDiscipline(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.discipline}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  deleteCategory(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.category}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  deleteWeight(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.weight}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  deleteSeason(id) async {
    Response res = await apis.dio.delete('${apis.baseUrl}${apis.season}$id/',
         options: Options(
           headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  activateSeason(id) async {
    print('${apis.baseUrl}${apis.activateSeason}$id/');
    Response res = await apis.dio.put('${apis.baseUrl}${apis.activateSeason}$id/',
    //      options: Options(
    //       //  headers: {"Authorization": Apis.tempToken}),
    );
    return res;
  }
  // addCategory(data) async {
  //   ////print(apis.baseUrl);
  //   Response res = await apis.dio.post(apis.baseUrl + apis.category,
  //        options: Options(
  //          headers: {"Authorization": Apis.tempToken}),
  //       data: data
  //   );
  //   return res;
  // }
  // addDegree(data) async {
  //   ////print(apis.baseUrl);
  //   Response res = await apis.dio.post(apis.baseUrl + apis.degree,
  //        options: Options(
  //          headers: {"Authorization": Apis.tempToken}),
  //       data: data
  //   );
  //   return res;
  // }
  // addGrade(data) async {
  //   ////print(apis.baseUrl);
  //   Response res = await apis.dio.post(apis.baseUrl + apis.grade,
  //        options: Options(
  //          headers: {"Authorization": Apis.tempToken}),
  //       data: data
  //   );
  //   return res;
  // }
  // addDiscipline(data) async {
  //   ////print(apis.baseUrl);
  //   Response res = await apis.dio.post(apis.baseUrl + apis.discipline,
  //        options: Options(
  //          headers: {"Authorization": Apis.tempToken}),
  //       data: data
  //   );
  //   return res;
  // }
  // addWeight(data) async {
  //   ////print(apis.baseUrl);
  //   Response res = await apis.dio.post(apis.baseUrl + apis.weight,
  //        options: Options(
  //          headers: {"Authorization": Apis.tempToken}),
  //       data: data
  //   );
  //   return res;
  // }
  // addSeason(data) async {
  //   ////print(apis.baseUrl);
  //   Response res = await apis.dio.post(apis.baseUrl + apis.season,
  //        options: Options(
  //          headers: {"Authorization": Apis.tempToken}),
  //       data: data
  //   );
  //   return res;
  // }
}
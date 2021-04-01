import 'package:myapp/bean/celebrity_entity.dart';
import 'package:myapp/bean/celebrity_work_entity.dart';
import 'package:myapp/http/http_request.dart';
import 'package:myapp/http/API.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class PersonDetailRepository {
  CelebrityEntity celebrityEntity;
  CelebrityWorkEntity celebrityWorkEntity;
  HttpRequest _httpRequest = HttpRequest(API.BASE_URL);
  PersonDetailRepository({this.celebrityEntity, this.celebrityWorkEntity});

  Future<PersonDetailRepository> requestAPI(String id) async {
    String responseStr = await rootBundle.loadString('mock/works.json');
    var responseJson = json.decode(responseStr);

    // var result = await _httpRequest.get(
    //     '/v2/movie/celebrity/$id/works?apikey=0b2bdeda43b5688921839c8ecb20399b');
    celebrityWorkEntity = CelebrityWorkEntity.fromJson(responseJson);

    String responseStrz = await rootBundle.loadString('mock/celebrity.json');
    var responseJsonz = json.decode(responseStrz);
    // result = await _httpRequest
    //     .get('/v2/movie/celebrity/$id?apikey=0b2bdeda43b5688921839c8ecb20399b');
    celebrityEntity = CelebrityEntity.fromJson(responseJsonz);

    return PersonDetailRepository(
        celebrityEntity: celebrityEntity,
        celebrityWorkEntity: celebrityWorkEntity);
  }
}

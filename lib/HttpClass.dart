import 'dart:convert';
import 'package:http/http.dart';
import 'PostModel.dart';

class HttpService {
  final String fit_bit_row_data_url = "192.168.89.223:4002/watch";
  final String stress_level_url = "192.168.89.223:4002/stress_levels";
  final String vacantion_needed_url = "192.168.89.223:4002/vacation";
  final String stress_level_interval_url = "192.168.89.223:4002/stress_levels";
  final String block_chain_post_url = "192.168.89.223:3004/new_vacantion";
  final String block_chain_get_url = "192.168.89.223:3004/all_vacantions";

  Future<T?> getRequest<T> () async {
    T? data;
    Response res;
    if (T is FitBitRowData) {
      res = await get(Uri.parse(fit_bit_row_data_url));

      if (res.statusCode == 200) {
        dynamic body = json.decode(res.body);
        FitBitRowData get_data = FitBitRowData.fromJson(body);
        data = get_data as T?;
      }
    } else if (T is StressLevel) {
      res = await get(Uri.parse(stress_level_url));

      if (res.statusCode == 200) {
        dynamic body = json.decode(res.body);
        StressLevel get_data = StressLevel.fromJson(body);
        data = get_data as T?;
      }
    } else if (T is VacantionNeeded) {
      res = await get(Uri.parse(vacantion_needed_url));

      if (res.statusCode == 200) {
        dynamic body = json.decode(res.body);
        VacantionNeeded get_data = VacantionNeeded.fromJson(body);
        data = get_data as T?;
      }
    } else if (T is StressLevelInterval) {
      res = await get(Uri.parse(stress_level_interval_url));

      if (res.statusCode == 200) {
        dynamic body = json.decode(res.body);
        StressLevelInterval get_data = StressLevelInterval.fromJson(body);
        data = get_data as T?;
      }
    } else if (T is BlockChainPost) {
      res = await get(Uri.parse(stress_level_interval_url));

      if (res.statusCode == 200) {
        dynamic body = json.decode(res.body);
        StressLevelInterval get_data = StressLevelInterval.fromJson(body);
        data = get_data as T?;
      }
    }

    return data;
  }

  Future<Response> postRequest<T>(String info) {
    dynamic body;
    if (T is BlockChainPost) {
      BlockChainPost obj = BlockChainPost(info);
      body = obj.ToJson();
    }

    return post(
        Uri.parse(block_chain_post_url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body
    );
  }
}
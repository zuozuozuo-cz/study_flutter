import 'package:dio/dio.dart';
import 'package:study_flutter/mvvm/models/member_model.dart';

class MemberService {
  final Dio _dio = Dio();

  Future<List<MemberModel>> fetchMembers() async {
    /// https://h5.48.cn/resource/jsonp/allmembers.php?gid=10  # SNH48 上海正团
    /// https://h5.48.cn/resource/jsonp/allmembers.php?gid=20  # BEJ48 北京姐妹团
    /// https://h5.48.cn/resource/jsonp/allmembers.php?gid=30  # GNZ48 广州姐妹团
    /// https://h5.48.cn/resource/jsonp/allmembers.php?gid=40  # CKG48 重庆姐妹团
    /// https://h5.48.cn/resource/jsonp/allmembers.php?gid=50  # CGT48 成都姐妹团（已成立）
    /// https://h5.48.cn/resource/jsonp/allmembers.php?gid=60  # JNR48 少儿练习生团计划

    final response = await _dio
        .get('https://h5.48.cn/resource/jsonp/allmembers.php?gid=60');
    print('fetchMembers ---------- > ${response.data.toString()}');
    if (response.data is Map && response.data['rows'] is List) {
      final List<dynamic> rows = response.data['rows'];
      return rows.map((e) => MemberModel.fromJson(e)).toList();
    } else {
      throw Exception('接口返回数据格式异常');
    }
  }
}

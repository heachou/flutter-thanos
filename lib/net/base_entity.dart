import 'package:thanos/values/values.dart';

class BaseEntity<T> {
  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code] as int;
    message = json[Constant.message] as String;
    if (json.containsKey(Constant.data)) {
      data = _generateOBJ<T>(json[Constant.data]);
    }
  }

  int code;
  String message;
  T data;

  T _generateOBJ<T>(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    }
    return _generateList(json);
  }

  _generateList<T>(List json) {
    List<T> mData = new List<T>();
    if (json != null) {
      json.forEach((v) {
        mData.add(_generateOBJ<T>(v));
      });
    }
    return mData;
  }
}

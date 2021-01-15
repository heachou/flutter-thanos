// To parse this JSON data, do
//
//     final userResponseLogin2 = userResponseLogin2FromJson(jsonString);

import 'dart:convert';

class UserResponseLogin {
  UserResponseLogin({
    this.loginResult,
    this.token,
    this.tel,
    this.accountId,
    this.userName,
    this.realName,
    this.goldPlateNumber,
    this.jobNumber,
    this.photoPath,
    this.organizationId,
    this.orgText,
    this.fullOrgText,
    this.gender,
    this.gmtCreate,
    this.postId,
    this.postName,
    this.businessId,
    this.businessCode,
    this.businessList,
    this.menuList,
    this.callChannelList,
    this.functionAuthority,
    this.functionAuthorityCodeString,
    this.loginPostId,
    this.loginBusinessId,
    this.loginBusinessCode,
    this.loginPostName,
    this.userId,
    this.loginChannel,
    this.realIp,
  });

  bool loginResult;
  String token;
  String tel;
  int accountId;
  String userName;
  String realName;
  String goldPlateNumber;
  String jobNumber;
  String photoPath;
  int organizationId;
  String orgText;
  String fullOrgText;
  String gender;
  String gmtCreate;
  int postId;
  String postName;
  int businessId;
  String businessCode;
  List<BusinessListElement> businessList;
  List<MenuList> menuList;
  List<String> callChannelList;
  String functionAuthority;
  String functionAuthorityCodeString;
  int loginPostId;
  int loginBusinessId;
  String loginBusinessCode;
  String loginPostName;
  int userId;
  int loginChannel;
  String realIp;

  factory UserResponseLogin.fromRawJson(String str) =>
      UserResponseLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponseLogin.fromJson(Map<String, dynamic> json) =>
      UserResponseLogin(
        loginResult: json["loginResult"],
        token: json["token"],
        tel: json["tel"],
        accountId: json["accountId"],
        userName: json["userName"],
        realName: json["realName"],
        goldPlateNumber: json["goldPlateNumber"],
        jobNumber: json["jobNumber"],
        photoPath: json["photoPath"],
        organizationId: json["organizationId"],
        orgText: json["orgText"],
        fullOrgText: json["fullOrgText"],
        gender: json["gender"],
        gmtCreate: json["gmtCreate"],
        postId: json["postId"],
        postName: json["postName"],
        businessId: json["businessId"],
        businessCode: json["businessCode"],
        businessList: List<BusinessListElement>.from(
            json["businessList"].map((x) => BusinessListElement.fromJson(x))),
        menuList: List<MenuList>.from(
            json["menuList"].map((x) => MenuList.fromJson(x))),
        callChannelList:
            List<String>.from(json["callChannelList"].map((x) => x)),
        functionAuthority: json["functionAuthority"],
        functionAuthorityCodeString: json["functionAuthorityCodeString"],
        loginPostId: json["loginPostId"],
        loginBusinessId: json["loginBusinessId"],
        loginBusinessCode: json["loginBusinessCode"],
        loginPostName: json["loginPostName"],
        userId: json["userId"],
        loginChannel: json["loginChannel"],
        realIp: json["realIp"],
      );

  Map<String, dynamic> toJson() => {
        "loginResult": loginResult,
        "token": token,
        "tel": tel,
        "accountId": accountId,
        "userName": userName,
        "realName": realName,
        "goldPlateNumber": goldPlateNumber,
        "jobNumber": jobNumber,
        "photoPath": photoPath,
        "organizationId": organizationId,
        "orgText": orgText,
        "fullOrgText": fullOrgText,
        "gender": gender,
        "gmtCreate": gmtCreate,
        "postId": postId,
        "postName": postName,
        "businessId": businessId,
        "businessCode": businessCode,
        "businessList": List<dynamic>.from(businessList.map((x) => x.toJson())),
        "menuList": List<dynamic>.from(menuList.map((x) => x.toJson())),
        "callChannelList": List<dynamic>.from(callChannelList.map((x) => x)),
        "functionAuthority": functionAuthority,
        "functionAuthorityCodeString": functionAuthorityCodeString,
        "loginPostId": loginPostId,
        "loginBusinessId": loginBusinessId,
        "loginBusinessCode": loginBusinessCode,
        "loginPostName": loginPostName,
        "userId": userId,
        "loginChannel": loginChannel,
        "realIp": realIp,
      };
}

class BusinessListElement {
  BusinessListElement({
    this.id,
    this.name,
    this.loginStatus,
    this.postList,
  });

  int id;
  String name;
  bool loginStatus;
  List<BusinessListElement> postList;

  factory BusinessListElement.fromRawJson(String str) =>
      BusinessListElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessListElement.fromJson(Map<String, dynamic> json) =>
      BusinessListElement(
        id: json["id"],
        name: json["name"],
        loginStatus: json["loginStatus"],
        postList: json["postList"] == null
            ? null
            : List<BusinessListElement>.from(
                json["postList"].map((x) => BusinessListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "loginStatus": loginStatus,
        "postList": postList == null
            ? null
            : List<dynamic>.from(postList.map((x) => x.toJson())),
      };
}

class MenuList {
  MenuList({
    this.id,
    this.name,
    this.routerName,
    this.description,
    this.code,
    this.parentId,
    this.url,
    this.ico,
    this.startOpen,
    this.show,
  });

  int id;
  String name;
  String routerName;
  String description;
  String code;
  int parentId;
  String url;
  String ico;
  bool startOpen;
  bool show;

  factory MenuList.fromRawJson(String str) =>
      MenuList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
        id: json["id"],
        name: json["name"],
        routerName: json["routerName"],
        description: json["description"],
        code: json["code"] == null ? null : json["code"],
        parentId: json["parentId"],
        url: json["url"],
        ico: json["ico"],
        startOpen: json["startOpen"],
        show: json["show"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "routerName": routerName,
        "description": description,
        "code": code == null ? null : code,
        "parentId": parentId,
        "url": url,
        "ico": ico,
        "startOpen": startOpen,
        "show": show,
      };
}

class UserRequestLogin {
  UserRequestLogin({
    this.authType,
    this.handPhone,
    this.authCode,
    this.loginChannel,
  });

  String authType;
  String handPhone;
  int authCode;
  int loginChannel;

  factory UserRequestLogin.fromRawJson(String str) =>
      UserRequestLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserRequestLogin.fromJson(Map<String, dynamic> json) =>
      UserRequestLogin(
        authType: json["authType"],
        handPhone: json["handPhone"],
        authCode: json["authCode"],
        loginChannel: json["loginChannel"],
      );

  Map<String, dynamic> toJson() => {
        "authType": authType,
        "handPhone": handPhone,
        "authCode": authCode,
        "loginChannel": loginChannel,
      };
}

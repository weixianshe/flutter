// To parse this JSON data, do
//
//     final songDetail = songDetailFromJson(jsonString);

import 'dart:convert';

SongDetail songDetailFromJson(String str) =>
    SongDetail.fromJson(json.decode(str));

String songDetailToJson(SongDetail data) => json.encode(data.toJson());

class SongDetail {
  List<Song> songs;
  List<Privilege> privileges;
  int code;

  SongDetail({
    required this.songs,
    required this.privileges,
    required this.code,
  });

  factory SongDetail.fromJson(Map<String, dynamic> json) => SongDetail(
        songs: List<Song>.from(json["songs"].map((x) => Song.fromJson(x))),
        privileges: List<Privilege>.from(
            json["privileges"].map((x) => Privilege.fromJson(x))),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "songs": List<dynamic>.from(songs.map((x) => x.toJson())),
        "privileges": List<dynamic>.from(privileges.map((x) => x.toJson())),
        "code": code,
      };
}

class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;
  int playMaxbr;
  int downloadMaxbr;
  String maxBrLevel;
  String playMaxBrLevel;
  String downloadMaxBrLevel;
  String plLevel;
  String dlLevel;
  String flLevel;
  dynamic rscl;
  FreeTrialPrivilege freeTrialPrivilege;
  List<ChargeInfoList> chargeInfoList;

  Privilege({
    required this.id,
    required this.fee,
    required this.payed,
    required this.st,
    required this.pl,
    required this.dl,
    required this.sp,
    required this.cp,
    required this.subp,
    required this.cs,
    required this.maxbr,
    required this.fl,
    required this.toast,
    required this.flag,
    required this.preSell,
    required this.playMaxbr,
    required this.downloadMaxbr,
    required this.maxBrLevel,
    required this.playMaxBrLevel,
    required this.downloadMaxBrLevel,
    required this.plLevel,
    required this.dlLevel,
    required this.flLevel,
    this.rscl,
    required this.freeTrialPrivilege,
    required this.chargeInfoList,
  });

  factory Privilege.fromJson(Map<String, dynamic> json) => Privilege(
        id: json["id"],
        fee: json["fee"],
        payed: json["payed"],
        st: json["st"],
        pl: json["pl"],
        dl: json["dl"],
        sp: json["sp"],
        cp: json["cp"],
        subp: json["subp"],
        cs: json["cs"],
        maxbr: json["maxbr"],
        fl: json["fl"],
        toast: json["toast"],
        flag: json["flag"],
        preSell: json["preSell"],
        playMaxbr: json["playMaxbr"],
        downloadMaxbr: json["downloadMaxbr"],
        maxBrLevel: json["maxBrLevel"],
        playMaxBrLevel: json["playMaxBrLevel"],
        downloadMaxBrLevel: json["downloadMaxBrLevel"],
        plLevel: json["plLevel"],
        dlLevel: json["dlLevel"],
        flLevel: json["flLevel"],
        rscl: json["rscl"],
        freeTrialPrivilege:
            FreeTrialPrivilege.fromJson(json["freeTrialPrivilege"]),
        chargeInfoList: List<ChargeInfoList>.from(
            json["chargeInfoList"].map((x) => ChargeInfoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fee": fee,
        "payed": payed,
        "st": st,
        "pl": pl,
        "dl": dl,
        "sp": sp,
        "cp": cp,
        "subp": subp,
        "cs": cs,
        "maxbr": maxbr,
        "fl": fl,
        "toast": toast,
        "flag": flag,
        "preSell": preSell,
        "playMaxbr": playMaxbr,
        "downloadMaxbr": downloadMaxbr,
        "maxBrLevel": maxBrLevel,
        "playMaxBrLevel": playMaxBrLevel,
        "downloadMaxBrLevel": downloadMaxBrLevel,
        "plLevel": plLevel,
        "dlLevel": dlLevel,
        "flLevel": flLevel,
        "rscl": rscl,
        "freeTrialPrivilege": freeTrialPrivilege.toJson(),
        "chargeInfoList":
            List<dynamic>.from(chargeInfoList.map((x) => x.toJson())),
      };
}

class ChargeInfoList {
  int rate;
  dynamic chargeUrl;
  dynamic chargeMessage;
  int chargeType;

  ChargeInfoList({
    required this.rate,
    this.chargeUrl,
    this.chargeMessage,
    required this.chargeType,
  });

  factory ChargeInfoList.fromJson(Map<String, dynamic> json) => ChargeInfoList(
        rate: json["rate"],
        chargeUrl: json["chargeUrl"],
        chargeMessage: json["chargeMessage"],
        chargeType: json["chargeType"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "chargeUrl": chargeUrl,
        "chargeMessage": chargeMessage,
        "chargeType": chargeType,
      };
}

class FreeTrialPrivilege {
  bool resConsumable;
  bool userConsumable;
  dynamic listenType;

  FreeTrialPrivilege({
    required this.resConsumable,
    required this.userConsumable,
    this.listenType,
  });

  factory FreeTrialPrivilege.fromJson(Map<String, dynamic> json) =>
      FreeTrialPrivilege(
        resConsumable: json["resConsumable"],
        userConsumable: json["userConsumable"],
        listenType: json["listenType"],
      );

  Map<String, dynamic> toJson() => {
        "resConsumable": resConsumable,
        "userConsumable": userConsumable,
        "listenType": listenType,
      };
}

class Song {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<dynamic> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  dynamic crbt;
  String cf;
  Al al;
  int dt;
  H h;
  H m;
  H l;
  H sq;
  dynamic hr;
  dynamic a;
  String cd;
  int no;
  dynamic rtUrl;
  int ftype;
  List<dynamic> rtUrls;
  int djId;
  int copyright;
  int sId;
  int mark;
  int originCoverType;
  dynamic originSongSimpleData;
  dynamic tagPicList;
  bool resourceState;
  int version;
  dynamic songJumpInfo;
  dynamic entertainmentTags;
  dynamic awardTags;
  int single;
  dynamic noCopyrightRcmd;
  int rtype;
  dynamic rurl;
  int mst;
  int cp;
  int mv;
  int publishTime;

  Song({
    required this.name,
    required this.id,
    required this.pst,
    required this.t,
    required this.ar,
    required this.alia,
    required this.pop,
    required this.st,
    required this.rt,
    required this.fee,
    required this.v,
    this.crbt,
    required this.cf,
    required this.al,
    required this.dt,
    required this.h,
    required this.m,
    required this.l,
    required this.sq,
    this.hr,
    this.a,
    required this.cd,
    required this.no,
    this.rtUrl,
    required this.ftype,
    required this.rtUrls,
    required this.djId,
    required this.copyright,
    required this.sId,
    required this.mark,
    required this.originCoverType,
    this.originSongSimpleData,
    this.tagPicList,
    required this.resourceState,
    required this.version,
    this.songJumpInfo,
    this.entertainmentTags,
    this.awardTags,
    required this.single,
    this.noCopyrightRcmd,
    required this.rtype,
    this.rurl,
    required this.mst,
    required this.cp,
    required this.mv,
    required this.publishTime,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        name: json["name"],
        id: json["id"],
        pst: json["pst"],
        t: json["t"],
        ar: List<Ar>.from(json["ar"].map((x) => Ar.fromJson(x))),
        alia: List<dynamic>.from(json["alia"].map((x) => x)),
        pop: json["pop"],
        st: json["st"],
        rt: json["rt"],
        fee: json["fee"],
        v: json["v"],
        crbt: json["crbt"],
        cf: json["cf"],
        al: Al.fromJson(json["al"]),
        dt: json["dt"],
        h: H.fromJson(json["h"]),
        m: H.fromJson(json["m"]),
        l: H.fromJson(json["l"]),
        sq: H.fromJson(json["sq"]),
        hr: json["hr"],
        a: json["a"],
        cd: json["cd"],
        no: json["no"],
        rtUrl: json["rtUrl"],
        ftype: json["ftype"],
        rtUrls: List<dynamic>.from(json["rtUrls"].map((x) => x)),
        djId: json["djId"],
        copyright: json["copyright"],
        sId: json["s_id"],
        mark: json["mark"],
        originCoverType: json["originCoverType"],
        originSongSimpleData: json["originSongSimpleData"],
        tagPicList: json["tagPicList"],
        resourceState: json["resourceState"],
        version: json["version"],
        songJumpInfo: json["songJumpInfo"],
        entertainmentTags: json["entertainmentTags"],
        awardTags: json["awardTags"],
        single: json["single"],
        noCopyrightRcmd: json["noCopyrightRcmd"],
        rtype: json["rtype"],
        rurl: json["rurl"],
        mst: json["mst"],
        cp: json["cp"],
        mv: json["mv"],
        publishTime: json["publishTime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "pst": pst,
        "t": t,
        "ar": List<dynamic>.from(ar.map((x) => x.toJson())),
        "alia": List<dynamic>.from(alia.map((x) => x)),
        "pop": pop,
        "st": st,
        "rt": rt,
        "fee": fee,
        "v": v,
        "crbt": crbt,
        "cf": cf,
        "al": al.toJson(),
        "dt": dt,
        "h": h.toJson(),
        "m": m.toJson(),
        "l": l.toJson(),
        "sq": sq.toJson(),
        "hr": hr,
        "a": a,
        "cd": cd,
        "no": no,
        "rtUrl": rtUrl,
        "ftype": ftype,
        "rtUrls": List<dynamic>.from(rtUrls.map((x) => x)),
        "djId": djId,
        "copyright": copyright,
        "s_id": sId,
        "mark": mark,
        "originCoverType": originCoverType,
        "originSongSimpleData": originSongSimpleData,
        "tagPicList": tagPicList,
        "resourceState": resourceState,
        "version": version,
        "songJumpInfo": songJumpInfo,
        "entertainmentTags": entertainmentTags,
        "awardTags": awardTags,
        "single": single,
        "noCopyrightRcmd": noCopyrightRcmd,
        "rtype": rtype,
        "rurl": rurl,
        "mst": mst,
        "cp": cp,
        "mv": mv,
        "publishTime": publishTime,
      };
}

class Al {
  int id;
  String name;
  String picUrl;
  List<dynamic> tns;
  String picStr;
  double pic;

  Al({
    required this.id,
    required this.name,
    required this.picUrl,
    required this.tns,
    required this.picStr,
    required this.pic,
  });

  factory Al.fromJson(Map<String, dynamic> json) => Al(
        id: json["id"],
        name: json["name"],
        picUrl: json["picUrl"],
        tns: List<dynamic>.from(json["tns"].map((x) => x)),
        picStr: json["pic_str"],
        pic: json["pic"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picUrl": picUrl,
        "tns": List<dynamic>.from(tns.map((x) => x)),
        "pic_str": picStr,
        "pic": pic,
      };
}

class Ar {
  int id;
  String name;
  List<dynamic> tns;
  List<dynamic> alias;

  Ar({
    required this.id,
    required this.name,
    required this.tns,
    required this.alias,
  });

  factory Ar.fromJson(Map<String, dynamic> json) => Ar(
        id: json["id"],
        name: json["name"],
        tns: List<dynamic>.from(json["tns"].map((x) => x)),
        alias: List<dynamic>.from(json["alias"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tns": List<dynamic>.from(tns.map((x) => x)),
        "alias": List<dynamic>.from(alias.map((x) => x)),
      };
}

class H {
  int br;
  int fid;
  int size;
  int vd;
  int sr;

  H({
    required this.br,
    required this.fid,
    required this.size,
    required this.vd,
    required this.sr,
  });

  factory H.fromJson(Map<String, dynamic> json) => H(
        br: json["br"],
        fid: json["fid"],
        size: json["size"],
        vd: json["vd"],
        sr: json["sr"],
      );

  Map<String, dynamic> toJson() => {
        "br": br,
        "fid": fid,
        "size": size,
        "vd": vd,
        "sr": sr,
      };
}

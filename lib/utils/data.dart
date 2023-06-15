class FormatData {
  static String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  static final icons = [
    {
      "icon":
          "http://p1.music.126.net/4DpSgAVpJny4Ewf-Xw_WQQ==/109951163986641971.jpg",
      "text": "每日推荐"
    },
    {
      "icon":
          "http://p1.music.126.net/Shi7cRT1bDhwpVDM7AOFXg==/109951165265330616.jpg",
      "text": "私人FM"
    },
    {
      "icon":
          "http://p1.music.126.net/uG5p6CnwAHrLqOkaSeRlnA==/109951163986649164.jpg",
      "text": "歌单"
    },
    {
      "icon":
          "http://p1.music.126.net/SDFC6A3X2wzUCavYyeGIOg==/109951163986649670.jpg",
      "text": "排行榜"
    },
    {
      "icon":
          "http://p1.music.126.net/Kb4oK0m_ocs3FR3lo-r9yg==/109951167319110429.jpg",
      "text": "有声书"
    },
    {
      "icon":
          "http://p1.music.126.net/nRWhsf3P7r7eqHz-v61VBg==/109951166989045593.jpg",
      "text": "数字专辑"
    },
    {
      "icon":
          "http://p1.music.126.net/2JvVZZjcjyCE72fGMsC1hg==/109951166989043011.jpg",
      "text": "直播"
    },
    {
      "icon":
          "http://p1.music.126.net/BAOWsqZmmxL8JIH-wejMmQ==/109951167294312390.jpg",
      "text": "关注新歌"
    },
    {
      "icon":
          "http://p1.music.126.net/gk99UFRasebERf38t6A1kA==/109951168168319514.jpg",
      "text": "收藏家"
    },
    {
      "icon":
          "http://p1.music.126.net/qzKViKyOodgMYIEpp5t1NQ==/109951166989041366.jpg",
      "text": "游戏专区"
    }
  ];
}

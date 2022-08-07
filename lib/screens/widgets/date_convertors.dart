class DateConverter {
  static String dateConverterMonth(String string) {
    int i = 0;
    String s = "";
    String monthNum = string.split('')[5] + string.split('')[6];
    String dayNum = string.split('')[8] + string.split('')[9];

    List<String> m = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    List<String> mN = [
      '01',
      '02',
      '03',
      '04',
      '05',
      '06',
      '07',
      '08',
      '09',
      '10',
      '11',
      '12'
    ];

    for (i = 0; i < 12; ++i) {
      if (monthNum == mN[i]) {
        s = dayNum + ' ' + m[i] + ' ';
        break;
      }
    }

    for (i = 0; i < 4; ++i) {
      s += string.split('')[i];
    }

    return s;
  }

  static String dateConverterOnly(String string) {
    String b = "";
    b = string.split("T")[0];

    String s =
        b[8] + b[9] + '-' + b[5] + b[6] + '-' + b[0] + b[1] + b[2] + b[3];

    return s;
  }

  static String dateConverterSince(String string) {
    String s = "";
    int apiDay = int.parse(string.split("")[8] + string.split("")[9]);
    int currentDay = DateTime.now().day;

    if (currentDay == apiDay) {
      s = "Today";
    } else if (currentDay == apiDay + 1) {
      s = "Yesterday";
    } else if (currentDay > apiDay + 1) {
      s = "Since ${currentDay - apiDay} days";
    }

    return s;
  }

  static String dateConverterHours24Mode(String string) {
    int i = 0;
    String s = "";

    for (i = 11; i < 16; ++i) {
      s += string.split('')[i];
    }

    return s;
  }

  static String dateConverterHoursAmPmMode(String string) {
    int i = 0;
    String s = "";
    int mode = int.parse(string[11] + string[12]);
    List<String> duration = ['AM', 'PM'];

    if (mode > 11) {
      if (mode != 12) mode -= 12;

      s += '0' + mode.toString();

      for (i = 13; i < 16; ++i) {
        s += string.split('')[i];
      }

      s += '' + duration[1];
    } else {
      for (i = 11; i < 16; ++i) {
        s += string.split('')[i];
      }

      s += '' + duration[0];
    }

    return s;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateHelper {
  static String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  static String formatTimeOfDay24(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    DateFormat format = DateFormat("HH:mm");
    return format.format(dt);
  }

  static String formatDate(dynamic datex, {String dtFormat = 'dd/MM/yyyy'}) {
    if (datex == null) return '';
    DateTime date;
    if (datex is String) {
      date = fromString(datex);
    } else if (datex is DateTime) {
      date = datex;
    } else {
      date = DateTime.now();
    }

    final format = DateFormat(dtFormat);
    return format.format(date);
  }

  static String dateConvert(String date) {
    return DateHelper.formatDate(
      DateTime.parse(date),
    );
  }

  static String formatDateHumanTime(dynamic datex) {
    if (datex == null) return '';
    DateTime date = DateTime.now();
    if (datex is DateTime) {
      date = datex;
    }
    if (datex is String) {
      date = fromString(datex, withWIB: false);
    }
    String dtFormat = 'HH:mm';

    Locale myLocale = Localizations.localeOf(Get.context!);
    final format = DateFormat(dtFormat, myLocale.languageCode);
    // print(format.format(date),);
    return format.format(date);
  }

  static String formatDateHumanShort(dynamic datex, {bool forcedWIB=false, String? customFormat, bool textWIB=true}) {
    if (datex == null) return '';
    DateTime date = DateTime.now();
    if (datex is DateTime) {
      date = datex;
    }
    if (datex is String) {
      date = forcedWIB ? fromStringFixedWIB(datex) : fromString(datex, withWIB: false);
    }
    String dtFormat = forcedWIB
        ? '${customFormat ?? 'EEEE, dd/MM/yyyy • HH:mm'}${textWIB ? ' WIB' : ''}'
        : customFormat ?? 'EEEE, dd/MM/yyyy • HH:mm';
    Locale myLocale = Localizations.localeOf(Get.context!);
    final format = DateFormat(dtFormat, myLocale.languageCode);
    // print(format.format(date),);
    return format.format(date);
  }

  static String formatDateTimeAlreadyWIB(dynamic datex, {String? customFormat}) {
    DateFormat defaultFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    String freshConverted = defaultFormat.format(
      DateTime.parse(datex),
    );

    String setWIB = fromStringFixedWIB(freshConverted).toString();

    DateFormat formatDateTIme = DateFormat(customFormat ?? 'yyyy-MM-dd HH:mm:ss');

    return formatDateTIme.format(
      DateTime.parse(setWIB),
    );
  }

  static DateTime fromStringFixedWIB(String val) {
    String time = val.replaceFirst(r'Z', '');
    time += '-0700';
    return DateTime.parse(time);
  }

  static String formatDateCustom(dynamic datex, {String? dateFormat}) {
    if (datex == null) return '';
    DateTime date = DateTime.now();
    if (datex is DateTime) {
      date = datex;
    }
    if (datex is String) {
      date = fromString(datex, withWIB: false);
    }
    String dtFormat = dateFormat ?? 'd MMMM yyyy';

    Locale myLocale = Localizations.localeOf(Get.context!);
    final format = DateFormat(dtFormat, myLocale.languageCode);
    // print(format.format(date),);
    return format.format(date);
  }

  static String formatDateHuman(dynamic datex,
      {bool showTime = false,
      bool withEnter = false,
      bool withDayName = true,
      bool useAbbr = false,
      bool yesterDay = false}) {
    if (datex == null) return '';
    DateTime date = DateTime.now();
    if (datex is DateTime) {
      date = datex;
    }
    if (datex is String) {
      date = fromString(datex, withWIB: false);
    }
    if (yesterDay) {
      date = date.subtract(
        const Duration(days: 1),
      );
    }
    String dtFormat = 'd MMMM yyyy';
    if (useAbbr) {
      dtFormat = 'd MMM yyyy';
    }

    if (withDayName) {
      if (withEnter) {
        dtFormat = 'EEEE,\n $dtFormat';
      } else {
        dtFormat = 'EEEE, $dtFormat';
      }
    }
    if (showTime) {
      dtFormat += ' HH:mm';
    }

    Locale myLocale = Localizations.localeOf(Get.context!);
    final format = DateFormat(dtFormat, myLocale.languageCode);
    // print(format.format(date),);
    return format.format(date);
  }

  static String? getDayName(String? day) {
    Map<String, String> dayData = {
      '1': 'Senin',
      '2': 'Selasa',
      '3': 'Rabu',
      '4': 'Kamis',
      '5': 'Jumat',
      '6': 'Sabtu',
      '7': 'Minggu'
    };
    if (day == null || day.isEmpty) return '';
    return dayData[day];
  }

  static String? getDay({DateTime? date}) {
    Map<String, String> dayData = {
      'Senin': '1',
      'Selasa': '2',
      'Rabu': '3',
      'Kamis': '4',
      'Jumat': '5',
      'Sabtu': '6',
      'Minggu': '7',
    };

    date ??= DateTime.now();

    String dtFormat = 'EEEE';
    String locale = 'id';
    final format = DateFormat(dtFormat, locale);
    String day = format.format(date);
    return dayData[day];
  }

  static String formatDateSQL(DateTime date) {
    String dtFormat = 'yyyy-MM-dd';
    final format = DateFormat(dtFormat);
    return format.format(date);
  }

  static DateTime fromString(String? val, {bool withWIB=true}) {
    if (val == null) return DateTime.now();
    if (withWIB) {
      if (val.split(" ").length > 1) {
        val += '+07:00';
      }
    }
    DateTime? times;
    try {
      times = DateTime.parse(val).isUtc ? DateTime.parse(val).toLocal() : DateTime.parse(val);
    } catch (ex) {
      times = DateTime.now();
    }
    return times;
  }

  static String formatTimefromString(String? t) {
    if (t == null) {
      return '';
    }
    List<String> dateString = t.split(' ');
    if (dateString.length == 2) {
      t = dateString.last;
    }
    List<String> timeString = t.split(":");
    if (timeString.length >= 2) {
      return '${timeString[0]}:${timeString[1]}';
    } else {
      return '';
    }
  }

  static TimeOfDay? stringToTimeOfDay(String? t) {
    if (t == null) {
      return null;
    }
    List<String> timeString = t.split(":");
    int hour = 0;
    int minute = 0;
    if (timeString.length >= 2) {
      hour = int.tryParse(timeString[0]) ?? 0;
      minute = int.tryParse(timeString[1]) ?? 0;
    }
    TimeOfDay time = TimeOfDay(hour: hour, minute: minute);
    return time;
  }

  static DateTime stringToDateTime(String date) {
    return DateTime.parse(date);
  }

  static bool isExpired(String? date, {int? inMonth, DateTime? targetTime, bool withTime=false}) {
    if (date == null) return false;
    bool status = false;
    DateTime? expired = fromString(date);
    DateTime? nowDate = targetTime ?? DateTime.now();
    if (inMonth != null) {
      expired = DateTime(expired.year, expired.month + inMonth, expired.day);
    }
    var open = withTime
        ? DateTime(nowDate.year, nowDate.month, nowDate.day, nowDate.hour, nowDate.minute, nowDate.second,
            nowDate.millisecond, nowDate.microsecond)
        : DateTime(nowDate.year, nowDate.month, nowDate.day);
    var close = withTime
        ? DateTime(expired.year, expired.month, expired.day, expired.hour, expired.minute, expired.second,
            expired.millisecond, expired.microsecond)
        : DateTime(expired.year, expired.month, expired.day);
    status = open.isAfter(close);
    return status;
  }

  static bool isBefore(String? date, {int? inMonth, DateTime? targetTime}) {
    if (date == null) return false;
    bool status = false;
    DateTime? expired = fromString(date);
    DateTime? nowDate = targetTime ?? DateTime.now();
    if (inMonth != null) {
      expired = DateTime(expired.year, expired.month + inMonth, expired.day);
    }
    var open = DateTime(nowDate.year, nowDate.month, nowDate.day, nowDate.hour, nowDate.minute, nowDate.second,
        nowDate.millisecond, nowDate.microsecond);
    var close = DateTime(expired.year, expired.month, expired.day, expired.hour, expired.minute, expired.second,
        expired.millisecond, expired.microsecond);
    // if(isOneDayBefore){
    //   close = DateTime(expired.year, expired.month, expired.day-1,expired.hour+23,expired.minute+59,expired.second,expired.millisecond,expired.microsecond);
    // }
    //print(open);
    //print(close);
    status = open.isBefore(close);

    return status;
  }

  static bool isSameDate(dynamic date) {
    if (date == null) return false;
    bool status = false;
    DateTime? expired;
    if (date is String) {
      expired = fromString(date);
    } else if (date is DateTime) {
      expired = date;
    } else {
      return status;
    }

    DateTime nowDate = DateTime.now();
    var open = DateTime(nowDate.year, nowDate.month, nowDate.day);
    var close = DateTime(expired.year, expired.month, expired.day);
    status = open.isAtSameMomentAs(close);
    return status;
  }

  static String? getTimeAgo(dynamic val) {
    if (val == null) return '';
    DateTime value;
    if (val is String) {
      value = stringToDateTime(val);
    } else {
      value = val;
    }
    timeago.setLocaleMessages(
      'id',
      timeago.IdMessages(),
    );
    return timeago.format(value, locale: 'id');
  }

  static bool isBetweenDates(String? startDate, String? endDate,
      {bool withTime=false, bool beforeEnd= false, DateTime? targetDate, bool showLog= false}) {
    if (startDate == null || endDate == null) return false;
    bool status = false;
    DateTime? targetNowDate;
    if (targetDate != null) {
      targetNowDate = fromString(
        targetDate.toString(),
      );
    }
    DateTime? nowDate = targetNowDate ?? DateTime.now();
    DateTime? stDate;
    DateTime? enDate;
    try {
      stDate = fromString(startDate);
    } catch (ex) {
      stDate = null;
    }
    try {
      enDate = fromString(endDate);
    } catch (ex) {
      enDate = null;
    }
    // if(targetDate!=null)print(nowDate);
    if (showLog) {
      print('COMPARE TIME!');
      print(stDate);
      print(enDate);
      print(nowDate);
    }
    bool status1 = false;
    bool status2 = false;
    if (withTime) {
      if (stDate != null) {
        var open = DateTime(nowDate.year, nowDate.month, nowDate.day, nowDate.hour, nowDate.minute, nowDate.second,
            nowDate.millisecond, nowDate.microsecond);
        var close = DateTime(stDate.year, stDate.month, stDate.day, stDate.hour, stDate.minute, stDate.second,
            stDate.millisecond, stDate.microsecond);
        status1 = open.isAfter(close) || open.isAtSameMomentAs(close);
      }
      if (enDate != null) {
        var open = DateTime(nowDate.year, nowDate.month, nowDate.day, nowDate.hour, nowDate.minute, nowDate.second,
            nowDate.millisecond, nowDate.microsecond);
        var close = DateTime(enDate.year, enDate.month, enDate.day, enDate.hour, enDate.minute, enDate.second,
            enDate.millisecond, enDate.microsecond);
        if (!beforeEnd) {
          status2 = open.isBefore(close) || open.isAtSameMomentAs(close);
        } else {
          status2 = open.isBefore(close);
        }
      } else {
        status2 = true;
      }
    } else {
      if (stDate != null) {
        var open = DateTime(nowDate.year, nowDate.month, nowDate.day);
        var close = DateTime(stDate.year, stDate.month, stDate.day);
        status1 = open.isAfter(close) || open.isAtSameMomentAs(close);
      }
      if (enDate != null) {
        var open = DateTime(nowDate.year, nowDate.month, nowDate.day);
        var close = DateTime(enDate.year, enDate.month, enDate.day);
        if (!beforeEnd) {
          status2 = open.isBefore(close) || open.isAtSameMomentAs(close);
        } else {
          status2 = open.isBefore(close);
        }
      } else {
        status2 = true;
      }
    }
    status = status1 && status2;
    return status;
  }

  static String getShortDayLocalName(dynamic datex) {
    String shortDay = 'DAY';
    switch (formatDate(DateTime.parse(datex).toLocal(), dtFormat: 'EEEE').toUpperCase().substring(0, 3)) {
      case 'SUN':
        shortDay = 'MIN';
        break;
      case 'MON':
        shortDay = 'SEN';
        break;
      case 'TUE':
        shortDay = 'SEL';
        break;
      case 'WED':
        shortDay = 'RAB';
        break;
      case 'THU':
        shortDay = 'KAM';
        break;
      case 'FRI':
        shortDay = 'JUM';
        break;
      case 'SAT':
        shortDay = 'SAB';
        break;
      default:
        shortDay = 'DAY';
        break;
    }
    return shortDay;
  }

  static List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
    List<DateTime> day = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      day.add(startDate.add(
        Duration(days: i),
      ));
    }
    return day;
  }

  static String getDateValueOfString(dynamic datex) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final currentDate = DateTime.parse(datex);

    final aDate = DateTime(currentDate.year, currentDate.month, currentDate.day);
    if (aDate == today) {
      return 'Hari ini';
    } else if (aDate == yesterday) {
      return 'Kemarin';
    } else if (aDate == tomorrow) {
      return 'Besok';
    } else {
      return formatDateCustom(datex, dateFormat: 'dd MMM yy');
    }
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}

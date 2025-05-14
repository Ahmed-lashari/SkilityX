class TimeFormater {
  // 14th May, 2025
  static String formatTimestamp(String time) {
    final date = DateTime.fromMicrosecondsSinceEpoch(int.parse(time));

    final day = date.day;
    final month = _monthName(date.month);
    final year = date.year;

    final suffix = _getDaySuffix(day);

    return '$day$suffix $month, $year';
  }

  static String _monthName(int month) {
    const months = [
      '', // to make indexs 1 based
      'Jan', 'Feb', 'March', 'April', 'May', 'June',
      'July', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }

  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';

    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}

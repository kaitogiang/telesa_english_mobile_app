enum StreakStatus { done, today, upcoming }

class StreakDayEntity {
  final String dayName; // tên ngày: Mon, Tue, ...
  final StreakStatus status; // trạng thái streak
  final String? dateLabel; // ngày thực tế dưới dạng String (tuỳ chọn hiển thị)

  StreakDayEntity({
    required this.dayName,
    required this.status,
    this.dateLabel,
  });
}

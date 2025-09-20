extension StringExtension on String {
  String formatCurrency([String unit = 'vnđ']) {
    return '$this $unit';
  }
}

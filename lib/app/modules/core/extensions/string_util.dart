extension StringExtend on String {
  bool get isBlank {
    return this == null || this.trim().isEmpty;
  }
}

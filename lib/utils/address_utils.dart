String removePlusCode(String address) {
  final plusCodePattern = RegExp(r'^[A-Z0-9\+]+, ');
  return address.replaceFirst(plusCodePattern, '');
}

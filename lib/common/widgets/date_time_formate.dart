

 dateFormat({DateTime? dateTime, String ?format}) {
   return DateFormat(format ?? 'dd MMMM, yyyy').format(dateTime);
 }

DateFormat(String s) {
}

DateTime stringToDate(String date) => DateTime.parse(date);


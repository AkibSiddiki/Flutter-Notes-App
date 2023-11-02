class Note {
  final int id;
  final String title;
  final String details;
  final int delete;
  final String insertDatetime;
  final String updateDatetime;
  final String deleteDatetime;

  const Note(
      {required this.id,
      required this.title,
      required this.details,
      required this.delete,
      required this.insertDatetime,
      required this.updateDatetime,
      required this.deleteDatetime});
}

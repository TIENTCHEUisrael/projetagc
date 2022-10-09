class language {
  final int id;
  final String name;
  final String flag;
  final String languagecode;

  language(
      {required this.id,
      required this.name,
      required this.flag,
      required this.languagecode});
  static List<language> languageList() {
    return <language>[
      language(id: 1, name: '🇺🇸', flag: 'English', languagecode: "en"),
      language(id: 2, name: '🇫🇷', flag: 'French', languagecode: "fr"),
    ];
  }
}

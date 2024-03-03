class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel addSimilarWord(
      {required String similarWord, required bool isArabicSimilarWord}) {
    List<String> newSimilarWord =
        _initializeNewSimilarWords(isArabicSimilarWord: isArabicSimilarWord);

    newSimilarWord.add(similarWord);
    return _getWordAfterCheckSimilarWords(
      newSimilarWord: newSimilarWord,
      isArabicSimilarWord: isArabicSimilarWord,
    );
  }

  WordModel deleteSimilarWord(
      {required int IndexAtSimilarWord, required bool isArabicSimilarWord}) {
    List<String> newSimilarWord =
        _initializeNewSimilarWords(isArabicSimilarWord: isArabicSimilarWord);

    newSimilarWord.removeAt(IndexAtSimilarWord);

    return _getWordAfterCheckSimilarWords(
      newSimilarWord: newSimilarWord,
      isArabicSimilarWord: isArabicSimilarWord,
    );
  }

  List<String> _initializeNewSimilarWords({required bool isArabicSimilarWord}) {
    if (isArabicSimilarWord) {
      return List.from(arabicSimilarWords);
    } else {
      return List.from(englishSimilarWords);
    }
  }

  WordModel _getWordAfterCheckSimilarWords(
      {required List<String> newSimilarWord,
      required bool isArabicSimilarWord}) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:
          isArabicSimilarWord ? newSimilarWord : arabicSimilarWords,
      englishSimilarWords:
          !isArabicSimilarWord ? newSimilarWord : englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }
}

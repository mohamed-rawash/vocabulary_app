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

  WordModel decrementIndexAtDataBase() {
    return WordModel(
      indexAtDatabase: indexAtDatabase - 1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

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

  WordModel deleteExample(int indexAtExamples, bool isArabicExample) {
    List<String> newExamples = _intializeNewExamples(isArabicExample);
    newExamples.removeAt(indexAtExamples);
    return _getWordAfterCheckExamples(newExamples, isArabicExample);
  }

  WordModel addExample(String example, bool isArabicExample) {
    List<String> newExamples = _intializeNewExamples(isArabicExample);
    newExamples.add(example);
    return _getWordAfterCheckExamples(newExamples, isArabicExample);
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

  List<String> _intializeNewExamples(bool isArabicExample) {
    if (isArabicExample) {
      return List.from(arabicExamples);
    }
    return List.from(englishExamples);
  }

  WordModel _getWordAfterCheckExamples(
      List<String> newExamples, bool isArabicExample) {
    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabicExample ? newExamples : arabicExamples,
      englishExamples: !isArabicExample ? newExamples : englishExamples,
    );
  }
}

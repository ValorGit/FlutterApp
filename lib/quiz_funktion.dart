class QuizFunktion {
  int position = 0;
  var questions = [
    "fragen 1hjgkjgksdjfskjgk jfdlgjdg ljsgglsjljdsfkd sdgndsgn sdbmsdbs, sfbsmfs sbsfnsm dsbsfbsdm jdjlgf jsf dsglg lfjslgl sldjljgls  skljslg sd lfsdljsldjdlgjgfj",
    "fragen 2",
    "fragen 3",
    "fragen 4",
  ];
  var choices = [
    ["ab", "cd", "ef", "gh"],
    ["aa", "bb", "cc", "dd"],
    ["s", "b", "c", "d"],
    ["aad", "bab", "ccs", "add"]
  ];
  var correctAnswers = ["cd", "aa", "c", "bab"];

  String getQuestion() {
    return questions[position];
  }

  bool isFinshed() {
    if (position >= questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  /*int printQuestionNumber() {
    print(_fragenNummer);
  }
  int printQuestionsLength() {
    print(_fragen.length);
  }*/

  void reset() {
    position = 0;
  }

  String getAnswer() {
    return correctAnswers[position];
  }

  void nextQuestion() {
    if (position < questions.length - 1) {
      position++;
    }
  }
}

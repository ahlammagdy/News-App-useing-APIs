abstract class NewsStates {}

class Newsinitstate extends NewsStates {}

class Newsbattonnavbarstate extends NewsStates {}

class Newsgetbusinesssuccessstate extends NewsStates {}

class Newsgetbusinesserrorstate extends NewsStates {
  final String error;
  Newsgetbusinesserrorstate(this.error);
}

class Newsgetbusinessloadingstate extends NewsStates {}

class Newsgetsportssuccessstate extends NewsStates {}

class Newsgetsportserrorstate extends NewsStates {
  final String error;
  Newsgetsportserrorstate(this.error);
}

class Newsgetsportsloadingstate extends NewsStates {}

class Newsgetsciencesuccessstate extends NewsStates {}

class Newsgetscienceerrorstate extends NewsStates {
  final String error;
  Newsgetscienceerrorstate(this.error);
}

class Newsgetscienceloadingstate extends NewsStates {}

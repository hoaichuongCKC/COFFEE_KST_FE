abstract class CodeState {
  const CodeState();
}

class InititalCode extends CodeState {
  const InititalCode();
}

class SucessCode extends CodeState {}

class LoadingCode extends CodeState {}

class FailedCode extends CodeState {}

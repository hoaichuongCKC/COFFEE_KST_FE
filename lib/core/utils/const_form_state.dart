//state form defaults
abstract class FormAppState {
  const FormAppState();
}

class FormInitState extends FormAppState {
  const FormInitState();
}

class FormSubmittingState extends FormAppState {}

class FormSubmitSuccessState extends FormAppState {}

class FormSubmitFailedState extends FormAppState {}

import 'dart:async';

class LoginBloc {
  StreamController<String> emailController = StreamController<String>();
  StreamController<String> passwordController = StreamController<String>();

  Stream<String> get emailStream => emailController.stream;

  Stream<String> get passwordStream => passwordController.stream;

  Sink<String> get emailSink => emailController.sink;

  Sink<String> get passwordSink => passwordController.sink;

  getEmailError({String msg}) {
    emailSink.add(msg);
  }

  getPasswordError({String msg}) {
    passwordSink.add(msg);
  }

  void dispose() {
    emailController.close();
    passwordController.close();
  }
}

class LoginRepository {
  Future Login() async {
    await Future.delayed(const Duration(seconds: 3));
    throw Exception('Login Failed');
  }
}

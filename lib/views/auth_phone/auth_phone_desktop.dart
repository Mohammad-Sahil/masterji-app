part of auth_phone_view;

class _AuthPhoneDesktop extends StatelessWidget {
  final AuthPhoneViewModel viewModel;

  _AuthPhoneDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AuthPhoneDesktop')),
    );
  }
}
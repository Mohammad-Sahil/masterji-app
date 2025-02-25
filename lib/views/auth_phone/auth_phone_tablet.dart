part of auth_phone_view;

class _AuthPhoneTablet extends StatelessWidget {
  final AuthPhoneViewModel viewModel;

  _AuthPhoneTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AuthPhoneTablet')),
    );
  }
}
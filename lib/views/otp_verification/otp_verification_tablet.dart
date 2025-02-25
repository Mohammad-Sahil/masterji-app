part of otp_verification_view;

class _OtpVerificationTablet extends StatelessWidget {
  final OtpVerificationViewModel viewModel;

  _OtpVerificationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OtpVerificationTablet')),
    );
  }
}
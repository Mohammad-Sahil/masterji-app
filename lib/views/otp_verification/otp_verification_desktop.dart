part of otp_verification_view;

class _OtpVerificationDesktop extends StatelessWidget {
  final OtpVerificationViewModel viewModel;

  _OtpVerificationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OtpVerificationDesktop')),
    );
  }
}
part of onboarding_screen_view;

class _OnboardingScreenDesktop extends StatelessWidget {
  final OnboardingScreenViewModel viewModel;

  _OnboardingScreenDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OnboardingScreenDesktop')),
    );
  }
}
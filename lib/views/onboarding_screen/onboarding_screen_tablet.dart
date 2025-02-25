part of onboarding_screen_view;

class _OnboardingScreenTablet extends StatelessWidget {
  final OnboardingScreenViewModel viewModel;

  _OnboardingScreenTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OnboardingScreenTablet')),
    );
  }
}
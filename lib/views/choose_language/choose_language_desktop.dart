part of choose_language_view;

class _ChooseLanguageDesktop extends StatelessWidget {
  final ChooseLanguageViewModel viewModel;

  _ChooseLanguageDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ChooseLanguageDesktop')),
    );
  }
}
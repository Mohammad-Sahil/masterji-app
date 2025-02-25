part of choose_language_view;

class _ChooseLanguageTablet extends StatelessWidget {
  final ChooseLanguageViewModel viewModel;

  _ChooseLanguageTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ChooseLanguageTablet')),
    );
  }
}
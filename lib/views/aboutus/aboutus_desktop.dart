part of aboutus_view;

class _AboutusDesktop extends StatelessWidget {
  final AboutusViewModel viewModel;

  _AboutusDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AboutusDesktop')),
    );
  }
}
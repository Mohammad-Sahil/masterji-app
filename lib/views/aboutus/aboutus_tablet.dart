part of aboutus_view;

class _AboutusTablet extends StatelessWidget {
  final AboutusViewModel viewModel;

  _AboutusTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AboutusTablet')),
    );
  }
}
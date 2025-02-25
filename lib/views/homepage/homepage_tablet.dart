part of homepage_view;

class _HomepageTablet extends StatelessWidget {
  final HomepageViewModel viewModel;

  _HomepageTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomepageTablet')),
    );
  }
}
part of homepage_view;

class _HomepageDesktop extends StatelessWidget {
  final HomepageViewModel viewModel;

  _HomepageDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomepageDesktop')),
    );
  }
}
part of choose_location_view;

class _ChooseLocationTablet extends StatelessWidget {
  final ChooseLocationViewModel viewModel;

  _ChooseLocationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ChooseLocationTablet')),
    );
  }
}
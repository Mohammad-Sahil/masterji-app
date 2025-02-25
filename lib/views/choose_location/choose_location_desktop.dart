part of choose_location_view;

class _ChooseLocationDesktop extends StatelessWidget {
  final ChooseLocationViewModel viewModel;

  _ChooseLocationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ChooseLocationDesktop')),
    );
  }
}
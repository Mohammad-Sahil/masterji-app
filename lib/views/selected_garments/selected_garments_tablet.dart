part of selected_garments_view;

class _SelectedGarmentsTablet extends StatelessWidget {
  final SelectedGarmentsViewModel viewModel;

  _SelectedGarmentsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SelectedGarmentsTablet')),
    );
  }
}
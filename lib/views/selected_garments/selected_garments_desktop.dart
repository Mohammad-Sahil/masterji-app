part of selected_garments_view;

class _SelectedGarmentsDesktop extends StatelessWidget {
  final SelectedGarmentsViewModel viewModel;

  _SelectedGarmentsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SelectedGarmentsDesktop')),
    );
  }
}
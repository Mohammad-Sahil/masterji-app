part of confirmvisit_view;

class _ConfirmvisitDesktop extends StatelessWidget {
  final ConfirmvisitViewModel viewModel;

  _ConfirmvisitDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ConfirmvisitDesktop')),
    );
  }
}
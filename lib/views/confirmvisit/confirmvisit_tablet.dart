part of confirmvisit_view;

class _ConfirmvisitTablet extends StatelessWidget {
  final ConfirmvisitViewModel viewModel;

  _ConfirmvisitTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ConfirmvisitTablet')),
    );
  }
}
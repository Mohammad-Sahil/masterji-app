part of fabricshops_view;

class _FabricshopsDesktop extends StatelessWidget {
  final FabricshopsViewModel viewModel;

  _FabricshopsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FabricshopsDesktop')),
    );
  }
}
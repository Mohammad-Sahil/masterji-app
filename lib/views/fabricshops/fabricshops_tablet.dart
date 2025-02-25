part of fabricshops_view;

class _FabricshopsTablet extends StatelessWidget {
  final FabricshopsViewModel viewModel;

  _FabricshopsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FabricshopsTablet')),
    );
  }
}
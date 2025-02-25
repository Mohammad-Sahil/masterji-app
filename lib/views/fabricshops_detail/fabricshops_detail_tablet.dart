part of fabricshops_detail_view;

class _FabricshopsDetailTablet extends StatelessWidget {
  final FabricshopsDetailViewModel viewModel;

  _FabricshopsDetailTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FabricshopsDetailTablet')),
    );
  }
}
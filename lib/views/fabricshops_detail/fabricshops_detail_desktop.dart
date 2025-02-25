part of fabricshops_detail_view;

class _FabricshopsDetailDesktop extends StatelessWidget {
  final FabricshopsDetailViewModel viewModel;

  _FabricshopsDetailDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FabricshopsDetailDesktop')),
    );
  }
}
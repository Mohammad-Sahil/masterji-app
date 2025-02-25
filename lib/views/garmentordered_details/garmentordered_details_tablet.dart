part of garmentordered_details_view;

class _GarmentorderedDetailsTablet extends StatelessWidget {
  final GarmentorderedDetailsViewModel viewModel;

  _GarmentorderedDetailsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GarmentorderedDetailsTablet')),
    );
  }
}
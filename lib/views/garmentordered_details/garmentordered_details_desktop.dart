part of garmentordered_details_view;

class _GarmentorderedDetailsDesktop extends StatelessWidget {
  final GarmentorderedDetailsViewModel viewModel;

  _GarmentorderedDetailsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GarmentorderedDetailsDesktop')),
    );
  }
}
part of fashionconsultants_details_view;

class _FashionconsultantsDetailsDesktop extends StatelessWidget {
  final FashionconsultantsDetailsViewModel viewModel;

  _FashionconsultantsDetailsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FashionconsultantsDetailsDesktop')),
    );
  }
}
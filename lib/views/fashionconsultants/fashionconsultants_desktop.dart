part of fashionconsultants_view;

class _FashionconsultantsDesktop extends StatelessWidget {
  final FashionconsultantsViewModel viewModel;

  _FashionconsultantsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FashionconsultantsDesktop')),
    );
  }
}
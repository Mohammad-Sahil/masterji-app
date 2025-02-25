part of fashionconsultants_view;

class _FashionconsultantsTablet extends StatelessWidget {
  final FashionconsultantsViewModel viewModel;

  _FashionconsultantsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FashionconsultantsTablet')),
    );
  }
}
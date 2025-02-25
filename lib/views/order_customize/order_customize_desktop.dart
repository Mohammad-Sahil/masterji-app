part of order_customize_view;

class _OrderCustomizeDesktop extends StatelessWidget {
  final OrderCustomizeViewModel viewModel;

  _OrderCustomizeDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OrderCustomizeDesktop')),
    );
  }
}
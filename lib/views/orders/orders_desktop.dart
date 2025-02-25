part of orders_view;

class _OrdersDesktop extends StatelessWidget {
  final OrdersViewModel viewModel;

  _OrdersDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OrdersDesktop')),
    );
  }
}
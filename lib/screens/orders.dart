import 'package:estore/models/enums.dart';
import 'package:estore/models/models.dart';
import 'package:estore/setup/constants.dart';
import 'package:estore/setup/responsivness.dart';
import 'package:flutter/material.dart';
import 'package:estore/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  static String routeName = '/orders';
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          child: Container(
            height: getPropScreenHeight(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kPrimaryColor),
            child: TabBar(
              tabs: [
                Text("Ongoing"),
                Text("History"),
              ],
              controller: tabController,
              labelColor: kTextColor,
              labelStyle: Theme.of(context).textTheme.bodyText1,
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: Theme.of(context).textTheme.bodyText2,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.white, width: 1.0)),
            ),
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        ),
      ),
      body: TabBarView(children: [
        Ongoing(),
        History(),
      ], controller: tabController),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
    );
  }
}

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    var state1 = Provider.of<OrderController>(context);

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state1.previousOrders.length,
        itemBuilder: (context, index) {
          return OrderCard(
              productTitle: state1.previousOrders[index].item!.title,
              productPrice: state1.previousOrders[index].item!.price,
              currency: state1.previousOrders[index].item!.currency,
              image: state1.previousOrders[index].item!.imageUrl,
              status: state1.previousOrders[index].orderStatus,
              address: state1.previousOrders[index].deliveryAddress,
              totalAmount: state1.previousOrders[index].totalAmount);
        },
      ),
    );
  }
}

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    var state2 = Provider.of<OrderController>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: state2.ongoingOrders.length,
        itemBuilder: (context, index) {
          return OrderCard(
              productTitle: state2.ongoingOrders[index].item!.title,
              productPrice: state2.ongoingOrders[index].item!.price,
              currency: state2.ongoingOrders[index].item!.currency,
              image: state2.ongoingOrders[index].item!.imageUrl,
              status: state2.ongoingOrders[index].orderStatus,
              address: state2.ongoingOrders[index].deliveryAddress,
              totalAmount: state2.ongoingOrders[index].totalAmount);
        },
      ),
    );
  }
}

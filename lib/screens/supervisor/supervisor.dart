
import 'package:delivery/screens/supervisor/cubit/cubit.dart';
import 'package:delivery/screens/supervisor/cubit/states.dart';
import 'package:delivery/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    super.initState();
    SupervisorCubit.get(context).listenForOrders();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<SupervisorCubit, OrdersState>(

        builder: (context, state) {
          if (state is OrdersLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is OrdersError) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else if (state is OrdersLoaded && state.orders.isEmpty) {
            return Center(
              child: Text('No orders available.'),
            );
          } else if (state is OrdersLoaded) {
            // Display data in ListView
            final orders = state.orders;
            return Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return ListTile(
                    leading: Image.asset('assets/allan-lainez-7y2vVGzAQ2o-unsplash.jpg'),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Restaurant Name: ',style: TextStyle(fontSize: 20,color: textcolor),),
                        Text('${order.rest_name}',style: TextStyle(fontSize: 20,color: Colors.black),),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address: ',style: TextStyle(fontSize: 20,color: textcolor),),
                          Text('${order.address}',style: TextStyle(fontSize: 20,color: Colors.black),),
                          Text('Number of Drivers: ',style: TextStyle(fontSize: 20,color: textcolor),),
                          Text('${order.drivers}',style: TextStyle(fontSize: 20,color: Colors.black),),

                        ],
                    ),
                    // Add more details as needed
                  );
                },
              ),
            );
          } else {
            // Handle other states if needed
            return Container();
          }
        },
      ),
    );
  }
}
  // Widget buildorders (SupervisorCubit model) => GestureDetector(
  //   onTap: (){
  //
  //   },
  //   child: Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Row(
  //       children: [
  //         Image.asset('assets/allan-lainez-7y2vVGzAQ2o-unsplash.jpg',
  //         height: 100,
  //           width: 100,
  //         ),
  //         SizedBox(width: 15,),
  //         Text('looo',style: TextStyle(fontSize: 30),),
  //       ],
  //     ),
  //   ),
  // );

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//
// // import 'dart:io';
//
// import 'dart:io';
//
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:delivery/screens/login/cubit/cubit.dart';
// import 'package:delivery/screens/login/cubit/states.dart';
// import 'package:delivery/screens/manager/manager.dart';
// import 'package:delivery/screens/orderpage/cubit/cubit.dart';
// import 'package:delivery/screens/orderpage/cubit/states.dart';
// import 'package:delivery/screens/orderpage/orderpage.dart';
// import 'package:delivery/screens/supervisor/cubit/cubit.dart';
// import 'package:delivery/screens/supervisor/cubit/states.dart';
// import 'package:delivery/screens/supervisor/supervisor.dart';
// import 'package:delivery/shared/components.dart';
// import 'package:delivery/shared/components.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class OrdersPage extends StatelessWidget {
//   get someNullableVariable => null;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<SupervisorCubit, SupervisingStates>(
//       listener: (context, state)  {
//
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             title: Text('Text Fields Example'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 16.0),
//
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () async {
//                    await SupervisorCubit.get(context).getorders();
//                   // print(SupervisorCubit.get(context).listOfOrders);
//                   },
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     ); // Scaffold
//   }
// }

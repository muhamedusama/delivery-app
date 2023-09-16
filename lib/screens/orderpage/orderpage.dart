


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:delivery/screens/login/cubit/cubit.dart';
import 'package:delivery/screens/login/cubit/states.dart';
import 'package:delivery/screens/manager/manager.dart';
import 'package:delivery/screens/orderpage/cubit/cubit.dart';
import 'package:delivery/screens/orderpage/cubit/states.dart';
import 'package:delivery/screens/orderpage/orderpage.dart';
import 'package:delivery/screens/supervisor/supervisor.dart';
import 'package:delivery/shared/components.dart';
import 'package:delivery/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var address_controller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => orderpageCubit(),
      child: BlocConsumer<orderpageCubit, orderingStates>(
        listener: (context, state)  {

        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Text Fields Example'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  TextField(
                    controller: address_controller,

                    decoration: InputDecoration(
                      labelText: 'Enter your the address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      var addresses =address_controller.text.trim();
                            orderpageCubit.get(context).createorder(addresses);
                      // Add your logic here for handling text field values.
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ); // Scaffold
  }
}

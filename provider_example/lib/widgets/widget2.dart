import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("This is Widget 2"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: Consumer<CounterProvider>(
                  child: const Text(
                      "This is Constant & this should never build !"),
                  builder: (context, counterProviderObj, child) {
                    return Column(
                      children: [
                        child,
                        Row(
                          children: [
                            IconButton(
                                onPressed: () =>
                                    counterProviderObj.incrementCounter(),
                                icon: Icon(Icons.add)),
                            Row(
                              children: [
                                Text("Counter is: "),
                                Text(
                                  counterProviderObj.getCounter.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () =>
                                    counterProviderObj.decrementCounter(),
                                icon: Icon(Icons.remove)),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

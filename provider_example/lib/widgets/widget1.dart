import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterProvider counterProviderObj = Provider.of<CounterProvider>(context);
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("This is Widget 1"),
            const Text("This is Constant & this should never build"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => counterProviderObj.incrementCounter(),
                      icon: Icon(Icons.add)),
                  Text("Counter is: ${counterProviderObj.getCounter}"),
                  IconButton(
                      onPressed: () => counterProviderObj.decrementCounter(),
                      icon: Icon(Icons.remove)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

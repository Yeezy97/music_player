//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class PlayListController extends GetxController {
//
//
//   final _lists = <String>[];
//   final _textController = TextEditingController();
//
//   void _addList() {
//     _lists.add(_textController.text);
//     _textController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('List Creator'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             controller: _textController,
//             decoration: const InputDecoration(
//               hintText: 'Enter the list name',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _addList,
//             child: const Text('Create List'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _lists.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_lists[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
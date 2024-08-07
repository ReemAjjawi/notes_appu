// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../injection_file.dart';
// import '../article_bloc/articles_bloc.dart';

// class Register extends StatelessWidget {
//   const Register({super.key});
//   @override
//   Widget build(BuildContext context) {
//       return BlocProvider<AuthBloc>(
//     create: (_) =>sl()..add(
//             RegisterEvent(),
//           ),
//       child: Scaffold(
//         body: BlocBuilder<AuthBloc, RegisterClassState>(
//           builder: (context, state) {
//             if (state is SuccessState) {
//               return Container(
//                 color: Colors.amber,
//                 child: Text("hiiiiii"),
//               );
//             } else if (state is FailureState) {
//               return Center(
//                 child: Text(state.message),
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }























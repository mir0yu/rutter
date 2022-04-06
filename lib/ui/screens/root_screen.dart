// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rutter/bloc/navigation/navigation_cubit.dart';
// import 'package:rutter/constants/paths.dart';
// import 'package:rutter/ui/screens/home_screen.dart';
//
// class RootPage extends StatefulWidget {
//   const RootPage({Key? key}) : super(key: key);
//
//   @override
//   State<RootPage> createState() => _RootPageState();
// }
//
// class _RootPageState extends State<RootPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Rutter'),
//       ),
//       bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             currentIndex: state.index,
//             showUnselectedLabels: false,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.home,
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.person,
//                 ),
//                 label: 'Profile',
//               ),
//             ],
//             onTap: (index) {
//               if (index == 0) {
//                 BlocProvider.of<NavigationCubit>(context)
//                     .getNavBarItem('HOME');
//               } else if (index == 1) {
//                 BlocProvider.of<NavigationCubit>(context)
//                     .getNavBarItem('HOME');
//               }
//             },
//           );
//         },
//       ),
//       body: BlocBuilder<NavigationCubit, NavigationState>(
//           builder: (context, state) {
//             if (state.navbarItem == 'HOME') {
//               // Navigator.pushNamed(context, HOME);
//               const HomePage();
//             // } else if (state.navbarItem == 'PROFILE') {
//             //   Navigator.pushNamed(context, Profile);
//             }
//             return Container();
//           }),
//     );
//   }
// }

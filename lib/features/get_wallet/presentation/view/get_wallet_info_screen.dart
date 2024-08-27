import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/features/get_wallet/presentation/bloc_file/wallet_info_event.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../injection_file.dart';
import '../bloc_file/wallet_info_bloc.dart';
import '../bloc_file/wallet_info_state.dart';

class WalletInfoScreen extends StatelessWidget {
  WalletInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletInfoBloc>(
      create: (context) => sl()..add(WalletInfoEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: BlocBuilder<WalletInfoBloc, WalletInfoClassState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: Container(
                        child: Text(state.walletInfo.bankAccount.toString()),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: Container(
                        child: Text(state.walletInfo.balance.toString()),
                      ),
                    ),
                  ],
                );
              } else if (state is LoadingState) {
                return Indicator();
              } else  {
                return Text("jhnj");
                
              }
           
            },
          ),
        );
      }),
    );
  }
}

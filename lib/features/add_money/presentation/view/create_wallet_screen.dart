import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_application/features/wallet/data/model/wallet_model.dart';
import 'package:ride_application/features/wallet/presentation/bloc/wallet_creation_bloc/wallet_creation_bloc.dart';
import 'package:ride_application/features/wallet/presentation/bloc/wallet_creation_bloc/wallet_creation_event.dart';

import '../../../../injection_file.dart';

class CreateWalletScreen extends StatelessWidget {
  CreateWalletScreen({super.key});
  TextEditingController pass = TextEditingController();
  TextEditingController conf = TextEditingController();

  TextEditingController str = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCreationBloc(sl()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: 150,
                child: TextFormField(
                  controller: pass,
                ),
              ),
              SizedBox(
                height: 150,
                child: TextFormField(
                  controller: conf,
                ),
              ),
              SizedBox(
                height: 150,
                child: TextFormField(
                  controller: str,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Wallet wallet = Wallet(
                        securityCode: pass.text,
                        confirmSecurityCode: conf.text,
                        bankAccount: str.text);
                    context.read<WalletCreationBloc>().add(
                          WalletCreationEvent(wallet: wallet),
                        );
                  },
                  child: const Text("press me"))
            ],
          ),
        );
      }),
    );
  }
}

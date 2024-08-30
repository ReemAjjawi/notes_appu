import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:ride_application/main.dart';

import '../../../../core/helper/build_app_bar.dart';
import '../../../../core/helper/indicator.dart';
import '../../../../core/resources/managers/strings_manager.dart';
import '../../../../core/resources/managers/styles_manager.dart';
import '../../../../injection_file.dart';
import '../policy_bloc/policy_bloc.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocProvider(
        create: (context) => policyBloc(sl())..add(policyEvent()),
        child: _buildBody(screenWidth, screenHeight),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return buildAppBar(
      hasLeading: true,
      title: Text(StringsManager.PRIVACYPOLICY),
      onPressed: () => _onAppBarPressed(context),
    );
  }

  Widget _buildBody(double screenWidth, double screenHeight) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocConsumer<policyBloc, policyClassState>(
        listener: (context, state) async {
          if (state is unknowStatepolicy) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Error',
              text: state.message,
            );
            Navigator.pushNamed(context, '/PrivacyPolicyScreen');
          }
          if (state is internetStatepolicy) {
            await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Errorinternet',
              text: state.message,
            );
            Navigator.pushNamed(context, '/PrivacyPolicyScreen');
          }
        },
        builder: (context, state) {
          if (state is SuccessStatepolicy) {
            return Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  _buildSizeBox(screenHeight),
                  _buildText(state.data.data.title),
                  _buildSizeBox(screenHeight),
                  _buildText2(state.data.data.description),
                  _buildSizeBox2(screenHeight),
                ],
              ),
            );
          }
          if (state is FailureStatepolicy) {
            return Column(
              children: [
                _buildSizeBox(screenHeight),
                _buildTextfild(),
                _buildSizeBox(screenHeight),
                _buildText2fil(),
                _buildSizeBox2(screenHeight),
              ],
            );
          }
          return const Center(child: Indicator());
        },
      );
    });
  }

  Widget _buildSizeBox(double screenHeight) {
    return SizedBox(height: screenHeight * 0.02);
  }

  Widget _buildText(String title) {
    return Text(
      title,
      style: StylesManager.headLineStyle,
    );
  }

  Widget _buildTextfild() {
    return Text(
      StringsManager.PRIVACYPOLICYFORRIDESHARE,
      style: StylesManager.headLineStyle,
    );
  }

  Widget _buildSizeBox2(double screenHeight) {
    return SizedBox(height: screenHeight * 0.03);
  }

  Widget _buildText2(String dec) {
    return Text(
      dec,
      style: StylesManager.subLineStyle,
    );
  }

  Widget _buildText2fil() {
    return Text(
      StringsManager.SUBPRIVACYPOLICY,
      style: StylesManager.subLineStyle,
    );
  }

  void _onAppBarPressed(context) {
    Navigator.of(context).pop();
  }
}

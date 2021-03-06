import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer_mobile/app/models/order_pix.dart';

class FinishedPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 70),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Pedido realizado com sucesso, clique no botão abaixo para acesso ao QRCode do pix.",
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                VakinhaButton(
                  label: 'PIX',
                  onPressed: () {
                    Get.toNamed(
                      '/order/pix',
                      arguments: _orderPix,
                    );
                  },
                  width: context.widthTransformer(reducedBy: 30),
                  color: context.theme.primaryColorDark,
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: VakinhaButton(
                    label: 'FECHAR',
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    width: context.widthTransformer(reducedBy: 20),
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

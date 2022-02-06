import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_button.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_cart_controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: IntrinsicHeight(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Carrinho',
                              style: context.textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return Column(
                          children: controller.products
                              .map(
                                (p) => Container(
                                  margin: const EdgeInsets.all(5),
                                  child: PlusMinusBox(
                                    label: p.product.name,
                                    calculateTotal: true,
                                    elevated: true,
                                    backgroundColor: Colors.white,
                                    quantity: p.quantity,
                                    price: p.product.price,
                                    plusCallback: () {
                                      controller.addQuantityInProduct(p);
                                    },
                                    minusCallback: () {
                                      controller.subtractQuantityInProduct(p);
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total do pedido',
                              style: context.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              FormatterHelper.formatCurrency(
                                  controller.totalValue),
                              style: context.textTheme.bodyText1!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const _AddressField(),
                      const Divider(),
                      const _CpfField(),
                      const Divider(),
                      //const Spacer(),
                      Center(
                        child: SizedBox(
                          width: context.widthTransformer(
                            reducedBy: 10,
                          ),
                          child: VakinhaButton(
                            onPressed: () {},
                            label: 'FINALIZAR',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCartController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Expanded(
              child: Text(
                'Endereço de entrega',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCartController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Expanded(
              child: Text(
                'CPF',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple(
              [
                Validatorless.required('CPF obrigatório'),
                Validatorless.cpf('CPF inválido'),
              ],
            ),
            decoration: const InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

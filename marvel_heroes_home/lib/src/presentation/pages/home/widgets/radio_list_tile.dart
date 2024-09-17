import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

// ignore: must_be_immutable
class OrderByRadioListTileWidget extends StatefulWidget {
  final List<OrderByEnum> options;
  final Function(OrderByEnum value) onchange;
  OrderByEnum selectedOption;

  OrderByRadioListTileWidget({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onchange,
  });

  @override
  State<OrderByRadioListTileWidget> createState() =>
      _OrderByRadioListTileState();
}

class _OrderByRadioListTileState extends State<OrderByRadioListTileWidget> {
  _setSelectedOption(OrderByEnum option) {
    setState(() {
      widget.selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _createRadioList(),
    );
  }

  List<Widget> _createRadioList() {
    List<Widget> list = [];
    for (OrderByEnum option in widget.options) {
      list.add(
        RadioListTile<OrderByEnum>(
          contentPadding: EdgeInsets.only(
            left: DsWidth.w_0.value,
          ),
          value: option,
          groupValue: widget.selectedOption,
          title: Text(
            option.desc,
            style: DSTextStyle.body,
          ),
          onChanged: (value) {
            setState(() {
              _setSelectedOption(value!);
              widget.onchange(value);
            });
          },
          selected: widget.selectedOption == option,
          activeColor: DSColors.primary,
        ),
      );
    }
    return list;
  }
}

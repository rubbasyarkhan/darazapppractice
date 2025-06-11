import 'package:flutter/material.dart';

class Billcalculator extends StatefulWidget {
  const Billcalculator({super.key});

  @override
  _BillcalculatorState createState() => _BillcalculatorState();
}

class _BillcalculatorState extends State<Billcalculator> {
  final GlobalKey<FormState> myformKey = GlobalKey<FormState>();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController taxController = TextEditingController();

  double unit = 0, pricePerUnit = 0, taxPercent = 0;
  double billAmount = 0, taxAmount = 0, finalBillAmount = 0;

  String selectedCurrency = '\$';

  final List<String> currencies = ['₹', '\$', '€', '£', '¥'];

  var billDetails = {};

  void calculateBill() {
    if (myformKey.currentState!.validate()) {
      unit = double.parse(unitController.text);
      pricePerUnit = double.parse(priceController.text);
      taxPercent = double.parse(taxController.text);

      billAmount = unit * pricePerUnit;
      taxAmount = (billAmount * taxPercent) / 100;

      setState(() {
        finalBillAmount = billAmount + taxAmount;
      });

      billDetails = {
        "Unit": unit.toString(),
        "Price per Unit": pricePerUnit,
        "Tax Percent": taxPercent,
        "Bill Amount": billAmount,
        "Tax Amount": taxAmount,
        "Final Bill Amount": finalBillAmount,
      };
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter valid details"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void resetForm() {
    unitController.clear();
    priceController.clear();
    taxController.clear();
    setState(() {
      finalBillAmount = 0;
      billDetails.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text('⚡ Electricity Bill Calculator'),
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: myformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildInputCard(),
              const SizedBox(height: 16),
              buildCurrencySelector(),
              const SizedBox(height: 16),
              buildActionButtons(),
              const SizedBox(height: 30),
              if (finalBillAmount > 0) buildResultsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputCard() {
    return Card(
      elevation: 6,
      shadowColor: Colors.indigo[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildTextField(
              controller: unitController,
              label: "Enter Units",
              icon: Icons.bolt_outlined,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: priceController,
              label: "Price per Unit",
              icon: Icons.attach_money_outlined,
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: taxController,
              label: "Tax Percent",
              icon: Icons.percent_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.indigo[700]),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow[700]!, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || double.tryParse(value) == null) {
          return "Enter a valid number";
        }
        return null;
      },
    );
  }

  Widget buildCurrencySelector() {
    return Row(
      children: [
        const Icon(Icons.currency_exchange, color: Colors.indigo),
        const SizedBox(width: 10),
        const Text(
          "Select Currency:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedCurrency,
            items: currencies
                .map((symbol) => DropdownMenuItem(
                      value: symbol,
                      child: Text(symbol, style: TextStyle(fontSize: 16)),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCurrency = value!;
              });
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: calculateBill,
            icon: const Icon(Icons.calculate_outlined),
            label: const Text("Calculate"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[700],
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: resetForm,
            icon: const Icon(Icons.refresh_outlined),
            label: const Text("Reset"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 14),
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildResultsCard() {
    return Card(
      elevation: 5,
      shadowColor: Colors.indigo[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "🔌 Bill Summary",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            buildResultRow("Units", unit.toString()),
            buildResultRow("Price/Unit",
                "$selectedCurrency${pricePerUnit.toStringAsFixed(2)}"),
            buildResultRow(
                "Tax %", "${taxPercent.toStringAsFixed(2)}%"),
            const Divider(height: 28),
            buildResultRow(
                "Bill Amount", "$selectedCurrency${billAmount.toStringAsFixed(2)}"),
            buildResultRow(
                "Tax Amount", "$selectedCurrency${taxAmount.toStringAsFixed(2)}"),
            const Divider(height: 28),
            buildResultRow(
              "Final Bill",
              "$selectedCurrency${finalBillAmount.toStringAsFixed(2)}",
              isBold: true,
              isHighlighted: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResultRow(String title, String value,
      {bool isBold = false, bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              )),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isHighlighted ? Colors.green[700] : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

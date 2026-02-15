import 'package:flutter/material.dart';
import 'package:practice/module_12/widget/btn.dart';

class Calculator2 extends StatefulWidget {
  const Calculator2({super.key});

  @override
  State<Calculator2> createState() => _Calculator2State();
}

class _Calculator2State extends State<Calculator2> {
  String _output = '0';
  String _input = '';
  String _expression = '';
  String _operation = '';
  double _num1 = 0;
  double _num2 = 0;
  bool _shouldResetInput = false;
  bool _hasDecimal = false;
  bool _isError = false;

  void _buttonPress(String value) {
    if (_isError && value != 'C') {
      _clear();
    }

    setState(() {
      if (value == 'C') {
        _clear();
      } else if (value == '⌫') {
        _backspace();
      } else if (value == '±') {
        _toggleSign();
      } else if (value == '%') {
        _percentage();
      } else if (value == '.') {
        _addDecimal();
      } else if (value == '=') {
        _calculate();
      } else if (['+', '-', '×', '÷'].contains(value)) {
        _setOperation(value);
      } else {
        _addNumber(value);
      }
    });
  }

  void _clear() {
    _output = '0';
    _input = '';
    _expression = '';
    _operation = '';
    _num1 = 0;
    _num2 = 0;
    _shouldResetInput = false;
    _hasDecimal = false;
    _isError = false;
  }

  void _backspace() {
    if (_shouldResetInput || _input.isEmpty || _input == '0') {
      return;
    }

    if (_input.length == 1) {
      _input = '';
      _output = '0';
    } else {
      if (_input.endsWith('.')) {
        _hasDecimal = false;
      }
      _input = _input.substring(0, _input.length - 1);
      _output = _input;
    }
  }

  void _toggleSign() {
    if (_input.isEmpty || _input == '0') return;

    if (_input.startsWith('-')) {
      _input = _input.substring(1);
    } else {
      _input = '-$_input';
    }
    _output = _input;
  }

  void _percentage() {
    if (_input.isEmpty) return;

    double value = double.parse(_input);

    if (_operation.isNotEmpty && _num1 != 0) {
      // Calculate percentage of the first number
      value = _num1 * (value / 100);
    } else {
      // Just divide by 100
      value = value / 100;
    }

    _input = _formatNumber(value);
    _output = _input;
    _hasDecimal = _input.contains('.');
  }

  void _addDecimal() {
    if (_shouldResetInput) {
      _input = '0.';
      _output = _input;
      _shouldResetInput = false;
      _hasDecimal = true;
      return;
    }

    if (_hasDecimal) return;

    if (_input.isEmpty) {
      _input = '0.';
    } else {
      _input += '.';
    }
    _output = _input;
    _hasDecimal = true;
  }

  void _addNumber(String number) {
    if (_shouldResetInput) {
      _input = number;
      _shouldResetInput = false;
      _hasDecimal = false;
    } else {
      if (_input.isEmpty || _input == '0' && !_hasDecimal) {
        _input = number;
      } else {
        _input += number;
      }
    }
    _output = _input;
  }

  void _setOperation(String op) {
    if (_input.isNotEmpty) {
      if (_operation.isNotEmpty && !_shouldResetInput) {
        // Chain calculations
        _calculate();
      }
      _num1 = double.parse(_input);
    }

    _operation = op;
    _expression = '${_formatNumber(_num1)} $op';
    _shouldResetInput = true;
    _hasDecimal = false;
  }

  void _calculate() {
    if (_operation.isEmpty || _input.isEmpty) return;

    _num2 = double.parse(_input);
    double result = 0;

    switch (_operation) {
      case '+':
        result = _num1 + _num2;
        break;
      case '-':
        result = _num1 - _num2;
        break;
      case '×':
        result = _num1 * _num2;
        break;
      case '÷':
        if (_num2 == 0) {
          _output = 'Error';
          _expression = 'Cannot divide by zero';
          _isError = true;
          return;
        }
        result = _num1 / _num2;
        break;
    }
    _expression = '${_formatNumber(_num1)} $_operation ${_formatNumber(_num2)} =';
    _output = _formatNumber(result);
    _input = result.toString();
    _num1 = result;
    _operation = '';
    _shouldResetInput = true;
    _hasDecimal = _output.contains('.');
  }
  String _formatNumber(double number) {
    if (number.abs() > 999999999999 || (number.abs() < 0.000001 && number != 0)) {
      return number.toStringAsExponential(2);
    }
    String result = number.toString();
    if (result.contains('.')) {
      result = result.replaceAll(RegExp(r'0*$'), '');
      result = result.replaceAll(RegExp(r'\.$'), '');
    }
    if (result.contains('.')) {
      List<String> parts = result.split('.');
      if (parts[1].length > 8) {
        result = number.toStringAsFixed(8);
        result = result.replaceAll(RegExp(r'0*$'), '');
        result = result.replaceAll(RegExp(r'\.$'), '');
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _expression.isEmpty ? ' ' : _expression,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        _output,
                        style: TextStyle(
                          fontSize: 64,
                          color: _isError ? Colors.red : Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      build_button(
                        onclick: () => _buttonPress('C'),
                        text: 'C',
                        color: Colors.grey[700],
                        textColor: Colors.red,
                      ),
                      build_button(
                        onclick: () => _buttonPress('⌫'),
                        text: '⌫',
                        color: Colors.grey[700],
                      ),
                      build_button(
                        onclick: () => _buttonPress('%'),
                        text: '%',
                        color: Colors.grey[700],
                      ),
                      build_button(
                        onclick: () => _buttonPress('÷'),
                        text: '÷',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      build_button(
                        onclick: () => _buttonPress('7'),
                        text: '7',
                      ),
                      build_button(
                        onclick: () => _buttonPress('8'),
                        text: '8',
                      ),
                      build_button(
                        onclick: () => _buttonPress('9'),
                        text: '9',
                      ),
                      build_button(
                        onclick: () => _buttonPress('×'),
                        text: '×',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      build_button(
                        onclick: () => _buttonPress('4'),
                        text: '4',
                      ),
                      build_button(
                        onclick: () => _buttonPress('5'),
                        text: '5',
                      ),
                      build_button(
                        onclick: () => _buttonPress('6'),
                        text: '6',
                      ),
                      build_button(
                        onclick: () => _buttonPress('-'),
                        text: '-',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      build_button(
                        onclick: () => _buttonPress('1'),
                        text: '1',
                      ),
                      build_button(
                        onclick: () => _buttonPress('2'),
                        text: '2',
                      ),
                      build_button(
                        onclick: () => _buttonPress('3'),
                        text: '3',
                      ),
                      build_button(
                        onclick: () => _buttonPress('+'),
                        text: '+',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      build_button(
                        onclick: () => _buttonPress('±'),
                        text: '±',
                        color: Colors.grey[700],
                      ),
                      build_button(
                        onclick: () => _buttonPress('0'),
                        text: '0',
                      ),
                      build_button(
                        onclick: () => _buttonPress('.'),
                        text: '.',
                      ),
                      build_button(
                        onclick: () => _buttonPress('='),
                        text: '=',
                        color: Colors.green[700],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
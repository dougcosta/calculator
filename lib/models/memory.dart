class Memory{
  static const operations = const['%','/','x','-','+','='];

  String _value = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _opertation;
  bool _wipeValue = false;
  String _lastCommand;

  void applyCommand(String command) {
    if(_isReplacingOpoeration(command)){
      this._opertation = command;
      return;
    }

    if(command == 'AC')
      this._allClear();
    else if(operations.contains(command))
      this._setOperation(command);
    else
      this._addDigit(command);

    this._lastCommand = command;
  }

  _isReplacingOpoeration(String command){
    return this.operations.contains(this._lastCommand)
      && this.operations.contains(this._lastCommand)
      && this._lastCommand != '='
      && command != '=';

  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';

    if(this._bufferIndex == 0) {
      if(!isEqualSign){
        this._opertation = newOperation;
        this._bufferIndex = 1;
      }
    } else {
      this._buffer[0] = this._calculate();
      this._buffer[1] = 0.0;
      this._value = this._buffer[0].toString();
      this._value = this._value.endsWith('.0') ? this._value.split('.')[0] : this._value;
      this._opertation = isEqualSign ? null : newOperation;
      this._bufferIndex = isEqualSign ? 0 : 1;
    }
        
    this._wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == ',';
    final wipeValue = (this._value == '0' && !isDot) || this._wipeValue;

    if(isDot && this._value.contains(',') && !this._wipeValue)
      return;

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : this._value;
    this._value = currentValue + digit;
    this._wipeValue = false;

    this._buffer[this._bufferIndex] = double.tryParse(this._value) ?? 0;
  }

  _allClear() {
    this._value = '0';
    this._buffer.setAll(0, [0.0, 0.0]);
    this._opertation = null;
    this._bufferIndex = 0;
    this._wipeValue = false;
  }

  _calculate(){
    switch(this._opertation) {
      case '%': return this._buffer[0] % this._buffer[1];
      case '/': return this._buffer[0] / this._buffer[1];
      case 'x': return this._buffer[0] * this._buffer[1];
      case '-': return this._buffer[0] - this._buffer[1];
      case '+': return this._buffer[0] + this._buffer[1];
      default: return this._buffer[0];
    }
  }

  String get value {
    return _value;
  }
}
class Heroi {
  final String _nome;
  final String _alterEgo;

  Heroi(this._nome, this._alterEgo);

  @override
  String toString() => "${_nome} - ${_alterEgo}";

  String get nome => "${_nome}";
  String get alterEgo => "${_alterEgo}";
}

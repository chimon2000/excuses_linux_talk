enum AppRoute {
  home(''),
  excuses('excuses', parent: home),
  excuse(':id', parent: excuses);

  const AppRoute(
    this._path, {
    this.parent,
  });

  final String _path;
  final AppRoute? parent;

  String get path => parent == null ? '/$_path' : _path;
}

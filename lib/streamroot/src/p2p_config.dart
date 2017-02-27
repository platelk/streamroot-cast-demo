part of streamroot;

@JS()
@anonymous
class P2pConfig {

 external factory P2pConfig(
     {String streamrootKey,
     String contentId,
     bool rangeRequestEnabled,
     bool activateP2P,
     int cacheSize,
     bool mobileBrowserEnabled,
     bool debug});

  external String get streamrootKey;
  external set streamrootKey(String v);

  external bool get rangeRequestEnabled;
  external set rangeRequestEnabled(bool b);

  external bool get activateP2P;
  external set activateP2P(bool b);

  external int get cacheSize;
  external set cacheSize(int v);

  external String get contentId;
  external set contentId(String v);

  external bool get mobileBrowserEnabled;
  external set mobileBrowserEnabled(bool b);

  external bool get debug;
  external set debug(bool b);
}

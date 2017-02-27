part of hls_bundle;

typedef void EventCallback(dynamic a);

@JS("Hls")
class Hls {
  external Hls(HlsConfig hlsConfig, P2pConfig p2pConfig); 

  external void loadSource(String url);
  external void attachMedia(VideoElement videoElement);
  external void on(String event, Function callback);
}

@JS("Hls.Events")
class HlsEvents {
  external static String get MANIFEST_PARSED;
}
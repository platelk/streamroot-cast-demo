part of hls_bundle;

@JS()
@anonymous
class HlsConfig {
  external factory HlsConfig({
    bool debug,
    int maxBufferSize,
    int maxBufferLenght,
    int liveSyncDuration
  });

  external int get maxBufferSize;
  external set maxBufferSize(int v);

  external int get maxBufferLenght;
  external set maxBufferLenght(int v);

  external int get liveSyncDuration;
  external set liveSyncDuration(int v);

  external bool get debug;
  external set debug(bool b);
}
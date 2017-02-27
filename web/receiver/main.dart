import 'dart:html';
import 'dart:js';
import 'package:js/js.dart';
import 'package:func/func.dart';

import 'package:streamroot_chromecast_demo/streamroot/hls_bundle.dart';
import 'package:streamroot_chromecast_demo/cast/cast.dart';

const String contentUrl = 'http://www.streambox.fr/playlists/test_001/stream.m3u8';

void setupCast() {
  VideoElement video = querySelector("#video") as VideoElement;
  var mm = new MediaManager(video);
  var c = CastReceiverManager.getInstance();
  var mb = c.getCastMessageBus("urn:x-cast:streamroot:action");
  mb.onMessage = allowInterop((MessageBusEvent e) {
    print("Receive message");
  });
  c.start();
}


void main() {
  print("Starting receiver app...");

  VideoElement video = querySelector("#video") as VideoElement;

  var p2pConfig = new P2pConfig(streamrootKey: "dev", debug: true, contentId: null, activateP2P: true);
  var hlsConfig = new HlsConfig(debug: true, maxBufferSize: 0, maxBufferLenght: 30, liveSyncDuration: 30);
  
  var hls = new Hls(hlsConfig, p2pConfig);

  hls.loadSource(contentUrl);
  hls.attachMedia(video);

  hls.on(HlsEvents.MANIFEST_PARSED, allowInteropCaptureThis((dynamic e, dynamic r, dynamic c)=> video.play()));
  // Setup google cast
  setupCast();
}
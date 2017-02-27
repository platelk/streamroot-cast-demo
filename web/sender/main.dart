import 'dart:html';
import 'dart:js';
import 'package:js/js.dart';
import 'package:func/func.dart';

import 'package:streamroot_chromecast_demo/streamroot/hls_bundle.dart';
import 'package:streamroot_chromecast_demo/cast/cast.dart';

const String contentUrl = 'http://www.streambox.fr/playlists/test_001/stream.m3u8';

void initCast() {
  print("Init cast...");
  var ctx = CastContext.getInstance();
  ctx.setOptions(new CastOptions(receiverApplicationId: "D6DE1CBE", autoJoinPolicy: AutoJoinPolicy.ORIGIN_SCOPED));
  ctx.addEventListener(CastContextEventType.SESSION_STATE_CHANGED, allowInterop((CastStateEventData d) {
    if (d.castState == CastState.CONNECTED) {
      print("Connected to chromecast !!");

      var session = ctx.getCurrentSession();
      session.sendMessage("urn:x-cast:streamroot:action", {"data": "lol"});
    }
  }));
}

void setupCast() {
  context["initCast"] = initCast; 
}


void main() {
  print("Starting sender app...");

  VideoElement video = querySelector("#video") as VideoElement;

  var p2pConfig = new P2pConfig(streamrootKey: "dev", debug: true, contentId: null, activateP2P: true);
  var hlsConfig = new HlsConfig(debug: true, maxBufferSize: 0, maxBufferLenght: 30, liveSyncDuration: 30);
  
  var hls = new Hls(hlsConfig, p2pConfig);

  hls.loadSource(contentUrl);
  hls.attachMedia(video);

  hls.on(HlsEvents.MANIFEST_PARSED, allowInteropCaptureThis((dynamic e, dynamic v, dynamic s)=> video.play()));
  // Setup google cast
  setupCast();
}
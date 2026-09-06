# KAI 9000 Lum Voice Reference

Seal: `KAI9000_LUM_VOICE_REFERENCE_GREEN_20260906`

This Android/Termux integration registers an external voice-reference bundle for KAI 9000 without committing proprietary game recordings into this repository.

## External reference

- Google Drive file: `KAI9000_DC_c176_ESHU_voice_reference_bundle.zip`
- Drive file ID: `1gGT_fjA0JK999wTXiG0VjNeewkpukA4f`
- SHA-256: `bd2bbe66323b2e877225d85328531eaa11e779000e8488be54462537b596aba0`
- Size: `1,156,949` bytes

The bundle is a private/reference-only corpus derived from archived Destiny Child voice-mod material. It is **not** an APK dependency and must not be copied into public release artifacts.

## Allowed use

Use the reference only to study performance grammar such as cadence, phrase length, battle intensity, hit/recovery timing, and emotion categories. The production target is an original fictional Lum voice.

Do not use the source to clone or impersonate an identifiable performer, and do not redistribute the original recordings through this repository.

## Android lane

- Ordinary Termux remains the KAI 9000 control plane.
- Samsung Secure Folder remains a protected client/cockpit.
- Voice generation should run through an OpenAI-compatible voice/TTS adapter or a local TTS adapter.
- Text-only dialogue is the required fallback.
- No public network listener is required for voice playback.

## Runtime handoff

Suggested local-only flow:

```text
Lum dialogue intent
      |
      v
voice-style envelope
      |
      +--> OpenAI-compatible voice adapter
      |        or
      +--> local TTS adapter
      |
      v
original Lum audio
      |
      v
Godot / Android cockpit
```

Reference audio remains outside the repository and outside release builds.

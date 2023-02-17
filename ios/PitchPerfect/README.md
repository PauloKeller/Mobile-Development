# Pitch Perfect

The Pitch Perfect app is result of **Intro to iOS App Development with Swift**.

The app allows users to record a sound using the device’s microphone. It then allows users to play the recorded sound back with four
different sound modulations: Chipmunk, Darth Vader, Slow, Fast with Reverb and Echo effect.

## Implementation

The app has two view controller scenes:

- **RecordSoundsViewController** - consists a record button with a microphone image. Tapping this microphone button
starts an audio recording session and present a stop button. When the stop button is clicked, the app completes recording and then show the PlaySound controller.

- **PlaySoundsViewController** - contains six buttons to play the recorded sound file with different effects and a button to stop the playback.

The application uses code from `AVFoundation` to record sounds from the microphone (`AVAudioRecorder`) and play recorded audio with effects (`AVAudioPlayer`, `AVAudioEngine`).

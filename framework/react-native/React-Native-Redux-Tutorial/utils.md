#Some usefull utils

## Handling watchman exceptions
- echo 256 | sudo tee -a /proc/sys/fs/inotify/max_user_instances
- echo 32768 | sudo tee -a /proc/sys/fs/inotify/max_queued_events
- echo 65536 | sudo tee -a /proc/sys/fs/inotify/max_user_watches
- watchman shutdown-server

# Handling bundle exceptions

# Clean cache
- rm -rf $TMPDIR/react-*; rm -rf $TMPDIR/haste-*; rm -rf $TMPDIR/metro-*; watchman watch-del-all

# Open a new tab and Start Metro Bundler directly from the project folder
- react-native start  --reset-cache

# Now run `react-native run-android` or `react-native run-ios`

# React native Debugger
- http://localhost:8081/debugger-ui/

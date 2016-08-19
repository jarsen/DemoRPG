# DemoRPG

This is a quick demo of the magical things you can do when you combine unidirectional data flow with serializiable state and file watching.

I used carthage for my dependencies.

You'll need to change the path of the `DesktopDaemon` to whatever the full path of the file is on your local file system.

This project uses ReSwift, even though I know I did all my slides in [`Reactor`](https://github.com/jarsen/Reactor). This is because Xcode Beta was giving me a serious headache and not loading libswiftCore for some reason, so I went back to Xcode 7 which doesn't support Swift 3 obviously. Anyway, all of the same principles apply.

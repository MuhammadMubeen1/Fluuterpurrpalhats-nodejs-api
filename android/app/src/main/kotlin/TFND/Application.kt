package TFND

import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugins.GeneratedPluginRegistrant

class Application : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()

        // Create and cache a FlutterEngine
        val flutterEngine = FlutterEngine(this)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        FlutterEngineCache.getInstance().put("my_engine_id", flutterEngine)
    }
}

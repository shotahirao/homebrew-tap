cask "db-fire" do
  version "0.1.11"
  sha256 "628f1ce601db3a6eece1e4819d4e033b9a50d29778c0a5fc0defbac76bf59d96"

  url "https://github.com/shotahirao/db-fire/releases/download/v#{version}/db-fire_#{version}_aarch64.dmg"
  name "db-fire"
  desc "Fast, lightweight, cross-platform database client built with Tauri"
  homepage "https://github.com/shotahirao/db-fire"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on :macos
  depends_on arch: :arm64

  app "db-fire.app"

  # db-fire is not notarized, so Gatekeeper would report the app as
  # "damaged" when the quarantine attribute is present. Remove it so the
  # app opens normally after installation.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/db-fire.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.shotahirao.db-fire",
    "~/Library/Caches/com.shotahirao.db-fire",
    "~/Library/Preferences/com.shotahirao.db-fire.plist",
    "~/Library/Saved Application State/com.shotahirao.db-fire.savedState",
    "~/Library/WebKit/com.shotahirao.db-fire",
  ]

  caveats <<~EOS
    db-fire is not notarized by Apple. The quarantine attribute is removed
    automatically after installation so the app opens without a Gatekeeper
    warning. If macOS still reports the app as damaged, run:

      xattr -rd com.apple.quarantine "#{appdir}/db-fire.app"
  EOS
end

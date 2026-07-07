cask "githydra" do
  version "2.1.0"
  sha256 "69731a60a66b147f9e8f9d83323e0abd24ebf2b60845866e170da101adf6f677"

  url "https://github.com/shotahirao/git-hydra/releases/download/v#{version}/GitHydra_#{version}_aarch64.dmg"
  name "GitHydra"
  desc "Simple Git GUI client"
  homepage "https://github.com/shotahirao/git-hydra"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos
  depends_on arch: :arm64

  app "GitHydra.app"

  # GitHydra is not notarized, so Gatekeeper would report the app as
  # "damaged" when the quarantine attribute is present. Remove it so the
  # app opens normally after installation.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/GitHydra.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.githydra.githydra",
    "~/Library/Caches/com.githydra.githydra",
    "~/Library/Preferences/com.githydra.githydra.plist",
    "~/Library/Saved Application State/com.githydra.githydra.savedState",
    "~/Library/WebKit/com.githydra.githydra",
  ]

  caveats <<~EOS
    GitHydra is not notarized by Apple. The quarantine attribute is removed
    automatically after installation so the app opens without a Gatekeeper
    warning. If macOS still reports the app as damaged, run:

      xattr -rd com.apple.quarantine "#{appdir}/GitHydra.app"
  EOS
end

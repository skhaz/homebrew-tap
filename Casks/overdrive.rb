cask "overdrive" do
  version "0.1.76"
  sha256 "ab61ccb88278020fda145ce668012dd41b6d293200bd5f895c2316314b8f4913"

  url "https://github.com/skhaz/overdrive/releases/download/v#{version}/Overdrive.zip"
  name "Overdrive"
  desc "Music player with Last.fm scrobbling"
  homepage "https://github.com/skhaz/overdrive"

  depends_on macos: :tahoe

  app "Overdrive.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Overdrive.app"]
  end

  uninstall quit: "org.delduca.Overdrive"

  zap trash: [
    "~/Library/Application Support/Overdrive",
    "~/Library/Caches/org.delduca.Overdrive",
    "~/Library/HTTPStorages/org.delduca.Overdrive",
    "~/Library/HTTPStorages/org.delduca.Overdrive.binarycookies",
    "~/Library/Preferences/org.delduca.Overdrive.plist",
    "~/Library/Saved Application State/org.delduca.Overdrive.savedState",
  ]
end

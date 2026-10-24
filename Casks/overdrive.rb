cask "overdrive" do
  version "0.1.173"
  sha256 "0e5a36cd0a4be2b7404ea95bed19c954e14347b24b9f46fdc7b33f3b0d0f397e"

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

cask "overdrive" do
  version "0.1.104"
  sha256 "5d25048dcdc5727ee5db8b2b80c5b4084b046a3dc16a1082c3a839458a5f05f2"

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

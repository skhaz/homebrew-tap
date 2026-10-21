cask "overdrive" do
  version "0.1.107"
  sha256 "a0903c29849721e17f0f59c4ed18827b6704328ceb9cde68c29e27f60db91a35"

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

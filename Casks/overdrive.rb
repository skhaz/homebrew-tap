cask "overdrive" do
  version "0.1.23"
  sha256 "41a6e33672a056069e54a38e7d62482ad4d40fc7a1a52f2e0f9a676090583bb6"

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

  zap trash: "~/Library/Preferences/org.delduca.Overdrive.plist"
end

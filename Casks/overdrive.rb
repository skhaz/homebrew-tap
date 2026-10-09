cask "overdrive" do
  version "0.1.16"
  sha256 "aa174a74c8025a9bc66cdf91c2cc666858f837b8fd7493c077b5612875a3e4b1"

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

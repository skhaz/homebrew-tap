cask "overdrive" do
  version "0.1.9"
  sha256 "04b2d8fddcd0a9682e94c30ff7a7444972183959055ff7be1ecc079a70dcd054"

  url "https://github.com/skhaz/overdrive/releases/download/v#{version}/Overdrive.zip"
  name "Overdrive"
  desc "Music player with Last.fm scrobbling"
  homepage "https://github.com/skhaz/overdrive"

  depends_on macos: :golden_gate

  app "Overdrive.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Overdrive.app"]
  end

  uninstall quit: "org.delduca.Overdrive"

  zap trash: "~/Library/Preferences/org.delduca.Overdrive.plist"
end

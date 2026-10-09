cask "overdrive" do
  version "0.1.21"
  sha256 "4a989720e367e626537e534a512773e51db604c7a392f96a1f8acaafa8efd2d4"

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

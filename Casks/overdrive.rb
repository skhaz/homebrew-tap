cask "overdrive" do
  version "0.1.17"
  sha256 "36f1fd6be8f744cadf790b1758482b9727f88fc3691da3cadf43077f035ca819"

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

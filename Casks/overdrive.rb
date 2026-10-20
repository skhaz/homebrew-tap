cask "overdrive" do
  version "0.1.68"
  sha256 "4b3d7aa506c706da316b21389adcd0ac9db0a6fd5e31f4e488aa8f65253efdc0"

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

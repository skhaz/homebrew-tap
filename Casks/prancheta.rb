cask "prancheta" do
  version "0.2.0"
  sha256 "acca5f0071d882d58b04c4a80ffbf981a76e17ac531fde5a643755d8b8f7f1b0"

  url "https://github.com/skhaz/prancheta/releases/download/v#{version}/Prancheta.zip"
  name "Prancheta"
  desc "Clipboard history in the menu bar"
  homepage "https://github.com/skhaz/prancheta"

  depends_on macos: :golden_gate

  app "Prancheta.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Prancheta.app"]
  end

  uninstall quit: "org.delduca.Prancheta"

  zap trash: "~/Library/Application Support/Prancheta"
end

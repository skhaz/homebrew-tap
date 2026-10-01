cask "prancheta" do
  version "0.2.1"
  sha256 "d67874c6a954da087e5a04f12e07f77fde6908fc6c880693c5263cdc34b05b5d"

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

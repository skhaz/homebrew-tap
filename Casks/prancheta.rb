cask "prancheta" do
  version "0.5.0"
  sha256 "eead0e973d3c15aad984cdb45b8a4c15f5366d5c9c4cc8186d2231b516535e16"

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

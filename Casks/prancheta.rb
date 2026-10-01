cask "prancheta" do
  version "0.4.1"
  sha256 "3bb515dd8726871162e022a56e29ad2d3a2e74215bae7fa3955c29d64de607f8"

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

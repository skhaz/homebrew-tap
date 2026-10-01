cask "prancheta" do
  version "0.1.0"
  sha256 "aaa53ed5424d826d9f71ed9dc02d1781a53ef42e82f7eab0bfa3fcd32c64d35d"

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

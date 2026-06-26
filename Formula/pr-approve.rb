class PrApprove < Formula
  desc "Approve GitHub PRs from your terminal or Raycast, with pre-flight safety checks"
  homepage "https://github.com/tonkotsuboy/pr-approve"
  url "https://github.com/tonkotsuboy/pr-approve/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0f7d0239c71d034b6fee3957560df063d452f66c68d319822ebe8fb4405bd59c"
  license "MIT"
  revision 1

  depends_on "gh"
  depends_on "jq"

  def install
    bin.install "pr-approve"
    # Bundle the Raycast Script Command. Homebrew can't register it with Raycast
    # (that's a user setting), so we ship it here and explain it in caveats.
    pkgshare.install "raycast/approve-pr.sh"
    (pkgshare/"approve-pr.sh").chmod 0755
  end

  def caveats
    <<~EOS
      A Raycast Script Command is bundled at:
        #{opt_pkgshare}/approve-pr.sh

      To use it from Raycast, register that directory:
        Raycast -> Settings -> Extensions -> Script Commands -> Add Directories
        -> select  #{opt_pkgshare}

      (Or symlink/copy approve-pr.sh into a directory you've already registered.)
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/pr-approve 2>&1", 1)
  end
end

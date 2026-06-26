class PrApprove < Formula
  desc "Approve GitHub PRs from your terminal or Raycast, with pre-flight safety checks"
  homepage "https://github.com/tonkotsuboy/pr-approve"
  url "https://github.com/tonkotsuboy/pr-approve/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0f7d0239c71d034b6fee3957560df063d452f66c68d319822ebe8fb4405bd59c"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  def install
    bin.install "pr-approve"
  end

  test do
    assert_match "usage", shell_output("#{bin}/pr-approve 2>&1", 1)
  end
end

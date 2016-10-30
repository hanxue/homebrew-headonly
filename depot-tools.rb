class DepotTools < Formula
  desc "Tools for dealing with Chromium development."
  homepage "http://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools.html"
  head "https://chromium.googlesource.com/chromium/tools/depot_tools.git"

  depends_on "repo"

  # We're linking these tools with auto-update disabled. It's bad enough that
  # all we know is that we're at the HEAD of the master branch, since the
  # Chromium team isn't nice enough to tag releases for us.
  def install
    (prefix/"tools").install Dir["*"]
    %w[annotated_gclient.py apply_issue
       apply_issue.py buildbucket.py
       chrome-update.py cit cit.py clang-format
       clang_format.py commit_queue
       commit_queue.py cpplint.py cpplint_chromium.py
       create-chromium-git-src
       dart_format.py depot-tools-auth depot-tools-auth.py
       download_from_google_storage
       download_from_google_storage.py drover drover.py fetch
       fetch.py gcl gcl.py gclient
       gclient-new-workdir.py gclient.py
       gclient_completion.sh gerrit_util.py git-auto-svn
       git-cache git-cherry-pick-upload git-cl git-crrev-parse
       git-crsync git-drover git-find-releases git-footers
       git-freeze git-gs git-hyper-blame git-map git-map-branches
       git-mark-merge-base git-nav-downstream git-nav-upstream
       git-new-branch git-number git-rebase-update
       git-rename-branch git-reparent-branch git-retry
       git-runhooks git-squash-branch git-thaw git-try
       git-upstream-diff git_auto_svn.py git_cache.py
       git_cherry_pick_upload.py git_cl.py git_drover.py
       git_find_releases.py git_footers.py git_freezer.py
       git_hyper_blame.py git_map.py git_map_branches.py
       git_mark_merge_base.py git_nav_downstream.py
       git_new_branch.py git_number.py git_rebase_update.py
       git_rename_branch.py git_reparent_branch.py git_retry.py
       git_squash_branch.py git_try.py git_upstream_diff.py gn
       gn.py gsutil.py my_activity.py my_reviews.py ninja
       ninja-mac
       presubmit_support.py pylint pylint.py python_runner.sh
       recipes.py roll-dep
       roll_dep.py roll_dep_svn.py setup_color.py
       trychange.py update_depot_tools
       upload_to_google_storage.py watchlists.py
       weekly wtf].each do |tool|
      (bin/tool).write <<-EOS.undent
        #!/bin/bash
        TOOL=#{prefix}/tools/#{tool}
        export DEPOT_TOOLS_UPDATE=0
        export PATH="$PATH:#{prefix}/tools"
        exec "$TOOL" "$@"
      EOS
    end
  end

  test do
    %w[gclient presubmit_support.py trychange.py].each do |tool|
      system "#{bin}/#{tool}", "--version"
    end
  end
end

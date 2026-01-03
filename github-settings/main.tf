resource "github_repository" "repo" {
  name        = var.repository_name
  visibility  = "private"

  # Pull Request merge options
  allow_merge_commit     = false
  allow_rebase_merge     = false
  allow_squash_merge     = true

  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"

  delete_branch_on_merge = true

  has_issues   = true
  has_projects = false
  has_wiki     = false
}

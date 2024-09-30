resource "aws_iam_user" "vault-admin" {
  name = var.vault-admin
  path = "/"

  tags = {
    name = "vault-admin"
  }
}

resource "aws_iam_access_key" "vault-admin-access-key" {
  user = aws_iam_user.vault-admin.name
}

data "aws_iam_policy_document" "vault-admin-policy-doc" {
  statement {
    effect    = "Allow"
    actions   = [
        "iam:AttachUserPolicy",
        "iam:CreateUser",
        "iam:CreateAccessKey",
        "iam:DeleteUser",
        "iam:DeleteAccessKey",
        "iam:DeleteUserPolicy",
        "iam:DetachUserPolicy",
        "iam:GetUser",
        "iam:ListAccessKeys",
        "iam:ListAttachedUserPolicies",
        "iam:ListGroupsForUser",
        "iam:ListUserPolicies",
        "iam:PutUserPolicy",
        "iam:AddUserToGroup",
        "iam:RemoveUserFromGroup"
        ]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "vault-admin-policy" {
  name   = "vault-admin-policy"
  user   = aws_iam_user.vault-admin.name
  policy = data.aws_iam_policy_document.vault-admin-policy-doc.json
}
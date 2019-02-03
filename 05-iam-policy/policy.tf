
resource "aws_iam_group" "developer" {
  name = "developer"
  path = "/users/"
}

resource "aws_iam_policy" "policy" {
  name        = "developer-policy"
  description = "A test policy"
  policy = "${data.aws_iam_policy_document.developer-policy-doc.json}"
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = "${aws_iam_group.developer.name}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}

data "aws_iam_policy_document" "developer-policy-doc" {

  statement {
    sid = "1"
    effect  = "Deny"
    actions = [
      "ec2:TerminateInstances"
    ]

    resources = [
      "arn:aws:ec2:::*",
    ]
  }


  statement {
    sid = "2"
    effect  = "Allow"
    actions = [
      "ec2:RunInstances",
      "ec2:CreateSecurityGroup",
      "ec2:AttachVolume"
    ]

    resources = [
      "arn:aws:ec2:::*",
    ]
  }
 
}


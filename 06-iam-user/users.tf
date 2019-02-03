resource "aws_iam_user_group_membership" "example1" {
  user = "${aws_iam_user.user1.name}"

  groups = [
    "${aws_iam_group.programer.name}",
    "${aws_iam_group.projectmanager.name}",
  ]
}

resource "aws_iam_user_group_membership" "example2" {
  user = "${aws_iam_user.user2.name}"

  groups = [
    "${aws_iam_group.projectmanager.name}",
  ]
}

resource "aws_iam_user" "user1" {
  name = "lucas.ko"
}

resource "aws_iam_user" "user2" {
  name = "john.snow"
}


resource "aws_iam_group" "programer" {
  name = "programer"
  path = "/users/"
}

resource "aws_iam_group" "projectmanager" {
  name = "projectmanager"
  path = "/users/"
}
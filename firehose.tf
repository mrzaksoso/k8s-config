resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = var.kinesis_firehose_delivery_stream
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.bucket.arn
  }
  tags = {
    Name      = "aws_kinesis_firehose_delivery_stream.extended_s3_stream"
    yor_trace = "818a863b-3254-42db-85f7-4b6e73d3ffad"
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.s3_bucket_name
  tags = {
    Name      = "aws_s3_bucket.bucket"
    yor_trace = "dd59f98e-c89c-4801-b383-fdfc6b01abfe"
  }
}

data "aws_iam_policy_document" "firehose_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "firehose_role" {
  name               = var.firehose_role
  assume_role_policy = data.aws_iam_policy_document.firehose_assume_role.json
  tags = {
    Name      = "aws_iam_role.firehose_role"
    yor_trace = "048fd203-230b-4757-b403-5d38ebcb0252"
  }
}

data "aws_iam_policy_document" "kinesis-firehose-ds-policy" {
  statement {
    effect = "Allow"
    actions = ["s3:AbortMultipartUpload",
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
    "s3:PutObject"]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.bucket.id}",
    "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"]

  }
}

resource "aws_iam_policy" "kinesis-firehose-ds-policy" {
  name        = "kinesis-firehose-ds-policy"
  description = "kinesis-firehose-ds-policy"
  policy      = data.aws_iam_policy_document.kinesis-firehose-ds-policy.json
  tags = {
    Name      = "aws_iam_policy.kinesis-firehose-ds-policy"
    yor_trace = "294bcacf-4aaa-4893-ae6e-abe770b58630"
  }
}

resource "aws_iam_role_policy_attachment" "firehose_ds_role-attachment" {
  role       = aws_iam_role.firehose_role.name
  policy_arn = aws_iam_policy.kinesis-firehose-ds-policy.arn
}

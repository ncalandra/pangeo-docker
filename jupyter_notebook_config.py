import os
from s3contents import S3ContentsManager

if "contents_manager_class" in os.environ and os.environ["contents_manager_class"] == "S3ContentsManager":
    c.NotebookApp.contents_manager_class = S3ContentsManager
    c.S3ContentsManager.bucket = os.environ["s3_bucket"]
    c.S3ContentsManager.prefix = os.environ["s3_prefix"]

import zipfile

with zipfile.ZipFile('SP_CODE_SAMPLE.zip') as f:
    f.extractall('./')
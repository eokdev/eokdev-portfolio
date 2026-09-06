from pathlib import Path
from shutil import copy2

# Never overwrite the user's Downloads file.
SRC = Path('assets/docs/eokdev_resume_original.pdf')
OUT = Path('assets/docs/emmanuel_resume.pdf')

if __name__ == '__main__':
    if not SRC.is_file():
        raise SystemExit(f'missing original resume: {SRC}')
    copy2(SRC, OUT)
    print('copied', SRC, '->', OUT)

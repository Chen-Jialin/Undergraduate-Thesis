# ShangHaiTech university THESIS (shtthesis)
[![Action status](https://github.com/lirundong/sht-thesis/workflows/build/badge.svg)](https://github.com/lirundong/shtthesis/actions)
[![GitHub release](https://img.shields.io/github/v/release/lirundong/shtthesis?style=flat&logo=GitHub)](https://github.com/lirundong/shtthesis/releases/latest)
[![CTAN version](https://img.shields.io/ctan/v/shtthesis?style=flat&logo=LaTeX)](https://ctan.org/pkg/shtthesis)
[![Overleaf](https://img.shields.io/badge/overleaf-shtthesis-green?style=flat&logo=Overleaf&color=1C890F)](https://www.overleaf.com/latex/templates/shanghaitech-university-thesis-template/mskbxkmfxqpt)

`shtthesis` project, forked from [`ucasthesis`](https://github.com/mohuangrui/ucasthesis), is an **unofficial** LaTeX thesis template for ShanghaiTech University and satisfies all format requirements of graduate/undergraduate thesis. The user just need to set `\documentclass{shtthesis}` and to setup mandatory information via `\shtsetup`, then his or her thesis document will be typeset properly:
```latex
\documentclass[master]{shtthesis}

\shtsetup{
  title = {论文标题},
  title* = {Title~of~Thesis},
  author = {作者姓名},
  author* = {Name~of~Author},
  % ...
}

\begin{document}
% ...
```

## Get the Template
- Stable version: Install or download with any of following methods
  - CTAN (**strongly recommended**): [`shtthesis`](https://ctan.org/pkg/shtthesis) package on CTAN can be installed via `tlmgr` for TeX Live and MacTeX users:
    ```bash
    tlmgr install shtthesis
    ```
    If your distribution has already installed `shtthesis`, please update it to the latest version:
    ```bash
    tlmgr update shtthesis
    ```

    **Note**: `shtthesis` package on CTAN does not include the university logo file. Please download [`shanghaitech-emblem.pdf`](https://github.com/lirundong/shtthesis/raw/master/shanghaitech-emblem.pdf) from this repository and put it in the root of your project directory.
  - [Overleaf](https://www.overleaf.com/latex/templates/shanghaitech-university-thesis-template/mskbxkmfxqpt): Please compile with XeLaTeX. Since compilation time for Overleaf free-plan is limited to *1 minute*, you might encounter with timeout issue if compiling with LuaLaTeX
  - GitHub Release: Please refer to the [release](https://github.com/lirundong/sht-thesis/releases) page and download required files based on release information
- Develop version: Directly clone the GitHub repo
  ```bash
  git clone https://github.com/lirundong/shtthesis.git
  ```

Please, read through [the user's guide](shtthesis-user-guide.pdf) before continuing.

## Get Started
After cloning or downloading this template, please

0. Install a modern TeX distribution **in full scheme**:
   - Windows or Linux: [TeX Live](https://www.tug.org/texlive/)
   - macOS: [MacTeX](https://www.tug.org/mactex/)
1. Open your terminal (CMD for Windows users) and switch to this directory, compile this template by `latexmk` tool with LuaLaTeX or XeLaTeX engine (**note**: pdfLaTeX is not supported):
   ```bash
   latexmk -pdflua
   # if you prefer XeLaTeX engine:
   # latexmk -pdfxe
   ```
   the output file `shtthesis-user-guide.pdf` is the compiled user guide document
2. Open the document source file [shtthesis-user-guide.tex](shtthesis-user-guide.tex) and enjoy TeXing :smirk:

## License
- The copyright of ShanghaiTech University logo (`shanghaitech-emblem.pdf`) is owned by ShanghaiTech University
- The rest of `shtthesis` project is licensed under GNU Public License v3, see [LICENSE](LICENSE) for details

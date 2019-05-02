#!/usr/bin/env bash

# Init option {{{
Color_off='\033[0m'       # Text Reset

# terminal color template {{{
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White
# }}}

#System name
System="$(uname -s)"

# }}}

# need_cmd {{{
need_cmd () {
  if ! hash "$1" &>/dev/null; then
    error "需要 '$1' （找不到命令）"
    exit 1
  fi
}
# }}}

# success/info/error/warn {{{
msg() {
  printf '%b\n' "$1" >&2
}

success() {
  msg "${Green}[✔]${Color_off} ${1}${2}"
}

info() {
  msg "${Blue}[➭]${Color_off} ${1}${2}"
}

error() {
  msg "${Red}[✘]${Color_off} ${1}${2}"
  exit 1
}

warn () {
  msg "${Red}[✘]${Color_off} ${1}${2}"
}
# }}}

# echo_with_color {{{
echo_with_color () {
  printf '%b\n' "$1$2$Color_off" >&2
}
# }}}

# fetch_repo {{{
fetch_repo () {
  if [[ -d "$HOME/.CusVim" ]]; then
    info "正在更新 CusVim..."
    cd "$HOME/.CusVim"
    git pull
    cd - > /dev/null 2>&1
    success "CusVim 更新已完成"
  else
    info "正在安装 CusVim..."
    git clone ssh://git@122.114.7.175:65433/jone/CusVim.git "$HOME/.CusVim"
    success "CusVim 安装已完成"
  fi
}
# }}}

# install_package_manager {{{
install_package_manager () {
  if [[ ! -e "/home/`whoami`/.local/share/nvim/site/autoload/plug.vim" ]]; then
    info "正在安装 vim-plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    success "vim-plug 安装已完成"
  fi
}
# }}}

# generate init.vim {{{
generate_init () {
  echo "scriptencoding utf-8"  > ~/.CusVim/init.vim
  echo ""  >> ~/.CusVim/init.vim
  echo "let g:CusVim = {}"  >> ~/.CusVim/init.vim
  echo "let g:CusVim.root = '/home/jone/.CusVim'"  >> ~/.CusVim/init.vim
  echo "let g:CusVim.cache_dir = '/home/jone/.cache/nvim'"  >> ~/.CusVim/init.vim
  echo "let g:CusVim.info = g:CusVim.cache_dir . '/info.vim'"  >> ~/.CusVim/init.vim
  echo "let g:CusVim.pkg_dir = g:CusVim.root . '/pkgs'"  >> ~/.CusVim/init.vim
  echo ""  >> ~/.CusVim/init.vim
  echo ""  >> ~/.CusVim/init.vim
  echo "let g:CusVim.excluded = []"  >> ~/.CusVim/init.vim
  echo "let g:CusVim.user_configs = []"  >> ~/.CusVim/init.vim
  echo ""  >> ~/.CusVim/init.vim
  echo ""  >> ~/.CusVim/init.vim
  echo "set runtimepath+=/home/jone/.CusVim/core"  >> ~/.CusVim/init.vim
  echo ""  >> ~/.CusVim/init.vim
  echo "call CusVim#bootstrap()"  >> ~/.CusVim/init.vim

}
# }}}

# install_neovim {{{
install_neovim () {
  if [[ ! -d "$HOME/.config/" ]];then
    mkdir "$HOME/.config/"
  fi
  if [[ -d "$HOME/.config/nvim" ]]; then
    if [[ "$(readlink $HOME/.config/nvim)" =~ \.CusVim$ ]]; then
      success "已为 neovim 安装了 CusVim"
    else
      mv "$HOME/.config/nvim" "$HOME/.config/nvim_back"
      success "备份 $HOME/.config/nvim 至 $HOME/.config/nvim_back"
      ln -s "$HOME/.CusVim" "$HOME/.config/nvim"
      success "已为 neovim 安装了 CusVim"
      
    fi
  else
    ln -s "$HOME/.CusVim" "$HOME/.config/nvim"
    success "已为 neovim 安装了 CusVim"
  fi
}
# }}}

# uninstall_neovim {{{
uninstall_neovim () {
  if [[ -d "$HOME/.config/nvim" ]]; then
    if [[ "$(readlink $HOME/.config/nvim)" =~ \.CusVim$ ]]; then
      rm "$HOME/.config/nvim"
      success "已为 neovim 卸载了 CusVim"
      if [[ -d "$HOME/.config/nvim_back" ]]; then
        mv "$HOME/.config/nvim_back" "$HOME/.config/nvim"
        success "从 $HOME/.config/nvim_back 恢复了原始配置"
      fi
    fi
  fi
}
# }}}

# check_requirements {{{
check_requirements () {
  info "正在检测 CusVim 依赖环境..."
  if hash "git" &>/dev/null; then
    git_version=$(git --version)
    success "检测 git 版本：${git_version}"
  else
    warn "缺少依赖：git"
  fi
  if hash "nvim" &>/dev/null; then
    success "检测到 Neovim 已安装成功"
  else
    warn "CusVim 需要 Neovim"
  fi
  if hash "pip" &>/dev/null; then
    sudo pip install -q python-language-server
    success "安装python依赖"
  else
    warn "缺少命令：pip"
  fi
  if hash "go" &>/dev/null; then
    go get github.com/sourcegraph/go-langserver
    success "安装golang依赖"
  else
    warn "缺少命令：go"
  fi
}
# }}}

# usage {{{
usage () {
  echo_with_color ${BWhite} "CusVim 安装脚本"
  echo_with_color ""
  echo_with_color ${Color_off} "  这是 CusVim 初始化脚本，可用于定制安装、更新及卸载 CusVim。"
  echo_with_color ""
  echo_with_color "使用"
  echo_with_color ""
  echo_with_color "  sh ./install.sh -- [选项] [对象]"
  echo_with_color ""
  echo_with_color "所有选项"
  echo_with_color ""
  echo_with_color " -i, --install            为 neovim 安装 CusVim"
  echo_with_color " -u, --uninstall          卸载 CusVim"
  echo_with_color ""
  echo_with_color "使用示例"
  echo_with_color ""
  echo_with_color "    默认为安装 CusVim"
  echo_with_color ""
  echo_with_color "        sh ./install.sh"
  echo_with_color ""
  echo_with_color "    卸载 CusVim"
  echo_with_color ""
  echo_with_color "        sh ./install.sh --uninstall"
}
# }}}

# install_done {{{

install_done () {
  echo_with_color ${Yellow} ""
  echo_with_color ${Yellow} "安装已完成!"
  echo_with_color ${Yellow} "=============================================================================="
  echo_with_color ${Yellow} "== 打开nvim执行一下命令安装coc相应插件"
  echo_with_color ${Yellow} ":call coc#util#build()"
  echo_with_color ${Yellow} ":CocInstall coc-json coc-html coc-css coc-emmet"
  echo_with_color ${Yellow} ":CocInstall coc-dictionary coc-tag coc-word"
  echo_with_color ${Yellow} ":CocInstall coc-gocode"
  echo_with_color ${Yellow} ":CocInstall coc-ultisnips coc-neosnippet coc-snippets"
  echo_with_color ${Yellow} ":CocInstall coc-vetur coc-tsserver"
  echo_with_color ${Yellow} ":CocInstall coc-pyls"
  echo_with_color ${Yellow} ""
  echo_with_color ${Yellow} "以上所有命可用Cocinit代替"
  echo_with_color ${Yellow} "=============================================================================="
  echo_with_color ${Yellow} "== coc home page"
  echo_with_color ${Yellow} 'https://github.com/neoclide/coc.nvim'
  echo_with_color ${Yellow} "=============================================================================="
  echo_with_color ${Yellow} ""
  echo_with_color ${Yellow} "感谢支持 CusVim，欢迎反馈！"
  echo_with_color ${Yellow} ""
}

# }}}

# download_font {{{
download_font () {
  url="https://raw.githubusercontent.com/wsdjeg/DotFiles/master/local/share/fonts/$1"
  path="$HOME/.local/share/fonts/$1"
  if [[ -f "$path" ]]
  then
    success "已下载 $1"
  else
    info "正在下载 $1"
    curl -s -o "$path" "$url"
    success "已下载 $1"
  fi
}

# }}}

# install_fonts {{{
install_fonts () {
  if [[ ! -d "$HOME/.local/share/fonts" ]]; then
    mkdir -p $HOME/.local/share/fonts
  fi
  download_font "DejaVu Sans Mono Bold Oblique for Powerline.ttf"
  download_font "DejaVu Sans Mono Bold for Powerline.ttf"
  download_font "DejaVu Sans Mono Oblique for Powerline.ttf"
  download_font "DejaVu Sans Mono for Powerline.ttf"
  download_font "DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf"
  download_font "Ubuntu Mono derivative Powerline Nerd Font Complete.ttf"
  download_font "WEBDINGS.TTF"
  download_font "WINGDNG2.ttf"
  download_font "WINGDNG3.ttf"
  download_font "devicons.ttf"
  download_font "mtextra.ttf"
  download_font "symbol.ttf"
  download_font "wingding.ttf"
  info "正在构建字体缓存，请稍等..."
  if [ $System == "Darwin" ];then
    if [ ! -e "$HOME/Library/Fonts" ];then
      mkdir "$HOME/Library/Fonts"
    fi 
    cp $HOME/.local/share/fonts/* $HOME/Library/Fonts/
  else
    fc-cache -fv > /dev/null
    mkfontdir "$HOME/.local/share/fonts" > /dev/null
    mkfontscale "$HOME/.local/share/fonts" > /dev/null
  fi
  success "字体安装已完成!"
}

# }}}

### main {{{
main () {
  if [ $# -gt 0 ]
  then
    case $1 in
      --uninstall|-u)
        info "正在卸载 CusVim..."
        uninstall_neovim
        echo_with_color ${BWhite} "感谢体验 CusVim，期待再次回来..."
        exit 0
        ;;
      --install|-i)
        need_cmd 'git'
        fetch_repo
        install_neovim
        install_done
        check_requirements
        exit 0
        ;;
      --help|-h)
        usage
        exit 0
        ;;
    esac
  else
    need_cmd 'git'
    fetch_repo
    install_neovim
    install_package_manager
    check_requirements
    install_fonts
    install_done
  fi
}

# }}}

main $@

# vim:set foldenable foldmethod=marker:

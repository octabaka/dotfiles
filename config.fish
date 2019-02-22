set fish_greeting
if status is-interactive
	fish_vi_key_bindings
end
# set EDITOR vim

alias ..='cd ..'
alias ls='ls --color=auto'
alias l='ls -alh'
alias watch='watch -c -t'
alias gs="git status"
alias gc="git commit -a"
alias gg="git log --graph --oneline --all"
alias go='grc go'
alias em='env TERM=tmux-256color emacs -nw'
alias p='ps axf --format "pid %cpu %mem cmd"'
alias pp='ps ax --format "pid %cpu %mem cmd" --sort "%cpu %mem"'
alias pc='watch -n 0 "lscpu | grep MHz"'


function fish_mode_prompt --description 'Displays the current mode'
	                        # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold red
                # echo 🅽
                echo N
            case insert
                set_color --bold green
                # echo 🅸
                echo I
            case replace-one
                set_color --bold green
                # echo 🆁
                echo R
            case visual
                set_color --bold brmagenta
                # echo 🆅
                echo V
        end
        set_color normal
        printf " "
    end
end
function fish_user_key_bindings
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
				for mode in insert default visual
						bind -M $mode \cf forward-char
				end
		end
end

if test -f /home/octa/.autojump/share/autojump/autojump.fish; . /home/octa/.autojump/share/autojump/autojump.fish; end


if test -f ~/.config/fish/config.local.fish
	source ~/.config/fish/config.local.fish
end

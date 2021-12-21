#Error logs for dev.api.karaconnect.com

# hymen
alias error_log="ssh hymen \"sudo tail -f /etc/httpd/logs/dev.api.karaconnect.com/error_log -n 200\""
alias s_error_log="ssh hymen \"sudo tail -f /etc/httpd/logs/staging.api.karaconnect.com/error_log -n 200\""
alias p_error_log="ssh api \"sudo tail -f /etc/httpd/logs/api.karaconnect.com/error_log -n 200\""

alias dot_env="vim scp://hymen//home/apps/public_html/dev_api_karaconnect/.env"
alias s_dot_env="vim scp://hymen//home/apps/public_html/staging_api_karaconnect/.env"
alias p_dot_env="vim scp://hymen//home/apps/public_html/api_karaconnect/.env"

alias celery_log="ssh hymen \"sudo tail -f /var/log/celery/mr_reminder.log -n 200\""

# python virtual environment actiavation
alias activate="source venv/bin/activate"

# database connection
alias titan="mysql -h titan.db.karaconnect.com -u trappa --database=titan -p"

# Office - Home
alias forward="ssh -f -N vnc"
alias remote="vncviewer -passwd ~/.vnc/karabasepw localhost:0"
alias mount-media="sshfs karabase:/home/birkir/Media /av/remote"

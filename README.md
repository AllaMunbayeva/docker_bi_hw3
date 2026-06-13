В процессе выполнения дз были заново прочитаны семинары по башу, докеру и гиту. К сожалению тех команд, что были даны в семинаре не хватило для полной реализации и поэтмоу были прочитаны следующие дополнительные ресурсы для выполнения (к примеру из этих материалов были использованы след. команды - chmod +x run.sh, #!/bin/bash, -v "$(pwd)/data:/data, --rm и др.):
https://pingvinus.ru/note/cmd-pwd
https://habr.com/ru/companies/ruvds/articles/326328/
https://help.sweb.ru/osnovy-bash-v-linux-rukovodstvo-po-napisaniyu-skriptov_1293.html
https://skillbox.ru/media/code/chto-takoe-linux-bash-i-kak-im-polzovatsya/#stk-3
а также доп. ресурсы, которые были указаны в семинаре по докеру.
строка -v "$(pwd)/data:/data нужна была для подключения локальной папки data внутрь контейнера как /data
также добавлен строка find . -maxdepth 3 -type f -not -path "./.git/*" в команде структура, чтобы не выводить служебные файлы гит, так как они не относятся к структуре проекта.
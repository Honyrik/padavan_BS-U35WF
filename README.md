# Docker образ для сборки прошивки Padavan для KIMAX BS-U35WF актуален на 26.11.2020 #
## Установка ##
```bash
git clone https://github.com/Honyrik/padavan_BS-U35WF.git
```
```bash
cd padavan_BS-U35WF
```
```bash
docker build -t padavan-local .
```
## Запуск ##
```bash
docker run -it --rm -v `pwd`/dist:/opt/dist --name padavan-BS-U35WF-builder padavan-local
```
`pwd`/dist - любой путь до локальной папки куда будем перекладывать готовую прошивку, например c:\dist
## Сборка прошивки ##
- Запускаем ./start.sh и ждем загрузку зависимостей

![Alt-текст](screen/1.png)
- Выбираем Padavan-ng, жмем 1 (1 - стабильная старая ветка не обновлялась почти год(26.11.2020), 2 - обновляется и самое новое сейчас можно ее (у меня стоит с нее))

![Alt-текст](screen/2.png)
- Выходим из скрипта, Жмем Ctrl+C

![Alt-текст](screen/3.png)
- Запускаем ./patch_BS-U35WF.sh

![Alt-текст](screen/4.png)
- Запускаем ./start.sh

![Alt-текст](screen/5.png)
- Выбираем NEXX. Набираем 10 и жмем Enter.

![Alt-текст](screen/6.png)
- Выбираем wt3020h. Набираем 1 и жмем Enter.

![Alt-текст](screen/7.png)
- Запускаем сборку toolchain. Набираем 3. (Занимает 20-30+ минут)

![Alt-текст](screen/8.png)
- Переходим в сборку прошивки. Набираем 4.

![Alt-текст](screen/9.png)
- Переходим в выбор тем. Набираем 2.

![Alt-текст](screen/10.png)
- Набирем последовательно 0 1 2 3 4 5 6. Жмем Shift+Q для возрата

![Alt-текст](screen/11.png)
- Собираем ядро. Набираем 3. (Занимает 20-30+ минут)

![Alt-текст](screen/12.png)
- После успешного сборки запоминаем название сборки и выходим из скрипта. Дважды жмем Shift+Q.

![Alt-текст](screen/13.png)
- Копируем сборку в папку cp padavan-ng/trunk/images/*.trx /opt/dist/. После этого на локальной в папке будет доступна прошивка которую можно залить на устройство

![Alt-текст](screen/14.png)

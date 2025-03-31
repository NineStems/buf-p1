### Официальная документация
- [buf docs](https://buf.build/docs/)
- [buf tour](https://github.com/bufbuild/buf-tour/blob/main/README.md)
- [buf repo](https://github.com/bufbuild/buf)

### Примеры файлов
- example-buf.yaml
- example-buf-gen.yaml

### Очистить репозиторий от сгенерированных файлов
```shell
rm -rf internal
```

### Зависимости
```shell
buf dep update
```
Важно: чтобы вызвать необходимо в месте вызова иметь файл `buf.yaml`

### Классическая генерация 
```shell
buf generate --template config/0_generate/buf.gen.yaml --config config/0_generate/buf.yaml
```
#### Где 
- `generate`: ключ команды генерации
- `--template`: путь до `файла buf.gen.yaml`
- `--config`: путь до конфигурации buf

### Вызов утилиты lint
```shell
buf lint --config config/1_lint/buf.yaml
```
#### Где
- `lint`: ключ команды проверки proto
- `--config`: путь до конфигурации buf

### Вызов утилиты breaking changes
```shell
buf breaking --config config/2_breaking_change/buf.yaml --against ".git#branch=master,subdir=source/2_breaking_change/proto"
```
#### Где
- `breaking`: ключ команды проверки ломающих изменений
- `--config`: путь до конфигурации buf
- `--against`: ключ с чем сравнивать изменения ".git#branch=master,subdir=source/3_breaking_change/proto"
  - `.git#branch=master` - сравнивать с master
  - `subdir=source/2_breaking_change/proto` - из master взять конкретную директорию

#### Вариативность
Может запускаться с ключом `--against "/path/to/previous_version.zip"`, чтобы сравнить с локальными изменениями
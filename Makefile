# Очистить генерацию
clgen:
	rm -rf internal

# Подтянуть зависимости
lock-dep-1st:
	buf dep update --config config/0_generate/buf.yaml

# Классическая рабочая генерация
buf-gen-0ro:
	buf generate --template config/0_generate/buf.gen.yaml --config config/0_generate/buf.yaml

# Проверка против удаленного репозитория
buf-breaking-remote-3rd:
	buf breaking --config config/3_breaking_change/buf.yaml --against ".git#branch=master"


# Проверка против локального архива
buf-breaking-local-3rd:
	buf breaking --config config/3_breaking_change/buf.yaml  --against "/path/to/previous_version.zip"
install:
	uv sync

sql:
	psql -d db_project_83 -U admin

pdev ?= 5000
dev:
	uv run flask --debug --app page_analyzer:app run --port $(pdev)

PORT ?= 8000
start:
	uv run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

build:
	./build.sh

render-start:
	gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

i:
	uv tool install .

uninstall:
	uv tool uninstall hexlet-code
	uv clean

re: uninstall i

req-txt:
	uv pip compile pyproject.toml -o requirements.txt

#_______________________________________________________________________________Lint

lint:
	uv run ruff check .

fix:
	uv run ruff check --fix
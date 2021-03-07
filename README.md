# Horusec Action

[Horusec](https://horusec.io/) is a [SAST](https://en.wikipedia.org/wiki/Static_application_security_testing) great DevSecOps tool to use for any pipeline. This is a proof of concept to embed in a Github Action.

## How to use

You can put arguments as cli (`--ignore="**/tmp/**"`), but the better way when use a configuration file. To generate the configuration file:

```bash
horusec generate
```

Below is an example with Horusec configuration. If you want to see how to use in the a real project, you can see [here](https://github.com/fike/fastapi-blog/blob/main/.github/workflows/sast.yml).

```yml
on: [push]

jobs:
  checking_code:
    runs-on: ubuntu-latest
    name: Horusec Scan
    steps:
      - name: Run Horusec
        id: run_horusec
        uses: fike/horusec-action@v0.1
        with:
          arguments: --config-file-path=horusec-config.json
```

The most common argument to pass is `--ignore` directories and target path. You can add any extra argument for Horusec supported but keep in mind that use in the argument line for your Action workflow.

Here is an example to ignore some directories and the target path is `"/"`.

```yml
on: [push]

jobs:
  checking_code:
    runs-on: ubuntu-latest
    name: Horusec Scan
    steps:
      - name: Run Horusec
        id: run_horusec
        uses: fike/horusec-action@v0.1
        with:
          arguments: -p="./" --ignore="**/.vscode/**, **/*.env, **/.mypy_cache/**, **/tests/**"
```

## Known Issue

Build Action based Docker purely isn't flexible to split arguments like it's possible when build using Javascript/Typescript.

This is a proof of concept to running Horusec as a Github Action.

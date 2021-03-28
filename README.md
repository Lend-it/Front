# Front

Esse projeto é um startpoint em [Flutter](https://flutter.dev/) da aplicação [Lend.it](https://github.com/fga-eps-mds/2020.2-Lend.it) desenvolvida pela equipe formada pelos alunos da **Universidade de Brasília** do curso de **Engenharia de Software** nas matérias de **Engenharia de Produto de Software (EPS) / Métodos de Desenvolvimento de Software (MDS) - Grupo 01**

## Instalação

This project is a starting point for a Flutter application.
### Flutter para linux (64-bit)

Para a instalação do flutter é necessário instalar previamente o **snap** com o comando:
```
$ sudo apt install snap
```

Com o snap instalado podemos instalar o flutter:
```
$ sudo snap install flutter --clasic
```

Em seguida rode o comando para ver se alguma outra dependencia é necessária para instalação:
```
$ flutter doctor
```

### Flutter para macOS (64-bit)

É necessário ter o git instalado no sistema e recomendado também a instalação do [Xcode](https://developer.apple.com/xcode/) que já inclui o git, porém é possível baixar o [git](https://git-scm.com/download/mac) separamente também.

* Baixe a [SDK do Flutter](https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_2.0.3-stable.zip).
* Extraia o arquivo no local destinado, por exemplo:
```
$ cd ~/development
$ unzip ~/Downloads/flutter_macos_2.0.3-stable.zip
```
* Adicione o flutter ao seu path:
```
$ export PATH="$PATH:`pwd`/flutter/bin"
```
Em seguida rode o comando para ver se alguma outra dependencia é necessária para instalação:
```
$ flutter doctor
```

### Android Studio

Instalação do Android Studio: https://developer.android.com/studio/install

## Rodando o projeto

Navegue até a pasta **Front** no terminal usando **cd** e execute:

```
$ flutter run
```

## Referência

**Documentação do Flutter:** https://flutter.dev/docs

*Step by step*

1. Estrutura básica do projeto. 
$ npm init -y  
2. Instalar compilador do rescript.
$ npm add rescript
3. Criar arquivo de configuração do compilador "bsconfig.json".
$ touch bsconfig.json
~~~
{
  "name": "rescript-vanilla",
  "sources": [
    {
      "dir": "src",
      "subdirs": true
    }
  ],
  "package-specs": [
    {
      "module": "es6",
      "in-source": true
    }
  ],
  "suffix": ".bs.js",
  "bs-dependencies": []
}
~~~
4. Configurar scripts 
~~~
"scripts": {
    ...
  "rescript:buld": "rescript",
  "rescript:start": "rescript build -w",
  "rescript:clean": "rescript clean"
  },
~~~

* rescript : Compila para JS
* rescript build -w : watch mode
* rescript clean : limpa arquivos gerados

**Conseito** 
*Integração Vertical*
<p>
Nao tem "lock" com uma ferramenta de bundle.
</p>

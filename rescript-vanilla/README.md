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
        "module": "commonjs",
        "in-source": true
      }
    ],
    "suffix": ".bs.js",
    "bs-dependencies": []
  }
~~~
4. Configurar scripts package.json.
~~~
"scripts": {
    ...
  "rescript:buld": "rescript",
  "rescript:start": "rescript build -w",
  "rescript:clean": "rescript clean"
  },
~~~

* $ rescript : Compila para JS
* $ rescript build -w : watch mode
* $ rescript clean : limpa arquivos gerados

**Conceito:** 
*Integração Vertical*
<p>
Nao tem "lock" com uma ferramenta de bundle.
</p>

**Integração com uma ferramenta de Bundle:**
5. Clone do templante vite.
~~~ 
$ git clone git@github.com:es2077/vite-template.git
~~~

6. [vite] Adicionar acompilador rescript ao projeto vite.
~~~
$ npm add rescript
~~~

7. [vite] Criar arquivo de configuração do compilador "bsconfig.json".
~~~
{
    "name": "rescript-vite-template",
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

8. [vite] Configurar scripts package.json.
~~~
"scripts": {
    ...
  "rescript:buld": "rescript",
  "rescript:start": "rescript build -w",
  "rescript:clean": "rescript clean"
  },
~~~

**Integração com React:**

9. [vite] Instalar "binds".

~~~
$ npm add @rescript/react
~~~

10. [vite] Adicionar "@rescript/react" nas dependencias e informar ao compilador a versao do JSX  "bsconfig.json".
~~~

"suffix": ".bs.js",
    "reason": {
      "react-jsx": 3
    },
    "bs-dependencies": [
      "@rescript/react"
    ]
~~~ 


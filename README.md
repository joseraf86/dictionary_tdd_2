# Apuntes de Computaci�n
#### Desarrollando caracter�sticas bajo el enfoque TDD en _Ruby on Rails_

C�digo de ejemplo del tutorial [Desarrollando m�s caracter�sticas bajo el enfoque TDD en _Ruby on Rails_][8]. Continuaci�n del post  [Desarrollando caracter�sticas bajo el enfoque TDD en _Ruby on Rails_][1].

#### Pre-requisitos

* Ruby: MRI 2.2.3p173
* Rails 4.2.4
* gem 2.5.0
* bundle 1.10.6

Es recomendable el uso de [rbenv][2] con el plugin [rb-build][3] para la instalaci�n.

Se asume el uso de MySQL con _back-end_. Se puede utilizar cualquier otro _back-end_ soportado por **_ActiveRecord_** con los cambios necesarios en _config/database.yml_.

El correcto funcionamiento del ejemplo no est� garantizado si se usan distintas versiones de las indicadas.

#### Instalaci�n

Ejecutar en el directorio ra�z del proyecto:
```sh
$ git clone https://github.com/joseraf86/dictionary_tdd_2.git
$ bundle install
$ bundle exec rake db:setup
$ bundle exec rake test -v
```
Editar _config/database.yml_ y _config/secrets.yml_ con los datos requeridos, e iniciar el servidor de desarrollo.
```sh
$ bundle exec rails s
```
Comprobar la aplicaci�n en:

[http://127.0.0.1:3000/words/learn][3]

Debe generarse una palabra en ingl�s aleatoriamente con su respectiva traducci�n al espa�ol.

#### Instrucciones

Descargar c�digo fuente, el mismo est� intradocumentado. Seguir la lectura de los _posts_ [Desarrollando caracter�sticas bajo el enfoque TDD en _Ruby on Rails_][1](1� parte) y [Desarrollando m�s caracter�sticas TDD con _Ruby on Rails_][8](2� parte). Inspeccionar los ficheros  _test/models/word_test.rb_ y _test/controllers/words_controller_test.rb_ mientras se avanza en la lectura.

#### Lecturas recomendadas

* [... and some more TDD steps with Rails ][4] **(Fuente original/_Original source_: _Thoughts on Software_ - Andrzej Krzywda)**
* [A Guide to Testing Rails Applications][5] **(Gu�a oficial de _Rails_/_Official Rails guide_)**
* [Red-Green-Refactor][6] **(_Blog_ personal de James Shore/_James Shore's personal blog_)**
* [Introduction to Test Driven Development (TDD)][7] **(Agile Data por Scott Ambler/_Agile Data by Scott Ambler_)**

#### Contacto
joserafaelguevara@gmail.com

[//]: # (REFERENCIAS)
[1]: <https://joserafaelguevara.wordpress.com/2015/11/12/%desarrollando-caracteristicas-bajo-el-enfoque-tdd-en-ruby-on-rails>
[2]: <https://github.com/sstephenson/rbenv>
[3]: <https://github.com/sstephenson/ruby-build>
[4]: <http://andrzejonsoftware.blogspot.com.es/2007/05/and-some-more-tdd-steps-with-rails.html>
[5]: <http://guides.rubyonrails.org/testing.html>
[6]: <http://www.jamesshore.com/Blog/Red-Green-Refactor.html>
[7]: <http://agiledata.org/essays/tdd.html>
[8]: <https://joserafaelguevara.wordpress.com/2015/11/17/desarrollando-mas-caracteristicas-tdd-con-ruby-on-rails/>

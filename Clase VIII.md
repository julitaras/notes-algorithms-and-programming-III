<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clase VIII</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li>
<ul>
<li><a href="#organizacion-de-conocimiento">Organizacion de conocimiento</a></li>
</ul>
</li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <ul>
<li>Facilmente configurable. Cambiar nombres a CintaAzul, CintaRoja</li>
<li>QUe pase los 3 test.</li>
<li>Fijarse lo de si la cinta se debe encargar de deporsitar todo o si el contender deberia recibir todo.</li>
</ul>
<hr>
<h2 id="organizacion-de-conocimiento">Organizacion de conocimiento</h2>
<p>Paradigmas:<br>
<strong>Moderna</strong>:</p>
<ul>
<li>relacion de parentesco o herencia</li>
<li>objetos ejemplares o parentesco</li>
</ul>
<p>Se puede definir un padre para x objeto. en este caso estabamos trabajando con prototipos.</p>
<p>fowardear:<br>
Tal hace esta tarea, no juan hacelo vos</p>
<p>Delegar<br>
yo hago la tarea pero en otro contexto<br>
La ejecucuin se la delega al padre pero lo hace en su contextp</p>
<p>juan vos que sabes corregir, le voy preguntanod a juan. pero lo corrgo yo.</p>
<p>Paradigma:</p>
<ol>
<li>Clasica</li>
<li>Moderna</li>
</ol>
<hr>
<p>Enfoque clasico</p>
<p>INstancias : “tipos de obejtos”.<br>
clases: Auqellos objetos que modelan el conceoto. representa el concepto del dominion del problema</p>
<p>Cada clase puede definir el comportamiento de cada instancia</p>
<p>Clases van a tener asociados los metodos. Lo obejtos van a responder los mensajes que …</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk"><span class="token comment">"Crea una nueva instancia de esta clase."</span>
OrderedCollection <span class="token keyword">new</span><span class="token punctuation">.</span> 
</code></pre>
<p>Vamos a tener una jerarquia de clases.</p>
<p>Herencia --&gt; Clasificar, subclasificar.<br>
Clases que tengan al menos un metodos abstractos se llaman clases abstracctras<br>
no hay instancias concretas<br>
no se implementaria la clase<br>
ejemplo:<br>
clase numero<br>
tiene metodo multiplicar</p>
<p>sus hijos Entero y fraccion tienen el mensaje multiplicar implemnetado</p>
<p>pero en la clase numero el mimso no esta implementado y a eso lo llamamos abstracto</p>
<p><img src="https://user-images.githubusercontent.com/30576222/97241135-eeadc700-17ce-11eb-8ed2-2e0967bf9dd4.png" alt="image"></p>
<p>A partir de ahora usamos directemente la ventana de ClassBrowser</p>
<p>Polimorfirmo<br>
=&gt; El que es el mismo pero el como cambia.<br>
Podemos verlo en la clase Numero<br>
ya que la clase entero y fraccion vendrian a representar lo mismo que numero. Lo que cambia es el como de como se implemneta por ejemplo la multiplicacion, division, etc.</p>

    </div>
  </div>
</body>

</html>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clase VII</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li>
<ul>
<li><a href="#ejercicio">Ejercicio</a></li>
</ul>
</li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h1 align="center"> Clase nº 7</h1>
<p>Mensajes del semaforo al regulador<br>
POLIMORFMISMO</p>
<h2 id="ejercicio"><strong>Ejercicio</strong></h2>
<ul>
<li>Extractor de carbon, hierro,</li>
<li>Cintas transportadora azul y otra de color rojo.</li>
<li>Caja (Contenedor) donde se lleva el material. Común para ambas, en esta configuración.</li>
</ul>
<p>Factorio</p>
<ul>
<li>Una cinta vuelca en una cinta y esa cinta vuelca en el contendor</li>
</ul>
<p>No hay que encender las cintas, solo funcionan.</p>
<p>Las cantidades no importan.<br>
la cinta tira todo lo que tiene en el contendor.</p>
<ol>
<li>Tengo un contenedor y esta vacío.</li>
</ol>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">Contenedor<span class="token operator">/</span>Container <span class="token operator">=</span><span class="token operator">&gt;</span> Objeto
	<span class="token comment">"Se encarga de almacenar cosas"</span>

isEmpty <span class="token operator">=</span><span class="token operator">&gt;</span> mensaje del objeto Contendor
	<span class="token comment">"Devuelve si esta vacio"</span>
	<span class="token operator">^</span><span class="token keyword">true</span>
</code></pre>
<ol start="2">
<li>Tengo un contenedor y tiene algo. Por lo que no esta vacio.</li>
</ol>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">almacenar 
	<span class="token comment">"Se encarga de almacenar en el contenedor"</span>
	
</code></pre>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">ExtractorDeCarbon
	
	extraerEn<span class="token punctuation">:</span> destino 
		<span class="token comment">"Se encarga de descargar el contenido en el destino"</span>
		destino agregar
	
Contenedor
	
	agregar
		contenido <span class="token operator">:=</span> contenido <span class="token operator">+</span> <span class="token number">1</span><span class="token punctuation">.</span>
	
	estaVacio
		<span class="token operator">^</span>contenido <span class="token operator">=</span> <span class="token number">0</span>
	
	cantidadCarbon
		<span class="token operator">^</span>contenido

collection <span class="token operator">:=</span> OrderedCollection <span class="token keyword">new</span><span class="token punctuation">.</span>
collection size<span class="token punctuation">.</span>
collection add<span class="token punctuation">:</span> <span class="token number">1</span><span class="token punctuation">.</span>
collection addAll<span class="token punctuation">:</span> <span class="token symbol">#</span><span class="token punctuation">(</span><span class="token number">4</span> <span class="token number">5</span> <span class="token number">6</span><span class="token punctuation">)</span><span class="token punctuation">.</span>
collection removeAll<span class="token punctuation">.</span>
collection isEmpty<span class="token punctuation">.</span>
	
</code></pre>
<p>Entrega Juevees 29 19hs. o antes</p>

    </div>
  </div>
</body>

</html>

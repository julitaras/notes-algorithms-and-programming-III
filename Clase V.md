<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clase V</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li></li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h1 align="center"> Clase nº 5 </h1>
<ul>
<li>Revision de los formularios respondidos
<ul>
<li>Sintaxis, prioridad y no entiendo</li>
<li>Self y thisContext</li>
<li>Yendo meta</li>
</ul>
</li>
</ul>
<p><mark>Los mensajes son objetos</mark><br>
Mensajes que saben responder los mensajes:</p>
<ul>
<li>sendTo</li>
</ul>
<p>Ejemplo dentro de inspeccionar <code>dateOfBirth</code>:</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk"><span class="token keyword">self</span> sendTo AlanKay<span class="token punctuation">.</span>
</code></pre>
<hr>
<p>¿Qué significa el <code>#</code> cuándo hacemos lo siguiente ?</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk"><span class="token keyword">self</span> <span class="token symbol">#dateOfBirth</span>
</code></pre>
<p>Crea una clase de objeto que se llama <strong>simbolo</strong></p>
<hr>
<p><mark>Los métodos son objetos</mark></p>
<p>¿Qué mensaje sabe responder un método?</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk"><span class="token keyword">self</span> sourceCode<span class="token punctuation">.</span>
<span class="token keyword">self</span> linesOfCode<span class="token punctuation">.</span>
</code></pre>
<p><strong>self</strong> =&gt; Pseudo variable. No se puede redefinir. Representa el objeto donde se esta uno parado porque depende del contexto donde uno este.<br>
Permite pasar al objeto como colaborador a otro mensaje.</p>
<p><strong>this context</strong> =&gt; Pseudo variable. Hace referencia al contexto en el que estamos.</p>
<hr>
<p><strong>Ejercicio de semaforo.</strong></p>
<p>Se crea el objeto <code>Semaforo</code>, <code>LuzVerde</code>, <code>LuzAmarilla</code>, <code>LuzRoja</code>.</p>
<p>Por ahora solo se implemento el uso de la <code>LuzAmarilla.</code></p>
<p>Se crea el mensaje <code>encender</code> para <code>Semaforo</code>.</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">encender
	<span class="token keyword">self</span> titilarUnaVez<span class="token punctuation">:</span><span class="token punctuation">(</span><span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span><span class="token punctuation">.</span>
	<span class="token keyword">self</span> titilarUnaVez<span class="token punctuation">:</span><span class="token punctuation">(</span><span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span><span class="token punctuation">.</span>
	<span class="token keyword">self</span> titilarUnaVez<span class="token punctuation">:</span><span class="token punctuation">(</span><span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span><span class="token punctuation">.</span>
	<span class="token keyword">self</span> titilarUnaVez<span class="token punctuation">:</span><span class="token punctuation">(</span><span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span><span class="token punctuation">.</span>
	<span class="token keyword">self</span> titilarUnaVez<span class="token punctuation">:</span><span class="token punctuation">(</span><span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span><span class="token punctuation">.</span>
</code></pre>
<p>Se crea el mensaje <code>titilarUnaVez</code></p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">titilarUnaVez<span class="token punctuation">:</span> cantidadSegundosTitilar
	LuzAmarilla prencender<span class="token punctuation">.</span>
		<span class="token punctuation">(</span>Delay for<span class="token punctuation">:</span> cantidadSegundosTitilar<span class="token punctuation">)</span> wait<span class="token punctuation">.</span><span class="token punctuation">)</span>
	LuzAmarilla apagar<span class="token punctuation">.</span>
		<span class="token punctuation">(</span>Delay for<span class="token punctuation">:</span> cantidadSegundosTitilar<span class="token punctuation">)</span> wait<span class="token punctuation">.</span>
</code></pre>
<p>Se crea el mensaje <code>encender</code> y  <code>apagar</code> para <code>LuzAmarilla</code></p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">encender<span class="token punctuation">:</span>
	<span class="token keyword">self</span> Color Yellow
</code></pre>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">apagar<span class="token punctuation">:</span>
	<span class="token keyword">self</span> Color Black
</code></pre>

    </div>
  </div>
</body>

</html>

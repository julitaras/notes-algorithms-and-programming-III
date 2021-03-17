<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clase VI</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li>
<ul>
<li><a href="#que-es-un-closure">Que es un closure?</a></li>
<li><a href="#diferencia-entre-igualdad-e-identidad">Diferencia entre igualdad e identidad</a></li>
<li><a href="#como-quitar-código-repetido-">Como quitar código repetido ?</a></li>
</ul>
</li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h1 align="center"> Clase nº 6</h1>
<ul>
<li>Revision de los formularios respondidos
<ul>
<li>Closure</li>
<li>Igualdad e Identidad</li>
<li>Yendo bien meta</li>
</ul>
</li>
</ul>
<hr>
<h2 id="que-es-un-closure">Que es un <strong>closure</strong>?</h2>
<ul>
<li>Es un objeto.</li>
<li>Similitud con funciones anónimas.</li>
<li>No tienen nombres.</li>
<li>Representan conjunto de colaboraciones.</li>
<li>Se evalúan a través del mensaje <code>value</code>.</li>
<li>Estan bindeados al contexto. El closure esta unido al contexto.</li>
</ul>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">m1
	<span class="token temporary-variables"><span class="token punctuation">|</span><span class="token variable">t1</span> <span class="token variable">myClosure</span><span class="token punctuation">|</span></span>
	t1 <span class="token operator">:=</span> <span class="token number">1</span><span class="token punctuation">.</span>
	myClosure <span class="token operator">:=</span> <span class="token punctuation">[</span>t1 <span class="token operator">:=</span> t1 <span class="token operator">+</span> <span class="token number">1</span><span class="token punctuation">]</span><span class="token punctuation">.</span>
	<span class="token operator">^</span>myClosure
</code></pre>
<p>Si hago</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">m1 value<span class="token punctuation">.</span>
</code></pre>
<p>El resultado sera:</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">m1 value<span class="token punctuation">.</span> <span class="token number">2</span>
</code></pre>
<p>Si hago nuevamente</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">m1 value<span class="token punctuation">.</span>
</code></pre>
<p>Devolvera:</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">m1 value<span class="token punctuation">.</span> <span class="token number">3</span>
</code></pre>
<h2 id="diferencia-entre-igualdad-e-identidad">Diferencia entre <strong>igualdad</strong> e <strong>identidad</strong></h2>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk"><span class="token operator">==</span> <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Identidad<span class="token punctuation">.</span> Si es el mismo objeto<span class="token punctuation">.</span> Si es la misma posicion de memoria

<span class="token punctuation">(</span><span class="token number">3</span><span class="token operator">/</span><span class="token number">4</span><span class="token punctuation">)</span> <span class="token operator">==</span> <span class="token punctuation">(</span><span class="token number">3</span><span class="token operator">/</span><span class="token number">4</span><span class="token punctuation">)</span><span class="token punctuation">.</span> <span class="token keyword">false</span> <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Ya que son dos objetos diferentes<span class="token punctuation">.</span> No se puede guardar en memoria entonces se guarda en diferentes<span class="token punctuation">.</span>
<span class="token punctuation">(</span><span class="token number">10</span> factorial<span class="token punctuation">)</span> <span class="token operator">==</span> <span class="token punctuation">(</span><span class="token number">10</span> factorial<span class="token punctuation">)</span><span class="token punctuation">.</span> <span class="token keyword">true</span>
<span class="token punctuation">(</span><span class="token number">100</span> factorial<span class="token punctuation">)</span> <span class="token operator">==</span> <span class="token punctuation">(</span><span class="token number">100</span> factorial<span class="token punctuation">)</span><span class="token punctuation">.</span> <span class="token keyword">false</span>
<span class="token number">5</span> <span class="token operator">==</span> <span class="token number">5</span><span class="token punctuation">.</span> <span class="token keyword">true</span>
</code></pre>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk"><span class="token operator">=</span> <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Igualdad

<span class="token punctuation">(</span><span class="token number">3</span><span class="token operator">/</span><span class="token number">4</span><span class="token punctuation">)</span> <span class="token operator">=</span> <span class="token punctuation">(</span><span class="token number">3</span><span class="token operator">/</span><span class="token number">4</span><span class="token punctuation">)</span><span class="token punctuation">.</span> <span class="token keyword">true</span>
<span class="token number">5</span> <span class="token operator">=</span> <span class="token number">5</span><span class="token punctuation">.</span> <span class="token keyword">true</span>
</code></pre>
<hr>
<p><strong>Ejercicio semaforo</strong></p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">SemaforoDeMaipuYCorrientes <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Objeto

Mensajes<span class="token punctuation">:</span>
	advertirEncendido
		<span class="token number">5</span> timesRepeat<span class="token punctuation">:</span> <span class="token punctuation">[</span><span class="token keyword">self</span> titilarLuzAmarilla<span class="token punctuation">]</span>
		
	titilarLuzAmarilla
		LuzAmarilla prender<span class="token punctuation">.</span>
		<span class="token punctuation">(</span>Delay for<span class="token punctuation">:</span> <span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span> wait<span class="token punctuation">.</span>
		LuzAmarilla apagar<span class="token punctuation">.</span>
		<span class="token punctuation">(</span>Delay for<span class="token punctuation">:</span> <span class="token number">0.5</span> <span class="token operator">*</span> second<span class="token punctuation">)</span> wait<span class="token punctuation">.</span>
	
	encender<span class="token punctuation">:</span>
		<span class="token keyword">self</span> advertirEncendido
		
	apagarLuz<span class="token punctuation">:</span> unaLuz
		unaLuz apagar

LuzAmarilla <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Objeto

Mensajes<span class="token punctuation">:</span>
	prender

LuzVerde <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Objeto
LuzRoja <span class="token operator">-</span><span class="token operator">-</span><span class="token operator">&gt;</span> Objeto
</code></pre>
<p><em>reificar</em>: hacer real</p>
<hr>
<h2 id="como-quitar-código-repetido-">Como quitar código repetido ?</h2>
<p>Algoritmo de quitar código repetido</p>
<ol>
<li>Copiar lo repetido a un lugar.</li>
<li>Parametrizar lo que cambia.</li>
<li>Nombrar la nueva abstracción.</li>
<li>Reemplazar lo repetido por la nueva abstracción.</li>
</ol>
<hr>

    </div>
  </div>
</body>

</html>

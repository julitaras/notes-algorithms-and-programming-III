<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clase - TDD</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li>
<ul>
<li>
<ul>
<li></li>
<li><a href="#¿qué-es-tdd">¿QUÉ ES TDD?</a></li>
<li><a href="#estructura-de-un-test">ESTRUCTURA DE UN TEST</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#resolución-de-ejercicio-mars-rover">Resolución de ejercicio Mars Rover</a></li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h1 align="center"> Clase TDD </h1>
<h4 id="tdd-test-driven-development">TDD: Test driven development</h4>
<h3 id="¿qué-es-tdd">¿QUÉ ES TDD?</h3>
<ul>
<li>Tecnica para desarrollar software</li>
</ul>
<p><strong>Características:</strong></p>
<ul>
<li>Iterativo e increemental</li>
<li>Obtenemos feedback de inmediato</li>
</ul>
<p>analisis + diseño + programacoon + testing</p>
<ul>
<li>
<p>TEST era visto como algo que se hacia al final, etapa posterior</p>
</li>
<li>
<p>Implica que el programador haga sus propios test</p>
</li>
</ul>
<p><strong>¿CÓMO HACER UN TDD?  <mark>3 pasos</mark></strong></p>
<ul>
<li>Escribir un test
<ul>
<li>El mas sencillo</li>
<li>Debe fallar al ejecutarlo</li>
</ul>
</li>
<li>Lograr que todos los test pasen
<ul>
<li>Implementación mas simple posible.</li>
<li>No abarcar demas</li>
</ul>
</li>
<li>¿Se puede mejorar ?
<ul>
<li>Refactorizar --&gt; Deben seguir pasando los test</li>
</ul>
</li>
</ul>
<blockquote>
<p>💡<strong>NOTA:</strong> Siempre que hagamos funcionalidad, debe haber un test antes.</p>
</blockquote>
<blockquote>
<p>“Nunca confien en un tets que no vieron en rojo”</p>
</blockquote>
<h3 id="estructura-de-un-test">ESTRUCTURA DE UN TEST</h3>
<p><strong>Setup</strong> --&gt; Definir contexto/ escenario inicial. Pre-condición.<br>
<strong>Exercise</strong> --&gt; Ejercitar la funcionalidad que queremos testear.<br>
<strong>Assert</strong> --&gt; Verificar lo esperado. Post-condicion</p>
<p><strong>Ejemplo:</strong> Calendario de feriados</p>
<blockquote>
<p>Lo mas fácil es arrancar por los assert</p>
</blockquote>
<p>Con TDD GURU se puede ver mas o menos si se aplico correctamente TDD</p>
<p>JUEGO DE LA VIDA… —&gt;</p>
<hr>
<p>Primer test.<br>
una celda viva tiene vecinos vivos</p>
<h1 id="resolución-de-ejercicio-mars-rover">Resolución de ejercicio <code>Mars Rover</code></h1>

    </div>
  </div>
</body>

</html>

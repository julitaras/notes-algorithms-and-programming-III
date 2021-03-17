<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clase - 11 02</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <p>Clase 11/02</p>
<ul>
<li>Puesta en común del ejercicio de iteración 1</li>
</ul>
<p>Cambiar a <code>bag</code><br>
devolver copia --&gt; ejemplo mensaje</p>
<pre class=" language-smalltalk"><code class="prism  language-smalltalk">contents
<span class="token operator">^</span>books copy
</code></pre>
<hr>
<p>2da Iteracion</p>
<ul>
<li>Test double. Objetos simuladores.</li>
</ul>
<p>3 primeros test</p>
<ul>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> No checkout de carrito vacio.</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Checkout con un item --&gt; Carro debe quedar vacio. El cajero debe haber recolectado lo que sale el libro.</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Checkout con varios items. Carro debe quedar vacio. El cajero debe haber recolectado lo que sale el libro.</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Tarjeta expirada</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Tarjeta borrada ( ?</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> MP falla. --&gt; Ejemplo: no tiene limite la tarjeta</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Mp funciona</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Validar digitos totales en numero de expiracion T. credito. Debe ser --&gt; 6.</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Agregar parte decimal <strong>SIEMPRE</strong>.</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> Validar  <code>total a pagar</code>. Debe ser --&gt; 15 dígitos para la parte entera y dos dígitos para la decimal. (Mas adelante)</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Maximo de nombre (cco) sea de 30 caracteres.</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> multiple checkout ? --&gt; Preguntar si hay que hacer reportes?</li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" checked="true" disabled=""> Ticket</li>
</ul>
<p>Validacion de datos<br>
Rendicion de caja</p>
<ul>
<li>
<p>Donde ponemos cuanto sale el libro ?? --&gt; En el catalogo estaria bueno que este  Un diccci0nario. Clave valor. ISBN</p>
</li>
<li>
<p>Catalogo tiene los precios.</p>
</li>
</ul>
<hr>
<p>3era iteracion</p>
<p>To do:</p>
<ul>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> <strong>HACER MENSAJE EN PublisherTestObjectsFactory QUE DEVUELVA anInvalidCartId</strong></li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> <strong>HACER MENSAJE EN PublisherTestObjectsFactory QUE DEVUELVA anInvalidCartId</strong></li>
<li class="task-list-item"><input type="checkbox" class="task-list-item-checkbox" disabled=""> <strong>HACER MENSAJE EN PublisherTestObjectsFactory QUE DEVUELVA anInvalidCartId</strong></li>
</ul>

    </div>
  </div>
</body>

</html>

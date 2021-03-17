<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tp - Final</title>
  <link rel="stylesheet" href="https://stackedit.io/style.css" />
</head>

<body class="stackedit">
  <div class="stackedit__left">
    <div class="stackedit__toc">
      
<ul>
<li>
<ul>
<li><a href="#nombre-de-3-primeros-tests">Nombre de 3 primeros tests</a></li>
</ul>
</li>
</ul>

    </div>
  </div>
  <div class="stackedit__right">
    <div class="stackedit__html">
      <h2 id="nombre-de-3-primeros-tests">Nombre de 3 primeros tests</h2>
<ol>
<li>Se hace post a <a href="https://merchanttest.com/debit">https://merchanttest.com/debit</a> sin params.</li>
</ol>
<blockquote>
<p>En realidad solo debería hacerse a test y debería funcionar igual en prod.</p>
</blockquote>
<ol start="2">
<li>Se hace post con param <code>creditCardNumber</code>.</li>
<li>Se hace post con param <code>creditCardExpiration</code>.</li>
<li>Se hace post con param <code>creditCardOwner</code>.</li>
<li>Se hace post con param <code>transactionAmount</code>.</li>
</ol>
<p>Nombre de los tests:</p>
<p>test01PostToMerchantProcessorWithoutParameters<br>
test02PostToMerchantProcessorWithParamCreditCardNumber<br>
test03PostToMerchantProcessorWithParamCreditCardNumberAndcreditCardExpiration</p>
<hr>
<p>bottomup --&gt; desde abajo hacia arriba<br>
topdown --&gt; desde mas arriba hacia abajo</p>
<hr>
<p>TESTS --&gt; modelar y testear el carrito entre 6 y 9 tests.</p>
<p>puedo agregar cualquier libro al carrito ? --&gt; Error</p>
<ul>
<li>creo el carrito vacio</li>
<li>se agrega un elemento exitoso al carrito</li>
<li>se agregan varios elementos a un carrito.</li>
<li>se agrega un elemento que falla.</li>
</ul>
<p></p>

    </div>
  </div>
</body>

</html>

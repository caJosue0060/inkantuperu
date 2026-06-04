$newHeader = @"
		<header id="masthead" class="site-header" role="banner">
			<div class="wrapper main-menu">
				<div class="site-branding">
					<div class="site-logo">
						<a href="../index.htm" class="custom-logo-link" rel="home"><img width="221" height="53" src="../nuevo-logo.png" class="custom-logo" alt="INKANTU PERU TRAVEL"></a>
					</div>
					<div id="site-identity">
						<p class="site-title"><a href="../index.htm" rel="home">INKANTU PERU TRAVEL</a></p>
						<p class="site-description">Tours en Cusco</p>
					</div>
				</div>

				<nav id="site-navigation" class="main-navigation" role="navigation">
					<button class="menu-toggle" aria-controls="primary-menu" aria-expanded="false">
						<span class="menu-label">Menu</span>
					</button>
					<div class="menu-main-container">
						<ul id="primary-menu" class="menu nav-menu">
							<li class="menu-item"><a href="../index.htm">Inicio</a></li>
							<li class="menu-item"><a href="tours.htm">Tours</a></li>
							<li class="menu-item"><a href="terminos-condiciones.htm">Términos y Condiciones</a></li>
							<li class="menu-item"><a href="politica-proteccion-datos.htm">Política de Protección de Datos</a></li>
							<li class="menu-item"><a href="afiche-digital.htm">Afiche Digital</a></li>
							<li class="menu-item"><a href="https://wa.me/51965477510?text=Me%20gustaría%20saber%20mas%20de%20los%20tours" target="_blank">Contactanos</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</header>
"@

$files = Get-ChildItem -Path "tours" -Filter "*.htm"

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    # Regex to match the header block more robustly
    $pattern = '(?s)<header id="masthead".*?</header>(<!-- #masthead -->)?'
    $newContent = $content -replace $pattern, $newHeader
    Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
}

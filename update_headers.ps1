$utf8WithBOM = New-Object System.Text.UTF8Encoding($true)
$files = Get-ChildItem "tours/*.htm"
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    
    $currentMenuItem = ""
    if ($file.Name -eq "terminos-condiciones.htm") {
        $currentMenuItem = "menu-item-281"
    } elseif ($file.Name -eq "politica-proteccion-datos.htm") {
        $currentMenuItem = "menu-item-politica"
    } elseif ($file.Name -eq "afiche-digital.htm") {
        $currentMenuItem = "menu-item-afiche"
    } else {
        $currentMenuItem = "menu-item-285"
    }

    $headerTemplate = @"
<header id="masthead" class="site-header" role="banner">
    <div class="wrapper main-menu">
        <div class="site-branding">
            <div class="site-logo">
                <a href="../index.htm" class="custom-logo-link" rel="home"><img width="221" height="53" src="../nuevo-logo.png" class="custom-logo" alt="INKANTU PERU TRAVEL" decoding="async"></a>
            </div>
            <div id="site-identity">
                <p class="site-title"><a href="../index.htm" rel="home">INKANTU PERU TRAVEL</a></p>
                <p class="site-description">Tours en Cusco</p>
            </div><!-- #site-identity -->
        </div><!-- .site-branding -->

        <nav id="site-navigation" class="main-navigation" role="navigation">
            <button class="menu-toggle" aria-controls="primary-menu" aria-expanded="false">
                <span class="menu-label">Menu</span>
            </button>

            <div class="menu-main-container">
                <ul id="primary-menu" class="menu nav-menu">
                    <li id="menu-item-280" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-280"><a href="../index.htm">Inicio</a></li>
                    <li id="menu-item-285" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-285"><a href="tours.htm">Tours</a></li>
                    <li id="menu-item-281" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-281"><a href="terminos-condiciones.htm">T&eacute;rminos y Condiciones</a></li>
                    <li id="menu-item-politica" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="politica-proteccion-datos.htm">Pol&iacute;tica de Protecci&oacute;n de Datos</a></li>
                    <li id="menu-item-afiche" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="afiche-digital.htm">Afiche Digital</a></li>
                    <li id="menu-item-282" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-282"><a href="https://wa.me/51965477510?text=Me%20gustar%C3%ADa%20saber%20mas%20de%20los%20tours" target="_blank">Contactanos</a></li>
                </ul>
            </div>
        </nav><!-- #site-navigation -->
    </div><!-- .wrapper -->
</header><!-- #masthead -->
"@

    $headerTemplate = $headerTemplate -replace "id=""$currentMenuItem"" class=""menu-item", "id=""$currentMenuItem"" class=""menu-item current-menu-item"
    
    $newContent = $content -replace '(?s)<header id="masthead".*?</header><!-- #masthead -->', $headerTemplate
    
    [System.IO.File]::WriteAllText($file.FullName, $newContent, $utf8WithBOM)
}

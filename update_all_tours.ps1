$template = @'
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>__TITLE__ - INKANTU PERU TRAVEL</title>
    <link rel="icon" href="../wp-content/uploads/sites/140/2020/03/fab-icon-1-150x150.png" sizes="32x32">
    
    <!-- Preconnect for fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../inkantu-styles.css">
</head>
<body>

    <!-- Header & Navigation -->
    <header class="site-header">
        <div class="wrapper main-menu">
            <div class="site-branding">
                <a href="../index.htm" class="custom-logo-link">
                    <img src="../nuevo-logo.png" class="custom-logo" alt="INKANTU PERU TRAVEL">
                </a>
                <div id="site-identity" class="desktop-only">
                    <h1 class="site-title"><a href="../index.htm">INKANTU PERU</a></h1>
                    <p class="site-description">Tours en Cusco</p>
                </div>
            </div>

            <button class="menu-toggle" id="menu-toggle">
                <i class="fas fa-bars"></i>
            </button>

            <div class="menu-overlay" id="menu-overlay"></div>
            
            <nav class="menu-main-container" id="mobile-menu">
                <button class="close-menu" id="close-menu"><i class="fas fa-times"></i></button>
                <ul class="nav-menu">
                    <li><a href="../index.htm">Inicio</a></li>
                    <li><a href="tours.htm">Tours</a></li>
                    <li><a href="terminos-condiciones.htm">Términos y Condiciones</a></li>
                    <li><a href="politica-proteccion-datos.htm">Protección de Datos</a></li>
                    <li><a href="afiche-digital.htm">Misión y Visión</a></li>
                    <li><a href="https://wa.me/51965477510?text=Me%20gustaría%20saber%20mas%20de%20los%20tours" target="_blank">Contáctanos</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Page Header -->
    <section class="page-header-section" style="background-image: url('../__IMAGE__');">
        <div class="overlay"></div>
        <div class="wrapper page-header-content">
            <h1 class="page-header-title">__TITLE__</h1>
            <ul class="breadcrumb">
                <li><a href="../index.htm">Inicio</a></li>
                <li><a href="tours.htm">Tours</a></li>
                <li>__TITLE__</li>
            </ul>
        </div>
    </section>

    <!-- Content -->
    <section class="section">
        <div class="wrapper grid-2">
            <div class="tour-detail-content">
                __CONTENT__
            </div>
            
            <!-- Sidebar -->
            <div class="tour-sidebar">
                <div class="booking-widget">
                    <h3 style="font-family: var(--font-heading); margin-bottom: 10px; color: var(--secondary);">Reserva tu viaje</h3>
                    <p style="color: var(--text-secondary); margin-bottom: 20px;">Contáctanos para disponibilidad y precios.</p>
                    <a href="https://wa.me/51965477510?text=Hola,%20quisiera%20reservar%20el%20tour%20__TITLE__" target="_blank" class="btn btn-primary" style="display: block; width: 100%;">
                        <i class="fab fa-whatsapp"></i> Reservar por WhatsApp
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="site-footer">
        <div class="wrapper">
            <div class="footer-top grid-3">
                <div>
                    <img src="../nuevo-logo.png" alt="INKANTU PERU" class="footer-logo">
                    <p class="footer-about">Somos una agencia de viajes comprometida con brindarte la mejor experiencia en la ciudad imperial del Cusco y todo el Perú.</p>
                    <div class="footer-social">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-tiktok"></i></a>
                    </div>
                </div>
                <div>
                    <h3 class="footer-title">Enlaces Rápidos</h3>
                    <ul class="footer-links">
                        <li><a href="../index.htm">Inicio</a></li>
                        <li><a href="tours.htm">Nuestros Tours</a></li>
                        <li><a href="terminos-condiciones.htm">Términos y Condiciones</a></li>
                        <li><a href="politica-proteccion-datos.htm">Políticas de Privacidad</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="footer-title">Contáctanos</h3>
                    <ul class="footer-contact">
                        <li><i class="fas fa-map-marker-alt"></i> Cusco, Perú</li>
                        <li><i class="fas fa-phone-alt"></i> +51 965 477 510</li>
                        <li><i class="fas fa-envelope"></i> info@inkantuperu.com</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 INKANTU PERU TRAVEL. Todos los derechos reservados.</p>
                <div class="gtranslate_wrapper"></div>
            </div>
        </div>
    </footer>

    <!-- WhatsApp Float -->
    <a href="https://wa.me/51965477510?text=Hola,%20quisiera%20más%20información" class="whatsapp-float" target="_blank">
        <i class="fab fa-whatsapp"></i>
    </a>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- GTranslate -->
    <script>window.gtranslateSettings = {"default_language":"es","detect_browser_language":true,"languages":["es","en"],"wrapper_selector":".gtranslate_wrapper","alt_flags":{"en":"usa"}}</script>
    <script src="https://cdn.gtranslate.net/widgets/latest/float.js" defer></script>

    <!-- Custom App Logic -->
    <script>
        $(document).ready(function(){
            // Mobile Menu
            $('#menu-toggle').click(function(){
                $('#mobile-menu').addClass('active');
                $('#menu-overlay').addClass('active');
            });
            
            $('#close-menu, #menu-overlay').click(function(){
                $('#mobile-menu').removeClass('active');
                $('#menu-overlay').removeClass('active');
            });

            // Sticky Header
            $(window).scroll(function() {
                if ($(window).scrollTop() > 50) {
                    $('.site-header').css('padding', '5px 0');
                } else {
                    $('.site-header').css('padding', '10px 0');
                }
            });
        });
    </script>
</body>
</html>
'@

$files = @(
    "city-tour-cusco.htm", "valle-sur.htm", "7-lagunas-ausangate.htm", "wanakawri.htm", 
    "naupa-iglesia.htm", "valle-sagrado.htm", "maras-moray.htm", "machu-picchu.htm", 
    "montana-7-colores.htm", "humantay.htm", "chinchero.htm", "moray.htm", "pisac.htm", 
    "ollantaytambo.htm", "salineras-de-maras.htm", "tour-en-cusco.htm", "tour.htm", "huamantay.htm",
    "afiche-digital.htm", "terminos-condiciones.htm", "politica-proteccion-datos.htm"
)

foreach ($file in $files) {
    $filePath = "d:\Trabajo\Freelance\WEB WINAY WAQNA\travel-master\tours\$file"
    if (Test-Path $filePath) {
        $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
        
        # Extract title
        $title = "Tour"
        if ($content -match '<title>(.*?) &#8211;') {
            $title = $matches[1]
        } elseif ($content -match '<h1 class="page-title">(.*?)</h1>') {
            $title = $matches[1]
        } elseif ($content -match '<title>(.*?)</title>') {
            $title = $matches[1].Replace(" - INKANTU PERU TRAVEL", "")
        }
        
        # Extract image
        $image = "header-1.jpg"
        if ($content -match 'background-image:\s*url\(''(?:../)*(.*?)''\)') {
            $image = $matches[1]
            if ($image -match '^imagenes/') {
                # Ensure it relative correctly from template which expects 'imagenes/...' to be used as '../imagenes/...'
                # But our template uses url('../__IMAGE__')
                # Wait, if image is "imagenes/machu-picchu.jpg", we want it to be "__IMAGE__" = "imagenes/machu-picchu.jpg"
            } elseif ($image -notmatch '^imagenes/') {
                $image = "imagenes/header-1.jpg"
            }
        }

        # Extract content
        $mainContent = ""
        # The content usually lives in <div class="entry-content"> ... </div><!-- .entry-content -->
        $pattern = '(?s)<div class="entry-content">(.*?)</div><!-- \.entry-content -->'
        if ($content -match $pattern) {
            $mainContent = $matches[1]
        } else {
            # Fallback for pages that might not have <!-- .entry-content -->
            $pattern2 = '(?s)<div class="entry-content">(.*?)</div>\s*</div><!-- \.entry-container -->'
            if ($content -match $pattern2) {
                $mainContent = $matches[1]
            } else {
                Write-Host "Warning: Could not find entry-content for $file"
            }
        }
        
        # Special case for non-tour pages
        if ($file -match "terminos|politica|afiche") {
            # Adjust template for non-tours (remove sidebar, change breadcrumb)
            $newHtml = $template.Replace("__TITLE__", $title).Replace("__IMAGE__", "imagenes/header-1.jpg").Replace("__CONTENT__", $mainContent)
            # Remove sidebar
            $newHtml = $newHtml -replace '(?s)<!-- Sidebar -->.*?</div>\s*</div>\s*</section>', '</div></section>'
            # Change grid
            $newHtml = $newHtml -replace '<div class="wrapper grid-2">', '<div class="wrapper">'
        } else {
            $newHtml = $template.Replace("__TITLE__", $title).Replace("__IMAGE__", $image).Replace("__CONTENT__", $mainContent)
        }
        
        [System.IO.File]::WriteAllText($filePath, $newHtml, [System.Text.Encoding]::UTF8)
        Write-Host "Updated $file"
    }
}

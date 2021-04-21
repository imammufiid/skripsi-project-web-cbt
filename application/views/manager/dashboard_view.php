<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php if (!empty($site_name)) echo $site_name; ?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url(); ?>/manager"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="callout callout-info">
        <h4>Informasi</h4>
        <p>
            Selamat datang di Halaman Dashboard Aplikasi <?php echo (!empty($site_name)) ? $site_name : "" ?>.
        </p>
    </div>
</section><!-- /.content -->
# Installs voipmonitor server
class voipmonitor::server::install(
  Boolean $manage_cron,
  String $html_folder,
  String $install_location,
  String $spooldir_prefix,
  ) {
    # Step 1: prerequisites without php modules
  $prereqs = [
    'tshark',
    'mtr',
    'gsfonts',
    'rrdtool',
    'librsvg2-bin',
  ]
  package { $prereqs:
    ensure => present
  }

  # Step 2: IONcube
  exec { 'install IONcube':
    command => '/usr/bin/wget http://voipmonitor.org/ioncube/x86_64/ioncube_loader_lin_7.0.so -O /usr/lib/php/20151012/ioncube_loader_lin_7.0.so \
    && /bin/echo "zend_extension = /usr/lib/php/20151012/ioncube_loader_lin_7.0.so" > /etc/php/7.0/mods-available/ioncube.ini \
    && /bin/ln -s /etc/php/7.0/mods-available/ioncube.ini /etc/php/7.0/apache2/conf.d/01-ioncube.ini \
    && /bin/ln -s /etc/php/7.0/mods-available/ioncube.ini /etc/php/7.0/cli/conf.d/01-ioncube.ini',
    creates => '/usr/lib/php/20151012/ioncube_loader_lin_7.0.so',
  }

  # Step 3: GUI
  exec { 'fetch GUI':
    command => '/usr/bin/wget "http://www.voipmonitor.org/download-gui?version=latest&major=5&phpver=56&festry" -O w.tar.gz',
    cwd     => $html_folder,
    creates => "${html_folder}/index.php"
  }
  -> exec { 'unpack gui':
    command => '/bin/tar -xf w.tar.gz --strip 1',
    creates => "${html_folder}/index.php",
    cwd     => $html_folder,
  }
  -> exec { 'delete old GUI archive':
    command => "/bin/rm ${html_folder}/w.tar.gz",
    onlyif  => "/usr/bin/test -f ${html_folder}/w.tar.gz",
  }

  # Step 4: CRON
  if $manage_cron {
    cron { 'php cron':
      command => "/usr/bin/php ${html_folder}/php/run.php cron",
      user    => 'root',
      hour    => '*',
      minute  => '*/5'
    }
  }

  # Step 5: rights
  file { $spooldir_prefix:
    ensure => directory,
    owner  => 'www-data'
  }
}

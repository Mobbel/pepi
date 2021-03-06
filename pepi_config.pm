package pepi_config;

sub loadConfiguration {
  my ($pepi) = @_;
  $pepi->setConfiguration({
    htmlDev => {
      files         => {
        cwd         => '/mnt/d/Projekte/better-scripting.de/views',
        recursive   => true,
        src         => ['.tt', '.html'],
        destination => '/mnt/d/Projekte/testHtml', #otional
        ext         => 'tt', #optional
      },
    },
    htmlmin => {
      options => {
        remove_comments => 'true',
        remove_newlines => 'true',
        do_javascript => false,
        do_stylesheet => false,
        no_compress_comment => false,
        html5 => false,
      }
    },
  });

  $pepi->registerTask('html',[
    'htmlmin',
  ]);

  $pepi->registerChain('htmlDev',[
    'html'
  ]);
}

return 1;

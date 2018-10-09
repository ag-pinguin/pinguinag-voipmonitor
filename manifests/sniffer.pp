#Creates a sniffer
define voipmonitor::sniffer (
  $id_sensor,
  $interface,
  $managerport,
  $server_destination,
  $server_destination_port,
  $server_password,
  $enable                       = lookup('voipmonitor::sniffer::enable'),
  $utc                          = lookup('voipmonitor::utc'),
  $absolute_timeout             = lookup('voipmonitor::absolute_timeout'),
  $autocleanmingb               = lookup('voipmonitor::autocleanmingb'),
  $autocleanspool               = lookup('voipmonitor::autocleanspool'),
  $autocleanspoolminpercent     = lookup('voipmonitor::autocleanspoolminpercent'),
  $cdr_rtpport                  = lookup('voipmonitor::cdr_rtpport'),
  $cdr_sipport                  = lookup('voipmonitor::cdr_sipport'),
  $cdrproxy                     = lookup('voipmonitor::cdrproxy'),
  $destroy_call_at_bye          = lookup('voipmonitor::destroy_call_at_bye'),
  $dscp                         = lookup('voipmonitor::dscp'),
  $ensure                       = lookup('voipmonitor::sniffer::ensure'),
  $filter                       = lookup('voipmonitor::filter'),
  $max_buffer_mem               = lookup('voipmonitor::max_buffer_mem'),
  $maxpoolsize                  = lookup('voipmonitor::maxpoolsize'),
  $maxpoolsize_2                = lookup('voipmonitor::maxpoolsize_2'),
  $mos_g729                     = lookup('voipmonitor::mos_g729'),
  $mos_lqo                      = lookup('voipmonitor::mos_lqo'),
  $mos_lqo_bin                  = lookup('voipmonitor::mos_lqo_bin'),
  $mos_lqo_ref                  = lookup('voipmonitor::mos_lqo_ref'),
  $mos_lqo_ref16                = lookup('voipmonitor::mos_lqo_ref16'),
  $nocdr                        = lookup('voipmonitor::nocdr'),
  $ogg_quality                  = lookup('voipmonitor::ogg_quality'),
  $onewaytimeout                = lookup('voipmonitor::onewaytimeout'),
  $packetbuffer_compress        = lookup('voipmonitor::packetbuffer_compress'),
  $packetbuffer_compress_ratio  = lookup('voipmonitor::packetbuffer_compress_ratio'),
  $packetbuffer_enable          = lookup('voipmonitor::packetbuffer_enable'),
  $pcap_dump_asyncwrite         = lookup('voipmonitor::pcap_dump_asyncwrite'),
  $pcap_dump_bufflength         = lookup('voipmonitor::pcap_dump_bufflength'),
  $pcap_dump_writethreads       = lookup('voipmonitor::pcap_dump_writethreads'),
  $pcap_dump_writethreads_max   = lookup('voipmonitor::pcap_dump_writethreads_max'),
  $pcap_dump_zip                = lookup('voipmonitor::pcap_dump_zip'),
  $pcap_dump_zip_rtp            = lookup('voipmonitor::pcap_dump_zip_rtp'),
  $pcap_dump_ziplevel_sip       = lookup('voipmonitor::pcap_dump_ziplevel_sip'),
  $promisc                      = lookup('voipmonitor::promisc'),
  $ringbuffer                   = lookup('voipmonitor::ringbuffer'),
  $saveaudio_stereo             = lookup('voipmonitor::saveaudio_stereo'),
  $savegraph                    = lookup('voipmonitor::savegraph'),
  $savertcp                     = lookup('voipmonitor::savertcp'),
  $savertp                      = lookup('voipmonitor::savertp'),
  $savesip                      = lookup('voipmonitor::savesip'),
  $sip_options                  = lookup('voipmonitor::sip_options'),
  $sip_register                 = lookup('voipmonitor::sip_register'),
  $sip_register_active_nologbin = lookup('voipmonitor::sip_register_active_nologbin'),
  $sip_register_timeout         = lookup('voipmonitor::sip_register_timeout'),
  $sipport                      = lookup('voipmonitor::sipport'),
  $spooldir_prefix              = lookup('voipmonitor::spooldir_prefix'),
  $tar                          = lookup('voipmonitor::tar'),
  $tar_compress_graph           = lookup('voipmonitor::tar_compress_graph'),
  $tar_compress_rtp             = lookup('voipmonitor::tar_compress_rtp'),
  $tar_compress_sip             = lookup('voipmonitor::tar_compress_sip'),
  $tar_graph_level              = lookup('voipmonitor::tar_graph_level'),
  $tar_maxthreads               = lookup('voipmonitor::tar_maxthreads'),
  $tar_rtp_level                = lookup('voipmonitor::tar_rtp_level'),
  $tar_sip_level                = lookup('voipmonitor::tar_sip_level'),
) {
  $spooldir = "${spooldir_prefix}${id_sensor}"
  file { $spooldir:
    ensure => directory
  }
  class { 'voipmonitor::config':
    absolute_timeout             => $absolute_timeout,
    autocleanmingb               => $autocleanmingb,
    autocleanspool               => $autocleanspool,
    autocleanspoolminpercent     => $autocleanspoolminpercent,
    cdr_rtpport                  => $cdr_rtpport,
    cdr_sipport                  => $cdr_sipport,
    cdrproxy                     => $cdrproxy,
    config_filename              => "/etc/voipmonitor-${id_sensor}.conf",
    destroy_call_at_bye          => $destroy_call_at_bye,
    dscp                         => $dscp,
    filter                       => $filter,
    id_sensor                    => $id_sensor,
    interface                    => $interface,
    mangerport                   => $managerport,
    max_buffer_mem               => $max_buffer_mem,
    maxpoolsize                  => $maxpoolsize,
    maxpoolsize_2                => $maxpoolsize_2,
    mos_g729                     => $mos_g729,
    mos_lqo                      => $mos_lqo,
    mos_lqo_bin                  => $mos_lqo_bin,
    mos_lqo_ref                  => $mos_lqo_ref,
    mos_lqo_ref16                => $mos_lqo_ref16,
    nocdr                        => $nocdr,
    ogg_quality                  => $ogg_quality,
    onewaytimeout                => $onewaytimeout,
    packetbuffer_compress        => $packetbuffer_compress,
    packetbuffer_compress_ratio  => $packetbuffer_compress_ratio,
    packetbuffer_enable          => $packetbuffer_enable,
    pcap_dump_asyncwrite         => $pcap_dump_asyncwrite,
    pcap_dump_bufflength         => $pcap_dump_bufflength,
    pcap_dump_writethreads       => $pcap_dump_writethreads,
    pcap_dump_writethreads_max   => $pcap_dump_writethreads_max,
    pcap_dump_zip                => $pcap_dump_zip,
    pcap_dump_zip_rtp            => $pcap_dump_zip_rtp,
    pcap_dump_ziplevel_sip       => $pcap_dump_ziplevel_sip,
    promisc                      => $promisc,
    ringbuffer                   => $ringbuffer,
    saveaudio_stereo             => $saveaudio_stereo,
    savegraph                    => $savegraph,
    savertcp                     => $savertcp,
    savertp                      => $savertp,
    savesip                      => $savesip,
    server_destination           => $server_destination,
    server_destination_port      => $server_destination_port,
    server_password              => $server_password,
    sip_options                  => $sip_options,
    sip_register                 => $sip_register,
    sip_register_active_nologbin => $sip_register_active_nologbin,
    sip_register_timeout         => $sip_register_timeout,
    sipport                      => $sipport,
    spooldir                     => $spooldir,
    sqlcallend                   => $sqlcallend,
    sqldriver                    => $sqldriver,
    tar                          => $tar,
    tar_compress_graph           => $tar_compress_graph,
    tar_compress_rtp             => $tar_compress_rtp,
    tar_compress_sip             => $tar_compress_sip,
    tar_graph_level              => $tar_graph_level,
    tar_maxthreads               => $tar_maxthreads,
    tar_rtp_level                => $tar_rtp_level,
    tar_sip_level                => $tar_sip_level,
    utc                          => $utc,
  }
  voipmonitor::service { "voipmonitor-${id_sensor}":
    ensure => $ensure,
    enable => $enable
  }
}

# Installs voipmonitor server
class voipmonitor::config(
  String $config_filename,
  String $id_sensor,
  String $interface,
  String $server_password,
  String $absolute_timeout,
  String $autocleanmingb,
  String $autocleanspool,
  String $autocleanspoolminpercent,
  String $cdr_partition,
  String $cdr_rtpport,
  String $cdr_sipport,
  String $cdrproxy,
  String $destroy_call_at_bye,
  String $dscp,
  String $filter,
  String $managerport,
  String $max_buffer_mem,
  String $maxpoolsize,
  String $maxpoolsize_2,
  String $mos_g729,
  String $mos_lqo,
  String $mos_lqo_bin,
  String $mos_lqo_ref,
  String $mos_lqo_ref16,
  String $nocdr,
  String $ogg_quality,
  String $onewaytimeout,
  String $packetbuffer_compress,
  String $packetbuffer_compress_ratio,
  String $packetbuffer_enable,
  String $pcap_dump_asyncwrite,
  String $pcap_dump_bufflength,
  String $pcap_dump_writethreads,
  String $pcap_dump_writethreads_max,
  String $pcap_dump_zip,
  String $pcap_dump_zip_rtp,
  String $pcap_dump_ziplevel_sip,
  String $promisc,
  String $ringbuffer,
  String $saveaudio_stereo,
  String $savegraph,
  String $savertcp,
  String $savertp,
  String $savesip,
  String $sip_options,
  String $sip_register,
  String $sip_register_active_nologbin,
  String $sip_register_timeout,
  String $sipport,
  String $sipport,
  String $sipport,
  String $sipport,
  String $sipport,
  String $sipport,
  String $spooldir,
  String $sqlcallend,
  String $sqldriver,
  String $tar,
  String $tar_compress_graph,
  String $tar_compress_rtp,
  String $tar_compress_sip,
  String $tar_graph_level,
  String $tar_maxthreads,
  String $tar_rtp_level,
  String $tar_sip_level,
  Boolean $utc,
  Optional[String] $server_bind             = undef,
  Optional[String] $server_bind_port        = undef,
  Optional[String] $server_destination      = undef,
  Optional[String] $server_destination_port = undef,
  Optional[String] $mysqlcompress           = undef,
  Optional[String] $mysqldb                 = undef,
  Optional[String] $mysqlhost               = undef,
  Optional[String] $mysqlloadconfig         = undef,
  Optional[String] $mysqlpassword           = undef,
  Optional[String] $mysqlport               = undef,
  Optional[String] $mysqlusername           = undef,
){
  file { $config_filename:
    ensure  => present,
    content => template('voipmonitor/voipmonitor.conf.erb'),
    notify  => Service[$config_filename]
  }
}

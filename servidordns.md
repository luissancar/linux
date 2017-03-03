#  Configuración servidor DNS (bind9)

## named.conf.local    

~~~

zone "dam1.com" {
     	type master;
	file "/etc/bind/rd.dam1.com";
};

// Resolución inversa


zone "5.168.192.in-addr.arpa" {
	type master;
        file "/etc/bind/r1.192.168.5";
};
~~~

## named.conf.options  

~~~
options {
	directory "/var/cache/bind";

	// If there is a firewall between you and nameservers you want
	// to talk to, you may need to fix the firewall to allow multiple
	// ports to talk.  See http://www.kb.cert.org/vuls/id/800113

	// If your ISP provided one or more IP addresses for stable 
	// nameservers, you probably want to use them as forwarders.  
	// Uncomment the following block, and insert the addresses replacing 
	// the all-0's placeholder.

	 forwarders {
	       	8.8.8.8;
		80.58.61.250;
	 };

	//========================================================================
	// If BIND logs error messages about the root key being expired,
	// you will need to update your keys.  See https://www.isc.org/bind-keys
	//========================================================================
	dnssec-validation auto;

	auth-nxdomain no;    # conform to RFC1035
	listen-on-v6 { any; };
};
~~~


## rd.dam1.com  

~~~
$TTL 38400

@	IN	SOA	servidor01.dam1.com. correoadmin.dam1.com. (
			2014092901
			28800
			3600
			604800
			38400 )

@ IN NS servidor01.dam1.com.
servidor01.dam1.com. IN A 192.168.5.20
servidor02.dam1.com. IN A 192.168.5.21
pc01.dam1.com. IN A 192.168.5.30
pc02.dam1.com. IN A 192.168.5.31
www.dam1.com. IN CNAME servidor01.dam1.com. 
pc05.dam1.com.	IN	A	192.168.5.25

~~~

## ri.192.168.5
~~~
$TTL 38400

@ IN SOA servidor01.dam1.com. correoadmin.dam1.com. (
	2014092900;  //num serie
	28800; //refresco
	3600;  //reintentos
	604800; //caducidad
        38400); // tiempo en caché

@ IN NS servidor01.
20 IN PTR servidor01.
21 IN PTR servidor02.
30 IN PTR pc01.
31 IN PTR pc02.

~~~

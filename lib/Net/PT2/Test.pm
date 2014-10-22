package Net::PT2::Test;

use 5.006;
use strict;
use warnings FATAL => 'all';

=head1 NAME

Net::PT2::Test - The great new Net::PT!

=head1 VERSION

Version 0.01




=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Paul Taylor.

This program is released under the following license: BSD


=cut

our $VERSION = '1.0.2';

use 5.006;
use strict;
use warnings FATAL => 'all';

use Time::HiRes qw(gettimeofday);
use Math::Random::Secure qw(irand);
use JSON;
use MIME::Base64 qw(decode_base64 decode_base64url encode_base64url);
use Crypt::Mac::HMAC qw( hmac_b64u  );
use Carp;
use URI::Encode qw(uri_encode);
use Mozilla::CA;

use Data::Printer;

sub test {
    my ($class, $s) = @_;

    print "\n";
    print "Net::PT2::Test - test(${class}, ${s})\n";

    my $map = {
        class => $class,
        msg => $s
    };
    print "Net::PT2::Test - map = \n";
    p $map;


    my $json = encode_json $map;
    print "Net::PT2::Test - json = \n";
    p $json;

    my $b64 = encode_base64url $json;
    print "Net::PT2::Test - base64 url = \n";
    p $b64;

    my $key = "monkey";
    my $hmac = hmac_b64u('SHA256', $key, $b64);
    print "Net::PT2::Test - hmac = \n";
    p $hmac;

    my $json2 = decode_base64url $b64;
    print "Net:PT2::Test - json2 = \n";
    p $json2;
    
    my $map2 = decode_json $json2;
    print "Net:PT2::Test - map2 = \n";
    p $map2;

    print "\n";    


}

    
    

1;


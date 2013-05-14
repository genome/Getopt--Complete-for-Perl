use strict;
use warnings;

use Test::More tests => 1;

require Getopt::Complete;

my $options = Getopt::Complete::Options->new('foo' => ['a', 'b', 'c', undef]);

my $old_sig_warn = $SIG{__WARN__};
$SIG{__WARN__} = sub { die "found a warning" };

my $args = Getopt::Complete::Args->new(
    options => $options,
    argv => ['--foo=a'],
);

$SIG{__WARN__} = $old_sig_warn;

is( scalar($args->errors), 0, "No errors found as expected");

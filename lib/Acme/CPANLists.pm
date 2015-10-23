package Acme::CPANLists;

# DATE
# VERSION

1;
# ABSTRACT: CPAN lists

=head1 SYNOPSIS

Acme::CPANLists is yet another way to organize CPAN modules/authors into various
"lists".


=head1 SPECIFICATION VERSION

0.090


=head1 DESCRIPTION

With the multitude of modules that are available on CPAN, it is sometimes
difficult for a user to choose an appropriate module for a task or find other
modules related in some ways to a module. Various projects like L<CPAN
Ratings|http://cpanratings.perl.org/> (where users rate and review a
distribution) or L<MetaCPAN|https://metacpan.org/> (which has a C<++> feature
where logged-in users can press a button to C<++> a module and the website will
tally the number of C<++>'s a distribution has) help to some extent. There are
also various blog posts by Perl programmers which review modules, e.g. L<CPAN
Module Reviews by Neil Bowers|http://neilb.org/reviews/>.

For categorizing CPAN authors, there are also the L<Acme::CPANAuthors> project,
complete with L<its own website|http://acme.cpanauthors.org/>.

Acme::CPANLists is another way to help. One creates an
C<Acme::CPANLists::SOMENAME> module, and inside it puts lists of CPAN modules
and authors with their descriptions/reviews/ratings. The creator of the list is
free to organize her list in whatever way she likes.

A related website/online service for "CPAN lists" is coming (when I eventually
get to it :-), or perhaps when I get some help).


=head1 CREATING AN ACME::CPANLISTS MODULE

The first step is to decide on a name of the module. It must be under the
C<Acme::CPANLists::> namespace. Since, unlike in Acme::CPANAuthors, a module can
contain multiple lists, you can just use your CPAN ID for the module, even if
you want to create many lists, for example: L<Acme::CPANLists::PERLANCAR>.

Inside the module, the two main package variables you have to declare are:

 our @Author_Lists = ( ... );
 our @Module_Lists = ( ... );

Obviously enough, C<@Author_Lists> contains author lists while C<@Module_Lists>
contains module lists.

Each author/module list is just a hash structure (L<DefHash>). The basic
structure is this:

 # an example author list
 {
     #id => 'GUID', # optional, can be set to ease list identification/referral
     summary => 'My favorite modules',
     description => <<_,
(Some longer description, in Markdown format)

This is just a list of my favorite modules.
_
     entries => [
         {...},
         ...
     ],
 }

 # an example module list
 {
     #id => 'GUID', # optional, can be set to ease list identification/referral
     summary => 'My favorite authors',
     description => <<'_',
 (Some longer description, in Markdown format)

 This is just a list of my favorite authors.
 _
     entries => [
         {...},
         ...
     ],

Each entry is another, similar hash structure (L<DefHash>):

 # an example author list entry
 {
     author => 'RJBS',
     summary => 'Kick-ass projects',
     description => <<'_',
 He is my favorite author because he starts some kick-ass projects which I
 use daily, one of which is Dist::Zilla. It has saved me so much time, as
 well wasted countless, because by using Dist::Zilla I am motivated to
 release lots and lots of Perl modules.
 _
     # rating => 10, # optional, on a 1-10 scale
     # alternate_authors => ['SOMEONE', 'ANOTHER'], # optional, if you want to express alternate author(s)
 }

 # an example module list entry
 {
     module => 'Data::Dump',
     summary => 'Pretty output',
     description => <<'_',
 Data::Dump is my favorite dumping module because it outputs Perl code that
 is pretty and readable.
 _
     # rating => 10, # optional, on a 1-10 scale
     # alternate_modules => [...], # if you are reviewing an undesirable module and want to suggest better alternative(s)
     # related_modules => ['Data::Dump::Color', 'Data::Dumper'], # if you want to specify related modules that are not listed on the other entries of the same list
 }

That's it. After you have completed your lists, publish your Acme::CPANLists
module to CPAN.

If you are using L<Dist::Zilla> to release your distribution, this
L<Pod::Weaver> plugin might be useful for you:
L<Pod::Weaver::Plugin::Acme::CPANLists>. It will create an C<AUTHOR LISTS> and
C<MODULE LISTS> POD sections which are POD rendering of your author/module lists
so users reading your module's documentation can immediately read your lists.


=head1 USING ACME::CPANLISTS MODULES

As said earlier, a website/online service that collects and indexes all
Acme::CPANLists modules on CPAN is coming in the future. In the meantime, you
can install the L<acme-cpanlists> CLI script (from the L<App::AcmeCpanlists>
distribution).


=head1 SEE ALSO

C<Acme::CPANLists::*> modules

L<acme-cpanlists> from L<App::AcmeCpanlists>

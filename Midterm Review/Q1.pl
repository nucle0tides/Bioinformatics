# Midterm I questions have been written. 
#There are 3 main question sets totally 50 points. The exam allows open books, open notes and simple calculators. 
#However, please don't touch your laptop or any Perl capable devices during the exam. 
#Also, no discussion or exchange of information during the exam; that's cheating!

#Perl - Literals and Scalars Variables 

=pod
    Perl Literals 
    Numbers: 1, 2, 3, 4, 3.14159, 6.02214e23
    Strings: 'this is verbatim text that will not change'
             "this is an interpolated text\n"
        Numbers and strings are interchangeable and Perl converts them automatically when needed 
        Usage pattern determines the conversion directions 

    Number Literals    
    Numbers should not be put in quotes 
    Decimal, Octal, Hex

    String literals
    To interpolate is to insert something between two points 

    Not interpolated 
        'this is single quote string that will not be interpolated\n'

    Interpolated 
        "variables are replaced by their $values\n"
        "special \t backspas symbols are replaced, too \n"
        "very complex $array[$index]>{$tag} replacements work, too\n"

    Perl scalar variables 
        Scalar variables hold one value at a time 

        The value can be numbers, strings or references 

        my $variable = 123; 
        my $string = "boo"; 
        my $sum $i + $j;   

    Perl variable declaration and lexical scope 

    Use the my operator to declare a lexical variable with an /optional/ initialization value. 
    Multiple variables can all be declared at once using the list syntax 
        my ($index, $bound, $step) = (0, 100, 5); 

    Variables exist within the scope of declaration 
    Nested dec of variable names is possible, but not good 

    Mathematical operators on numbers 
    Algebraic: +, -, /, %, **, ++, --, +=, *=
    Comparison: <, <=, ==, !=, >, >=, <=>
    Transcendental functions: sqrt, sin, cos, atan2, exp, log
    Interger part and rounding int, sprintf "%.0f"
    ASCII and char conversions: ord, chr 
    Formatted output: printf "%5.2f", $float 

    String operators 
    Concatenation $long = $short.$medium, .=
    Multiplication $long = $short x $times, x=
    Comparison: lt (less than), le (less than or equal to), eq (equal), ne (not equal), gt (greater than), ge (greater than or equal to), cmp (comparison)
    Substring: $sub = substr($long, $start, $len), substr($long, $start, $len) = $replacement 
    Locate substring  $loc = index($long, $subs, $pos); 
    Bind operators (for patters and tr later): =~, !~
=cut 

# my $s = "100.0";
# my $i = 100;
# print "$s and $i are ", ($s == $i ? "the same" : "not
# the same"), " numbers\n";
#  #they are the same numbers 
# print "$s and $i are ", ($s eq $i ? "the same" : "not
# the same"), " strings\n";
#  #they are not the same strings 
# my $j = 99;
# print "$i is ", ($i > $j ? "greater" : "not
# greater"), " than $j as numbers\n";
#  #100 is greater than 99 as numbers 
# print "$i is ", ($i gt $j ? "greater" : "not
# greater"), " than $j as strings\n";
#  #100 is not greater than 99 as strings

=pod 
    Perl automatically converts numbers to string depending on useage 
    Avoid unnecessary conversions 
    Avoid equality comparisons of floating point numbers and numbers with strings
=cut

=pod   
    Perl lists and arrays 
    
    Lists 
        Lists are collections of items separated by commas and enclosed ny parenthesis 
        Each item of the list can be literals, variables or references to other lists (2D arrays) 
        Lists are associated with arrays and funtions. 
            Arrays store lists and Perl functions take an argument list as input and can return a list 

    Arrays 
        Arrays are used to store list values 
        Arrays can be initialized by a list of values 
            my @array = (1,2, 3, "this", "that"); 
        Can also initialize a list of scalar variables too 
            my ($head, $c, $n) = ("", 0, 0); 
        As seen, array values do not need to be all of the same type. 
    
    Array manipulations 
        An array can be assigned to another array 
            my @copy = @array; 

        Two arrays can be concatedated using list form 
            my @larger = (@array1, @array2); 

        Arrays can also be appended to another array 
            push @larger, @array1, @array2 

    Access array elements 
        Each array elem is iden by same name of array and index value 
            $array1[1] = $array[$i]; 
        An array elem will behave just like a $scalar variable despite a more complex syntax 

        The indices can be oter array elemns, too 
            $array[$index] = $array2[$mapping[$value]]; 

    More manipulations 
        Append a value or more to an array at the end 
            push @array, $value1, $value2, "third"
        Remove a variable form the end of an array 
            pop @array; 
        Similar operations at the front of the array 
            unshift @array, "front"; my $first = shift @array

    Perl REVERSE 
        The reverse function has dual behaviors 
        When applied in a scalar context, it reverses strings 
            my $rs = reverse @array; 
        When applied in a list context, it reverses elemnts 
            my @array = reverse @array; 

        Left-hand-side= of reverse function determines the context
=cut 

# my @array = ( 123, 456, 789 );
# my $rs = reverse @array;
# my @rsarray = reverse @array;

# print "$rs\n";
# #987654321
# print "@rsarray\n";
# #789 456 123

# #SHIFT EXAMPLE
# my @names = ('Foo', 'Bar', 'Moo');
# my $first = shift @names;
# print "$first\n";     # Foo
# print "@names\n";     # Bar Moo

# #UNSHIFT EXAMPLE
# my @names = ('Foo', 'Bar');
# unshift @names, 'Moo';
# print "@names\n";     # Moo Foo Bar 
 
# my @others = ('Darth', 'Vader');
# unshift @names, @others;
# print "@names\n";     # Darth Vader Moo Foo Bar

=pod 
    Array Length 
        to determine length of array use @array syntax in scalar context 
            my $array_len = @array; 
            print "large array!\n" if @array>100; 
            print "small array!\n" if @array<100; 
        special variable $#array provides last index 
            print "Last item of array is $array[$#array]\n"
        length function does not report array length

    Array slices 
        An array slice extracts a subarray
            my @words = ("the", "movie", "is", "not", "bad"); 
            my @correction = @words[0..2, 4]; 
                #the movie is bad
            Slices are also arrays so they use @symbol.   

    Array search 
        for (@larger) 
        { 
            print "found $_\n" if $_ == 78;
        }

        for (my $i=0; $i<@larger; i++)
        { 
            if(@larger[$i] == 78) 
            { 
                print "found 78 at $i\n"; 
                last; 
            }
        }

        my $count = 0; 
        for (@larger)
        { 
            $count ++ if $_ == 78
        }
        print "The number 78 was found $count times\n"; 

        the last commant breaks the loop 

    Sorting arrays 
        The sort function sorts arrays in various orders 
            my @new_array sort {conditions} @array; 
        Sort function just returns a new array
            #returns sorted values in alphabetical order
            sort { if ($a le $b) { -1 }
                elsif ($a eq $b) { 0 }
                else { 1} } @words;
            sort { $a cmp $b } @words;
            sort @words;

            #returns sorted values in numberical order
            sort { $a <=> $b } @larger;

    Array Mapping 
        the map function converts valuies of an array according to given calculation 
        Each value is represented by $_ inside map 
        returns another array with converted values 
            my @larger_values = map { $_ > 1e5 ? $_ : () } @values;
            print "@larger_values\n";
            my @log_values = map { log } @positive_numbers;
            print "@log_values\n";

    String split and Join 
        Split splits a string into fields and returns a list 
            while(<>) { 
                my @fields = split/\t/, $_; 
            }
        Join works in reverse; it composes a new string from an array with given sep symbol 
            my $line = join "\t", @fields; 

    Subroutine arguments 
        sub sum_up 
        { 
            my $total = 0; 
            for (@a_) 
            { 
                $total += $_; 
                $_ = total;         
            }
            return total; 
        }
        Perl subroutines take a special @_ argument array
        n Note that the @_ array differs from the $_ symbol
        n Note also that @_ and $_ are the actual arguments! Modifying
        them also modifies the original arguments

        sub sum_up {
        my @values = @_;
        my $total = 0;
        for (@values) {
         $total += $_;
         $_ = $total; # it's moot to do this here
        }
        return $total;
        }

    Anonymous Arrays 
        Anonymous arrays are created with brackets 
            [1, 2, 3, "name", "whatever"]; 
        They have no name, thus a reference to it must be saved or else it'll be recycled. 
            my $array_ptr = [ 1, 2, 3, "name", "515-123-4567" ];
        Note that a reference is a scalar, and anonymous array elements can be accessed through it
            print "Phone number is $array_ptr->[4]\n"
=cut

# my $total = 0;
# sub sum_up {
#     for (@_) {
#         $total += $_;
#         $_ = $total;
#     }
#     return $total;
# }

# my @array = ( 1, 2, 3, 4, 5, 6, 7, 8, ,9, 10);

# print "Before sum_up: @array\n";
# #Before sum_up: 1 2 3 4 5 6 7 8 9 10
# my $sum = sum_up(@array);
# print "After sum_up: @array\n";
# #After sum_up: 1 3 6 10 15 21 28 36 45 55
# print "sum is $sum\n";
# #sum is 55

=pod 
    Associative Memory 
        A Perl has is declared using the percentage symbol % 
            my %hash = (M => "Monday", T => "Tuesday", W => "Wednesday"); 
        The => notation is almost equiv to the comma in perl 
            my %hash = ("M", "Monday", "T", "Tuesday", "W", "Wednesday"); 
        Using => is apparently more readable 
    
    Accessing Perl has elements 
        Perl hash elements can be accessed using curly braces 
            print $hash{$day}, \n; 
        More perl hash elements can be added by assigning new values associated with new keys
            $hash["Th"] = "Thursday"; 
            $hash["F"] = "Friday"; 
            %has{"S"} = "Saturday" 
                NOTE: keys must be unique, Thursday and Tuesday cannot share the same key. 
    MORE 
        Keys in a hash must be unique, but values are unrestricted 
        Keys in different hashes are unrelated and do not need to be unique, unless you need to merge them together
        Keys are always strings
            Numbers will be converted to strings to be used as keys 

    Hashes and arrays are similar, but there is no push, pop, unshift or shift on hashes.
    Hashes are different to arrays. 
        Array elements are consecutive and can only be indexed by ints, like a hash where keys are always 0, N 
        Hash elements can be indexed by any strings 
        Even if some array elements are undefined, their memory have been preallocated in anticipation of eventual storage 
        However, hashes strickly maintains only the key, value pairs added and noes not automatically fill in missing elemnts. 
        
        $array[1000000] = "big"; # a one million plus one array, BIG!
        $hash{1000000} = "small"; # a single element hash, small

    Undefined or nonexistent elements in a hash 
        hash associates a key to a value, can't just use defined function to check whether value is defined or not 
            key could be defined but value is undefined 
            key is undefined (does not exist)
        To differentiate 
            print "$key is defined\n" if exists $hash{$key};
            print "$key value is $hash{$key}\n" if defined $hash{$key};

    Delete hash elements 
        Sometimes you need to remove a key,value pair from hash 
        the delete function will deletea n entry in a hash 
        deleted value is returned 

        %hash = (); 
        $has{there} = "is fun!"; 
        my $value1 = delete %hash{there}; 
        my $value2 = delete %hash{not there}; 
        #$value1 is "is fun", but $value2 is undefined 

    Traversing hash elements 
        The each function loops throug key, value pairs one at a time 
        the keys function returs a list of all keys in a hash all at once 
        the values function returns a list of all values in a hash all at once. 
            while (my ($key, $value) = each %hash) {
             print "$key => $value\n";
            }
            for my $key (keys %hash) {
             print "$key => $hash{$key}\n";
            }
            for my $value (values %hash) {
             print "$value\n";
            }
    Hash slice 
        Hash slice is similar to array slice, but just returns the value list, not complete sub-hash 
            my @hash_slice = @hash{"M", "Th", "S"}; 
        However to obtain a sub-hash just use the same hash slice twice 
            my %sub_hash;  @sub_hash{@keys} = @hash{@keys};
        Two hashes can be merged using the slice of all key-value pairs
            @hash{keys %smaller} = values %smaller; # key-value paired
=cut    

# Set 1 questions ask you what will be printed with various Perl print statements. 
#You need to understand string interpolations, automatic string to number conversions, 
#and the two different contexts of the reverse function.


#String interpolations
#String to number conversions
#Reverse function

my $value = 100; 
print "I have $value cookies\n"; 
#I have 100 cookies

print 'I have $value cookies'; 
print "\n"; 
#I have $value cookies

my $value2 = "100"; 
print "$value + $value2 \n"; 
#100 + 100 

print $value + $value2, "\n";  
#200

print $value + "$value2", "\n"; 
#200

print "$value2" + $value, "\n"; 
#200 

my @test_array = ("poop", "de", "doop"); 
my $rs_array = reverse @test_array; 
my @rs_test_array = reverse @test_array; 
print "$rs_array\n"; 
#poodedpoop
print "@rs_test_array\n"; 
#doop de poop

=pod 
    PERL SORTING 
    lexicographic sort 
        @s = sort @a; 
    ascending numeric sort 
        @s = sort {$a <=> $b} @a; 
    descending lexicographic sort
        @s = sort {$b cmp $a} @a; 
    descending numeric sort 
        @s = sort {$b <=> $a} @a; 
    case-insensitive sort 
        @s = sort {lc $a <=> lc $b} @a; 
    element-length sort
        @s = sort {length $a <=> length $b} @a; 
=cut
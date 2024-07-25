# OnlyProgressBar

`OnlyProgressBar` is a Julia package for displaying a simple progress bar 
in the terminal. It helps track the progress of running tasks with a visual 
indicator. Basically, this prints a line with progress bar without `\n` 
at the end, after flushing the previously printed line.

**IMPORTANT NOTE:** Even though the manipulating IO-tasks are not costly 
these days, however, they still can make your code run slower than with 
them. So if you do not need to use this program, then please avoid using 
this program.

## Installation

You can install the `OnlyProgressBar` package from the Julia REPL using 
the following command:

```julia
using Pkg
Pkg.add(url="https://github.com/ukvaishnav/OnlyProgressBar")
```

## Usage

### Function `progress_bar`

Displays a progress bar in the terminal.

#### Arguments

- `iteration::Int`: The current iteration (should be between 1 and `total`).
- `total::Int`: The total number of iterations.
- `desc::String`: An optional description string to be displayed before 
                the progress bar. Defaults to `"Processing ... "`.

#### Example

```julia
using OnlyProgressBar

for i in 1:100
    progress_bar(i, 100, desc="Loading")
    sleep(0.1)  # Simulate a task
end

Processing ... |████████████████████                             | 40%
```

### Function `get_width`

Returns the width of the terminal for displaying the progress bar. The 
width is set to a percentage of the terminal's total width.

#### Arguments

- `p::Float64`: The percentage of the terminal width to use for the 
                progress bar. Defaults to 90.0.

#### Example

```julia
using OnlyProgressBar

width = get_width()  # Defaults to 90% of the terminal width
println("The terminal width for progress bar is: $width")

width_80 = get_width(80.0)  # 80% of the terminal width
println("The terminal width for progress bar at 80% is: $width_80")
```

This will run the tests and output the results, verifying that 
the `OnlyProgressBar` package behaves as expected.

## License

`OnlyProgressBar` is licensed under the MIT License. See the 
[LICENSE](LICENSE) file for more details.

## Contributions

Contributions are welcome! Please fork the repository and submit 
a pull request with your changes. Make sure to include tests for 
new features or bug fixes.


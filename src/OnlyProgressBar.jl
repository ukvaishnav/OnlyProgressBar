module OnlyProgressBar

export progress_bar

"""
    progress_bar(iteration::Int, total::Int; desc::String="Processing ... ")

Displays a progress bar in the terminal.

# Arguments
- `iteration::Int`: The current iteration (should be between 1 and `total`).
- `total::Int`: The total number of iterations.
- `desc::String`: An optional description string to be displayed before the progress bar. Defaults to `"Processing ... "`.

# Example
```julia
for i in 1:100
    progress_bar(i, 100, desc="Loading")
    sleep(0.1)
end
```
"""
function progress_bar(iteration::Int, total::Int, desc::String="Processing ... ")

    bar_length = get_width()
    percent = iteration / total
    progress = round(Int, percent * (bar_length - length(desc)))
    remaining = bar_length - progress - length(desc)

    # This ensures positivity of progress and remaining
    # possibly not required
    progress = max(progress, 0)
    remaining = max(remaining, 0)
    
    bar = "|" * "█" ^ progress * " " ^ remaining * "|"
    print("\r", desc, bar, " ", round(Int, percent * 100), "%")
    flush(stdout)

    if iteration==total
        println("")
    end 

end;

"""
    get_width(p::Float64=90.0) -> Int

Returns the width of the terminal for displaying the progress bar.
The width is set to a percentage of the terminal's total width.

# Arguments
- `p::Float64`: The percentage of the terminal width to use for the progress bar. Defaults to 90.0.

# Returns
- `Int`: The adjusted width of the terminal based on the specified percentage.

# Example
```julia
width = get_width()  # Defaults to 90% of the terminal width
println("The terminal width for progress bar is: ", width)

width_80 = get_width(80.0)  # 80% of the terminal width
println("The terminal width for progress bar at 80% is:, " width_80)
```
"""
function get_width(p::Float64=90.0)
    _, w = Base.displaysize(stdout)
    return Int(round(p*w/100.0))
end;

end # module OnlyProgressBar

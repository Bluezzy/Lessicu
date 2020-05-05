def current_year?(date, current_time = Time.now)
    date.year == current_time.year
end

def current_month?(date, current_time = Time.now)
    current_year?(date, current_time) && date.month == current_time.month
end

def current_day?(date, current_time = Time.now)
    current_month?(date, current_time) && date.day == current_time.day
end

def previous_day?(date, current_time = Time.now)
    current_month?(date, current_time) || last_day_of_month?(date) && 
    (date + 1.day).day == current_time.day    
end

def last_day_of_month?(date)
    next_day = date + 24.hours
    date.month != next_day.month
end

def format_date(date, current_time = Time.now, initialString = 'le ', separator = ' ')
    jour = format_day(date.day)
    mois = format_month(date.month)
    annee = format_year(date.year)

    # exception cases for recent dates
    if current_day?(date, current_time)
        return "aujourd'hui"
    elsif previous_day?(date, current_time)
        return "hier"
    # not showing the year if same year
    elsif current_year?(date, current_time)
        return initialString + [jour, mois].join(separator) 
    end   
    
    # regular cases
    return initialString + [jour, mois, annee].join(separator)
end

def format_day(day)
    day.to_s
end

def format_month(month)
    case month
    when 1 then return 'janvier'
    when 2 then return 'février'
    when 3 then return 'mars'
    when 4 then return 'avril'
    when 5 then return 'mai'
    when 6 then return 'juin'
    when 7 then return 'juillet'
    when 8 then return 'août'
    when 9 then return 'septembre'
    when 10 then return 'octobre'
    when 11 then return 'novembre'
    when 12 then return 'décembre'
    end
end

def format_year(year)
    year.to_s
end


def test_time_1
    time = Time.now - 3.days
    date = time - 1.days
    puts previous_day?(date, time) && last_day_of_month?(date)
    puts format_date(date, time)
end

def test_time_2
    date = Time.now + 10.hours
    puts format_date(date)
end

def test_time_3
    date = Time.now - 24.hours
    puts previous_day?(date) && !last_day_of_month?(date) && date.month == Time.now.month
    puts format_date(date)
end

def test_time_4
    date = Time.now - 22.days
    date2 = Time.now - 33.days
    date3 = Time.now - 1.years
    puts format_date(date)
    puts format_date(date2)
    puts format_date(date3)
    puts current_day?(date3)
    puts current_month?(date3)
end

puts "\n"
test_time_1
puts "\n"
test_time_2
puts "\n"
test_time_3
puts "\n"
test_time_4

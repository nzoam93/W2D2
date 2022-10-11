require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries) #salaries is hash. key = title, value = salary. salaries[title] = salary
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title_name)
        @salaries.keys.include?(title_name) #woohoo
    end

    def >(anotherStartup)
        return self.funding > anotherStartup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        return @employees.length
    end

    def pay_employee(employee_instance)
        employee_title = employee_instance.title
        employee_salary = @salaries[employee_title]
        if @funding > employee_salary
            employee_instance.pay(employee_salary)
            @funding -= employee_salary
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    #part 3
    def average_salary
        sum = 0
        @employees.each do |employee_instance|
            employee_title = employee_instance.title
            employee_salary = @salaries[employee_title]
            sum += employee_salary
        end
        return sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(anotherStartup)
        @funding += anotherStartup.funding
        @salaries = anotherStartup.salaries.merge(@salaries) #to merge WITHOUT overwriting, simply merge the other way around!
        # This would overwrite... @salaries = @salaries.merge(anotherStartup.salaries)
        @employees += anotherStartup.employees # "+=" to avoid adding in another array. It just adds it to the exisiting array
        anotherStartup.close
    end



end

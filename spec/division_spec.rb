require('spec_helper')

 describe(Division) do
   it('tells which employees belong to this division') do
     division = Division.create({:name => "division"})
     employee1 = Employee.create({:name => "Bob", :division_id => division.id})
     employee2 = Employee.create({:name => "Jamie", :division_id => division.id})
     expect(division.employees()).to(eq([employee1, employee2]))
   end
 end

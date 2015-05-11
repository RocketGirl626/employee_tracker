require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/employee')
require('./lib/division')
require('pg')
require('pry')


get('/') do
  erb(:index)
end

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

post('/divisions') do
  name = params.fetch("name")
  divisions = Division.new({:name => name})
  divisions.save()
  @divisions = Division.all()
  erb(:divisions)
end

post('/employees') do
  name = params.fetch('name')
  employees = Employee.new({:name => name})
  employees.save()
  @employees = Employee.all()
  erb(:employees)
end

get('/divisions/:id') do
  @division = Division.find(params.fetch("id").to_i())
binding.pry
  erb(:division)
end

patch('/divisions/:id') do
  name = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => name})
  @divisions = Division.all()
  erb(:divisions)
end

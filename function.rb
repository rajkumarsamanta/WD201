def salute(name,quote)
  nameWords=name.split(" ")
  quote + " Mr. " + nameWords.last
end 

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")

#Learn recursive function in ruby
#A ruby program that renders an html document to the console
node1 ={
  :tag =>"h1",
  :text=> "This is a large heading"
}
node2 = {
  :tag => "div",
  :children => [
    {
      :tag => "h2",
      :text => "This is a smaller paragraph"
    },
    {
      :tag => "p",
      :text => "Ruby was made to make programeers happy"
    }
  ]
}

html ={
  :tag  => "div",
  :children => [node1,node2]
}

def render(node)
  if node[:tag] == "h1"
    puts "**** #{node[:text].upcase} ****"
  elsif node[:tag]=="h2"
    puts "** #{node[:text]} **"
  elsif node[:tag] == "p"
    puts "* #{node[:text]} *"
  elsif node[:tag]=="div"
    children = node[:children]
    children.each {|child| render(child) }
  end
end

render(html)
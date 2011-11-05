class Tree
  
  attr_accessor :children, :node_name
  
  def initialize(name, children=[]) 
    @node_name = name
    @children = children
  end
  
  def visit_all(&block)
    visit &block
    children.each do |c| 
      puts "Traversing from #{@node_name} to #{c.node_name}..."
      c.visit_all &block
    end
  end

  def visit(&block) 
    block.call self 
  end 
  
  
  #New Initializer I added
  def initialize (tree)
    @node_name = ""
    @children = [] 
    if tree.size == 1 then
      @node_name = tree.keys.first
      tree[@node_name].each do |key, value|
        @children.push(Tree.new(key => value))
      end
    else
      tree.each do |key, value|
        @children.push(Tree.new(value))
      end
    end
  end  
end

#Creating a family tree
family_tree = Tree.new({'gf' => {'u1' => {'c1' => {}},'u2' => {},'f' => {'me' => {'son' => {}}},'u3' => {'c2' => {}}}})

#Visiting the entire Tree
puts "Visiting entire tree"
family_tree.visit_all {|node| puts node.node_name }
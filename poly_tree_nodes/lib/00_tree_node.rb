class PolyTreeNode
  attr_reader :children, :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  # def value
  # end

  def parent=(parent_node = nil)
    if @parent
      @parent.children.delete_if { |child| child == self }
    end
    @parent = parent_node

    parent_node.children << self unless parent_node.nil? || child_exists?(self)
  end

  def add_child(child_node)
    @children.each { |child| child.parent=(self) } unless child_exists?(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    if child_exists?(child_node)
      child_node.parent=(nil)
    else
      raise "child does not exist beep boop"
    end
  end

  def child_exists?(child)
    @children.include?(child)
  end

  def dfs(target_value)
    #is current node target value?
    return self if @value == target_value
    #loop through children
    @children.each do |child|
      #call DFS recursively on children
      recursive_result = child.dfs(target_value)
      return recursive_result unless recursive_result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      current = queue.shift
      return current if current.value == target_value
      queue += current.children
    end
    nil
  end
end

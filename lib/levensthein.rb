class Levensthein
  def self.distance_between(one_string, another_string)
    s = (" " + one_string).split("")
    t = (" " + another_string).split("")

    n = s.length
    m = t.length
    
    dp = n.times.map { Array.new(m) }
    for i in 0...n
      dp[i][0] = i
    end

    for j in 0...m
      dp[0][j] = j
    end
    
    for i in 1...n
      for j in 1...m
        dp[i][j] = [dp[i-1][j] + 1, dp[i][j-1] + 1, dp[i-1][j-1] + (s[i] == t[j] ? 0 : 1)].min
      end
    end
    
    # for i in 0...n
    #   for j in 0...m
    #     print "#{dp[i][j]} "
    #   end
    #   puts
    # end
    #     
    # puts "Distance between '#{one_string}' and '#{another_string}' = #{dp[n-1][m-1]}"
    dp[n-1][m-1]
  end
end

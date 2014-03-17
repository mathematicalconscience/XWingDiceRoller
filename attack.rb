#!/usr/bin/env ruby

# ===============================================================================================================
# Helpers
# ===============================================================================================================

class AssertionError < RuntimeError
end

def assert
  raise AssertionError unless yield
end


def time
  start = Time.now
  yield
  executionTime = Time.now - start
  return executionTime
end

# ===============================================================================================================
# Probability Functions
# ===============================================================================================================

class Fixnum
  @@factorialLookUp = []
  
  def self.computeFactorials
    for f in 0..20 do
      result = 1
      for i in 1..f do
        result = result * i
      end
      @@factorialLookUp[f] = result
    end
  end
  
  def factorial
    result = @@factorialLookUp[self]
  end
end



def permutationsOfAttacksDiceResult(evades, foci, blanks)
  # The defence dice have: 3 x evade, 2 x focus, 3 x blank

  # Standard formula for a k-Combination with repretitions is n!/(m1! * m2! ... )
  n = evades + foci + blanks
  
  # last terms corrects for the probability of the dice sides by counting all the possibiities of permutating the side results
  return n.factorial.to_f / 
        ( evades.factorial * foci.factorial * blanks.factorial) *
        3 ** evades *  2 ** foci *  3 ** blanks
end


def permutationsOfAttacksDiceResult(hits, crits, foci, blanks)
  # The attack dice have: 1 x crit, 3 x hit, 2 x focus, 2 x blank

  # Standard formula for a k-Combination with repretitions is n!/(m1! * m2! ... )
  n = hits + crits + foci + blanks
  
  # 3 ** hits *  2 ** foci *  2 ** blanks corrects for the probability of the dice sides by counting all the possibiities of permutating the side results
  return n.factorial.to_f / 
        ( hits.factorial * crits.factorial * foci.factorial * blanks.factorial) *
        3 ** hits *  2 ** foci *  2 ** blanks
end


def testProbabilityFunctions
  assert {0.factorial == 1}
  assert {1.factorial == 1}
  assert {3.factorial == 6}
  assert {6.factorial == 720}
  
  assert { permutationsOfAttacksDiceResult(1,0,0,0) == 3}
  assert { permutationsOfAttacksDiceResult(0,1,0,0) == 1}
  assert { permutationsOfAttacksDiceResult(0,0,1,0) == 2}
  assert { permutationsOfAttacksDiceResult(0,0,0,1) == 2}
  assert { permutationsOfAttacksDiceResult(1,1,0,0) == 6}
  assert { permutationsOfAttacksDiceResult(0,0,2,2) == 96}
end



# ===============================================================================================================
# Simulator
# ===============================================================================================================

# 
# def attack(attackerStrength = 0, defenderStrength = 0, defenderShields = 0, distance = 2, attackerTokens = [], defenderTokens = [])
#     
#     
#     # returns expected damage
#     effectiveAttackerStrength = attackerStrength + (distance == 1 ? 1 : 0)
#     effectiveDefenderStrength = defenderStrength + (distance == 3 ? 1 : 0)
#     
#     for attackerDamage in 0..effectiveAttackerStrength
#       for attackerCrits in 0..(effectiveAttackerStrength-attackerDamage)
#         blanks = effectiveAttackerStrength - attackerDamage - attackerCrits
#         probabilityOfThisRoll =  permutationsOfDiceResult()
#         effectiveDamageOfThisRoll = 0
#         
#       end
#     end
#     
#     
# end



# ---- Main Script ----------------------------------------------------------------------------------------------

execTime = time do
  Fixnum.computeFactorials
  testProbabilityFunctions
end

puts "Script execution time: #{execTime} seconds\n"






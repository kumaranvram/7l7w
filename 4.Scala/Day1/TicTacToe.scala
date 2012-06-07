class Cell {
	var valueInCell = ""
	var hasValue = false;
	
	def == (target:Cell):Boolean = {
		return this.valueInCell == target.valueInCell
	}
	
	def getValueInCell() : String = this.valueInCell;
	
	def isOccupied() = this.hasValue;
	
	def setValue(valueToSet:String) = {
		if(!this.hasValue) {
 			if (valueToSet == "X" || valueToSet == "O") {
				this.valueInCell = valueToSet;
				this.hasValue = true;
			}
			else {
				throw new Exception ("Invalid value put into cell")
			}
		}
		else {
			throw new Exception("Cell already occupied");
		}
	}
	
	override def toString() : String = {
		if(hasValue)
			return valueInCell;
		return "*";
	}
}

class Board {
	var cells = List[List[Cell]];
	
	for(i <- 0 until 9) {
		cells.add(new Cell());
	}
	
	val winningFormations = new List (
								new List(0, 1, 2),
								new List(3, 4, 5),
								new List(6, 7, 8),
								new List(0, 3, 6),
								new List(1, 4, 7),
								new List(2, 5, 8),
								new List(0, 4, 8),
								new List(2, 4, 6)
							);
							
	def doesThisPathHasWinner(path:List[Int]) : Boolean = {
	return true;	
	}
}

class Game {
}
import std.stdio;
import std.algorithm;
import core.thread;

void main(string[] args) {
	int[][] diamondback = [
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0],
		[0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0],
		[0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,1,0,1,1,1,1,0,0,0,0],
		[0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0],
		[0,0,1,0,1,0,0,0,1,1,0,0,0,0,0,0],
		[0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	];
	
	int[][] Koks_galaxy = [
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,1,0,0,1,0,1,0,0,0,0],
		[0,0,0,1,1,0,1,0,1,1,1,0,0,0,0],
		[0,0,0,0,1,0,0,0,0,0,0,1,0,0,0],
		[0,0,0,1,1,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,1,0,0,0,0,0,1,1,0,0,0],
		[0,0,0,1,0,0,0,0,0,0,1,0,0,0,0],
		[0,0,0,0,1,1,1,0,1,0,1,1,0,0,0],
		[0,0,0,0,1,0,1,0,0,1,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	];
	
	int[][] Gosper_glider_gun = [
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
		[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
	];
	
	auto simulator = new CellularAutomaton(convert_cell!(LifeGameCell)(Gosper_glider_gun));
	
	while (1) {
		simulator.getString().write();
		simulator.nextGen();
		Thread.sleep(dur!"msecs"(100));
		// erase the grids
		write("\x1b[", simulator.size_x, "F", "\x1b[J");
	}
}


class Cell {
	protected int state;
	
	this(int state) {
	    this.state = state;
	}
	
	int nextState(Cell n, Cell ne, Cell e, Cell se, Cell s, Cell sw, Cell w, Cell nw) { return 0; }
	
	void setState(int state) { this.state = state; }
	
	string getString() { import std.conv: to; return state.to!string; }
}

// create a cell grid from state grid
Cell[][] convert_cell(T)(int[][] state_grid)
	if (is(T : Cell))
{
	Cell[][] grid;
	foreach (state_row; state_grid) {
		Cell[] row;
		scope(exit) grid ~= row;
		foreach (state; state_row) row ~= new T(state);
	}
	return grid;
}

class LifeGameCell : Cell {
	static auto ALIVE = 1, DEAD = 0;
	
	this(int state) {
		super(state);
	}
	
	override int nextState(Cell n, Cell ne, Cell e, Cell se, Cell s, Cell sw, Cell w, Cell nw) {
		// the number of neighbor cells alive
		auto density = count([n, ne, e, se, s, sw, w, nw].map!(c => c.state), LifeGameCell.ALIVE);
		
		// if it is alive and exactly 2 or 3 neighbor cells are alive, then it survives in the next generation
		// if it is dead and exactly 2 neibor cells are alive, then it becomes alive in the next generation
		// otherwise it dies.
		if ((density*2 + state).among!(2*2+1, 3*2+1, 3*2+0))
			return LifeGameCell.ALIVE;
		else
			return LifeGameCell.DEAD;
	}
	
	override string getString() {
		return state == LifeGameCell.ALIVE ? "O" : ".";
	}
}

class CellularAutomaton {
	size_t size_x, size_y;
	Cell[][] grid;
	
	this(Cell[][] grid) {
		this.grid = grid;
		this.size_x = grid.length;
		if (size_x > 0) this.size_y = grid[0].length;
		else this.size_y = 0;
	}
	
	void nextGen() {
	
		// calculate the next states of all cells
		int[][] state_list;
		
		foreach (x, row; grid) {
			int[] state_row;
			scope(exit) state_list ~= state_row;
			
			foreach (y, cell; row) {
				// set neighbor cells
				auto xp1 = x+1, xm1 = x-1, yp1 = y+1, ym1 = y-1;
				if (xp1 >= size_x) xp1 = 0;
				if (x == 0) xm1 = size_x-1;
				if (yp1 >= size_y) yp1 = 0;
				if (y == 0) ym1 = size_y-1;
				auto n  = grid[xm1][y];
				auto ne = grid[xm1][yp1];
				auto e  = grid[x][yp1];
				auto se = grid[xp1][yp1];
				auto s  = grid[xp1][y];
				auto sw = grid[xp1][ym1];
				auto w  = grid[x][ym1];
				auto nw = grid[xm1][ym1];
				
				state_row ~= cell.nextState(n, ne, e, se, s, sw, w, nw);
			}
		}
		
		// set states
		foreach (x, row; grid) foreach (y, cell; row) 
			grid[x][y].setState(state_list[x][y]);
	}
	
	// convert to a visualizable string
	string getString() {
		string result;
		foreach (row; grid) {
			foreach (cell; row)
				result ~= cell.getString();
			result ~= "\n";
		}
		return result;
	}
}


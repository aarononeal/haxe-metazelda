package metazelda;

/**
 * Represents a single key or lock within the lock-and-key puzzle.
 * <p>
 * Each Symbol has a 'value'. Two Symbols are equivalent iff they have the same
 * 'value'.
 */
class Symbol
{
	/**
	 * Symbol map with special meanings.
	 * <p>
	 * Certain items (such as START, GOAL, BOSS) serve no purpose in the puzzle
	 * other than as markers for the client of the library to place special game
	 * objects.
	 * <p>
	 * The SWITCH_ON and SWITCH_OFF symbols do not appear in rooms, only in
	 * {@link Condition}s and {@link Edge}s.
	 * <p>
	 * The SWITCH item does not give the player the SWITCH symbol, instead the
	 * player may choose to either
	 * <ul>
	 * <li>lose the SWITCH_OFF symbol (if they have it), and gain the SWITCH_ON
	 *      symbol; or
	 * <li>lose the SWITCH_ON symbol (if they have it), and gain the SWITCH_OFF
	 *      symbol.
	 * <ul>
	 * <p>
	 */
	public static inline var START:Int = -1;
	public static inline var GOAL:Int = -2;
	public static inline var BOSS:Int = -3;
	public static inline var SWITCH_ON:Int = -4;    // used as a condition (lock)
	public static inline var SWITCH_OFF:Int = -5;   // used as a condition (lock)
	public static inline var SWITCH:Int = -6;       // used as an item (key) within a room
	
	private var value:Int;
	private var name:String;
	
	/**
	 * Creates a Symbol with the given value.
	 * @param value value to give the Symbol
	 */
	public function new(value:Int) 
	{
		this.value = value;
		
		if (value == START) {
			name = "Start";
		} else if (value == GOAL) {
			name = "Goal";
		} else if (value == BOSS) {
			name = "Boss";
		} else if (value == SWITCH_ON) {
			name = "ON";
		} else if (value == SWITCH_OFF) {
			name = "OFF";
		} else if (value == SWITCH) {
			name = "SW";
		} else if (value >= 0 && value < 26) {
			name = String.fromCharCode('A'.charCodeAt(0) + value);
		} else {
			name = Std.string(value);
		}
	}
	
	public function equals(other:Dynamic):Bool
	{
		if (Std.is(other, Symbol)) {
			return value == other.value;
		}
		return false;
	}
	
	/**
	 * @return the value of the Symbol
	 */
	public function getValue():Int {
		return value;
	}
	
	/**
	 * @return whether the symbol is the special START symbol
	 */
	public function isStart():Bool {
		return value == START;
	}
	
	/**
	 * @return whether the symbol is the special GOAL symbol
	 */
	public function isGoal():Bool {
		return value == GOAL;
	}
	
	/**
	 * @return whether the symbol is the special BOSS symbol
	 */
	public function isBoss():Bool {
		return value == BOSS;
	}
	
	/**
	 * @return whether the symbol is the special SWITCH symbol
	 */
	public function isSwitch():Bool {
		return value == SWITCH;
	}
	
	/**
	 * @return whether the symbol is one of the special SWITCH_{ON,OFF} symbols
	 */
	public function isSwitchState():Bool {
		return value == SWITCH_ON || value == SWITCH_OFF;
	}
	
	public inline function toString():String {
		return name;
	}
}

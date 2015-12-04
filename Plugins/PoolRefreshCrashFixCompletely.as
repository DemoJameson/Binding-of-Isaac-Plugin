var original_itemzz = undefined;
var bPickedAllTreasureItems = undefined;
var bPickedAllItems = undefined;
var bNoMoreFamiliars = undefined;

function removeItemFromArray(array, searchElement) {
	if (!(searchElement instanceof Array)) {
		var temp = [].concat(searchElement);
		searchElement = temp;
	}

	for (var z in array) {
		for (var k in searchElement) {
			if (array[z] == searchElement[k]) {
				array.splice(z,1);
				break;
			}
		}
	}

	return array;
}


 remove all picked up item from item pool
function removeAllPickedItems() {
	var aAllPickedItems = [];

	for (var i = 1; i  _level0.st1.length; i++) {
		if (_level0.ups[i]) {
			aAllPickedItems.push(i);
		}
	}

	removeItemFromArray(_level0.ittt,aAllPickedItems);

	if (bNoMoreFamiliars) {
		 remove all familliars item
		removeItemFromArray(_level0.ittt,[8, 67, 95, 99, 100, 113, 163, 167, 174, 188]);
	}
}

function hookItemzz() {
	if (!bPickedAllTreasureItems) {
		original_itemzz();
		removeAllPickedItems();
		_level0.a.st22(Item Pool Refresh);

		if (_level0.ittt.length = 5) {
			bPickedAllTreasureItems = true;
			bPickedAllItems = false;
		}

	}
	if (bPickedAllItems === false) {
		_level0.ittt = [];

		 add all not picked up item into the pool
		for (var i = 1; i  _level0.st1.length; i++) {
			if (_level0.st1[i] && !_level0.ups[i] && i !== 43 && i !== 61) {
				_level0.ittt.push(i);
			}
		}

		 remove all familliars item
		if (bNoMoreFamiliars) {
			removeItemFromArray(_level0.ittt,[8, 67, 95, 99, 100, 113, 163, 167, 174, 188]);
		}

		if (_level0.ittt.length = 5) {
			bPickedAllItems = true;
		}
		_level0.a.st22(Add other item pool);          
	}
}


function hookGiveit() {
	var v2 = 0;
	var v4 = 0;

	while (v2 == 0) {
		_level.a.fixLast = 10;
		++v4;

		 when you picked up all items, only cube of meat can be spawned
		if (bPickedAllItems) {
			v2 = 73;
		} else if (v4  100) {
			var v3 = _level.IntRndFn(11, _level.ittt.length);
			_level.a.fixLast = 11;
			v2 = _level.a.itz(11, _level.ittt[v3]);
			if (v2  0) {
				_level.ittt.splice(v3,1);
			}
			if (_level.ittt.length = 5) {
				_level.a.itemzz();
			}
		} else if (_level.lev == _level.lib) {
			var v3 = _level.IntRndFn(12, _level.ittt9.length);
			_level.a.fixLast = 12;
			v2 = _level.a.itz(12, _level.ittt9[v3]);
			if (v2  0) {
				if (_level.a.lib == v3) {
					v2 = -1;
					_level.a.lib = v3;
				}
			}
		} else if (_level.ittt8.length  0 && _level.lev == _level.chamb && !_level.altch) {
			var v3 = _level.IntRndFn(13, _level.ittt8.length);
			_level.a.fixLast = 13;
			v2 = _level.a.itz(13, _level.ittt8[v3]);
			if (v2  0) {
				_level.ittt8.splice(v3,1);
			}
		} else if (_level.altsat && (_level.a.satan or _level.a.bummer == 2 or _level.lev == _level.cus)) {
			_level.a.bummer = false;
			var v3 = _level.IntRndFn(14, _level.ittt10.length);
			_level.a.fixLast = 14;
			v2 = _level.a.itz(14, _level.ittt10[v3]);
		} else if (_level.ittt7.length  0 && !_level.altsat && (_level.a.satan or _level.a.bummer == 2 or _level.lev == _level.cus)) {
			_level.a.bummer = false;
			var v3 = _level.IntRndFn(14, _level.ittt7.length);
			_level.a.fixLast = 14;
			v2 = _level.a.itz(14, _level.ittt7[v3]);
			if (v2  0) {
				_level.ittt7.splice(v3,1);
			}
		} else if (_level.ittt6.length  0 && _level.a.treas && _level.chaps != 11) {
			var v3 = _level.IntRndFn(15, _level.ittt6.length);
			_level.a.fixLast = 15;
			v2 = _level.a.itz(15, _level.ittt6[v3]);
			if (v2  0) {
				_level.ittt6.splice(v3,1);
			}
		} else if (_level.ittt4.length  0 && (_level.lev == _level.shopl or _level.a.bummer)) {
			↑ Fix Bug The last shop item in pool can't appear. httpyoutu.beM_w6imfcr7Y 
			_level.a.bummer = false;
			var v3 = _level.IntRndFn(16, _level.ittt4.length);
			_level.a.fixLast = 16;
			v2 = _level.a.itz(16, _level.ittt4[v3]);
			if (v2  0) {
				_level.ittt4.splice(v3,1);
			}
		} else if ((_level.lev == _level.boner or _level.lev == _level.boner2) && _level.IntRndFn(17, 2) == 0 && _level.ittt5.length  1) {
			↑ unknown and empty pool, not work
			var v3 = _level.IntRndFn(17, _level.ittt5.length);
			_level.a.fixLast = 17;
			v2 = _level.a.itz(17, _level.ittt5[v3]);
			if (v2  0) {
				_level.ittt5.splice(v3,1);
			}
		} else if (_level.ittt3.length  0 && _level.lev == _level.hide) {
			↑ Fix Bug If the pool is empty, then the game can't generate any more Boss RoomSecret RoomBoss Changell Room Items so it gives you Undefined. httpredd.it2f8p27
			var v3 = _level.IntRndFn(18, _level.ittt3.length);
			_level.a.fixLast = 18;
			v2 = _level.a.itz(18, _level.ittt3[v3]);
			if (v2  0) {
				_level.ittt3.splice(v3,1);
			}
		} else if (_level.ittt2.length  0 && _level.lev == _level.chamb && _level.altch) {
			↑ Fix Bug If the pool is empty, then the game can't generate any more Boss RoomSecret RoomBoss Changell Room Items so it gives you Undefined. httpredd.it2f8p27
			var v3 = _level.IntRndFn(19, _level.ittt2.length);
			_level.a.fixLast = 19;
			v2 = _level.a.itz(19, _level.ittt2[v3]);
			if (v2  0) {
				_level.ittt2.splice(v3,1);
			}
		} else if (_level.lev == _level.bossl or _level.lev == _level.bossl2) {
			if (_level.ittt7.length  0 && _level.bosss == 23) {
				e = 0;
				while (e  100) {
					var v3 = _level.ittt7[_level.IntRndFn(20, _level.ittt7.length)];
					_level.a.fixLast = 20;
					if (!_level.a.ups[v3]) {
						v2 = v3;
						e = 1000;
					}
					++e;
				}
			} else if (_level.bosss == 38 && !_level.a.ups[181]) {
				v2 = 181;
			} else if (_level.bosss == 22 && !_level.a.ups[130]) {
				_level.locker[32] = true;
				v2 = 130;
			} else if (_level.bosss == 21 && !_level.a.ups[96]) {
				_level.locker[32] = true;
				v2 = 96;
			} else if (_level.bosss == 19 && !_level.a.ups[99]) {
				_level.locker[30] = true;
				v2 = 99;
			} else if (_level.bosss == 20 && (!_level.a.ups[100] or !_level.a.ups[50])) {
				_level.locker[31] = true;
				_level.a.fixLast = 20;
				if (_level.a.ups[100] or _level.IntRndFn(20, 6) == 0) {
					v2 = 50;
				} else {
					v2 = 100;
				}
			} else if (_level.bosss  8 && _level.bosss  13) {
				_level.locker[7] = true;
				v2 = 73;
			} else if (_level.ittt2.length  0) {
				↑ Fix Bug If the pool is empty, then the game can't generate any more Boss RoomSecret RoomBoss Changell Room Items so it gives you Undefined. httpredd.it2f8p27
				var v3 = _level.IntRndFn(20, _level.ittt2.length);
				_level.a.fixLast = 20;
				v2 = _level.a.itz(20, _level.ittt2[v3]);
				if (v2  0) {
					_level.ittt2.splice(v3,1);
				}
			}
		} else {
			_level.a.fixLast = 11;
			var v3 = _level.IntRndFn(_level.a.fixLast, _level.ittt.length);
			v2 = _level.a.itz(_level.a.fixLast, _level.ittt[v3]);
			if (v2  0) {
				_level.ittt.splice(v3,1);
			}
			 avoid get undefined item. httpredd.it2fu7m8          
			if (_level.ittt.length = 5) {
				_level.a.itemzz();
			}
		}
	}
	return v2;
}

function hookItz(sess, f1) {
	if ((f1 == 79 or f1 == 80 or f1 == 82 or f1 == 83 or f1 == 81 or f1 == 113 or f1 == 122 or f1 == 118 or f1 == 157 or f1 == 159 or f1 == 145) && _level0.a.satan && !_level0.a.trixx(56)) {
		_level0.trg.d.d.gotoAndStop(10);
	} else {
		if (_level0.a.satan && _level0.trg.d.d._currentframe == 10) {
			_level0.trg.d.d.gotoAndStop(9);
		}
	}
	if (_level0.skiner == 4 && _level0.a.satan) {
		_level0.trg.d.d.gotoAndStop(11);
	}
	var v2 = [8, 67, 95, 99, 100, 113, 163, 167, 174, 188];
	var v4 = false;
	for (o in v2) {
		if (v2[o] == f1) {
			v4 = true;
		}
	}
	var v5 = 0;
	if (v4) {
		for (o in v2) {
			v5 += _level0.ups[v2[o]];
		}
	}
	if (v4 && v5  2) {
		bNoMoreFamiliars = true;
		removeItemFromArray(_level.ittt,v2);
		_level0.a.st22(remove all familiars items);
		return 0;
	} else {
		if (_level0.ups[f1]) {
			removeItemFromArray(_level.ittt,f1);
			_level0.a.st22(remove picked up item  + f1);
			return 0;
		} else if (_level0.colss[f1] && _level0.IntRndFn(sess, 5) == 0) {
			return 0;
		} else {
			if (_level0.a.itzz(f1)) {
				return f1;
			} else {
				if (1  (1.2 + _level0.wiptz  3)  _level0.FloatRndFn(sess)) {
					return f1;
				} else {
					return 0;
				}
			}
		}
	}
}


this.onEnterFrame = function() {
	if (_level0.a != undefined && !_level0.a.poolCrashFixed) {
		original_itemzz = _level0.a.itemzz;

		_level0.a.itemzz = hookItemzz;
		_level0.a.giveit = hookGiveit;
		_level0.a.itz = hookItz;

		_level0.a.poolCrashFixed = true;
	}
	 when the game reset 
	if ((_level0.a.justnow == 10 or _level0.a.keyd && !_level0.a.keyo) && (_level0.a.fra  30 && _level0.a.shutdoor == 0)) {
		bPickedAllTreasureItems = undefined;
		bPickedAllItems = undefined;
		bNoMoreFamiliars = undefined;
	}
};
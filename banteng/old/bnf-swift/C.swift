
class CLangAbstractDeclarator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangAbstractDeclarator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAbstractDeclarator1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAbstractDeclarator2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangAbstractDeclarator0 : CLangAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPointer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAbstractDeclarator0(units : units)
	}
}

class CLangAbstractDeclarator1 : CLangAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPointer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDirectAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAbstractDeclarator1(units : units)
	}
}

class CLangAbstractDeclarator2 : CLangAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAbstractDeclarator2(units : units)
	}
}

class CLangAdditiveExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangAdditiveExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAdditiveExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAdditiveExp2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangAdditiveExp0 : CLangAdditiveExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangMultExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAdditiveExp0(units : units)
	}
}

class CLangAdditiveExp1 : CLangAdditiveExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAdditiveExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "+") else { return nil}
		if let unit = CLangMultExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAdditiveExp1(units : units)
	}
}

class CLangAdditiveExp2 : CLangAdditiveExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAdditiveExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "-") else { return nil}
		if let unit = CLangMultExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAdditiveExp2(units : units)
	}
}

class CLangAndExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangAndExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAndExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangAndExp0 : CLangAndExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEqualityExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAndExp0(units : units)
	}
}

class CLangAndExp1 : CLangAndExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAndExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "&") else { return nil}
		if let unit = CLangEqualityExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAndExp1(units : units)
	}
}

class CLangArgumentExpList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangArgumentExpList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangArgumentExpList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangArgumentExpList0 : CLangArgumentExpList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAssignmentExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangArgumentExpList0(units : units)
	}
}

class CLangArgumentExpList1 : CLangArgumentExpList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangArgumentExpList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangAssignmentExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangArgumentExpList1(units : units)
	}
}

class CLangAssignmentExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangAssignmentExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangAssignmentExp0 : CLangAssignmentExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangConditionalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAssignmentExp0(units : units)
	}
}

class CLangAssignmentExp1 : CLangAssignmentExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangUnaryExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangAssignmentOperator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangAssignmentExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangAssignmentExp1(units : units)
	}
}

class CLangAssignmentOperator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangAssignmentOperator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator5.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator6.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator7.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator8.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator9.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangAssignmentOperator10.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangAssignmentOperator0 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator0()
	}
}

class CLangAssignmentOperator1 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "*=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator1()
	}
}

class CLangAssignmentOperator2 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "/=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator2()
	}
}

class CLangAssignmentOperator3 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "%=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator3()
	}
}

class CLangAssignmentOperator4 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "+=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator4()
	}
}

class CLangAssignmentOperator5 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "-=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator5()
	}
}

class CLangAssignmentOperator6 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "<<=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator6()
	}
}

class CLangAssignmentOperator7 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : ">>=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator7()
	}
}

class CLangAssignmentOperator8 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "&=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator8()
	}
}

class CLangAssignmentOperator9 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "^=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator9()
	}
}

class CLangAssignmentOperator10 : CLangAssignmentOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "|=") else { return nil}
		parentIndex = index
		return CLangAssignmentOperator10()
	}
}

class CLangCastExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangCastExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangCastExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangCastExp0 : CLangCastExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangUnaryExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangCastExp0(units : units)
	}
}

class CLangCastExp1 : CLangCastExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangTypeName.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangCastExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangCastExp1(units : units)
	}
}

class CLangCompoundStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangCompoundStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangCompoundStat1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangCompoundStat2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangCompoundStat3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangCompoundStat0 : CLangCompoundStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangStatList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangCompoundStat0(units : units)
	}
}

class CLangCompoundStat1 : CLangCompoundStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangStatList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangCompoundStat1(units : units)
	}
}

class CLangCompoundStat2 : CLangCompoundStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangCompoundStat2(units : units)
	}
}

class CLangCompoundStat3 : CLangCompoundStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangCompoundStat3()
	}
}

class CLangConditionalExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangConditionalExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangConditionalExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangConditionalExp0 : CLangConditionalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangLogicalOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConditionalExp0(units : units)
	}
}

class CLangConditionalExp1 : CLangConditionalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangLogicalOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "?") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ":") else { return nil}
		if let unit = CLangConditionalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConditionalExp1(units : units)
	}
}

class CLangConst : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangConst0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangConst1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangConst2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangConst3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangConst0 : CLangConst {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangIntConst.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConst0(units : units)
	}
}

class CLangConst1 : CLangConst {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangCharConst.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConst1(units : units)
	}
}

class CLangConst2 : CLangConst {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangFloatConst.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConst2(units : units)
	}
}

class CLangConst3 : CLangConst {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEnumerationConst.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConst3(units : units)
	}
}

class CLangConstExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangConstExp0.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangConstExp0 : CLangConstExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangConditionalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangConstExp0(units : units)
	}
}

class CLangDecl : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangDecl0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDecl1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangDecl0 : CLangDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangInitDeclaratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangDecl0(units : units)
	}
}

class CLangDecl1 : CLangDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangDecl1(units : units)
	}
}

class CLangDeclList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangDeclList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangDeclList0 : CLangDeclList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclList0(units : units)
	}
}

class CLangDeclList1 : CLangDeclList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclList1(units : units)
	}
}

class CLangDeclSpecs : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangDeclSpecs0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclSpecs1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclSpecs2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclSpecs3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclSpecs4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclSpecs5.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangDeclSpecs0 : CLangDeclSpecs {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStorageClassSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclSpecs0(units : units)
	}
}

class CLangDeclSpecs1 : CLangDeclSpecs {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStorageClassSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclSpecs1(units : units)
	}
}

class CLangDeclSpecs2 : CLangDeclSpecs {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclSpecs2(units : units)
	}
}

class CLangDeclSpecs3 : CLangDeclSpecs {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclSpecs3(units : units)
	}
}

class CLangDeclSpecs4 : CLangDeclSpecs {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeQualifier.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclSpecs4(units : units)
	}
}

class CLangDeclSpecs5 : CLangDeclSpecs {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeQualifier.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclSpecs5(units : units)
	}
}

class CLangDeclarator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangDeclarator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDeclarator1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangDeclarator0 : CLangDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPointer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclarator0(units : units)
	}
}

class CLangDeclarator1 : CLangDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDeclarator1(units : units)
	}
}

class CLangDirectAbstractDeclarator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangDirectAbstractDeclarator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator5.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator6.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator7.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectAbstractDeclarator8.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangDirectAbstractDeclarator0 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator0(units : units)
	}
}

class CLangDirectAbstractDeclarator1 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator1(units : units)
	}
}

class CLangDirectAbstractDeclarator2 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator2(units : units)
	}
}

class CLangDirectAbstractDeclarator3 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator3(units : units)
	}
}

class CLangDirectAbstractDeclarator4 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator4()
	}
}

class CLangDirectAbstractDeclarator5 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangParamTypeList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator5(units : units)
	}
}

class CLangDirectAbstractDeclarator6 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangParamTypeList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator6(units : units)
	}
}

class CLangDirectAbstractDeclarator7 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator7(units : units)
	}
}

class CLangDirectAbstractDeclarator8 : CLangDirectAbstractDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectAbstractDeclarator8()
	}
}

class CLangDirectDeclarator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangDirectDeclarator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectDeclarator1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectDeclarator2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectDeclarator3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectDeclarator4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectDeclarator5.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangDirectDeclarator6.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangDirectDeclarator0 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangDirectDeclarator0(units : units)
	}
}

class CLangDirectDeclarator1 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectDeclarator1(units : units)
	}
}

class CLangDirectDeclarator2 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangDirectDeclarator2(units : units)
	}
}

class CLangDirectDeclarator3 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangDirectDeclarator3(units : units)
	}
}

class CLangDirectDeclarator4 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangParamTypeList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectDeclarator4(units : units)
	}
}

class CLangDirectDeclarator5 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangIdList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectDeclarator5(units : units)
	}
}

class CLangDirectDeclarator6 : CLangDirectDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDirectDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangDirectDeclarator6(units : units)
	}
}

class CLangEnumSpec : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangEnumSpec0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangEnumSpec1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangEnumSpec2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangEnumSpec0 : CLangEnumSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "enum") else { return nil}
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangEnumeratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangEnumSpec0(units : units)
	}
}

class CLangEnumSpec1 : CLangEnumSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "enum") else { return nil}
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangEnumeratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangEnumSpec1(units : units)
	}
}

class CLangEnumSpec2 : CLangEnumSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "enum") else { return nil}
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEnumSpec2(units : units)
	}
}

class CLangEnumerator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangEnumerator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangEnumerator1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangEnumerator0 : CLangEnumerator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEnumerator0(units : units)
	}
}

class CLangEnumerator1 : CLangEnumerator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "=") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEnumerator1(units : units)
	}
}

class CLangEnumeratorList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangEnumeratorList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangEnumeratorList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangEnumeratorList0 : CLangEnumeratorList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEnumerator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEnumeratorList0(units : units)
	}
}

class CLangEnumeratorList1 : CLangEnumeratorList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEnumeratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangEnumerator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEnumeratorList1(units : units)
	}
}

class CLangEqualityExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangEqualityExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangEqualityExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangEqualityExp2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangEqualityExp0 : CLangEqualityExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEqualityExp0(units : units)
	}
}

class CLangEqualityExp1 : CLangEqualityExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEqualityExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "==") else { return nil}
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEqualityExp1(units : units)
	}
}

class CLangEqualityExp2 : CLangEqualityExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEqualityExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "!=") else { return nil}
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangEqualityExp2(units : units)
	}
}

class CLangExclusiveOrExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangExclusiveOrExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangExclusiveOrExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangExclusiveOrExp0 : CLangExclusiveOrExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAndExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangExclusiveOrExp0(units : units)
	}
}

class CLangExclusiveOrExp1 : CLangExclusiveOrExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangExclusiveOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "^") else { return nil}
		if let unit = CLangAndExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangExclusiveOrExp1(units : units)
	}
}

class CLangExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangExp0 : CLangExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAssignmentExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangExp0(units : units)
	}
}

class CLangExp1 : CLangExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangAssignmentExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangExp1(units : units)
	}
}

class CLangExpStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangExpStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangExpStat1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangExpStat0 : CLangExpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangExpStat0(units : units)
	}
}

class CLangExpStat1 : CLangExpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangExpStat1()
	}
}

class CLangExternalDecl : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangExternalDecl0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangExternalDecl1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangExternalDecl0 : CLangExternalDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangFunctionDefinition.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangExternalDecl0(units : units)
	}
}

class CLangExternalDecl1 : CLangExternalDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangExternalDecl1(units : units)
	}
}

class CLangFunctionDefinition : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangFunctionDefinition0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangFunctionDefinition1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangFunctionDefinition2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangFunctionDefinition3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangFunctionDefinition0 : CLangFunctionDefinition {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "func") else { return nil}
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangCompoundStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangFunctionDefinition0(units : units)
	}
}

class CLangFunctionDefinition1 : CLangFunctionDefinition {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangCompoundStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangFunctionDefinition1(units : units)
	}
}

class CLangFunctionDefinition2 : CLangFunctionDefinition {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangCompoundStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangFunctionDefinition2(units : units)
	}
}

class CLangFunctionDefinition3 : CLangFunctionDefinition {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangCompoundStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangFunctionDefinition3(units : units)
	}
}

class CLangIdList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangIdList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIdList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangIdList0 : CLangIdList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIdList0(units : units)
	}
}

class CLangIdList1 : CLangIdList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangIdList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIdList1(units : units)
	}
}

class CLangInclusiveOrExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangInclusiveOrExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangInclusiveOrExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangInclusiveOrExp0 : CLangInclusiveOrExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangExclusiveOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInclusiveOrExp0(units : units)
	}
}

class CLangInclusiveOrExp1 : CLangInclusiveOrExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangInclusiveOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "|") else { return nil}
		if let unit = CLangExclusiveOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInclusiveOrExp1(units : units)
	}
}

class CLangInitDeclarator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangInitDeclarator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangInitDeclarator1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangInitDeclarator0 : CLangInitDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitDeclarator0(units : units)
	}
}

class CLangInitDeclarator1 : CLangInitDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "=") else { return nil}
		if let unit = CLangInitializer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitDeclarator1(units : units)
	}
}

class CLangInitDeclaratorList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangInitDeclaratorList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangInitDeclaratorList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangInitDeclaratorList0 : CLangInitDeclaratorList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangInitDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitDeclaratorList0(units : units)
	}
}

class CLangInitDeclaratorList1 : CLangInitDeclaratorList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangInitDeclaratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangInitDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitDeclaratorList1(units : units)
	}
}

class CLangInitializer : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangInitializer0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangInitializer1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangInitializer2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangInitializer0 : CLangInitializer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAssignmentExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitializer0(units : units)
	}
}

class CLangInitializer1 : CLangInitializer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangInitializerList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangInitializer1(units : units)
	}
}

class CLangInitializer2 : CLangInitializer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangInitializerList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangInitializer2(units : units)
	}
}

class CLangInitializerList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangInitializerList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangInitializerList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangInitializerList0 : CLangInitializerList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangInitializer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitializerList0(units : units)
	}
}

class CLangInitializerList1 : CLangInitializerList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangInitializerList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangInitializer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangInitializerList1(units : units)
	}
}

class CLangIterationStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangIterationStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat5.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat6.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat7.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat8.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangIterationStat9.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangIterationStat0 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "while") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat0(units : units)
	}
}

class CLangIterationStat1 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "do") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "while") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangIterationStat1(units : units)
	}
}

class CLangIterationStat2 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat2(units : units)
	}
}

class CLangIterationStat3 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat3(units : units)
	}
}

class CLangIterationStat4 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat4(units : units)
	}
}

class CLangIterationStat5 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat5(units : units)
	}
}

class CLangIterationStat6 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat6(units : units)
	}
}

class CLangIterationStat7 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat7(units : units)
	}
}

class CLangIterationStat8 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat8(units : units)
	}
}

class CLangIterationStat9 : CLangIterationStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "for") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangIterationStat9(units : units)
	}
}

class CLangJumpStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangJumpStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangJumpStat1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangJumpStat2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangJumpStat3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangJumpStat4.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangJumpStat0 : CLangJumpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "goto") else { return nil}
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangJumpStat0(units : units)
	}
}

class CLangJumpStat1 : CLangJumpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "continue") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangJumpStat1()
	}
}

class CLangJumpStat2 : CLangJumpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "break") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangJumpStat2()
	}
}

class CLangJumpStat3 : CLangJumpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "return") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangJumpStat3(units : units)
	}
}

class CLangJumpStat4 : CLangJumpStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "return") else { return nil}
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangJumpStat4()
	}
}

class CLangLabeledStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangLabeledStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangLabeledStat1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangLabeledStat2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangLabeledStat0 : CLangLabeledStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ":") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLabeledStat0(units : units)
	}
}

class CLangLabeledStat1 : CLangLabeledStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "case") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ":") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLabeledStat1(units : units)
	}
}

class CLangLabeledStat2 : CLangLabeledStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "default") else { return nil}
		guard match(string, parentIndex : &index, constant : ":") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLabeledStat2(units : units)
	}
}

class CLangLogicalAndExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangLogicalAndExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangLogicalAndExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangLogicalAndExp0 : CLangLogicalAndExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangInclusiveOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLogicalAndExp0(units : units)
	}
}

class CLangLogicalAndExp1 : CLangLogicalAndExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangLogicalAndExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "&&") else { return nil}
		if let unit = CLangInclusiveOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLogicalAndExp1(units : units)
	}
}

class CLangLogicalOrExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangLogicalOrExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangLogicalOrExp1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangLogicalOrExp0 : CLangLogicalOrExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangLogicalAndExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLogicalOrExp0(units : units)
	}
}

class CLangLogicalOrExp1 : CLangLogicalOrExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangLogicalOrExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "||") else { return nil}
		if let unit = CLangLogicalAndExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangLogicalOrExp1(units : units)
	}
}

class CLangMultExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangMultExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangMultExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangMultExp2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangMultExp3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangMultExp0 : CLangMultExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangCastExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangMultExp0(units : units)
	}
}

class CLangMultExp1 : CLangMultExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangMultExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "*") else { return nil}
		if let unit = CLangCastExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangMultExp1(units : units)
	}
}

class CLangMultExp2 : CLangMultExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangMultExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "/") else { return nil}
		if let unit = CLangCastExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangMultExp2(units : units)
	}
}

class CLangMultExp3 : CLangMultExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangMultExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "%") else { return nil}
		if let unit = CLangCastExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangMultExp3(units : units)
	}
}

class CLangParamDecl : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangParamDecl0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangParamDecl1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangParamDecl2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangParamDecl0 : CLangParamDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangParamDecl0(units : units)
	}
}

class CLangParamDecl1 : CLangParamDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangParamDecl1(units : units)
	}
}

class CLangParamDecl2 : CLangParamDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclSpecs.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangParamDecl2(units : units)
	}
}

class CLangParamList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangParamList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangParamList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangParamList0 : CLangParamList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangParamDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangParamList0(units : units)
	}
}

class CLangParamList1 : CLangParamList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangParamList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangParamDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangParamList1(units : units)
	}
}

class CLangParamTypeList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangParamTypeList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangParamTypeList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangParamTypeList0 : CLangParamTypeList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangParamList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangParamTypeList0(units : units)
	}
}

class CLangParamTypeList1 : CLangParamTypeList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangParamList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		guard match(string, parentIndex : &index, constant : "...") else { return nil}
		parentIndex = index
		return CLangParamTypeList1(units : units)
	}
}

class CLangPointer : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangPointer0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPointer1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPointer2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPointer3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangPointer0 : CLangPointer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "*") else { return nil}
		if let unit = CLangTypeQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPointer0(units : units)
	}
}

class CLangPointer1 : CLangPointer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "*") else { return nil}
		parentIndex = index
		return CLangPointer1()
	}
}

class CLangPointer2 : CLangPointer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "*") else { return nil}
		if let unit = CLangTypeQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangPointer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPointer2(units : units)
	}
}

class CLangPointer3 : CLangPointer {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "*") else { return nil}
		if let unit = CLangPointer.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPointer3(units : units)
	}
}

class CLangPostfixExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangPostfixExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp5.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp6.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPostfixExp7.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangPostfixExp0 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPrimaryExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPostfixExp0(units : units)
	}
}

class CLangPostfixExp1 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "[") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "]") else { return nil}
		parentIndex = index
		return CLangPostfixExp1(units : units)
	}
}

class CLangPostfixExp2 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangArgumentExpList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangPostfixExp2(units : units)
	}
}

class CLangPostfixExp3 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangPostfixExp3(units : units)
	}
}

class CLangPostfixExp4 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ".") else { return nil}
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPostfixExp4(units : units)
	}
}

class CLangPostfixExp5 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "->") else { return nil}
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPostfixExp5(units : units)
	}
}

class CLangPostfixExp6 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "++") else { return nil}
		parentIndex = index
		return CLangPostfixExp6(units : units)
	}
}

class CLangPostfixExp7 : CLangPostfixExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "--") else { return nil}
		parentIndex = index
		return CLangPostfixExp7(units : units)
	}
}

class CLangPrimaryExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangPrimaryExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPrimaryExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPrimaryExp2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangPrimaryExp3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangPrimaryExp0 : CLangPrimaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPrimaryExp0(units : units)
	}
}

class CLangPrimaryExp1 : CLangPrimaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangConst.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPrimaryExp1(units : units)
	}
}

class CLangPrimaryExp2 : CLangPrimaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangString.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangPrimaryExp2(units : units)
	}
}

class CLangPrimaryExp3 : CLangPrimaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangPrimaryExp3(units : units)
	}
}

class CLangRelationalExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangRelationalExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangRelationalExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangRelationalExp2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangRelationalExp3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangRelationalExp4.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangRelationalExp0 : CLangRelationalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangRelationalExp0(units : units)
	}
}

class CLangRelationalExp1 : CLangRelationalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "<") else { return nil}
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangRelationalExp1(units : units)
	}
}

class CLangRelationalExp2 : CLangRelationalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ">") else { return nil}
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangRelationalExp2(units : units)
	}
}

class CLangRelationalExp3 : CLangRelationalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "<=") else { return nil}
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangRelationalExp3(units : units)
	}
}

class CLangRelationalExp4 : CLangRelationalExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangRelationalExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ">=") else { return nil}
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangRelationalExp4(units : units)
	}
}

class CLangSelectionStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangSelectionStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangSelectionStat1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangSelectionStat2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangSelectionStat0 : CLangSelectionStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "if") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSelectionStat0(units : units)
	}
}

class CLangSelectionStat1 : CLangSelectionStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "if") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "else") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSelectionStat1(units : units)
	}
}

class CLangSelectionStat2 : CLangSelectionStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "switch") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSelectionStat2(units : units)
	}
}

class CLangShiftExpression : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangShiftExpression0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangShiftExpression1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangShiftExpression2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangShiftExpression0 : CLangShiftExpression {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangAdditiveExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangShiftExpression0(units : units)
	}
}

class CLangShiftExpression1 : CLangShiftExpression {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "<<") else { return nil}
		if let unit = CLangAdditiveExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangShiftExpression1(units : units)
	}
}

class CLangShiftExpression2 : CLangShiftExpression {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangShiftExpression.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ">>") else { return nil}
		if let unit = CLangAdditiveExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangShiftExpression2(units : units)
	}
}

class CLangSpecQualifierList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangSpecQualifierList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangSpecQualifierList1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangSpecQualifierList2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangSpecQualifierList3.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangSpecQualifierList0 : CLangSpecQualifierList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangSpecQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSpecQualifierList0(units : units)
	}
}

class CLangSpecQualifierList1 : CLangSpecQualifierList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSpecQualifierList1(units : units)
	}
}

class CLangSpecQualifierList2 : CLangSpecQualifierList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeQualifier.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangSpecQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSpecQualifierList2(units : units)
	}
}

class CLangSpecQualifierList3 : CLangSpecQualifierList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeQualifier.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangSpecQualifierList3(units : units)
	}
}

class CLangStat : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStat0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStat1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStat2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStat3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStat4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStat5.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStat0 : CLangStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangLabeledStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStat0(units : units)
	}
}

class CLangStat1 : CLangStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangExpStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStat1(units : units)
	}
}

class CLangStat2 : CLangStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangCompoundStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStat2(units : units)
	}
}

class CLangStat3 : CLangStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangSelectionStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStat3(units : units)
	}
}

class CLangStat4 : CLangStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangIterationStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStat4(units : units)
	}
}

class CLangStat5 : CLangStat {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangJumpStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStat5(units : units)
	}
}

class CLangStatList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStatList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStatList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStatList0 : CLangStatList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStatList0(units : units)
	}
}

class CLangStatList1 : CLangStatList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStatList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangStat.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStatList1(units : units)
	}
}

class CLangStorageClassSpec : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStorageClassSpec0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStorageClassSpec1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStorageClassSpec2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStorageClassSpec3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStorageClassSpec4.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStorageClassSpec0 : CLangStorageClassSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "auto") else { return nil}
		parentIndex = index
		return CLangStorageClassSpec0()
	}
}

class CLangStorageClassSpec1 : CLangStorageClassSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "register") else { return nil}
		parentIndex = index
		return CLangStorageClassSpec1()
	}
}

class CLangStorageClassSpec2 : CLangStorageClassSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "static") else { return nil}
		parentIndex = index
		return CLangStorageClassSpec2()
	}
}

class CLangStorageClassSpec3 : CLangStorageClassSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "extern") else { return nil}
		parentIndex = index
		return CLangStorageClassSpec3()
	}
}

class CLangStorageClassSpec4 : CLangStorageClassSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "typedef") else { return nil}
		parentIndex = index
		return CLangStorageClassSpec4()
	}
}

class CLangStructDecl : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStructDecl0.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStructDecl0 : CLangStructDecl {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangSpecQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangStructDeclaratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ";") else { return nil}
		parentIndex = index
		return CLangStructDecl0(units : units)
	}
}

class CLangStructDeclList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStructDeclList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructDeclList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStructDeclList0 : CLangStructDeclList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclList0(units : units)
	}
}

class CLangStructDeclList1 : CLangStructDeclList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangStructDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclList1(units : units)
	}
}

class CLangStructDeclarator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStructDeclarator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructDeclarator1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructDeclarator2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStructDeclarator0 : CLangStructDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclarator0(units : units)
	}
}

class CLangStructDeclarator1 : CLangStructDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ":") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclarator1(units : units)
	}
}

class CLangStructDeclarator2 : CLangStructDeclarator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : ":") else { return nil}
		if let unit = CLangConstExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclarator2(units : units)
	}
}

class CLangStructDeclaratorList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStructDeclaratorList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructDeclaratorList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStructDeclaratorList0 : CLangStructDeclaratorList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclaratorList0(units : units)
	}
}

class CLangStructDeclaratorList1 : CLangStructDeclaratorList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructDeclaratorList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ",") else { return nil}
		if let unit = CLangStructDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructDeclaratorList1(units : units)
	}
}

class CLangStructOrUnion : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStructOrUnion0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructOrUnion1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStructOrUnion0 : CLangStructOrUnion {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "struct") else { return nil}
		parentIndex = index
		return CLangStructOrUnion0()
	}
}

class CLangStructOrUnion1 : CLangStructOrUnion {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "union") else { return nil}
		parentIndex = index
		return CLangStructOrUnion1()
	}
}

class CLangStructOrUnionSpec : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangStructOrUnionSpec0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructOrUnionSpec1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangStructOrUnionSpec2.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangStructOrUnionSpec0 : CLangStructOrUnionSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructOrUnion.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangStructDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangStructOrUnionSpec0(units : units)
	}
}

class CLangStructOrUnionSpec1 : CLangStructOrUnionSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructOrUnion.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "{") else { return nil}
		if let unit = CLangStructDeclList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : "}") else { return nil}
		parentIndex = index
		return CLangStructOrUnionSpec1(units : units)
	}
}

class CLangStructOrUnionSpec2 : CLangStructOrUnionSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructOrUnion.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangStructOrUnionSpec2(units : units)
	}
}

class CLangTranslationUnit : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangTranslationUnit0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTranslationUnit1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangTranslationUnit0 : CLangTranslationUnit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangExternalDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTranslationUnit0(units : units)
	}
}

class CLangTranslationUnit1 : CLangTranslationUnit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTranslationUnit.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangExternalDecl.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTranslationUnit1(units : units)
	}
}

class CLangTypeName : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangTypeName0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeName1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangTypeName0 : CLangTypeName {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangSpecQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangAbstractDeclarator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeName0(units : units)
	}
}

class CLangTypeName1 : CLangTypeName {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangSpecQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeName1(units : units)
	}
}

class CLangTypeQualifier : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangTypeQualifier0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeQualifier1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangTypeQualifier0 : CLangTypeQualifier {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "const") else { return nil}
		parentIndex = index
		return CLangTypeQualifier0()
	}
}

class CLangTypeQualifier1 : CLangTypeQualifier {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "volatile") else { return nil}
		parentIndex = index
		return CLangTypeQualifier1()
	}
}

class CLangTypeQualifierList : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangTypeQualifierList0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeQualifierList1.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangTypeQualifierList0 : CLangTypeQualifierList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeQualifier.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeQualifierList0(units : units)
	}
}

class CLangTypeQualifierList1 : CLangTypeQualifierList {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypeQualifierList.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangTypeQualifier.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeQualifierList1(units : units)
	}
}

class CLangTypeSpec : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangTypeSpec0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec5.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec6.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec7.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec8.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec9.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec10.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangTypeSpec11.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangTypeSpec0 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "void") else { return nil}
		parentIndex = index
		return CLangTypeSpec0()
	}
}

class CLangTypeSpec1 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "char") else { return nil}
		parentIndex = index
		return CLangTypeSpec1()
	}
}

class CLangTypeSpec2 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "short") else { return nil}
		parentIndex = index
		return CLangTypeSpec2()
	}
}

class CLangTypeSpec3 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "int") else { return nil}
		parentIndex = index
		return CLangTypeSpec3()
	}
}

class CLangTypeSpec4 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "long") else { return nil}
		parentIndex = index
		return CLangTypeSpec4()
	}
}

class CLangTypeSpec5 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "float") else { return nil}
		parentIndex = index
		return CLangTypeSpec5()
	}
}

class CLangTypeSpec6 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "double") else { return nil}
		parentIndex = index
		return CLangTypeSpec6()
	}
}

class CLangTypeSpec7 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "signed") else { return nil}
		parentIndex = index
		return CLangTypeSpec7()
	}
}

class CLangTypeSpec8 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "unsigned") else { return nil}
		parentIndex = index
		return CLangTypeSpec8()
	}
}

class CLangTypeSpec9 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangStructOrUnionSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeSpec9(units : units)
	}
}

class CLangTypeSpec10 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangEnumSpec.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeSpec10(units : units)
	}
}

class CLangTypeSpec11 : CLangTypeSpec {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangTypedefName.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypeSpec11(units : units)
	}
}

class CLangTypedefName : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangTypedefName0.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangTypedefName0 : CLangTypedefName {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangId.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangTypedefName0(units : units)
	}
}

class CLangUnaryExp : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangUnaryExp0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryExp1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryExp2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryExp3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryExp4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryExp5.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangUnaryExp0 : CLangUnaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangPostfixExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangUnaryExp0(units : units)
	}
}

class CLangUnaryExp1 : CLangUnaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "++") else { return nil}
		if let unit = CLangUnaryExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangUnaryExp1(units : units)
	}
}

class CLangUnaryExp2 : CLangUnaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "--") else { return nil}
		if let unit = CLangUnaryExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangUnaryExp2(units : units)
	}
}

class CLangUnaryExp3 : CLangUnaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		if let unit = CLangUnaryOperator.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		if let unit = CLangCastExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangUnaryExp3(units : units)
	}
}

class CLangUnaryExp4 : CLangUnaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "sizeof") else { return nil}
		if let unit = CLangUnaryExp.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		parentIndex = index
		return CLangUnaryExp4(units : units)
	}
}

class CLangUnaryExp5 : CLangUnaryExp {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		var units : [Unit] = []
		guard match(string, parentIndex : &index, constant : "sizeof") else { return nil}
		guard match(string, parentIndex : &index, constant : "(") else { return nil}
		if let unit = CLangTypeName.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }
		guard match(string, parentIndex : &index, constant : ")") else { return nil}
		parentIndex = index
		return CLangUnaryExp5(units : units)
	}
}

class CLangUnaryOperator : Unit {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		if let unit = CLangUnaryOperator0.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryOperator1.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryOperator2.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryOperator3.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryOperator4.parse(string, parentIndex : &parentIndex) { return unit }
		if let unit = CLangUnaryOperator5.parse(string, parentIndex : &parentIndex) { return unit }
		return nil
	}
}

class CLangUnaryOperator0 : CLangUnaryOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "&") else { return nil}
		parentIndex = index
		return CLangUnaryOperator0()
	}
}

class CLangUnaryOperator1 : CLangUnaryOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "*") else { return nil}
		parentIndex = index
		return CLangUnaryOperator1()
	}
}

class CLangUnaryOperator2 : CLangUnaryOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "+") else { return nil}
		parentIndex = index
		return CLangUnaryOperator2()
	}
}

class CLangUnaryOperator3 : CLangUnaryOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "-") else { return nil}
		parentIndex = index
		return CLangUnaryOperator3()
	}
}

class CLangUnaryOperator4 : CLangUnaryOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "~") else { return nil}
		parentIndex = index
		return CLangUnaryOperator4()
	}
}

class CLangUnaryOperator5 : CLangUnaryOperator {
	override class func parse(string : String, inout parentIndex : String.Index) -> Unit? {
		var index : String.Index = parentIndex
		guard match(string, parentIndex : &index, constant : "!") else { return nil}
		parentIndex = index
		return CLangUnaryOperator5()
	}
}

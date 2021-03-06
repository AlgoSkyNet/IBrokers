`.twsOrderID` <-
structure(list(CUSTOMER=0, FIRM=1,
               OPT_UNKNOWN="?", OPT_BROKER_DEALER="b",
               OPT_CUSTOMER="c", OPT_FIRM="f", OPT_ISEMM="m",
               OPT_FARMM="n", OPT_SPECIALIST="y",
               AUCTION_MATCH=1, AUCTION_IMPROVEMENT=2, AUCTION_TRANSPARENT=3,
               EMPTY_STR=""),
               .Names=c('CUSTOMER', 'FIRM',
               'OPT_UNKNOWN', 'OPT_BROKER_DEALER',
               'OPT_CUSTOMER', 'OPT_FIRM', 'OPT_ISEMM',
               'OPT_FARMM', 'OPT_SPECIALIST',
               'AUCTION_MATCH', 'AUCTION_IMPROVEMENT', 'AUCTION_TRANSPARENT',
               'EMPTY_STR'))

`twsOrder` <-
function(orderId,
         action="BUY",
         totalQuantity="10",
         orderType="LMT",
         lmtPrice="0.0",
         auxPrice="0.0",
         tif="",
         outsideRTH="0", #FALSE
         openClose="O",
         origin=.twsOrderID$CUSTOMER,
         ocaGroup="",
         account="",
         orderRef="",
         transmit=TRUE,
         parentId="0",
         blockOrder="0",
         sweepToFill="0",
         displaySize="0",
         triggerMethod="0",
         hidden="0",
         discretionaryAmt="0.0",
         goodAfterTime="",
         goodTillDate="",
         faGroup="", faMethod="", faPercentage="", faProfile="",
         shortSaleSlot="0",
         designatedLocation=.twsOrderID$EMPTY_STR,
         ocaType="0",
         rule80A="",
         settlingFirm="",
         clearingAccount="", clearingIntent="",
         allOrNone="0",
         minQty="",
         percentOffset="",
         eTradeOnly="0",
         firmQuoteOnly="0",
         nbboPriceCap="",
         auctionStrategy="0",
         startingPrice="",
         stockRefPrice="",
         delta="",
         stockRangeLower="",
         stockRangeUpper="",
         overridePercentageConstraints="0",
         volatility="",
         volatilityType="",
         deltaNeutralOrderType="",
         deltaNeutralAuxPrice="",
         continuousUpdate="0",
         referencePriceType="",
         trailStopPrice="",
         basisPoints="",
         basisPointsType="",
         scaleInitLevelSize="",
         scaleSubsLevelSize="",
         scalePriceIncrement="",
         notHeld=FALSE,
         algoStrategy="",
         algoParams=NULL,
         whatIf=FALSE,
         clientId="", permId=""
        )
{
  if(missing(orderId))
    orderId <- ""
  structure(
                 # main order fields
            list(orderId=orderId,
                 clientId=clientId,
                 permId=permId,
                 action=action,
                 totalQuantity=as.character(as.numeric(totalQuantity)),
                 orderType=orderType,
                 lmtPrice=as.character(lmtPrice),
                 auxPrice=as.character(auxPrice),

                 # Extended order fields
                 tif=tif,
                 ocaGroup=ocaGroup,
                 ocaType=ocaType,
                 orderRef=orderRef,
                 transmit=as.character(as.integer(transmit)), #if FALSE, will be created but not transmitted
                 parentId=parentId, #Parent order Id
                 blockOrder=blockOrder,
                 sweepToFill=sweepToFill,
                 displaySize=displaySize,
                 triggerMethod=triggerMethod, # 0=Default, 1=Double_Bid_Ask, 2=Last, 3=Double_Last, 4=Bid_Ask, 7=Last_or_Bid_Ask, 8=Midpoint
                 outsideRTH=outsideRTH,
                 hidden=hidden,
                 goodAfterTime=goodAfterTime,
                 goodTillDate=goodTillDate,
                 overridePercentageConstraints=overridePercentageConstraints,
                 rule80A=rule80A,
                 allOrNone=allOrNone,
                 minQty=minQty,
                 percentOffset=percentOffset,
                 trailStopPrice=trailStopPrice,

                 # FA only
                 faGroup=faGroup,
                 faProfile=faProfile,
                 faMethod=faMethod,
                 faPercentage=faPercentage,

                 # Institutional Orders Only
                 openClose=openClose,
                 origin=origin,
                 shortSaleSlot=shortSaleSlot,
                 designatedLocation=designatedLocation,

                 # SMART routing only
                 discretionaryAmt=discretionaryAmt,
                 eTradeOnly=eTradeOnly,
                 firmQuoteOnly=firmQuoteOnly,
                 nbboPriceCap=nbboPriceCap,

                 # BOX or VOL orders only
                 auctionStrategy=auctionStrategy,

                 # BOX orders only
                 startingPrice=startingPrice,
                 stockRefPrice=stockRefPrice,
                 delta=delta,

                 # pegged to stock or VOL orders
                 stockRangeLower=stockRangeLower,
                 stockRangeUpper=stockRangeUpper,

                 # VOLATILITY orders only
                 volatility=volatility,
                 volatilityType=volatilityType,
                 continuousUpdate=continuousUpdate,
                 referencePriceType=referencePriceType,
                 deltaNeutralOrderType=deltaNeutralOrderType,
                 deltaNeutralAuxPrice=deltaNeutralAuxPrice,

                 # COMBO orders
                 basisPoints=basisPoints,
                 basisPointsType=basisPointsType,

                 # SCALE orders
                 scaleInitLevelSize=scaleInitLevelSize,
                 scaleSubsLevelSize=scaleSubsLevelSize,
                 scalePriceIncrement=scalePriceIncrement,

                 # Clearing info
                 account=account,
                 settlingFirm=settlingFirm,
                 clearingAccount=clearingAccount,
                 clearingIntent=clearingIntent,

                 # Algo Orders Only
                 algoStrategy=algoStrategy,
                 algoParams=algoParams,

                 # what if
                 whatIf=as.character(as.integer(whatIf)),

                 # Not Held
                 notHeld=as.character(as.integer(notHeld))
                ),
            class='twsOrder'
           )
}


`print.twsOrder` <-
function(x, ...) {
  str(unclass(x))
}

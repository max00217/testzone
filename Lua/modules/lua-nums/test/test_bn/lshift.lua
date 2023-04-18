local fail = false

print("Test: lshift...")

if a << a ~= bn("14763491377757814916505300588607708251291923044869171915030841961008924029091840") then
    print("\tFail: a << a")
    fail = true
end

if na << a ~= bn("-14763491377757814916505300588607708251291923044869171915030841961008924029091840") then
    print("\tFail: na << a")
    fail = true
end

if b << a ~= bn("7147659765135024208858786730721124411201030918908851507242456427459720856421598157124309880635293433856") then
    print("\tFail: b << a")
    fail = true
end

if b << na ~= nil then
    print("\tFail: b << na")
    fail = true
end

if b << d ~= nil then
    print("\tFail: b << d")
    fail = true
end

if c << 709 ~= bn("6894565328877484123410910259288642244510141386356390441121586745270248609280269775160825002429760"..
    "73479223111693916991352080883023896091539947888937618883326765331077022147490374177752073413947198182949091512336515072")
then
    print("\tFail: c << 709")
    fail = true
end

if nc << 709 ~= bn("-6894565328877484123410910259288642244510141386356390441121586745270248609280269775160825002429760"..
    "73479223111693916991352080883023896091539947888937618883326765331077022147490374177752073413947198182949091512336515072")
then
    print("\tFail: c << 709")
    fail = true
end

if nd << 32767 ~= bn("-5417196617203834875675746334385562734273164975966228632269011267759072254977128521695165627649"..
    "596421083099075805268408721491293623896834907264391173624371573631393844492601631403467218220112394366198248079"..
    "725174119622473769239705676124053250704246901747355874584835044575934727048653132524454252992581250765910837402"..
    "035484881187024360836810942180593651488213903083811716983516761642164415395314665286664777460463269382271638536"..
    "206306904449020302565041392417713797580055171036688160382665255624408714725032660257895160285892272745662399818"..
    "790747421919302669873772487119923582752648821550904634610416193973427120954037642357709141920006464794773524345"..
    "757966228030303290797860015265012314941723056042793173912383156432236391043670057259584441706803432516991004551"..
    "623020820678536075180493873824617733446584780062741028378325099239295945331598017956788111171047932711048946525"..
    "773253845809955087203474828344924933120724220264260926312106559661579747167957357063728490060354911896931808447"..
    "773351894382588290896800522018825969316322712427587622215941139459904784172862290217015288583810967442606752523"..
    "158126531957779333572471119731539371449334783273010768567622426106507286703715128146320980945062372512347283339"..
    "942338861346627100513692747923455950638706297089438014551955244904901163406052614045004617630878188511029181659"..
    "739986363078326890651351631894352926707172258497553982259751009473433871649441367594920934045175070185214158477"..
    "392688113470565865817543822965952135329495405771790467032415371288537038384522430097053924600529329511335967028"..
    "498617350567438247832080942160301484736006462457685790716586611483594057160376781250302345238106236520515396799"..
    "993905517144480488628574565485230337912178039710780754443393986999252099002722787465060830191401273575406684834"..
    "746880887571023557518619256948612527952244676646028701291937614569010568074079332444861047440326860277382646470"..
    "443367715334083894342976877790883581676321710472649136948570521249540620735285172629789233304586635024782219449"..
    "372188063544663293255975981970378899706895740208226325075565615304721735154851963420063806398579927390250234408"..
    "856251236290277887231949023498183297808041522361570691518688520003609913121959711209273831372722983529066248884"..
    "006803082163527711499111760088638902574388453366524499744721961085332097423345406404552892257547499795067833870"..
    "823064102867168689601632247443275282847527261416899181415848045242129879128352765921262139928974485841119406054"..
    "459290431586554656468864519838595872665524469508365698208075135815959951213452705710005918889321016781994857046"..
    "061741239059606629646321979376359435692515761606493461536145576914865851363332338661335838706009028763471885664"..
    "230004470416079369866236009595787350273049842860292883534385187946797601225656080796446897357229744415473481692"..
    "955199212555794364728023256997032409999262919159777488409188945172497066763785730546724350925861445604835235971"..
    "233006947955881525245739947009690814926988638414999076509056761037188483994162737605165353969210269308547782504"..
    "473183340615201373445602392813517229802024118115268356067492797128636015523692494479977045224299490193272705229"..
    "810778955203134427937702827966186680872446386184949291931247821531138489726496185707322888165197981661533179134"..
    "491650302197403341446188964815804996657606525161007744979506050041113825522496537264113315541487677278635506003"..
    "646715738006163042001774542009425542534509419853532071656568251279986900711074779885586599887946833176601427182"..
    "598999839417428891901906360039722059250784611104796416918659404365045466087053503812842406811617019164181309154"..
    "472236085269830087055594865193597393151948199836125710845626187037124391805683876954581954408284034224028906767"..
    "294982174063729506132238573011673268007677237457361480351190347381115982180579669144442857455966287979463927183"..
    "732302810344516551790683146781562092964455189696077698560758406747108647367438377845660435900603746861478081542"..
    "555955327832186851282479581417022404829960870061812630093235839639918417282738414379164656859667046441318129139"..
    "939760553818681260371578829235129687385068184585671173783636496612163764314180016067064977053826636022373114297"..
    "140987172389588888151953559043235702060313676556167230489424088695940539734016117108553333189430676777696112032"..
    "658548441987917880842861946024834168379793091703362265026289859035032876907230911706666980710590790110117471238"..
    "542915392782708036785969134628545686424819393619828301936807124907806992923584889950901027739848687411745759239"..
    "782303684431420478201060713975470661455239053135269827485026199876525516034385267884350326957192274616096188579"..
    "029020604535162518431089368481222602563108007168857316065882281945225333448372415190195237850390771723090111633"..
    "235330911492870102927078580872344040326432164596393252596127513016005798367034057440550030242528367928810347381"..
    "880744949985574857231887839452143940050849516408847157328153448787707521330330416040856025112007194563868803045"..
    "455354294523432418183074765230434704575047496795287338024643885730466635807561424719619389162941215549146023781"..
    "612286795436286487674851206617120169920911615023844762447655311089603750594429135281663469700364217364983300345"..
    "136354520999419251036234501711964454815577756613500147328607534757159952785222698844122576060744382523932401464"..
    "257829129580256415902814187202791009951752836434953174210142387905898853032410882229816266144795698303591013754"..
    "451921948205979020979597790077333390136753041233718356860914972674980089786960804319598927582674892371045095024"..
    "855626812142352523108755869234914564789573555236243400076731383846701586456092646922522255090621109141046561489"..
    "336570829923176762868682205566723746783804520218462570329374833695025669695917970982056644040016975955596829753"..
    "946604553976985552386576112463349797835821595149998634398720370862974601866837298016861768864861069106108361509"..
    "320851432043951205521346570989805928227471968721339563270912725861136539058518814099415345541425115970421545704"..
    "907131199595608061108196235731611139515761172916715488990453714412956488405427999503211910885484459126009026468"..
    "642061927697730860960119943851285331043440891267403232355044454222988268931830803798704333547169166666536712090"..
    "548061349363434173681542725663424633993387300058207337136835325683767297065341191820357196741120819808851314946"..
    "767411566928132805749764870046537152896075898556758528403660898422284262343498195175992863778176299207607867881"..
    "605702302941067091831788740528783036575816599329921270694302176218670943064849135447540385132655564710988467639"..
    "264954572642197008380295924019672830770794747667246904790536015992315535315560200499480349422037350115674305017"..
    "835558963391290013756046084283848887033035121961515011983813697870393603547399206707108691589442660286542842251"..
    "021956784740863370685484683586136403654661107388146111441432275279012091332947027926907216277599501529663987775"..
    "456359950956960699576278869743159767120967700528544687535813143603021779501642582997182892999144195705645558199"..
    "960575930156073533306260844144701908241595272196741711053464067203863724415997499161917440909419847844208746138"..
    "650773462208649720479599242376988303228475824290299922459035837469905793720965997883428056011772764570786843339"..
    "559974667870371199235906739922761862186271185456459550398419495459873103381140017984196438083093818064792164217"..
    "588202114108095518892843357872352183869254414627823188451761043200301842199804641101589442369479914880573884232"..
    "914228303416361757136794022752365521835130760076216279362534224307752444421178772914618795742220414382465244934"..
    "484521101365519270628728731317965180651713561391939557408735963479359584009734281918852822203971705619897243674"..
    "687381144059330095796971466879538511604146467037597866099704440461111728226532338034203231885694602505600945803"..
    "636137240102327481917137081055512838794911027089901443937001703868443114348909418038431695773372501522305102124"..
    "833953431187053955113502076506870084239457167717694526893458786297825034444854167442667922008124097722589203323"..
    "906972901885975192560461587505749383655166979741571650475965311878548448871566098449249377923892381855182215172"..
    "305777227936914018194731665769074097237636374972141518228658268359834296982887177268852700305226375972279067445"..
    "208990391405474845127673298632863140064527331973478241209681618760032891635797148927553823186307440136346286947"..
    "793485179149082247502859568936026260797053971050206434657294112127560250840623294632238855364319120859129065483"..
    "043833017946576038973087514223893913299984635435403931718149488037554611186771330003233383654125055249559872821"..
    "354069756305132639423690045613839993293498410925319639217410182435855421323914715635196536284248494659278786683"..
    "835946855800033557336778877083774644351450340279291111479848697688341588186303344383171895100198584666320289615"..
    "667864471801928026820557395126203771701875333978434447736329000245613724099503933314340403154155838876738579681"..
    "337926801278526115192941177195681933027769832090635601839712229179112525243619806970461452668967142978958080871"..
    "768680429882479687207567375026035330253630515422599547643967744447002128623935384403035510411020727660565638531"..
    "444363866252322872187396077917694555956804564169971432252648371110132096804907207371163672206431190408128026898"..
    "406799166687198956787339887485649757901901137566083894978615345801173724443685411779386290010621836820022617161"..
    "308482076226368995113557111497273848795152174569079597613366757117970580980495079748614521126732041108176557989"..
    "297585883495074600815293160181561352602351684697551207986857019936824813396799478143944889106275040827224171331"..
    "931530299775070093114946186210578592364938701290331957244401462610060478850645005437678211097330570639997182842"..
    "014855807059462578119985508127337099368929893452464581865123800443915821835462805074660451596631024634235527825"..
    "644732632464426013944073551142433400524035790759493178490423194833677789700742284195733250325936234253321156940"..
    "160055102648290146119114873850991728848079394843314927824148850665919534722698474446848020191649235483962877072"..
    "12415722398498655010331557888L")
then
    print("\tFail: nd << 32767")
    fail = true
end

if a << 24 << 33 ~= bn("36749372959343247360") then
    print("\tFail: a << 24 << 33")
    fail = true
end

if not fail then
    print("\tPass")
end


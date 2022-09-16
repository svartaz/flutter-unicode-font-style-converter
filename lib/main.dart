import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    themeMode: ThemeMode.system,
    home: UnicodeTextStyle(),
  ));
}

class UnicodeTextStyle extends StatefulWidget {
  const UnicodeTextStyle({super.key});

  @override
  UnicodeTextStyleState createState() => UnicodeTextStyleState();
}

class UnicodeTextStyleState extends State<UnicodeTextStyle> {
  String _input = '';
  String _style = '';
  String _case = '';
  String _output = '';

  final stylesLatn = <String, String>{
    'normal': 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
    'serif italic':
        '𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍𝑎𝑏𝑐𝑑𝑒𝑓𝑔ℎ𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧',
    'serif bold':
        '𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳',
    'serif bold italic':
        '𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛',
    'sans-serif':
        '𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓',
    'sans-serif bold':
        '𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇',
    'sans-serif italic':
        '𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻',
    'sans-serif bold italic':
        '𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯',
    'fraktur':
        '𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷',
    'fraktur bold':
        '𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟',
    'script':
        '𝒜ℬ𝒞𝒟ℰℱ𝒢ℋℐ𝒥𝒦ℒℳ𝒩𝒪𝒫𝒬ℛ𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵𝒶𝒷𝒸𝒹ℯ𝒻ℊ𝒽𝒾𝒿𝓀𝓁𝓂𝓃ℴ𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏',
    'script bold':
        '𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃',
    'monospace':
        '𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣',
    'double':
        '𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫',
  };

  final stylesGrek = <String, String>{
    'normal': 'ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρςστυφχψω',
    'serif bold':
        '𝚨𝚩𝚪𝚫𝚬𝚭𝚮𝚯𝚰𝚱𝚲𝚳𝚴𝚵𝚶𝚷𝚸𝚺𝚻𝚼𝚽𝚾𝚿𝛀𝛂𝛃𝛄𝛅𝛆𝛇𝛈𝛉𝛊𝛋𝛌𝛍𝛎𝛏𝛐𝛑𝛒𝛓𝛔𝛕𝛖𝛗𝛘𝛙𝛚',
    'serif italic':
        '𝛢𝛣𝛤𝛥𝛦𝛧𝛨𝛩𝛪𝛫𝛬𝛭𝛮𝛯𝛰𝛱𝛲𝛴𝛵𝛶𝛷𝛸𝛹𝛺𝛼𝛽𝛾𝛿𝜀𝜁𝜂𝜃𝜄𝜅𝜆𝜇𝜈𝜉𝜊𝜋𝜌𝜍𝜎𝜏𝜐𝜑𝜒𝜓𝜔',
    'serif bold italic':
        '𝜜𝜝𝜞𝜟𝜠𝜡𝜢𝜣𝜤𝜥𝜦𝜧𝜨𝜩𝜪𝜫𝜬𝜮𝜯𝜰𝜱𝜲𝜳𝜴𝜶𝜷𝜸𝜹𝜺𝜻𝜼𝜽𝜾𝜿𝝀𝝁𝝂𝝃𝝄𝝅𝝆𝝇𝝈𝝉𝝊𝝋𝝌𝝍𝝎',
    'sans-serif bold':
        '𝝖𝝗𝝘𝝙𝝚𝝛𝝜𝝝𝝞𝝟𝝠𝝡𝝢𝝣𝝤𝝥𝝦𝝨𝝩𝝪𝝫𝝬𝝭𝝮𝝰𝝱𝝲𝝳𝝴𝝵𝝶𝝷𝝸𝝹𝝺𝝻𝝼𝝽𝝾𝝿𝞀𝞁𝞂𝞃𝞄𝞅𝞆𝞇𝞈',
    'sans-serif bold italic':
        '𝞐𝞑𝞒𝞓𝞔𝞕𝞖𝞗𝞘𝞙𝞚𝞛𝞜𝞝𝞞𝞟𝞠𝞢𝞣𝞤𝞥𝞦𝞧𝞨𝞪𝞫𝞬𝞭𝞮𝞯𝞰𝞱𝞲𝞳𝞴𝞵𝞶𝞷𝞸𝞹𝞺𝞻𝞼𝞽𝞾𝞿𝟀𝟁𝟂',
  };

  final stylesNum = <String, String>{
    'normal': '0123456789',
    'serif bold': '𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗',
    'sans-serif': '𝟢𝟣𝟤𝟥𝟦𝟧𝟨𝟩𝟪𝟫',
    'sans-serif bold': '𝟬𝟭𝟮𝟯𝟰𝟱𝟲𝟳𝟴𝟵',
    'monospace': '𝟶𝟷𝟸𝟹𝟺𝟻𝟼𝟽𝟾𝟿',
    'double': '𝟘𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡',
  };

  final cases = ['as-is', 'majuscule', 'minuscule'];

  UnicodeTextStyleState() {
    _input =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghiıjȷklmnopqrstuvwxyz\nΑΒΓΔΕϜΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεϝζηθικλμνξοπρςστυφχψω\n0123456789';
    _style = stylesLatn.keys.toList()[1];
    _case = '';
    _output = '';

    onChanged();
  }

  void onChanged() {
    String s = _input;

    if (_case == 'majuscule') {
      s = s.toUpperCase();
    } else if (_case == 'minuscule') {
      s = s.toLowerCase();
    }

    if (_style != '') {
      for (var styles in [stylesLatn, stylesGrek, stylesNum]) {
        if (styles.containsKey(_style)) {
          styles['normal']!.characters.toList().asMap().forEach((i, c) {
            s = s.replaceAll(RegExp(c), styles[_style]!.characters.toList()[i]);
          });
        }
      }
    }

    if (_style == 'serif bold') {
      s = s.replaceAll(RegExp('Ϝ'), '𝟊').replaceAll(RegExp('ϝ'), '𝟋');
    } else if (_style == 'serif italic') {
      s = s.replaceAll(RegExp('ı'), '𝚤').replaceAll(RegExp('ȷ'), '𝚥');
    }

    _output = s;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('unicode font style converter'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: _input,
              maxLines: null,
              onChanged: (String text) {
                setState(() {
                  _input = text;
                });
                onChanged();
              },
            ),
            DropdownButton(
              value: _style.isEmpty ? stylesLatn.keys.toList()[0] : _style,
              items: stylesLatn.keys
                  .map<DropdownMenuItem<String>>((String s) => DropdownMenuItem(
                        child: Text(s),
                        value: s,
                      ))
                  .toList(),
              onChanged: (String? style) {
                setState(() {
                  _style = style!;
                });
                onChanged();
              },
            ),
            DropdownButton(
              value: _case.isEmpty ? cases[0] : _case,
              items: cases
                  .map((kase) => DropdownMenuItem(
                        child: Text(kase),
                        value: kase,
                      ))
                  .toList(),
              onChanged: (String? kase) {
                setState(() {
                  _case = kase == null ? '' : kase!;
                });
                onChanged();
              },
            ),
            SelectableText(
              _output,
            ),
            TextButton(
              child: const Text('copy'),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _output)).then((value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('copied.')));
                });
              },
            )
          ],
        )),
      );
}

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questins.dart';

class Result extends StatelessWidget {
  const Result(this._selectedAnss, this.restart, {super.key});
  final List<String> _selectedAnss;
  final Function() restart;
  get _summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < _selectedAnss.length; i++) {
      summary.add({
        'Question index': i + 1,
        'Question': questions[i].text,
        'Correct Answer': questions[i].answers[0],
        'User Answer': _selectedAnss[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var nOfCorrectAns = _summaryData
        .where((element) => element['User Answer'] == element['Correct Answer'])
        .length;
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'You got $nOfCorrectAns out of ${questions.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 350,
            child: SingleChildScrollView(
              child: Column(children: [
                ..._summaryData.map(
                  (ans) => Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                ans['User Answer'] == ans['Correct Answer']
                                    ? const Color.fromARGB(255, 65, 178, 68)
                                    : const Color.fromARGB(255, 222, 38, 25),
                            radius: 15,
                            child: Text(ans['Question index'].toString()),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ans['Question'].toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 7,
                                ),
                                if (ans['User Answer'] != ans['Correct Answer'])
                                  Text(ans['User Answer'].toString(),
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 66, 67, 87),
                                          fontSize: 15)),
                                Text(ans['Correct Answer'].toString(),
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 12, 173, 12),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.black,
            ),
            label: const Text(
              'Restart Quiz',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          )
        ],
      ),
    );
  }
}

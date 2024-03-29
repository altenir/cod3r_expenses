import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.10,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  // padding: const EdgeInsets.all(16.0),
                                  primary: Theme.of(context).errorColor,
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () => onRemove(tr.id),
                                child: const Text('Excluir'),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Theme.of(context).errorColor,
                                onPressed: () => onRemove(tr.id),
                              ),
                            ],
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
            },
          );
  }
}

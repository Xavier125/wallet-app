import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_app/configs/app_colors.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardActions = [
      {
        'icon': Icons.show_chart,
        'name': 'Manage limits',
        'description': 'Change card daily limit',
        'mode': ActionMode.navigator,
        'onNavigate': () {
          print('Navigating to Transfer Money');
        },
      },
      {
        'icon': Icons.compare_arrows,
        'name': 'Online transactions',
        'description': 'Allow transactions without a physical card',
        'mode': ActionMode.toggle,
        'onToggle': (bool value) {
          print('Online transactions toggled: $value');
        },
      },
      {
        'icon': Icons.lock,
        'name': 'Card Lock',
        'description': 'Keep your card secure',
        'mode': ActionMode.toggle,
        'onToggle': (bool value) {
          print('Card Lock toggled: $value');
        },
      },
      {
        'icon': Icons.notifications,
        'name': 'Notifications',
        'description': null,
        'mode': ActionMode.toggle,
        'onToggle': (bool value) {
          print('Notifications toggled: $value');
        },
      },
    ];

    void showCardDetails(BuildContext context) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return const SingleChildScrollView(child: CardDetailsModal());
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.accentColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 16.0),
                child: Column(
                  children: [
                    const Center(
                      child: CardFront(),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 1,
                            offset: Offset(0, 4.0),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => showCardDetails(context),
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: AppColors.primaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.credit_card,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Text(
                                'Card details',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: AppColors.primaryColor,
                                ),
                                child: const Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Freeze card',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: AppColors.primaryColor,
                                ),
                                child: const Icon(
                                  Icons.library_books,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Transactions',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Manage card',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cardActions.length,
                            itemBuilder: (context, index) {
                              final action = cardActions[index];
                              return ManageCardAction(
                                iconData: action['icon'],
                                actionName: action['name'],
                                actionDescription: action['description'],
                                actionMode: action['mode'],
                                onNavigate:
                                    action['onNavigate'] as VoidCallback?,
                                onToggle: action['onToggle'] as Function(bool)?,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardFront extends StatelessWidget {
  const CardFront({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB867C9),
            Color(0xFFECDCE4),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.contactless_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
            Column(
              children: [
                const Text(
                  'Xavier\'s Card',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 0),
                ),
                Image.asset(
                  'assets/logo/logo.png',
                  fit: BoxFit.fill,
                  width: 70,
                  height: 70,
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Debit Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardBack extends StatelessWidget {
  const CardBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB867C9),
            Color(0xFFECDCE4),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.credit_card,
                color: Colors.white,
                size: 32,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CARD HOLDER',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Xavier',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CARD NUMBER',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '1234 5678 9012 3456',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VALID THRU',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'CVV',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '12/24',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '123',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailsModal extends StatelessWidget {
  const CardDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const FlipCard(
            front: CardFront(),
            back: CardBack(),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.black.withOpacity(0.45),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Number',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            '1234 5678 9012 3456',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        Clipboard.setData(
                          const ClipboardData(text: '1234 5678 9012 3456'),
                        );
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 20.0,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry date',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            '12/24',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        Clipboard.setData(
                          const ClipboardData(text: '12/24'),
                        );
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 20.0,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            '123',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        Clipboard.setData(
                          const ClipboardData(text: '123'),
                        );
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 20.0,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum ActionMode { navigator, toggle }

class ManageCardAction extends StatefulWidget {
  final IconData iconData;
  final String actionName;
  final String? actionDescription;
  final ActionMode actionMode;
  final Function? onToggle;
  final VoidCallback? onNavigate;

  const ManageCardAction({
    super.key,
    required this.iconData,
    required this.actionName,
    this.actionDescription,
    required this.actionMode,
    this.onToggle,
    this.onNavigate,
  });

  @override
  State<ManageCardAction> createState() => _ManageCardActionState();
}

class _ManageCardActionState extends State<ManageCardAction> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(
              widget.iconData,
              color: Colors.black45,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.actionName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
                if (widget.actionDescription != null)
                  Text(
                    widget.actionDescription!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                      height: 1,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          widget.actionMode == ActionMode.navigator
              ? GestureDetector(
                  onTap: widget.onNavigate,
                  child: const Icon(
                    Icons.chevron_right,
                    size: 24,
                  ),
                )
              : Transform.scale(
                  scale: 0.75,
                  child: Switch(
                    value: _isToggled,
                    onChanged: (value) {
                      setState(() {
                        _isToggled = value;
                      });
                      if (widget.onToggle != null) {
                        widget.onToggle!(value);
                      }
                    },
                    activeColor: AppColors.primaryColor,
                    inactiveTrackColor: AppColors.accentColor,
                    inactiveThumbColor: Colors.black45,
                    trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.transparent; // No outline when active
                        }
                        return Colors.transparent; // No outline when inactive
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

.. _card_fb4cgg3:

FB4CGG3/FB2CGG3 cards
---------------------

FB4CGG3/FB2CGG3 cards by Silicom are supported in the NDK.

Build instructions
^^^^^^^^^^^^^^^^^^

- Go to ``build/fb4cgg3/`` folder in application repository.
- Check or modify ``user_const.tcl`` file, where you can change the firmware configuration.
- Run firmware build in Vivado by ``make`` command.
    - Use ``make 100g2`` command for firmware with 2x100GbE for FB2CGG3 card (default).
    - Use ``make 100g4`` command for firmware with 4x100GbE for FB4CGG3 card.
- After the build is complete, you will find bitstream in the same folder.

.. note::

    To build firmware, you must have Xilinx Vivado installed, including a valid license.

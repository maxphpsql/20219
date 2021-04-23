<?php
include("entete.php");
?>

<?php echo form_open(); ?>

<table cellpadding="6" cellspacing="1" style="width:100%; border=0;">

        <tr>
                <th>Quantité(s)</th>
                <th style="text-align:center">Désignation</th>
                <th style="text-align:right">Prix Unitaire</th>
                <th style="text-align:right">Prix Total</th>
        </tr>

        <?php $i = 1; ?>

        <?php foreach ($this->cart->contents() as $items): ?>

        <?php echo form_hidden($i.'[rowid]', $items['rowid']); ?>

        <tr>
                <td><?php echo form_input(array('name' => $i.'[qty]', 'value' => $items['qty'], 'maxlength' => '3', 'size' => '5', 'type' => 'number')); ?>
                </td>
                <td style="text-align:center">
                        <?php echo $items['name']; ?>

                        <?php if ($this->cart->has_options($items['rowid']) == TRUE): ?>

                        <p>
                                <?php foreach ($this->cart->product_options($items['rowid']) as $option_name => $option_value): ?>

                                <strong><?php echo $option_name; ?>:</strong> <?php echo $option_value; ?><br />

                                <?php endforeach; ?>
                        </p>

                        <?php endif; ?>

                </td>
                <td style="text-align:right"><?php echo $this->cart->format_number($items['price']); ?>€</td>
                <td style="text-align:right"><?php echo $this->cart->format_number($items['subtotal']); ?>€</td>
        </tr>

        <?php $i++; ?>

        <?php endforeach; ?>

        <tr>
                <td colspan="2"> </td>
                <td class="right"><strong>Total</strong></td>
                <td class="right"><?php echo $this->cart->format_number($this->cart->total()); ?>€</td>
        </tr>

</table>

<p><?php echo form_submit('', 'Update your Cart'); ?></p>

<?php
include("pieddepage.php");
?>
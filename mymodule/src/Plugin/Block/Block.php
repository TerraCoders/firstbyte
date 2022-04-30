<?php

namespace Drupal\mymodule\Plugin\Block;

use Drupal\Core\Block\BlockBase;
  
/**
 * Provides a block.
 *
 * @Block(
 *   id = "mymodule_block",
 *   admin_label = @Translation("Mymodule Block"),
 *   category = @Translation("A custom block")
 * )
 */
class MymoduleBlock extends BlockBase {
    /**
    * {@inheritdoc}
    */
    public function build() {
        return array(
            '#type' => 'markup',
            '#prefix' => '<div id="mymodule">',
            '#markup' => 'Some markup',
            '#suffix' => '</div>',
        );
    }
}
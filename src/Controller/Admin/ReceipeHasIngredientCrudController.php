<?php

namespace App\Controller\Admin;

use App\Entity\ReceipeHasIngredient;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ReceipeHasIngredientCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return ReceipeHasIngredient::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            AssociationField::new('receipe'),
            AssociationField::new('ingredient'),
            AssociationField::new('unit'),
            NumberField::new('quantity'),
        ];
    }
}

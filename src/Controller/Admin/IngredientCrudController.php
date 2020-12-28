<?php

namespace App\Controller\Admin;

use App\Entity\Ingredient;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class IngredientCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Ingredient::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', 'Nom'),
            AssociationField::new('category'),
            NumberField::new('carb', 'Glucides'),
            NumberField::new('fiber', 'dont fibres'),
            NumberField::new('sugar', 'dont sucre'),
            NumberField::new('protein', 'Protéines'),
            NumberField::new('fat', 'Lipides'),
            NumberField::new('kcal', 'Kilo calories'),
            NumberField::new('quantityFor', 'Valeur pour'),
            AssociationField::new('unit', 'Unité'),
            TextField::new('comment', 'Commentaire'),
        ];
    }
}

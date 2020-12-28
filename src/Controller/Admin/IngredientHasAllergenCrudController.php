<?php

namespace App\Controller\Admin;

use App\Entity\IngredientHasAllergen;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class IngredientHasAllergenCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return IngredientHasAllergen::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            AssociationField::new('ingredient'),
            AssociationField::new('allergen'),
        ];
    }
}

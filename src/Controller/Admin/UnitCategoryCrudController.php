<?php

namespace App\Controller\Admin;

use App\Entity\UnitCategory;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class UnitCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return UnitCategory::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}

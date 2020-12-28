<?php

namespace App\Repository;

use App\Entity\ReceipeHasIngredient;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReceipeHasIngredient|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReceipeHasIngredient|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReceipeHasIngredient[]    findAll()
 * @method ReceipeHasIngredient[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReceipeHasIngredientRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReceipeHasIngredient::class);
    }

    // /**
    //  * @return ReceipeHasIngredient[] Returns an array of ReceipeHasIngredient objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ReceipeHasIngredient
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}

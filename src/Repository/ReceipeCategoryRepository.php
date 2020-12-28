<?php

namespace App\Repository;

use App\Entity\ReceipeCategory;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method ReceipeCategory|null find($id, $lockMode = null, $lockVersion = null)
 * @method ReceipeCategory|null findOneBy(array $criteria, array $orderBy = null)
 * @method ReceipeCategory[]    findAll()
 * @method ReceipeCategory[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ReceipeCategoryRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ReceipeCategory::class);
    }

    // /**
    //  * @return ReceipeCategory[] Returns an array of ReceipeCategory objects
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
    public function findOneBySomeField($value): ?ReceipeCategory
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

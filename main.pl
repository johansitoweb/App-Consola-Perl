use strict;
use warnings;

# Estructura para representar una tarea
my @tareas;

sub agregar_tarea {
    print "Ingrese el título de la tarea: ";
    my $titulo = <STDIN>;
    chomp $titulo;
    print "Ingrese la descripción (opcional): ";
    my $descripcion = <STDIN>;
    chomp $descripcion;
    push @tareas, { titulo => $titulo, descripcion => $descripcion };
    print "Tarea agregada correctamente.\n";
}

sub listar_tareas {
    if (@tareas) {
        print "Lista de tareas:\n";
        for my $i (0 .. $#tareas) {
            print "$i. ${tareas[$i]{titulo}}\n";
        }
    } else {
        print "No hay tareas.\n";
    }
}

sub eliminar_tarea {
    print "Ingrese el índice de la tarea a eliminar: ";
    my $indice = <STDIN>;
    chomp $indice;
    if ($indice >= 0 && $indice < scalar @tareas) {
        splice @tareas, $indice, 1;
        print "Tarea eliminada.\n";
    } else {
        print "Índice inválido.\n";
    }
}

sub actualizar_tarea {
    listar_tareas();
    print "Ingrese el índice de la tarea a actualizar: ";
    my $indice = <STDIN>;
    chomp $indice;
    if ($indice >= 0 && $indice < scalar @tareas) {
        print "Ingrese el nuevo título: ";
        $tareas[$indice]{titulo} = <STDIN>;
        chomp $tareas[$indice]{titulo};
        print "Ingrese la nueva descripción: ";
        $tareas[$indice]{descripcion} = <STDIN>;
        chomp $tareas[$indice]{descripcion};
        print "Tarea actualizada.\n";
    } else {
        print "Índice inválido.\n";
    }
}

# Menú principal
while (1) {
    print "\nMenú:\n";
    print "1. Agregar tarea\n";
    print "2. Listar tareas\n";
    print "3. Eliminar tarea\n";
    print "4. Actualizar tarea\n";
    print "0. Salir\n";
    print "Ingrese una opción: ";
    my $opcion = <STDIN>;
    chomp $opcion;

    if ($opcion eq "1") {
        agregar_tarea();
    } elsif ($opcion eq "2") {
        listar_tareas();
    } elsif ($opcion eq "3") {
        eliminar_tarea();
    } elsif ($opcion eq "4") {
        actualizar_tarea();
    } elsif ($opcion eq "0") {
        last;
    } else {
        print "Opción inválida.\n";
    }
}
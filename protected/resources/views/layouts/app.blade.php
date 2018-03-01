<?php
use App\CekAkses;
use hoaaah\LaravelMenu\Menu;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_token" content="{!! csrf_token() !!}"/>

    <meta name="description" content="Sistem Perencanaan yang dikembangkan oleh Tim Simda BPKP">
    <meta name="author" content="Tim Simda BPKP">
    <link rel="icon" href="{{asset('simda-favicon.ico')}}">

    <title>simd@Perencanaan</title>

    <!-- Styles -->
    
    {{-- <script src="https://use.fontawesome.com/1417cae13b.js"></script> --}}

    {{-- <link rel="stylesheet" href="https://use.fontawesome.com/1417cae13b.css"> --}}
    <link href="{{ asset('css/font-awesome.min.css') }}" rel='stylesheet' type='text/css'>
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/jquery.dataTables.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/jquery-ui.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/metisMenu/metisMenu.min.css')}}" rel="stylesheet">
    <link href="{{ asset('css/sb-admin-2.css')}}" rel="stylesheet">
    <link href="{{ asset('css/dataTables.bootstrap.css') }}" rel="stylesheet">
    <link href="{{ asset('css/dataTables.fontAwesome.css') }}" rel="stylesheet">
    
    @yield('head')
    <style>
        h1.padding {
        padding-right: 1cm;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> 
                    <a class="navbar-brand navbar-right" href="{{ url('/home') }}">
                    <span class="fa-stack">
                      <i class="fa fa-square-o fa-stack-2x text-info"></i>
                      <i class="fa fa-home fa-stack-1x"></i>
                    </span> simd@<strong>Perencanaan</strong> <span class="badge"> ver 1.0 </span></a>
                </div>
                    <ul class="nav navbar-top-links pull-right">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    User <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu dropdown-user" role="menu">
                                    <li>
                                        <a href="{{ route('register') }}">Register</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('login') }}">Login</a>
                                    </li>
                                </ul>
                            </li>
                        @else
                            <li>
                                <a>
                                    <i class="fa fa-flag fa-fw"></i> Tahun Anggaran: <?= Session::get('tahun') != NULL ? Session::get('tahun') : 'Pilih!' ?></i>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    <i class="fa fa-user fa-fw"></i> {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu dropdown-user" role="menu">
                                    <li>
                                        <a href="{{ url('/home') }}"><i class="fa fa-home fa-fw text-info"></i> Home</a>
                                        <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                            <i class="fa fa-sign-out fa-fw text-info"></i> Logout</a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>

                   <div class="navbar-default sidebar" role="navigation">
                        <?php
                            $akses = new CekAkses();
                            $menu = new Menu();
                            $menu->render([
                                'options' => [
                                    'ulId' => 'side-menu'
                                ],
                                // 'label' => 'RKPD dan Renja',
                                'items' => [
                                    [   'label' => 'Modul RKPD dan Renja',
                                        'visible' => $akses->get(4) || $akses->get(5),
                                        'icon'=>'fa fa-tasks fa-fw fa-lg', 
                                        'url' => '/rkpd/dash'],
                                    [
                                        'label' => 'RKPD', 
                                        'visible' => $akses->get(4) || $akses->get(5),
                                        'items' => [
                                            [
                                                'label' => 'Rancangan Awal RKPD',
                                                'visible' => $akses->get(401) || $akses->get(402),
                                                'items' => [
                                                    ['label' => 'Load Data Tahunan RPJMD', 'url' => '/ranwalrkpd/loadData', 'visible' => $akses->get(401)],
                                                    ['label' => 'Rancangan Awal RKPD', 'url' => '/ranwalrkpd', 'visible' => $akses->get(402)],
                                                    ['label' => 'Dokumen Ranwal RKPD', 'url' => '/ranwalrkpd/Dokumen','visible' => $akses->get(401)],
                                                ]
                                            ],
                                            [
                                                'label' => 'Rancangan RKPD',
                                                'visible' => $akses->get(403) || $akses->get(404) || $akses->get(502),
                                                'items' => [
                                                    ['label' => 'Load Data Forum PD', 'url' => '/rancanganrkpd/loadData', 'visible' => $akses->get(403)],
                                                    ['label' => 'Rancangan RKPD', 'url' => '/rancanganrkpd', 'visible' => $akses->get(404)],
                                                    // ['label' => 'Penyesuaian PD', 'url' => '#', 'visible' => $akses->get(502)],
                                                    // ['label' => 'Dokumen Rancangan RKPD', 'url' => '#', 'visible' => $akses->get(403)],
                                                ]
                                            ],
                                            [
                                                'label' => 'Rancangan Akhir RKPD',
                                                'visible' => $akses->get(405) || $akses->get(406) || $akses->get(502),
                                                'items' => [
                                                    ['label' => 'Load Musrenbang RKPD', 'url' => '/ranhirrkpd/loadData', 'visible' => $akses->get(405)],
                                                    ['label' => 'Rancangan Akhir RKPD', 'url' => '/ranhirrkpd', 'visible' => $akses->get(406)],
                                                    // ['label' => 'Penyesuaian PD', 'url' => '#', 'visible' => $akses->get(502)],
                                                    ['label' => 'Dokumen Ranhir RKPD', 'url' => '/ranhirrkpd/Dokumen', 'visible' => $akses->get(406)],
                                                ]
                                            ],
                                            [
                                                'label' => 'RKPD Final',
                                                'visible' => $akses->get(408) || $akses->get(407) || $akses->get(502),
                                                'items' => [
                                                    ['label' => 'Load Ranhir RKPD', 'url' => '/rkpd/loadData', 'visible' => $akses->get(407)],
                                                    ['label' => 'RKPD Final', 'url' => '/rkpd', 'visible' => $akses->get(408)],
                                                    // ['label' => 'Penyesuaian PD', 'url' => '#', 'visible' => $akses->get(502)],
                                                    ['label' => 'Dokumen RKPD Final', 'url' => '/rkpd/Dokumen', 'visible' => $akses->get(408)],
                                                ]
                                            ],
                                        ]
                                    ],                                    
                                    [
                                        'label' => 'Renja Perangkat Daerah',
                                        'visible' => $akses->get(5),
                                        'items' => [
                                            [
                                                'label' => 'Rancangan Awal Renja',
                                                'visible' => $akses->get(501) || $akses->get(502),
                                                'items' => [
                                                    ['label' => 'Load Data Rancangan Awal Renja', 'url' => '/ranwalrenja/loadData', 'visible' => $akses->get(501)],
                                                    ['label' => 'Rancangan Awal Renja', 'url' => '/ranwalrenja/sesuai', 'visible' => $akses->get(502)],
                                                    ['label' => 'Dokumen Ranwal Renja', 'url' => '/ranwalrenja/dokumen', 'visible' => $akses->get(501)],
                                                ]
                                            ],
                                            [
                                                'label' => 'Rancangan Renja',
                                                'visible' => $akses->get(501) || $akses->get(502),
                                                'items' => [
                                                    ['label' => 'Load Data Rancangan Renja', 'url' => '/renja/loadData', 'visible' => $akses->get(501)],
                                                    ['label' => 'Rancangan Renja', 'url' => '/renja', 'visible' => $akses->get(502)],
                                                    ['label' => 'Dokumen Rancangan Renja', 'url' => '/renja/dokumen', 'visible' => $akses->get(502)],
                                                ]
                                            ],
                                            [
                                                'label' => 'Renja Final',
                                                'visible' => $akses->get(503) || $akses->get(401) || $akses->get(504),
                                                'items' => [
                                                    ['label' => 'Load Data RKPD Final', 'url' => '/renjafinal/loadData', 'visible' => $akses->get(503)],
                                                    ['label' => 'Renja Final', 'url' => '/renjafinal', 'visible' => $akses->get(504)],
                                                    ['label' => 'Dokumen Renja Final', 'url' => '/renjafinal/dokumen', 'visible' => $akses->get(504)],
                                                ]
                                            ],
                                            
                                        ]
                                    ],
                                    ['label' => 'Pokok Pikiran DPRD',
                                        'visible' => $akses->get(5) || $akses->get(4), 
                                        'items' => [
                                            ['label' => 'Pokok Pikiran DPRD', 'url' => '/pokir', 'visible' => $akses->get(503)],
                                            ['label' => 'Verifikasi Pokir', 'url' => '/pokir/verpokir', 'visible' => $akses->get(401)],
                                            ['label' => 'Tindak Lanjut Unit', 'url' => '/pokir/tlpokir', 'visible' => $akses->get(502)],
                                        ]
                                    ],
                                    [ 'label' => 'Forum Perangkat Daerah', 'visible' => $akses->get(606) || $akses->get(607),
                                       'items' => [
                                            ['label' => 'Load Rancangan Awal', 'url' => '/forumskpd/loadData', 'visible' => $akses->get(606)],
                                            ['label' => 'Forum Perangkat Daerah', 'url' => '/forumskpd', 'visible' => $akses->get(607)],
                                        ]
                                    ],
                                    [
                                        'label' => 'Musrenbang RKPD', 
                                        'visible' => $akses->get(6),
                                        'items' => [
                                            [
                                                'label' => 'Kecamatan',
                                                'visible' => $akses->get(601) || $akses->get(602) || $akses->get(604) || $akses->get(605),
                                                'items' => [
                                                    ['label' => 'Usulan RW', 'url' => '/musrenrw', 'visible' =>  $akses->get(601)],
                                                    ['label' => 'Usulan Desa', 'url' => '/musrendes', 'visible' => $akses->get(603)],
                                                    // ['label' => 'Posting Usulan Desa', 'url' => '/musrendes/loadData', 'visible' => $akses->get(602)],
                                                    ['label' => 'Load Usulan Desa', 'url' => '/musrencam/loadData', 'visible' => $akses->get(605)],
                                                    ['label' => 'Musrenbang', 'url' => '/musrencam', 'visible' => $akses->get(605)],
                                                    // ['label' => 'Posting Musrenbang', 'url' => '/musrencam/postingData', 'visible' => $akses->get(604)],
                                                ]
                                            ],
                                            [
                                                'label' => 'Kota/Kabupaten',
                                                'visible' => $akses->get(608) || $akses->get(609) || $akses->get(607),
                                                'items' => [
                                                    ['label' => 'Load Rancangan RKPD', 'url' => '/musrenrkpd/loadData', 'visible' => $akses->get(608)],
                                                    ['label' => 'Musrenbang RKPD', 'url' => '/musrenrkpd', 'visible' => $akses->get(609)],
                                                    // ['label' => 'Penyesuaian PD', 'url' => '#', 'visible' => $akses->get(607)],
                                                ]
                                            ],
                                        ]
                                    ],
                                    [
                                        'label' => 'Pencetakan RKPD &Renja',
                                        'visible' => $akses->get(30) || $akses->get(20),
                                        'items' => [
                                            ['label' => 'Cetak RPJMD', 'url' => '/', 'visible' => $akses->get(20)],
                                            ['label' => 'Cetak Renstra', 'url' => '/', 'visible' => $akses->get(30)],
                                        ]
                                    ],
                                ]
                            ]);
                        ?>
                        
                    </div>
        </nav>

        <div id="page-wrapper">
            <br>
            @yield('content')
        </div>

    </div>

        <script src="{{ asset('/js/jquery.min.js')}}"></script>
        <script src="{{ asset('/js/jquery-ui.js')}}"></script>
        <script src="{{ asset('/js/bootstrap.min.js')}}"></script>
        <script src="{{ asset('/js/handlebars.js')}}"></script>
        <script src="{{ asset('/js/jquery.dataTables.min.js') }}"></script>
        <script src="{{ asset('/js/dataTables.bootstrap.min.js') }}"></script>
        <script src="{{ asset('/js/dataTables.responsive.min.js') }}"></script>
        <script src="{{ asset('/js/input.js')}}"></script>
        <script src="{{ asset('/js/jquery.number.js')}}"></script>
        <script src="{{ asset('vendor/metisMenu/metisMenu.min.js')}}"></script>
        <script src="{{ asset('/js/sb-admin-2.js')}}"></script>


        @yield('scripts')

</body>
</html>

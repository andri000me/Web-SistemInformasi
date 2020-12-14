<?php
session_start();
include 'koneksi.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Menu Dosen</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		* {
			font-family: 'Quicksand', sans-serif;
			--text-primary: black;
			--text-secondary: #fff;
			--bg-primary: #b1e9ed;
			--bg-secondary: #517173;
			--transition-speed: 600ms;
		}

		.fakeimg {
			height: 200px;
			background: #aaa;
		}
	</style>
</head>

<body>
	<div class="container-fluid">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs bg-light">
			<a class="navbar-brand mr-7">
				<img src="img/ulul.png" width="250px">
			</a>
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#Profil">Profil</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#Materi">Materi</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#Nilai">Nilai</a>
			</li>
			<ul class="navbar-nav ml-auto">
				<a href="#" class="btn btn-outline-danger mr-3">Logout</a>
			</ul>
		</ul>
		<div class="tab-content">
			<div id="Profil" class="tab-pane container active">
				<br>
				<h3>SELAMAT DATANG, (Nama Dosen)!</h3>
				<br><br>
				<img class="img-fluid" src="img/images.png" width="150"><br><br>
				<table class="table">
					<tbody>
						<tr>
							<td>Nama</td>
							<td><?php
								$query_1 = "SELECT * FROM pengajar where id_pengajar=1";
								$h_1 = mysqli_query($koneksi, $query_1);
								while ($c = mysqli_fetch_array($h_1)) {
									echo $c['nama_pengajar']; ?></td>
						</tr>
						<tr>
							<td>NIP</td>
							<td><?php echo $c['id_pengajar']; ?></td>
						</tr>
						<tr>
							<td>Tempat, tanggal lahir</td>
							<td><?php echo $c['ttl_dosen']; ?></td>
						</tr>
						<tr>
							<td>Alamat</td>
							<td><?php echo $c['alamat_dosen']; ?></td>
						</tr>
					<?php
								}
					?>
					</tbody>
				</table>
			</div>
			<div id="Materi" class="tab-pane container fade">
				<br>
				<h3>List Materi</h3>
				<br>
				<button type="button" class="btn btn-primary" onclick="window.location.href='add_materi.php'" method=GET>Tambah Materi</button>
				<br><br>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>No.</th>
							<th>Mata Kuliah</th>
							<th>Kelas</th>
							<th>Pertemuan</th>
							<th>Materi</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>

						<?php
						$no = 1;
						$q_pertemuan = "SELECT * FROM pertemuan, matkul, kelas, pengajar WHERE pertemuan.id_matkul = matkul.id_matkul AND pertemuan.id_pengajar = pengajar.id_pengajar AND pertemuan.id_kelas = kelas.id_kelas AND pengajar.id_pengajar = '1'";
						$res_pertemuan = mysqli_query($koneksi, $q_pertemuan);
						while ($data = mysqli_fetch_array($res_pertemuan)) :
						?>
									<tr>
										<td><?= $no ?></td>
										<td><?= $data['nama_matkul'] ?></td>
										<td><?= $data['nama_kelas'] ?></td>
										<td><?= $data['pertemuan'] ?></td>
										<td><?= $data['materi'] ?></td>
										<td> <a class="btn btn-primary" href="edit_materi.php?id=<?=$data['id_pertemuan']?>">Edit</a> | <a class="btn btn-danger" href="delete_materi.php?id=<?=$data['id_pertemuan']?>">Delete</a> </td>
									</tr>
						<?php
								$no++;
								endwhile;
						?>

					</tbody>
				</table>
			</div>

			<!-- amu sampek kene ae-->

			<div id="Nilai" class="tab-pane container fade">
				<br>
				<h3>Lembar Penilaian</h3>
				<br>
				<div class="container">
					<div class="btn-group">
						<button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">Pilih Kelas</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Kelas A</a>
							<a class="dropdown-item" href="#">Kelas B</a>
						</div>
					</div>

					<div class="btn-group">
						<button type="button" class="btn btn-outline-primary dropdown-toggle" data-toggle="dropdown">Pilih Materi</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Materi 1</a>
							<a class="dropdown-item" href="#">Materi 2</a>
						</div>
					</div>

					<button type="button" class="btn btn-primary">Ok</button>

				</div><br>

				<table class="table table-striped">
					<thead>
						<tr>
							<th>No.</th>
							<th>NIM Mahasiswa</th>
							<th>Nama Mahasiswa</th>
							<th>Nilai</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<?php
						//query ke database SELECT tabel mahasiswa urut berdasarkan id yang paling besar
						$sql = mysqli_query($koneksi, "SELECT * FROM nilai ORDER BY id_mhs DESC") or die(mysqli_error($koneksi));
						//jika query diatas menghasilkan nilai > 0 maka menjalankan script di bawah if...
						if (mysqli_num_rows($sql) > 0) {
							//membuat variabel $no untuk menyimpan nomor urut
							$no = 1;
							//melakukan perulangan while dengan dari dari query $sql
							while ($data = mysqli_fetch_assoc($sql)) {
								//menampilkan data perulangan
								echo '
											<tr>
											<td>' . $no . '</td>
											<td>' . $data['id_mhs'] . '</td>
											<td>' . $data['nm_mhs'] . '</td>
											<td>' . $data['nilai'] . '</td>
											<td>
											<a href="ubah.php"><button type="button" class="btn btn-info">Ubah Nilai</button></a>

											</td>
											</tr>
											';
								$no++;
							}
						} else {
							echo '
										<tr>
										<td colspan="6">Tidak ada data.</td>
										</tr>
										';
						}
						?>
						<!-- <tr>
							<td>1.</td>
							<td>(NIM Mahasiswa 1)</td>
							<td>(Nama Mahasiswa 1)</td>
							<td></td>
							<td>
								<input type="text" class="form-control form-control-sm"><br>
								<a href="tambah.php"><button type="button" class="btn btn-primary">Submit Nilai</button></a>
							</td>
						</tr>
						<tr>
							<td>2.</td>
							<td>(NIM Mahasiswa 2)</td>
							<td>(Nama Mahasiswa 2)</td>
							<td>80</td>
							<td>
								<input type="text" class="form-control form-control-sm"><br>
								<a href="ubah.php"><button type="button" class="btn btn-info">Ubah Nilai</button></a>
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>

</html>
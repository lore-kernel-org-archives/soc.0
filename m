Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352683C9898
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391664; cv=none; b=DqJAbzGoN0b2ifHv8iGCGHzewEudIJhTvT8RTJ3V70BxPoLkfsnJKKtjTCnsMHN1/5W+32ZyquzVwB4MCG+1V7Uk51eekPrHPjrVd9HbgMlOvd/w0//P9xitmEM4w1fB1vezqIZFy9wn+xkZDfmb5OcNqNed6v7QyVXInShF+1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391664; c=relaxed/simple;
	bh=vCFSwJoi5ogOjplJDdhhqISDeGFms4ZxZKdpge0zlyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgIV17ZLxcNzx3khRt7tRgJ5l33VyhabNd2DPCoovICKeoGVFp9ETc4V6Qh+6r/P1eUUgaP+k5O333j4K8T/W0OAMpv6iaU0Gy3sWfNECSgN9IB5wuF+fnb6TWvXUlsz/5HxtYwRzbs+O50jMbmkxVsYsFq03qumQDlI3aEh4fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnJbnEBn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnJbnEBn"
Received: by smtp.kernel.org (Postfix)
	id 30C571F00898; Tue,  2 Jun 2026 09:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268771F00893;
	Tue,  2 Jun 2026 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391663;
	bh=vtlReEb+fitYDnn2AECwEnIKcGiaa/0Qcud+2B4xY04=;
	h=Date:From:To:Cc:Subject;
	b=XnJbnEBnEikSpe7xzBasBpNsfePZbYmDD4XSHbcEHrP83Paq0aICBPassN36RJwDw
	 0ysgoLJaqlJyTcLCcwGSXQsFYXDon3yLjs/tSHkejW4v+ert5TECJSllmdmxaR9xhi
	 g5noy9dLAx1CY8dCAAHDoPtaU1WBQlmDiQstgnJS5D/OzlhjjNihvGjUUDF0LIYlrf
	 9yFS6gajyPfNfWZd11etmuwb8Ct9mjLrzcSO6nTLaWu/47PwDluoS8Z/gBIioWLqDL
	 DHMMAZGjouOzjaKuyRhohAfnlvpgn6cuTZMwpYz3xfb1a+djoSY4OHD9WNo8AVjQ5v
	 Z+37HR+32R4hw==
Date: Tue, 2 Jun 2026 10:14:20 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V soc fixes for v7.1-rc7
Message-ID: <20260602-brought-impaired-e5cc81043a9e@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kZxeEu5T5ohTJHqe"
Content-Disposition: inline


--kZxeEu5T5ohTJHqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Please pull a single minor fix.

Cheers,
Conor.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v7.1-rc7

for you to fetch changes up to 75ef233975589d9a8c88bc8822a7c725c71ff650:

  soc: microchip: mpfs-sys-controller: fix resource leak on probe error (2026-05-14 21:03:34 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v7.1-rc7

Microchip:
Fix a resource leak in an unlikely probe failure case.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Felix Gu (1):
      soc: microchip: mpfs-sys-controller: fix resource leak on probe error

 drivers/soc/microchip/mpfs-sys-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--kZxeEu5T5ohTJHqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah6e7AAKCRB4tDGHoIJi
0twHAP4l+t/k8RmJleiq+9W6StNpGFdjnATo/PGRBbTCqDVbsAD+O2ZK/BQCpOVJ
IcTS2uJAv/rJOSxEcUHmrQ/JqMzSbAs=
=V7+B
-----END PGP SIGNATURE-----

--kZxeEu5T5ohTJHqe--

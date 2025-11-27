Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3A32D7DC8
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261414; cv=none; b=VVZ6XDuX4k3wILU7BQF/pfZgsyDOaqCUzG3JAV90wpfMUh3pX74wMh/EBMp5jCVSjF761JqdVIRX0bSOKatDi6gnJ8iWynrkWOWwwKBsbmAVl0H2/mD4QUHi4o53jjxYJ7c9dXpvkj2+BdI3o3UwU9I3kLe2hWJT5tmiKtmffzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261414; c=relaxed/simple;
	bh=Aa6TofsDgEtlr/eVXyb0tnk9QiuGSJrfHim0d0dEtuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kEpNntg7+EOnrP8yRpaD2N3y05bgTBdmcb5u9DWwrvr8NChU3zYgpxTbtT4zIUCrGZ8uWFUg3vu+dFub28VDyxPLOxLxwuw5VT04PsW3fpPKFzjV4Nd0QoT+6hKz4k7AKSBcWyTvcXfM9N6hegWqIi2KsR2L5WAF0ZDJCfw+la4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvXxf7DA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvXxf7DA"
Received: by smtp.kernel.org (Postfix)
	id 783E7C116C6; Thu, 27 Nov 2025 16:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96888C4CEF8;
	Thu, 27 Nov 2025 16:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764261414;
	bh=Aa6TofsDgEtlr/eVXyb0tnk9QiuGSJrfHim0d0dEtuU=;
	h=Date:From:To:Cc:Subject:From;
	b=NvXxf7DANd4/o5pEdsxmGwFcmVANV5Hnxf2Q22nrM7BaZrreYTx4KjiXR23SNOsMI
	 secQiWLAWlau+7eXACzzOuoufutI/jlbiq9cnFnDLmts5FG68LIX3/UPqUJNcrDy1w
	 n0LgSt/JiINJD0gu0HXPsvfCyto9jLvQtSl0Ju/yJ6wokD1VpkCdS92pyAEHG/EHUy
	 nsOBJXZkdX22b7Leu8EDgLRMasWByiDtX+Auu4OjxQ5HQjW7Jpii2HFLPvx3KD4I4z
	 fHy4L+GvBnJWAAqEHearF4rc0vz2qthDQRTtaWCwKNf3jPyx2Qtygb3e7s0zoQEuFJ
	 DFFnz4ba30hfg==
Date: Thu, 27 Nov 2025 16:36:51 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V config for v6.19
Message-ID: <20251127-saturate-slam-ab92576bcca7@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d0a3FAk5e90PPeWm"
Content-Disposition: inline


--d0a3FAk5e90PPeWm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

On behalf of the spacemit platform maintainers, I grabbed a config
option, so here it is. It's the only thing I have config wise this
time around.

Cheers,
Conor.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.19

for you to fetch changes up to 3187e25eb2705dec9f0509f6e42da7e018718c74:

  riscv: defconfig: enable SPI_FSL_QUADSPI as a module (2025-11-12 11:26:51 +0000)

----------------------------------------------------------------
RISC-V config for v6.19

Spacemit:
The Spacemit k1 wants the freescale qspi driver enabled as a module
as they appear to be rather similar IPs.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Alex Elder (1):
      riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

--d0a3FAk5e90PPeWm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSh+IwAKCRB4tDGHoIJi
0iJMAP0aRCYPja92Y3M72E7oDltBp2qgEIk2bxJ2S873n8H6LgD9El+Vagf/hr1N
bAzmTjiFY6AahhQHcTavEeJ3aa4zKgk=
=T+S3
-----END PGP SIGNATURE-----

--d0a3FAk5e90PPeWm--

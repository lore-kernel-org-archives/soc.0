Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33A3CBE80
	for <soc@lists.linux.dev>; Thu, 13 Aug 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636674; cv=none; b=eBtU//gClI3C+wNF371zvQayn5C32IHx/vcQBjS0qykzhjud/HQjYHF1al4L3AlMubqNV0OC4WEPijDow8iXJfatA3q3VSCIxwYXP/Kovdw6w4n8ogDAzB6LHzAfAsOv/LTjQkRWdz4pDWUby5TJA2cRMibnqU77GAbMviqkXJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636674; c=relaxed/simple;
	bh=x/xxQwCDf4sWB/o5Y/RyWTaabVfJB3d4nIUW0ql7kdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzuoxwRo6+daLY3/AtsB59463PXLnunseXI2GE+SAR95gUokT4wwW2wBGnvtfoZAj6mSTqlZji7GDAFFe4T7u79hE0ODn6GMOSyJrzjtZYfBR4Fp3ZzCvnKSXF3XVOHBNNPU31r7oqC+skFSlyFEufZNpgaD4/LiYTjftXQbCYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyx0/qFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyx0/qFI"
Received: by smtp.kernel.org (Postfix)
	id 342B91F00A3A; Thu, 13 Aug 2026 15:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1DC1F000E9;
	Thu, 13 Aug 2026 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636673;
	bh=7pQ1Cj33ViLGWVEK+BZVkmyXNycEFNHwPZJ2Ny5L2YY=;
	h=Date:From:To:Cc:Subject;
	b=nyx0/qFIXq7XgpF9dSmIJTgWxCnxA0/Kbomptfoc3px/p3LpLV6iHbXb2UdcwhlBk
	 V5Je4UwCEOvRO2HFvSerSL/z8DifwzbgySHFWzuSSNbpEi3KW7CVw3K6kCmAVAbyUl
	 zbxw4i7FcQp+VpSi7lnJeXjNIK9aZAC5zC+nRVpCHmG3IvGDtjWpBIv2Ti09pX6xMF
	 t1i738ImiH5Z3TjCzGlh9qtkncUMw/bMIpjMcOOah9NZ4wde8yfhWYHQd8sbwwOS/F
	 mwwX6LQ/CkrVNtkA2M8AairPFBi96DfIWxO/f61+J7xB7edYaEplxsOrpnT/aomf/u
	 UlSRSHcWQSraA==
Date: Thu, 13 Aug 2026 16:57:49 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, jic23@kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] standalone cache drivers for v7.3
Message-ID: <20260813-cope-smugness-dd4de191bdda@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yjjGQ/tRemjDV3og"
Content-Disposition: inline

--yjjGQ/tRemjDV3og
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

Barely worth a PR, but this minor cleanup patch is the only thing I have
across all my branches for this release, given that the Canaan k230 got merged
earlier in the cycle.
I know it's a bit late, but given how trivial this is I hope that's okay.

Cheers,
Conor.

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/conor/linux tags/cache-for-v7.3

for you to fetch changes up to 8a5d6c13cc7cf7f7f096094c5015c82b2fb36131:

  cache: hisi_soc_hha: use named initializers for acpi_device_id (2026-08-10 15:55:20 +0100)

----------------------------------------------------------------
standalone cache drivers for v7.3

HiSilicon:
A minor cleanup using named initialisers in the hha driver.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Pawel Zalewski (The Capable Hub) (1):
      cache: hisi_soc_hha: use named initializers for acpi_device_id

 drivers/cache/hisi_soc_hha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--yjjGQ/tRemjDV3og
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan3pfQAKCRB4tDGHoIJi
0gw6AP44MfFnAfCKQdPCmi9Tn15Wnus9xd7XqJGQO3say6VehQEAmU2YApMKPZh9
WG6wtDUTRfY2jqTmJhu7CcNOq+gA8gI=
=r43d
-----END PGP SIGNATURE-----

--yjjGQ/tRemjDV3og--

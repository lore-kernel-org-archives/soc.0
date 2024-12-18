Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34B145B1D
	for <soc@lists.linux.dev>; Wed, 18 Dec 2024 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537705; cv=none; b=J4px4cA0+i6Y8tF4gTdFRww4ldZtRbArZ+qr3hZz5+1mxmPZMCg3K5n8j4r2/04V73p9rJKpbmzMMJYYiPI5UZDiAyeCnou8u6ri+sT3Ey3ILCo30EbrC/hBM/WgW6UI5WJk0nN5WNCJdHyptZdZ/LiRecgM3IgyaPTJRPR5lhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537705; c=relaxed/simple;
	bh=qdHW5otulf4HTDNiE0pQJd0SuyNYYOBuZ/0SONWab5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kgJww3GreYG+xKFnpF8zVZoJQknTiEMHRv9W1e8QyJAdQwLPeSnHV62VnY8lw9gLnybZ3c4G17TC3FMyH1GWX2GJoPdTUNpSNXD/hXBU7f7u8RbigeVF9wQe79J0lHzUknaSnVCBAD7TuyqyNZBFbJok/V6PFMHKDmFYo+bbvqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lymIAex1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lymIAex1"
Received: by smtp.kernel.org (Postfix)
	id 75820C4CED4; Wed, 18 Dec 2024 16:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97471C4CECD;
	Wed, 18 Dec 2024 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734537704;
	bh=qdHW5otulf4HTDNiE0pQJd0SuyNYYOBuZ/0SONWab5E=;
	h=Date:From:To:Cc:Subject:From;
	b=lymIAex14ih5MQHuwJMiehdr06kY5uLpWZHewta62uSRYgPnbaIVSkOQY8CII+IU2
	 vjlqLx/XmFxNq3yqvHObuXWW/3pJd2y3MFVRL9lbMTpRmSc8dJNfYtqxqG6Fdvi/Sh
	 9R+kHhVC6WsZauYlEJjngSfFFLMXcQXuOl7LU6UP0kfJsjA/eRyeHSDmddffi9pb0l
	 +5sNQSIKvOJHf+Wpmb+quvsjV1RCAn7sxne6eym8v9nbPHEihk7GMGMLrqVuEoHIUZ
	 fYsywgBsUg7snItv8PJWNxRiWLUcU89O7P6Sjafhx0lq/7a5axVN4Hp1ZxLF78jZGN
	 DZehxgL4RkbIQ==
Date: Wed, 18 Dec 2024 16:01:41 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc driver fixes for v6.13-rc4
Message-ID: <20241218-suffrage-unfazed-fa0113072a42@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D+ozCC79uGWzFle7"
Content-Disposition: inline


--D+ozCC79uGWzFle7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

I know you sent a PR already this, so whenever you're sending another
here's a patch for you :)

Cheers,
Conor.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.13-rc4

for you to fetch changes up to 48808b55b07c3cea64805267a5547f03e6452a9f:

  firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state() (2024-12-05 15:08:51 +0000)

----------------------------------------------------------------
RISC-V soc driver fixes for v6.13-rc4

A single fix for the Auto Update driver, where a mistake in array
indexing (accessing as a u32 rather than a u8) caused the driver to read
the wrong feature disable bits.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Valentina Fernandez (1):
      firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()

 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--D+ozCC79uGWzFle7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2Lx5QAKCRB4tDGHoIJi
0utfAP91310tbtmnNBMMiMB0g6+daa1t2HdSspG6/Nj0d9DTVgD/c8Uz3Dyv87nq
SkbDI9ndbUCTJTu+k332RYcFqQJa8QU=
=6CbS
-----END PGP SIGNATURE-----

--D+ozCC79uGWzFle7--

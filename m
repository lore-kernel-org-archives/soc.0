Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97C41CEAD0
	for <soc@lists.linux.dev>; Mon, 13 Jan 2025 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796905; cv=none; b=OiLKO/GJpnsb6lfvv50kTiJO7ze9c1fyFlWy/GNUz2fTKpKzpXyEsqY3494rI7mmQhsyj3np6B/BUekhZJInxNA7nUJer5+zbtdOmvL6aOmImeRg164EoR62q13ADLqBtzThUua7dviC8J83kX7ujzuLQTld+PK6Kqb7SPmVLSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796905; c=relaxed/simple;
	bh=LNPRUlUhY5X4l38jufusldSu8m0yDc9nEltVinBbZ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=El+9bcD77v3/KIlUA7t4aicb7aDoSuvlP4I01GUCwrgN9vQq8B0N/LZ//T5AR/ncs52nYHbBMi0ZlSxtIrvgkESNIXF03L6WvIGUz+0slFaM/FV0JLDm982Jhb47hTHzX4yMMaa4bvRcy/0U7tspbUepU5lO4Twtc4vJG2YY/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBnAEFtD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBnAEFtD"
Received: by smtp.kernel.org (Postfix)
	id 56CEEC4CEE2; Mon, 13 Jan 2025 19:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE36C4CEE1;
	Mon, 13 Jan 2025 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736796905;
	bh=LNPRUlUhY5X4l38jufusldSu8m0yDc9nEltVinBbZ0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=NBnAEFtD8cO4/AZtZG0RFfZhstjHu8NTA9hDGwTj1LC2AE8wbgeRCfCSjNbSHKIkS
	 xVbnPW3rCWPyYPY+pVhAHnehbG4GQgxZD2IQSUnpDBQRGeYqJJq7cHgYuoUjupDYvU
	 Ffvj0+UwVJKQ6uOGCAYIO2xq9cK9sp+5KR+eWODu3xJpD9HljkHTOVI0ocYXEgbuXv
	 SFSBlkPWaPdl7YtdYxv2PUhyHAlSoFdotavnnUk7egaT9+0+HnjS/OX26auOn00EwG
	 W6/L4V14JAqWnjTP/FKtdeMMjRct/lQw/z6KOCOwFs4rpsCghzshkkF5nbYpMfJUSe
	 dn83r55j+7AMg==
Date: Mon, 13 Jan 2025 19:35:02 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] StarFive Devicetrees for v6.14
Message-ID: <20250113-kennel-outplayed-21a52a654c36@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GwHu556FBBtAye50"
Content-Disposition: inline


--GwHu556FBBtAye50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd,

Very little here, but apologies for it being kinda late. Ended up
dislocating my jaw between Christmas and New Years, so been kinda
out of it.

Cheers,
Conor.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.14

for you to fetch changes up to 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c:

  riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function (2024-12-02 19:06:40 +0000)

----------------------------------------------------------------
~RISC-V~ StarFive Devicetrees for v6.14

Not so much RISC-V, but rather StarFive, this time around as there are
only two changes: the Milk-V Mars and Pine64 Star64 boards get their usb0
interfaces moved from peripheral to host mode.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (2):
      riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function
      riscv: dts: starfive: jh7110-milkv-mars: enable usb0 host function

 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts    | 18 +++++++++++++++++-
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 18 +++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

--GwHu556FBBtAye50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4Vq5gAKCRB4tDGHoIJi
0vCUAQC8+tM6xqkQ0sQamnGjc9Dv3M5Zowoj/7gl+sD3XiV+RwEA+d/gKlbdQEJi
4DyLfqr72lac3fgmxfkmWvtOpJkbfgs=
=s+QG
-----END PGP SIGNATURE-----

--GwHu556FBBtAye50--

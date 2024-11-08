Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A741E0DEC
	for <soc@lists.linux.dev>; Fri,  8 Nov 2024 09:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058678; cv=none; b=dvnnijymdTB0jsYNPunh4mHwVbDBZiJdi3DgPQnn/1F4NCURRWMiYrKYtwB2XDz7JkrB8sazNA1Fcr1QBB/Yo8TZ9mv5akEFsn6pNPmQQXmpA7V/wQ3Q5EQjDbTRMcUBuLOLzfRoQ/5QfuwCuNg+2wrOC9vEQcwSJPKsuAII5Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058678; c=relaxed/simple;
	bh=/xq32m1EqGR28wC1AgX9th2fAlozUxx1pWbZBTrr/sA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URvE4ahHTqV45FiEGldkWUqWq498b6dk4+GEJmPdvb2/bBHDRpP3vtY054WIfsAmXzcCNR5l4IH3MnK9L5wQceGLdxfI2tY8c7sKZNOacCdkUZrjG3AbGcIZYbNy5EfParWyRO05O0mMmFjNmENB1vBCX2QyXRnmQCPHAHIvcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOFhwkpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOFhwkpO"
Received: by smtp.kernel.org (Postfix)
	id 625A6C4CECE; Fri,  8 Nov 2024 09:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85282C4CECD;
	Fri,  8 Nov 2024 09:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731058678;
	bh=/xq32m1EqGR28wC1AgX9th2fAlozUxx1pWbZBTrr/sA=;
	h=Date:From:To:Cc:Subject:From;
	b=uOFhwkpOOQAcm+pAT9+yJZJaN3cd7VsTGNyqmEq0ymk+EpbpkJ9gsM6isRNUH7u+b
	 LRO8Z7qO0F91gt9ENdqCDnzsgZGGaOrNWdOgK2x8dAg6//1J0KAQ0vBDwRwdqqifGt
	 yXJWp7dWxoldOE6SnH/CuguGJLXnaxfB7BMoCYkxXZBJ4pnk1mavpWhkM0luar2f6p
	 Z572qMjQti6sHQpU6uBCL6/h5JOQECJiugOZjiilAYhdKBO5U2kLp8OtJgM0U9HNxc
	 SOK0PF8O1k9F5elIaAnrqGQ+9PuSoUGmnF1OUdoHknviK9VCfkwQfPimNZ5o7keYz0
	 6H6FS7tIari+A==
Date: Fri, 8 Nov 2024 09:37:55 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetrees for v6.13
Message-ID: <20241108-washboard-material-6b9ff196063d@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FZLg+64WqNyvpcXG"
Content-Disposition: inline


--FZLg+64WqNyvpcXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

Please pull a handful of changes, mostly for StarFive.
Branch is based on rc3 instead of rc1 as I'd usually do, because rc{1,2}
was not booting for me.

Cheers,
Conor.

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-dt-for-v6.13

for you to fetch changes up to c8b72c301dbe71a7a55298d542dff7b2c3612765:

  riscv: dts: starfive: add DeepComputing FML13V01 board device tree (2024-10-31 12:22:53 +0000)

----------------------------------------------------------------
RISC-V Devicetrees for v6.13

StarFive:
Support for the DeepComputing FML13V01, a Framework laptop compatible
with a JH7110. This board is fairly different to the more standard SBCs
offerings that the kernel already supports, so there's also some
refactoring of jh7110-common.dtsi to move out nodes unused on the new
board.

Spacemit:
A vendor prefix I grabbed from the basic support series, since its
dependencies are not yet ready but peripheral drivers have started being
merged.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Guodong Xu (2):
      riscv: dts: starfive: jh7110-common: revised device node
      riscv: dts: starfive: jh7110-common: move usb0 config to board dts

Sandie Cao (3):
      dt-bindings: vendor: add deepcomputing
      dt-bindings: riscv: starfive: add deepcomputing,fml13v01
      riscv: dts: starfive: add DeepComputing FML13V01 board device tree

Yangyu Chen (1):
      dt-bindings: vendor-prefixes: add spacemit

 .../devicetree/bindings/riscv/starfive.yaml        |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  4 ++++
 arch/riscv/boot/dts/starfive/Makefile              |  1 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    | 10 ---------
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts | 17 +++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 22 +++++++++++++++++++
 .../boot/dts/starfive/jh7110-pine64-star64.dts     | 22 +++++++++++++++++++
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 25 ++++++++++++++++++++++
 8 files changed, 92 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts

--FZLg+64WqNyvpcXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZy3b8wAKCRB4tDGHoIJi
0utQAQCSF9dqJxTjp9MWhEbjOcDFgds1awTrkTDJQgpQbXvkZQEAl2q5mEB0buiI
fchglJX2dd4H/IsV8AY7gR8cJKyRjQU=
=ItIu
-----END PGP SIGNATURE-----

--FZLg+64WqNyvpcXG--

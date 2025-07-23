Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D02E8E05
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753281764; cv=none; b=f6/9ivhkb5IvIY7tdMJ/OA0rTb7hgy4yFzmQcvbWl6uxQ3QGCqoDZ6lrROYx+rRvIfstEj3E7s6eyQOvv5yUhnfvHCQ6a3JKPJJl0ZQvxUSmTQEbzHKZfUBIarnkNKSUR2lFI0vK/beFtaGYChgunmq6gf23o+RoJwD6bPZdLWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753281764; c=relaxed/simple;
	bh=R4TxTD7vqNgpLn4WFjTeF2OU0nVam8d8lfKzLvG+H+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bey0aQoq4a4UWKhpIWSj9/HuoaJwJfbtiF5eVr3EcxOlnz4fKbZirZiA7ZT9L7QqyDbZYjihe+gxufuZermEmUmDP4OdJwpZ119JgzaBNaZTfoSEa66Z3yVrTNbV0ZSDC6fAlFy6BXTwc6L6UPHGreEdWd50RmTZ8pOiagYJsDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dG7Qzn0M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dG7Qzn0M"
Received: by smtp.kernel.org (Postfix)
	id 4DF39C4CEF1; Wed, 23 Jul 2025 14:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BC7C4CEE7;
	Wed, 23 Jul 2025 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753281764;
	bh=R4TxTD7vqNgpLn4WFjTeF2OU0nVam8d8lfKzLvG+H+A=;
	h=Date:From:To:Cc:Subject:From;
	b=dG7Qzn0MGSjMZIKcv9BOFVqz1e8A458pQkakADr8f0WiYJYfNFvQdtV4SPnS5WlXi
	 ocTOzwd6OLtPAlx1yfVwHOXwz8ksJUNpuzOx1lSyv6jjyldwJI/DpHA2vrxwhvMqbO
	 bSn5kKLMKlOH27/X0tn1yjiVCX4TCMj6VXs+x4ybPtCofx1EcV/d73UjzZG6VWrn0d
	 ruoDgHSJkM7NAfPXwTSlbqbgcePQ+AXN0ZmV32+zWTM0peOYQ5f+IBECu5JpYV+MJS
	 RsUicaBgf6zrAFd6ANJxONoRXjwGwo9DGSV7z1n4g6/WzDE1MOfVXqMOIsydB3IdX5
	 ZeUjwSIXoUwwg==
Date: Wed, 23 Jul 2025 15:42:41 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Misc Devicetrees for v6.17
Message-ID: <20250723-postage-skylight-597377b5f8e4@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oh9VrmaBMOxopwqN"
Content-Disposition: inline


--oh9VrmaBMOxopwqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Since Linus didn't release v6.17 on Sunday, here's the dts PR I
mentioned. Not too much here, so hopefully not too late to pick it up.

Cheers,
Conor.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-for-v6.17

for you to fetch changes up to 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1:

  dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible (2025-07-22 21:45:40 +0100)

----------------------------------------------------------------
RISC-V Misc Devicetrees for v6.17

StarFive:
Sort properties on the MilkV Mars and add the power status LED to all
jh7110 boards.

AMD:
Add 64-bit Microblaze V cpu compatible.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (2):
      riscv: dts: starfive: jh7110-milkv-mars sort properties
      riscv: dts: starfive: jh7110-common: add status power led node

Michal Simek (1):
      dt-bindings: riscv: cpus: Add AMD MicroBlaze V 64bit compatible

 Documentation/devicetree/bindings/riscv/cpus.yaml  |  1 +
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |  9 +++++++++
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 12 ++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

--oh9VrmaBMOxopwqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaID04QAKCRB4tDGHoIJi
0q7QAPwIGUV/7xxkp/U0km4y5s9VEE8dTgMXY3SmLLo9HvIjxgD/dxAOeeNn1YK4
DBibLFyvnuZODCO4wqZS/vBmEJBqJQ0=
=uzv9
-----END PGP SIGNATURE-----

--oh9VrmaBMOxopwqN--

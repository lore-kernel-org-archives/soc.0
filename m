Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64723369966
	for <soc@lists.linux.dev>; Wed, 19 Nov 2025 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581294; cv=none; b=QgjFkaGjaseBgPQo9CVb/NA84VJHkmjxBa7Wq6cSXjYGsExzGX/5roK7GnY98LTzXNUDphbnNkqCFWsfyNZHJonaHhcTxNRv3foGByMl7YYLO4c4f778+VsjjaCjTCs4Tl6zQdzQXZSJeJhZO8Pp1pT4dAA96CwwMuN6fuhAXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581294; c=relaxed/simple;
	bh=7nhdGzXnCDz38ZWAiBImSPi9KIOdbNklRd6MG6rHbnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hpjvYbpL407xDtDkPtakdusGFcXEjWJ73m+677E4dXE1yLJzhNgZDfr/Ww/xhC9kvElrXkYcyjX8RowTJO4721X0y7jKPAd7UUlP4ykOWuDxd4c4HWq9wL+tjGLMyhVLCtn6b4klghDO/IpTLVtFHvUovk0hlXyHpEkASnfJybk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXYKzvdJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXYKzvdJ"
Received: by smtp.kernel.org (Postfix)
	id 00C4DC116B1; Wed, 19 Nov 2025 19:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA33BC4CEF5;
	Wed, 19 Nov 2025 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763581293;
	bh=7nhdGzXnCDz38ZWAiBImSPi9KIOdbNklRd6MG6rHbnw=;
	h=Date:From:To:Cc:Subject:From;
	b=jXYKzvdJMsObmnZFdLwIbVv6LF8zkYzzmvJF30yj4BsaukXgez79/wO+Psp2Azppn
	 qLQXLXnrI4lPYSGGI2Nie7rwgw6k5Gi4o9WBSRomdJbP5JKGDRo6A69Am4S7UIKO1b
	 MaQNL8ZCumNJ4Y6i8+2yETvGt3r10zGrm4eRXe/SMx7QnvCAZljveK1DLIKcKZzIca
	 cYxdFeWSLpEh54ziGWo6HNotFesTmYQguzbsbydX8YbAcabdMlTkfjo3ldPPhvTTGw
	 aHmbzYTyEnBbfkkhh86LstcO2jOQPiCufBcuJJLrrzYyKzI/KIKTx1TqBqan/mpGNf
	 ObTs1V0TlBRGA==
Date: Wed, 19 Nov 2025 19:41:30 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
	junhui.liu@pigmoral.tech
Subject: [GIT PULL] Anlogic Platform Initial Support
Message-ID: <20251119-sprinkled-setup-ad77396635c9@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OjpAxWcAERh+JVqW"
Content-Disposition: inline


--OjpAxWcAERh+JVqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey folks,

This is my first PR for 6.19, and it's a wee bit in advance of the
others just in case there's some objection that needs reworking.
Krzysztof is probably already aware of what's going on here, but I threw
the toys of the pram over the behaviour of the vendor here, and so
appointed myself maintainer after the submitter decided they were not
comfortable doing so any more. You can read the context here if you like:
https://lore.kernel.org/all/20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pigmoral.tech/
I'm only there as Odd Fixes, and I hope that I can eventually hand this
over to someone who cares about it specifically.
I consider what's here to otherwise be a bit on the premature side, with
no clock, reset or pinctrl drivers, but the submitter of the initial support
is currently working on that and I figured sorting out the maintainer
thing made sending it at this point worthwhile.

Cheers,
Conor.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/anlogic-initial-6.19

for you to fetch changes up to e6195b944089b779f421d390ad3422e05356f275:

  MAINTAINERS: Setup support for Anlogic tree (2025-11-12 17:15:23 +0000)

----------------------------------------------------------------
Initial Anlogic Platform Support

Add bindings for the serial and timer peripherals, and a basic soc dtsi
for the Anlogic dr1v90 SoC. The Milianke MLKPAI FS01 is the first board
for this SoC. Add myself as maintainer for this platform for the time
being.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Conor Dooley (1):
      MAINTAINERS: Setup support for Anlogic tree

Junhui Liu (9):
      dt-bindings: vendor-prefixes: Add Anlogic, Milianke and Nuclei
      dt-bindings: riscv: Add Nuclei UX900 compatibles
      dt-bindings: riscv: Add Anlogic DR1V90
      dt-bindings: timer: Add Anlogic DR1V90 ACLINT MTIMER
      dt-bindings: serial: snps-dw-apb-uart: Add Anlogic DR1V90 uart
      riscv: Add Anlogic SoC famly Kconfig support
      riscv: dts: Add initial Anlogic DR1V90 SoC device tree
      riscv: dts: anlogic: Add Milianke MLKPAI FS01 board
      riscv: defconfig: Enable Anlogic SoC

 Documentation/devicetree/bindings/riscv/anlogic.yaml                  |  27 +++++++++++++++++++++++++++
 Documentation/devicetree/bindings/riscv/cpus.yaml                     |   1 +
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml        |   1 +
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml |  17 +++++++++++------
 Documentation/devicetree/bindings/vendor-prefixes.yaml                |   6 ++++++
 MAINTAINERS                                                           |   8 ++++++++
 arch/riscv/Kconfig.socs                                               |   5 +++++
 arch/riscv/boot/dts/Makefile                                          |   1 +
 arch/riscv/boot/dts/anlogic/Makefile                                  |   2 ++
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts                    |  28 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi                               | 100 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/riscv/configs/defconfig                                          |   1 +
 12 files changed, 191 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/anlogic.yaml
 create mode 100644 arch/riscv/boot/dts/anlogic/Makefile
 create mode 100644 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
 create mode 100644 arch/riscv/boot/dts/anlogic/dr1v90.dtsi

--OjpAxWcAERh+JVqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR4dagAKCRB4tDGHoIJi
0iWdAQCpaMtTUk4n6c5AP6htdMFUEoduw79vsmNFx4FQCaIviQEAvZ1uM89z0bWU
i8Kg6Dwp+PW3fRPJfFvqYzAsUqM/5w4=
=0X2r
-----END PGP SIGNATURE-----

--OjpAxWcAERh+JVqW--

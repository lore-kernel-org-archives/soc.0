Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2CE272E45
	for <soc@lists.linux.dev>; Thu, 20 Nov 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632313; cv=none; b=BEJTWf6O74zRzBXYmHSnLaf1C7JzhYCKUuG7Z/mHIaJt9kWylZl0RkzJ6yYkY4vhM3Hal/PuRgOBiOjWhrODobtK4DO6IZwzy4FhwjivXwcSuK9BzkUMLToOnSNJ/WRxSWXXvtcCwwRQRoKohF/Mj6fKj03+k0Pvo9EMWd1tmHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632313; c=relaxed/simple;
	bh=sEpJLTV9MKyd27FDIefRAGQrW40CCfL3T35VbEh3anQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujq97gKWXFmrWRKhVPHsnDqNxZplcTb4dOJJkOJvhJ6d3w1MN0qomMfs2dvImrCC4EmHyAT5+0J8ThP25F5BoHphtlOEYLY/E8PZGKDAfyy9ip7WbNEe1PucvL+EusuGCwbKcOsax9Rwy/VNtLoN+/OQQplhM+b8Ihzpmo0LW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTgU9e0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTgU9e0S"
Received: by smtp.kernel.org (Postfix)
	id BBF08C116D0; Thu, 20 Nov 2025 09:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA13AC4CEF1;
	Thu, 20 Nov 2025 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763632312;
	bh=sEpJLTV9MKyd27FDIefRAGQrW40CCfL3T35VbEh3anQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTgU9e0S+dVLxImb0b5aulkU7kKgiOztOI3jsNxqkGC0/pS57P+KvC3sj8U35Aq19
	 oxi5usaC/SNDCblomUgrygwOo2Vi/+8JbXjSwaArsfuZVLVi/ZGhai8lNvwAfZxc8s
	 MGt9pZ3/mz1bMdTHxhjAW6jQvVhNkJEbZGSDMasejZvif9lZEg3Rs/hDT+y0+eTgNw
	 Pkt/eMG9IxbhbeWDeLG+EdjTMmKcXXGpAcPmFUH+Dgy95wZE4B8h1BJEB/yrkqd+EN
	 U2j+ZJAexVPIlcRPY2F8g7vCM2yyT6WW/F3jN13eqPlL2M68YrVW3OA/nIL5P4FccT
	 k9i+CInjPxzVQ==
Date: Thu, 20 Nov 2025 09:51:49 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org, junhui.liu@pigmoral.tech
Subject: Re: [GIT PULL] Anlogic Platform Initial Support
Message-ID: <20251120-neglector-helpless-a199ca774354@spud>
References: <20251119-sprinkled-setup-ad77396635c9@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C5c7hLVB7Z8yap+V"
Content-Disposition: inline
In-Reply-To: <20251119-sprinkled-setup-ad77396635c9@spud>


--C5c7hLVB7Z8yap+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 07:41:34PM +0000, Conor Dooley wrote:
> Hey folks,
>=20
> This is my first PR for 6.19, and it's a wee bit in advance of the
> others just in case there's some objection that needs reworking.
> Krzysztof is probably already aware of what's going on here, but I threw
> the toys of the pram over the behaviour of the vendor here, and so
> appointed myself maintainer after the submitter decided they were not
> comfortable doing so any more. You can read the context here if you like:
> https://lore.kernel.org/all/20250922-dr1v90-basic-dt-v2-0-64d28500cb37@pi=
gmoral.tech/
> I'm only there as Odd Fixes, and I hope that I can eventually hand this
> over to someone who cares about it specifically.
> I consider what's here to otherwise be a bit on the premature side, with
> no clock, reset or pinctrl drivers, but the submitter of the initial supp=
ort
> is currently working on that and I figured sorting out the maintainer
> thing made sending it at this point worthwhile.

Stephen pointed out last night that the MAINTAINERS entry was in the
wrong place. Here's an updated PR:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/anl=
ogic-initial-6.19-v2

for you to fetch changes up to d5c3f49b75832553ba0dafabc2d394a885106498:

  MAINTAINERS: Setup support for Anlogic tree (2025-11-20 09:48:13 +0000)

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

 Documentation/devicetree/bindings/riscv/anlogic.yaml                  |  2=
7 +++++++++++++++++++++++++++
 Documentation/devicetree/bindings/riscv/cpus.yaml                     |   =
1 +
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml        |   =
1 +
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml |  1=
7 +++++++++++------
 Documentation/devicetree/bindings/vendor-prefixes.yaml                |   =
6 ++++++
 MAINTAINERS                                                           |   =
8 ++++++++
 arch/riscv/Kconfig.socs                                               |   =
5 +++++
 arch/riscv/boot/dts/Makefile                                          |   =
1 +
 arch/riscv/boot/dts/anlogic/Makefile                                  |   =
2 ++
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts                    |  2=
8 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi                               | 10=
0 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++
 arch/riscv/configs/defconfig                                          |   =
1 +
 12 files changed, 191 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/anlogic.yaml
 create mode 100644 arch/riscv/boot/dts/anlogic/Makefile
 create mode 100644 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dts
 create mode 100644 arch/riscv/boot/dts/anlogic/dr1v90.dtsi

--C5c7hLVB7Z8yap+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR7ktQAKCRB4tDGHoIJi
0nZHAP410x65+ecLgKt6N6zoSnjw5sxyLfsk76rG1tVJq0aNEQD/cm54KR8F6bax
hsJz1WR3VzjNYvbB7UIRhQ/T9ttVAgY=
=GLrs
-----END PGP SIGNATURE-----

--C5c7hLVB7Z8yap+V--

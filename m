Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB053233E8
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 07:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471137; cv=none; b=TRxhY0bx4vIrqGHCsSfbfElYI7rLKKSg921ClK0yocJKJ4tCUH9VBG5Jh0AOIf9Z6VKjwRS6CKc9HcoE8eK0XBhiek+OS+Ig8TUgnaSjM1aKf43h1Oehj7OVW5tiBE7uJeY0bFG5C/vVaOGSVMUYA5yTi0MWIyxM/v65p+bHbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471137; c=relaxed/simple;
	bh=1aUk6zAmNKeEAxeYDjqunvHdsNnK+R7x9lkrn2aEthc=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=LPL7vaJ242FHzHvtLWxOHx98FhtBR7P7Fzu4gs4Ks+pCKKaxypm1/opgitgAwOLxhuGktaE/y646hbvISjHN68mPMv0b8S4CuJMN2sAk3SxCRAlgXK6LUzbwRK1Uy8WHB/dlnY1ZHx8qtrcyCRGWm165wxe7QSgcunHGcdCwH58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NKyx2Cat; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NKyx2Cat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780471127;
	bh=y5M+BHkdRMszwF+UBYD7j3KKopl0PRpBV+LxR571Fz4=;
	h=Subject:From:To:Cc:Date;
	b=NKyx2CatndWRFcz4jUeX3R9F8lteKdztwG4DlJlQ5HB7ZZdsHTr4O3xArvyGt3dv7
	 KHl74V01O88gBB7sP7UH2Ubh0AAQIqnMpZCQ5SJZcG5rhR65cs6rS3N5PstQPhty5C
	 +sv+4+hppj1+avwMSza3zSVQNvSRVyhBUzAht8WBzbMb3tQ3/W1uP34PFHIxc6tsnw
	 74q37neyo0wodQFl3P5FxWlV1/dBpQ1HN0L37UaeVXnJA0FZEmqr/kb+3BdACgw19h
	 U3g+0cLuTwlBAr24dhUWWsI4HBz3KHp3upuBzExVNa2a2k5hP6iizHVePx3D6zhMHc
	 n2/xSwzTbZWDg==
Received: from [IPv6:2405:6e00:2428:1c7f:23a6:ec69:2b14:b7d] (unknown [120.20.104.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B237960087;
	Wed,  3 Jun 2026 15:18:45 +0800 (AWST)
Message-ID: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
Subject: [RESEND,GIT PULL] aspeed: First batch of ARM devicetree changes for
 v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 16:48:43 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi SoC maintainers,

The first attempt[1] missed the preamble, so here's the same again,
this time with it included.

[1]: https://lore.kernel.org/soc/55ab27bc5e09252b1dbfdf1505693eb193b8e846.c=
amel@codeconstruct.com.au/

Cheers,

Andrew

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-devicetree-0

for you to fetch changes up to 1249ee157de518a76cec169e2a5db4d6e523cc90:

  ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename (2026-05-27 1=
2:44:26 +0930)

----------------------------------------------------------------
aspeed: First batch of ARM devicetree changes for v7.2

New platforms:

- Rainiera6 (Meta)
- SanMiguel (Meta)

Updated platforms:

- Anacapa: SGPIO line names and interrupt configuration
- Clemente: Remove TMP421 nodes
- Kommando: Enable networking via MAC2/MDIO2
- SanMiguel: Line names and interrupt configuration

AST2600 SoC updates:

- Describe PWM/Tach
- Describe I3C controllers
- Reorganise I2C nodes

Other notes:

91b9aed7381c ("ARM: dts: aspeed-g6: Add nodes for i3c controllers") current=
ly
causes a new warning:

  ... /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compa=
tible: ['aspeed,ast2600-i3c-global', 'syscon']

The patch necessary to address it has an R-b tag from Kryzsztof[2] but as b=
est
I can tell is yet to be applied to the MFD tree. I've left the change in fo=
r now
as the warning will resolve once the binding patch is applied.

Lastly, as part of improving support for the Kommando card Anirudh has also
addressed[1] the persistent pain we've had with the phy-mode property for t=
he
AST2600 MACs. Thanks to Andrew Lunn for being on the case for a while now, =
and
for those who tested Anirudh's patch.

[1]: https://lore.kernel.org/all/20260525-asus-kommando-v3-0-e6a0ca1b4a3e@g=
mail.com/
[2]: https://lore.kernel.org/all/20260425-poised-accomplished-hyena-d2c1a0@=
quoll/

----------------------------------------------------------------
Anirudh Srinivasan (1):
      ARM: dts: aspeed: Enable networking for Asus Kommando IPMI Card

Billy Tsai (1):
      ARM: dts: aspeed: g6: Add PWM/Tach controller node

Colin Huang (1):
      ARM: dts: aspeed: anacapa: Add JTAG CPLD TRST pin to SGPIO map

Daniel Hsu (1):
      ARM: dts: aspeed: yosemite5: Add MP5998 power monitor

Dawid Glazik (2):
      ARM: dts: aspeed-g6: move i2c controllers directly into apb node
      ARM: dts: aspeed-g6: Add nodes for i3c controllers

Ender Hsieh (1):
      ARM: dts: aspeed: msx4: enable BMC networking via MAC0

Mike Hsieh (1):
      ARM: dts: aspeed: clemente: Remove IOB NIC TMP421 nodes

Neil Cheng (2):
      dt-bindings: arm: aspeed: Add Meta Rainiera6 board
      ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC

Potin Lai (4):
      dt-bindings: arm: aspeed: add Meta SanMiguel BMC
      ARM: dts: aspeed: Add Meta SanMiguel BMC
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

Rex Fu (2):
      ARM: dts: aspeed: anacapa: Add interrupt properties for PDB PCA9555
      ARM: dts: aspeed: anacapa: Correct SGPIO names for monitoring

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml        |    2 +
 arch/arm/boot/dts/aspeed/Makefile                               |    2 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts |   18 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts        |   34 ++-
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts       |   20 --
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts      | 1012 +++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts      |  672 +++=
++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts      |    5 +
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts         |   15 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                         |  552 +++=
+++++++++++++++++++++++------------------
 10 files changed, 2074 insertions(+), 258 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.=
dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.=
dts

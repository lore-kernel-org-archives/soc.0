Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C441A8F
	for <soc@lists.linux.dev>; Fri, 27 Jun 2025 04:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750999325; cv=none; b=JHg/0Php8V/Tn5jI2BIfScU1hRUoVWE3KIpUEWVvUiOTkX8sdqIYrZp8h4qcxgdHKuLpRpF3yG1yAQJue0J78Lch2jsul9m46NFNC0wcws3PAlOiK6c5KX5VJupwbrLgff/E9wArumXUIpPMunlwhFg/eapDEuJaS6G/Tgf2A80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750999325; c=relaxed/simple;
	bh=8Z997JSisHQ67twUlk0vPzrE/fLRQguD8Os4aDa4fmQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rt2AmLWtxMhnCasZ05L7qc9CypuzrMS4tgxiWmaoDU3NbD0YwQtja/9IUJUPDv4opjD+XcPZJzve3aQsC6n5koJm3fC7CV4JN9jrYuP4ItWd88sQkuChwh18QAckNQXcdtf7WCCra153gO1XfAARgZ+MCaRsF0f5uaxSRswoUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=VRiJMeAn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="VRiJMeAn"
Received: by smtp.kernel.org (Postfix)
	id 24076C4CEEB; Fri, 27 Jun 2025 04:42:05 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74449C4CEE3;
	Fri, 27 Jun 2025 04:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74449C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750999321;
	bh=8Z997JSisHQ67twUlk0vPzrE/fLRQguD8Os4aDa4fmQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VRiJMeAn1mpG/VpNerO+d3E5Q8feoyKzgT0MLdcWbO4EXksqB8k8uzVgXf8OGXhv7
	 B3sJDtLJ3N+uf4/UCCQfw1HaUiTimA7YNKkGj1wPFgmnHN/Oq0A8n+LCPXWetI/rW3
	 tyK4sV8NWZ6ZUMtawV82sNgblceoslE5uWXqjj1WOOEfkrI4Gz5dd/R+EqRfDWNIbc
	 lXP3TSUAF7TEbxnl5DZzEPK0QhRhIr9uyq+PV88ECSUU1v7rUMjZG7BVZ7M7pVExcH
	 XBHIbxp28V7BWG5KocE+jRP7Uo6ApfPjofuRQcXJFhqgAamVXFIIrJ2leRuR678fTL
	 TpCN992Ed5zgA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8C8186443C;
	Fri, 27 Jun 2025 12:41:59 +0800 (AWST)
Message-ID: <2b301def81460b686ecb9e0fa05f42e8122419b6.camel@codeconstruct.com.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.16
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
Cc: arm <arm@kernel.org>, soc <soc@kernel.org>
Date: Fri, 27 Jun 2025 14:11:58 +0930
In-Reply-To: <CACPK8XdYLf6s=GtB5bsEw4zj0JjUBob-6GhdJzivX51y+E=KEA@mail.gmail.com>
References: 
	<CACPK8XdYLf6s=GtB5bsEw4zj0JjUBob-6GhdJzivX51y+E=KEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Arnd,

On Mon, 2025-05-19 at 11:42 +0930, Joel Stanley wrote:
> Hi Arnd,
>=20
> Here's the Aspeed pull request for 6.16. Andrew has prepared the
> patches and created the tag, so all credit goes to him.
>=20
> There's a change that Andrew calls out in the tag I didn't really
> like: it breaks old userspace by moving things around. The argument is
> that userspace was "wrong" to be using the paths under /sys. I think
> the cart is leading the horse if we let the yaml checking take a
> higher priority than breaking userspace. But I haven't the time to
> fight that battle, so here we are.
>=20
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
> =C2=A0 Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc
> tags/aspeed-6.16-devicetree
>=20
> for you to fetch changes up to 13c9c6eabf033ed4f369ad4d29bdc58ed4a411e3:
>=20
> =C2=A0 ARM: dts: aspeed: Rework APB nodes (2025-04-08 10:58:33 +0930)


I'm looking to get ahead of things for the next merge window. The
ASPEED PR didn't end up getting pulled for v6.16 - possibly it was a
combination of a few things: I expect it came a bit late in the cycle,
Joel expressed some concerns about the changes to the APB DTS nodes,
and well after the fact I noticed it was sent to arm@ rather than soc@
(though Joel suggested these were aliases, at least in the past).

Were any of these factors? I'm hoping we can avoid the same pitfalls
this time around.

Cheers,

Andrew

>=20
> ----------------------------------------------------------------
> ASPEED devicetree updates for v6.16
>=20
> Significant changes:
>=20
> - The APB nodes in the ASPEED SoC DTSIs were reworked to eliminate a larg=
e
> =C2=A0 volume of warnings from `make dtbs_check`. The changes to the node=
 names are
> =C2=A0 naturally reflected in sysfs, which may impact some userspace appl=
ications.
> =C2=A0 The impacts are called out in the commit message, along with argum=
ents for
> =C2=A0 the change.
>=20
> Removed platforms:
>=20
> - IBM's Swift BMC
>=20
> New platforms:
>=20
> - NVIDIA's GB200NVL BMC
>=20
> =C2=A0 NVIDIA GB200 NVL72 connects 36 Grace CPUs and 72 Blackwell GPUs in=
 an NVIDIA
> =C2=A0 NVLink-connected, liquid-cooled, rack-scale design.
>=20
> Updated BMC platforms:
>=20
> - Bletchley (Meta): Fixes for GPIO hog name, remove ethernet-phy node
> - Catalina (Meta): Various sensors added, MCTP support for NIC management
> - System1 (IBM): IPMB and various GPIO-related updates
>=20
> The System1 series includes a devicetree binding patch for IPMI IPMB devi=
ces.
>=20
> ----------------------------------------------------------------
> Andrew Jeffery (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Rework APB nodes
>=20
> Joel Stanley (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Remove swift machine
>=20
> Krzysztof Kozlowski (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Align GPIO hog name with=
 bindings
>=20
> Ninad Palsule (8):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: ipmi: Add binding for IPMB de=
vice
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Add IPMB device
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Add GPIO line n=
ame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Reduce sgpio sp=
eed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Update LED gpio=
 name
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Remove VRs max8=
952
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Mark GPIO line =
high/low
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: system1: Disable gpio pu=
ll down
>=20
> Potin Lai (11):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: bletchley: remove unused=
 ethernet-phy node
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Add IO Mezz bo=
ard thermal sensor nodes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Add Front IO b=
oard remote thermal sensor
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Add MP5990 pow=
er sensor node
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Add fan contro=
ller support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Add second sou=
rce fan controller support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Add second sou=
rce HSC node support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Remove INA238 =
and INA230 nodes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Enable multi-m=
aster on additional I2C buses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Update CBC FRU=
 EEPROM I2C bus and address
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: catalina: Enable MCTP su=
pport for NIC management
>=20
> Willie Thai (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: arm: aspeed: add Nvidia's GB2=
00NVL BMC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARM: dts: aspeed: Add device tree for Nvid=
ia's GB200NVL BMC
>=20
> =C2=A0.../devicetree/bindings/arm/aspeed/aspeed.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../devicetree/bindings/ipmi/ipmb-dev.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 56 +
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +-
> =C2=A0.../aspeed/aspeed-bmc-arm-stardragon4800-rep2.dts=C2=A0 |=C2=A0=C2=
=A0=C2=A0 4 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0 2 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dts |=C2=A0=C2=A0=C2=
=A0 4 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dts=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-bletchley.dts=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 5 -
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-catalina.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0 197 +++-
> =C2=A0.../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |=C2=A0=C2=A0=C2=
=A0 2 +-
> =C2=A0.../arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts |=C2=A0=C2=A0=C2=
=A0 2 +-
> =C2=A0.../arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dts |=C2=A0=C2=A0=C2=
=A0 4 +-
> =C2=A0.../arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts |=C2=A0 139 ++-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 46 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |=C2=A0=C2=A0 68=
 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dts=C2=A0 | 1128 ++++=
++++++++++++++++
> =C2=A0.../arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dts |=C2=A0=C2=A0 14=
 +-
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dts |=C2=A0=C2=A0 10=
 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 40 +-
> =C2=A0.../arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dts |=C2=A0=C2=A0=C2=
=A0 6 +-
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts=C2=A0 |=C2=A0 974=
 -----------------
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dts=C2=A0 |=C2=A0=C2=
=A0=C2=A0 8 +-
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g4.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 93 +-
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g5.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 109 +-
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 249 +++--
> =C2=A026 files changed, 1773 insertions(+), 1394 deletions(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.=
yaml
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200=
nvl-bmc.dts
> =C2=A0delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dt=
s


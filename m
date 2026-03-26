Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB821CC5C
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 03:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774494598; cv=none; b=qir3L7HOIsfamW7poP2SaRPofVt2SxASGkaKm++JZsXvLkpGrkth4iawmLukSZVZNBzRw48b8a3u5blaU6/88HinkjXpU40j+wThuXPD+1LSEF2bzX/mw/DrFhtp6dOG9ofN7eRy9QLymuPAz4OeAbH+C75E1cTjiYKX4/+LL7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774494598; c=relaxed/simple;
	bh=HuO+1F5N9PkdMqS3xGDPWZAChmffsBIoyU9fvdhNwgY=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=I+vLV7tnoKoXQls0zaxOIB21zdJ+Aj3K9iolvlcBN63tF/wzSQo38liTA4nWfo7SbiKfVaEAZoVN6Klp4cPcimveMevH4rPvaWFT8iVufEh5HRgynfrAVVUK8tjfTx5fExLaweR2n7MTGsz2PmmbDKHGDZpheks2MntyLha2uvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=h9tzlO7H; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="h9tzlO7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774494593;
	bh=zeUGGTYgyK94YprNuLur3t1PD0YGNWfrDQg8S912Lhw=;
	h=Subject:From:To:Cc:Date;
	b=h9tzlO7HVgpr7TKHSJj2CHl/BXQSp9jqI2Idzj2KXDfaP9GRr3XW/JDYKM0u5cwD/
	 rAA0ZCHXMqJykP5jihSrlPCB+p2DRCPC2is/7Nt3BEEEiG8iaNUhw0VzzhQUb+ybuL
	 YgrBjRkV3afc/awiiW+4sMx4JNX+oy44V0aHCI6f0cjMDjzbge+L+hymQFLVRASKX1
	 tjbspCnVMe5sjoc4ax7V7pDunlpEiV1mJ1uDDs8n5xIfThKsMYqfpJrU3JJVQ2i/Uf
	 l+D3SScdqg9BWOnhEfN5usNLs3nxOjJNn3OVJOdUYt2p/iKeWTWc8Hbs4hvgCcTZX0
	 TXl6HbAEMfkZA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5929E645CA;
	Thu, 26 Mar 2026 11:09:53 +0800 (AWST)
Message-ID: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of devicetree changes for v7.1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:39:52 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

Here's the first batch of ASPEED devicetree changes for v7.1.

Please pull.

Cheers,

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.1-devicetree-0

for you to fetch changes up to 76b4ec8efdc3887cdbf730da2e55881fc1a18770:

  ARM: dts: aspeed: anacapa: Add retimer EEPROMs (2026-02-23 12:02:22 +1030=
)

----------------------------------------------------------------
aspeed: first batch of devicetree changes for v7.1

New platforms:

- Asus Kommando IPMI card
- Asrock Paul IPMI card

Updated platforms:

- Anacapa (Meta): NFC and EEPROMs
- MSX4 (Nvidia): 128M layout for the alternate boot flash

----------------------------------------------------------------
Anirudh Srinivasan (4):
      dt-bindings: arm: aspeed: Add Asus Kommando IPMI card
      ARM: dts: aspeed: Add Asus Kommando IPMI card
      dt-bindings: arm: aspeed: Add Asrock Paul IPMI card
      ARM: dts: aspeed: Add Asrock Paul IPMI card

Carl Lee (1):
      ARM: dts: aspeed: anacapa: add NFC device

Dirk Chen (1):
      ARM: dts: aspeed: anacapa: Add retimer EEPROMs

Marc Olberding (1):
      ARM: dts: aspeed: Add 128M alt flash layout to NVIDIA MSX4

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml        |   2 ++
 arch/arm/boot/dts/aspeed/Makefile                               |   2 ++
 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-card.dts   | 131 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts | 117 ++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts        |  22 ++++=
+++++++++++
 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-msx4-bmc.dts         |   1 +
 arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.dtsi      |  32 ++++=
++++++++++++++++++
 7 files changed, 307 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-paul-ipmi-ca=
rd.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-=
card.dts
 create mode 100644 arch/arm/boot/dts/aspeed/openbmc-flash-layout-128-alt.d=
tsi


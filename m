Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BE326930
	for <soc@lists.linux.dev>; Fri, 10 Apr 2026 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827553; cv=none; b=V0zzzIIIDQgB68Y6xcEpVGVhVY8md6OlInGjI3CjsBTArMy585xnwjGNcHZ0tTj93PX++8T+b2PVxgp3DUI1PZrgply55Knb2X4A7duIA4QFGH4YFmoy8Z3ZUoll3GhSl6UWbtaTdXkuNBW+HrmiwGB+upYPE4vjXHAWg6d5Xy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827553; c=relaxed/simple;
	bh=GT7Aahlv/8aqacB7dT46QOr57cpeajJOdahsedL+19Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J5sFZEkM45YEJwP2S/ls1Wc9W/sqOFj5z1iFd1bIKZgekMf07Ct5vfRt8m/LMTBFuelLK71927Twyv2B1+vX7s+HsjS6CnWqkPZufhjZsVT/GMWbGwrAB8iFlqX3JEg/uJ7eQyL6jvFa1jME0AGGWtJcwnNPJgB5YEFsOPnDxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cChgOkzE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cChgOkzE"
Received: by smtp.kernel.org (Postfix)
	id 6A40CC19425; Fri, 10 Apr 2026 13:25:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23E9AC19421
	for <soc@kernel.org>; Fri, 10 Apr 2026 13:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23E9AC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D1751A325A
	for <soc@kernel.org>; Fri, 10 Apr 2026 13:25:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A675603F0;
	Fri, 10 Apr 2026 13:25:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 163A91045001A;
	Fri, 10 Apr 2026 15:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775827541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ANiLXy2khpgRJ4NUYD3KloSLAU+fqIeMO0q9LkbLPm4=;
	b=cChgOkzENzUd4hXa/ttfMXyZ0RDfND2LkMVRzbdjblDPHSJc/Ngf2fCJu5n2R/sFyZJKRz
	KEuV56FWmssZhlk0CmVElB56ny+lg/JfOgnIpDlkNvAM7yHm2BGXtUR3VLdx0KWonKsDSU
	7tyf6NHe2AgUU2J1I70ERoP4IrSZTkH9HV+5ozPDUyE6NvYDBosShh1WN613k2OfC8x+X7
	/cg/OYZRN+6tJXePzv8I5eOChkJyBnRboBs1x3maxI+Bi46hVFvRcvy4aM9axrFwO1G/5r
	aqBN1yCuGy6kY9Bo4ce7ozcEsGTAooQs67FI0Azh0RzERrAAn7skZYCPNOcYFg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
Date: Fri, 10 Apr 2026 15:25:39 +0200
Message-ID: <87cy072bho.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt64 for mvebu for v7.1.

Gregory

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-7.1-1

for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:

  arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller nod=
e (2026-04-09 10:14:40 +0200)

----------------------------------------------------------------
mvebu dt64 for 7.1 (part 1)

- Armada 37xx/3720 device tree fixes:
   - Reorder USB PHYs, standardize names, drop undocumented
     properties, fix schema alignment

- Add Marvell 7k COMe board bindings and uDPU ethernet aliases

- Cleanup: drop unused .dtsi files

----------------------------------------------------------------
Elad Nachman (2):
      arm64: dts: a7k: use phy handle
      dt-bindings: arm64: add Marvell 7k COMe boards

Gabor Juhos (6):
      arm64: dts: marvell: armada-3720: drop 'marvell,xenon-emmc' properties
      arm64: dts: marvell: armada-37xx: align 'phy-names' of EHCI node with=
 DT schema
      arm64: dts: marvell: armada-37xx: drop redundant status property
      arm64: dts: marvell: armada-37xx: drop 'marvell,usb-misc-reg' from US=
B host nodes
      arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller's=
 phy-names
      arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller=
 node

Rob Herring (Arm) (1):
      arm/arm64: dts: marvell: Drop unused .dtsi

Robert Marko (1):
      arm64: dts: marvell: uDPU: add ethernet aliases

 .../bindings/arm/marvell/armada-7k-8k.yaml         |  11 ++
 arch/arm/boot/dts/marvell/armada-380.dtsi          | 148 -----------------=
----
 .../boot/dts/marvell/armada-3720-atlas-v5.dts      |   1 -
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |   1 -
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi  |   7 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   9 +-
 .../boot/dts/marvell/armada-7020-comexpress.dtsi   |   2 +-
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |  20 ---
 .../boot/dts/marvell/cn9130-db-comexpress.dtsi     |  96 -------------
 9 files changed, 21 insertions(+), 274 deletions(-)
 delete mode 100644 arch/arm/boot/dts/marvell/armada-380.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/armada-8020.dtsi
 delete mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

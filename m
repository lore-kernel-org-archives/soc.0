Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5926E173
	for <soc@lists.linux.dev>; Fri, 23 Jan 2026 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188802; cv=none; b=oe32KVOzuHzsiTkRgjx9zo3gsHnz+l/LU+9oV45/Us2Lf53UZ1IKtexpGf6uAVU3gPHGyweEYAVmacgtmFvsxcCI+VkS7Pfg/JTUNL6a5FP1kE2kuTYyDsgrHvEBXLheTAsV1Aj6vT62Eq/V1iV43pF3A03t/9fes3x209IXS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188802; c=relaxed/simple;
	bh=ESgbn+yWBcuA5GDxXjpbaliNdIa1xaarRLEyKQ/fyy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LO1dUUyt7ziDeFkoXnP9EyAtvAXrM6e8D+dpNI+Ad7m1ILSnrcCuAeZjB9XY23ohkdtMZjmpOz3fOnmGB73dqrwFWhelzcRS3GKyoYoW+5VskCyi3gqICjf6T35Z/7hne7KxhLkk73XKbjmJDxYkyOWf5xn6DEcS6V6aSMm6Zhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i0VFNvRI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i0VFNvRI"
Received: by smtp.kernel.org (Postfix)
	id 21195C19422; Fri, 23 Jan 2026 17:20:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CABB0C4CEF1
	for <soc@kernel.org>; Fri, 23 Jan 2026 17:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CABB0C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40E364E42225;
	Fri, 23 Jan 2026 17:19:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 149E26070A;
	Fri, 23 Jan 2026 17:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80E3C119A87DF;
	Fri, 23 Jan 2026 18:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769188797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z3UTT4Ddm4zSBf5O+DmvwBEkvt0fzneTnv+oGgJD2f4=;
	b=i0VFNvRI9JKzaW9mLKbKKVI51vd6z6MT95G2ub5pvHDif4v7xalaGH12klGfeXrmS6B8fE
	AHqYPUey2Dpeejr728Oe5MsIgNk25hFnvXiqH5mySvmFWQI21DASd8ctU9aF191UNSz5H1
	QiA7mHyVDHj4k8otv/+d49NB65Pa0r4xqFjbfgypZjtL54woxEinyGF+W/RJxeorEsEXoi
	NuXltGtjWQHUrIRIGbCakA3OXLkQI/gnuasIf9AjyMG1T28lJDjOO5qgRPAig6cTy97KwU
	5TNNNe5fm2hxwWl+CELYNNsOdhVAIDlH1vfaANK6Kv9tBoNaN5qzvSdxlrblqQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.20 (#1)
Date: Fri, 23 Jan 2026 18:19:55 +0100
Message-ID: <87zf64jlfo.fsf@BLaptop.bootlin.com>
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

Here is the first pull request for dt64 for mvebu for v6.20.

Gregory

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.20-1

for you to fetch changes up to fcaf733ca526b69595ed1d227e2cc59ddd24eff7:

  MAINTAINERS: Add Falcon DB (2026-01-23 10:30:41 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.20 (part 1)

Add support for Armada 7020 Express Type 7 CPU module board by Marvell, inc=
luding:
 - COM Express CPU module and carrier board (Marvell DB-98CX85x0)
  - DDR4 memory, 1Gbit OOB Ethernet, 10G KR Ethernet, NAND/SPI flash, PCIe,=
 SATA, USB, and UART interfaces
Add SoC-specific compatibles for SafeXcel crypto engine on Armada 37xx and =
CP11x
Fix regulator type from "regulator-gpio" to "regulator-fixed" where no GPIO=
 control is present
Add missing GPIO properties for "nxp,pca9536" on cn9131-cf-solidwan
Fix and clean up pinctrl-names properties and typos
Add missing "#phy-cells" to "usb-nop-xceiv" nodes
MAINTAINERS: Add Falcon DB to the list of maintained Marvell Armada dts fil=
es

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto

Elad Nachman (2):
      arm64: dts: a7k: add COM Express boards
      MAINTAINERS: Add Falcon DB

Rob Herring (Arm) (4):
      arm64: dts: marvell: Add missing "#phy-cells" to "usb-nop-xceiv"
      arm64: dts: marvell: Fix stray and typo "pinctrl-names" properties
      arm64: dts: marvell: cn9131-cf-solidwan: Add missing GPIO properties =
on "nxp,pca9536"
      arm64: dts: marvell: change regulator-gpio to regulator-fixed

 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |   1 +
 .../dts/marvell/armada-3720-espressobin-ultra.dts  |   2 +-
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   9 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   3 +-
 .../boot/dts/marvell/armada-7020-comexpress.dtsi   | 161 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi       |   7 +
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |   2 +
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |   4 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   3 +-
 arch/arm64/boot/dts/marvell/cn9130-cf-base.dts     |   2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |   3 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |   4 +-
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |   2 +
 .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |   3 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         |   1 +
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         |   3 +-
 .../boot/dts/marvell/db-falcon-carrier-a7k.dts     |  27 ++++
 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi |  22 +++
 20 files changed, 243 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts
 create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi
--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FB1F5F6
	for <soc@lists.linux.dev>; Sun,  5 Jan 2025 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070718; cv=none; b=a302AHBTJ6KREmXVpe3ENLpz3yZ/pfHhy8bloJKzDF2gS1PwHD8EilIc6Kiym1hAZqoGIsr9aqst9kbmMTJclq1jkglf/ABgawsSWu9dMT4y1jNGfQs8iwHfXI99iKuOW56HgrtqqFRH+tcUmYxu0ubG2uXq7t145D/kQt2G5pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070718; c=relaxed/simple;
	bh=ImRUmjkuC+Ts2+IPd+R2QR7BrD9LnLFRZdXE/oe1kKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZH3yXX/awHmEcLP4oEQHaOBad6Uo00nTEqRpKpscchMbCloFhI3K9C9Oz0SCtUt+crwDaNN2qdx48/wxgqIjGlM6Sj6xqwEra/E4pUdWtx9jr0a2CVR5CWRoJ+cMAxA8K0VfhjfqQPfXsYS6Jm+/gyok7ej7AYgsJKqmZXDKKm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iYay7waF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iYay7waF"
Received: by smtp.kernel.org (Postfix)
	id 6D19BC4CED0; Sun,  5 Jan 2025 09:51:58 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.kernel.org (Postfix) with ESMTP id 8A136C4CED2;
	Sun,  5 Jan 2025 09:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A136C4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=69snu
	UwpsyIrkbZcnnFbbFnV//a9mRAcTgRbnMk9dG8=; b=iYay7waFFvMKKIGcEWceB
	RgxawlCM6JQiV1w0BNkINlXq1Jl3zmuz8TMIF1j0/6+/AC6VIZ9LNOoWfhivRyfZ
	8tOozGD0fFxqhfyVazWcUlzly4YDdUChYf0qvIu6YHsk8oqTZYW/GxTF6QQeDFSv
	4s3j1zBq0jM26rqN0Oxq+M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S4;
	Sun, 05 Jan 2025 17:51:44 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.14
Date: Sun,  5 Jan 2025 17:51:36 +0800
Message-Id: <20250105095139.714590-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4rJrW7Gw1kuF4fAF4UXFb_yoW5Cr1fpr
	1fZrsrJr4xGryfJ34DA3yjk3yYyw15Zr1fZr15Jay8Cr45Za47Xr9Igw1ft34UXFyrWay5
	tr18ZF9rJrn5uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQ2-8UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBALLZWd6TKsXoQAAsk

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.14

for you to fetch changes up to c7418a6e7ac9bca66a8a49793cbfa5a45c01bcbb:

  ARM: dts: imx: Use the correct mdio pattern (2024-12-30 16:03:58 +0800)

----------------------------------------------------------------
i.MX ARM device tree change for 6.14:

- Clean up TQMa7x device trees (Alexander Stein)
- Correct node name pattern for mdio-gpio devices (Fabio Estevam)
- Update deprecated GPIO properties for Generic ASoC Sound Card device
  (Geert Uytterhoeven)
- Set USB dr_mode property to OTG explicitly for imx6qdl-sabresd based
  boards (Hui Wang)
- Update MAINTAINERS entry for DH electronics DHSOM boards (Marek Vasut)
- A series from Stefan Kerkmann to add phy-3p0-supply for usb phys

----------------------------------------------------------------
Alexander Stein (7):
      ARM: dts: imx7-mba7: remove LVDS transmitter regulator
      ARM: dts: imx7-tqma7: Remove superfluous status="okay" property
      ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
      ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
      ARM: dts: imx7-mba7: Fix SD card vmmc-supply
      ARM: dts: imx7-mba7: Remove duplicated power supply
      ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support

Fabio Estevam (2):
      ARM: dts: imx6qdl-apalis: Change to "adi,force-bt656-4"
      ARM: dts: imx: Use the correct mdio pattern

Geert Uytterhoeven (1):
      ARM: dts: imx: Switch to {hp,mic}-det-gpios

Hui Wang (1):
      ARM: dts: imx6qdl-sabresd: add dr_mode to usbotg

Marek Vasut (1):
      MAINTAINERS: Update entry for DH electronics DHSOM SoMs and boards

Stefan Kerkmann (3):
      ARM: dts: imx6qdl: add phy-3p0-supply to usb phys
      ARM: dts: imx6sl: add phy-3p0-supply to usb phys
      ARM: dts: imx6sx: add phy-3p0-supply to usb phys

 MAINTAINERS                                       | 13 ++---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-scu2-mezz.dts |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi    |  5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi            |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi             |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi             |  6 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi          | 61 +++++++----------------
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi         |  3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts          |  3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts           |  2 +-
 17 files changed, 48 insertions(+), 73 deletions(-)


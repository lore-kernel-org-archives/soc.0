Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76702741A4
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752161123; cv=none; b=OKINSxESCPc14c6x+daZQIsyRP72Zlnh7EjBqeSNtgGiyfprAkt+6gAj5poAb4iCRhvuvPX9tUzYTdPaHrKa8BxDL8uJ6vlz2oXv40hkpNN4XsZzLQNycd0atzCtKC3jY2lkPm7Kg5NzzFJSTfXzH++viaBobSvTXKGLLPvJXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752161123; c=relaxed/simple;
	bh=rXKQFx6YLu5k0wX84UTWA8qMo/Pd9rGPtGjXwMfph38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=supNt2swz/8WUPOIWg8nZU+BcA1zoLHK9JS8rOkOndkPmsG5nh/9JJ5TH/yqkHi2h1lEdk25XYmwQm3tHWJjQUBG1VyRMh2pLupmC92CZyZhnVdE5p7Hw0Y5filuV00AtaU8++ACzBmsjkwbjMo7sPqc2OxX+WpSrhRANWpPNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 78BD6C4CEF4; Thu, 10 Jul 2025 15:25:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12DE3C4CEE3
	for <soc@kernel.org>; Thu, 10 Jul 2025 15:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12DE3C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uZt9B-0008Oa-Ed; Thu, 10 Jul 2025 17:25:17 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.17
Date: Thu, 10 Jul 2025 17:25:13 +0200
Message-Id: <20250710152513.1346298-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Dear arm-soc maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/pza/linux.git tags/reset-for-v6.17

for you to fetch changes up to 196dbace08243bbd4639cdb3d8ec655b2da361bd:

  dt-bindings: reset: Convert snps,dw-reset to DT schema (2025-07-03 11:04:54 +0200)

----------------------------------------------------------------
Reset controller updates for v6.17

* Support reset controllers on Kendryte K230 and SOPHGO CV1800B.
* Add RZ/V2N USB2PHY reset controller bindings
* Use auxiliary device creation helpers in reset-mpfs.
* Convert nxp,lcp1850-rgu and snps,dw-reset binding docs to DT schema.
* Enable reset-brcmstb(-rescal) on BCM2712.
* Fix a typo in the T-HEAD TH1520 Kconfig option

----------------------------------------------------------------
Drew Fustini (1):
      reset: thead: Fix TH1520 typo

Frank Li (1):
      dt-bindings: reset: convert nxp,lpc1850-rgu.txt to yaml format

Inochi Amaoto (2):
      dt-bindings: reset: sophgo: Add CV1800B support
      reset: simple: add support for Sophgo CV1800B

Jerome Brunet (1):
      reset: mpfs: use the auxiliary device creation

Junhui Liu (2):
      dt-bindings: reset: add support for canaan,k230-rst
      reset: canaan: add reset driver for Kendryte K230

Lad Prabhakar (1):
      dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/V2N SoC support

Peter Robinson (1):
      reset: brcmstb: Enable reset drivers for ARCH_BCM2835

Rob Herring (Arm) (1):
      dt-bindings: reset: Convert snps,dw-reset to DT schema

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 .../devicetree/bindings/reset/nxp,lpc1850-rgu.txt  |  83 -----
 .../devicetree/bindings/reset/nxp,lpc1850-rgu.yaml | 101 ++++++
 .../reset/renesas,rzv2h-usb2phy-reset.yaml         |   7 +-
 .../devicetree/bindings/reset/snps,dw-reset.txt    |  30 --
 .../devicetree/bindings/reset/snps,dw-reset.yaml   |  39 +++
 .../bindings/reset/sophgo,sg2042-reset.yaml        |   4 +-
 drivers/reset/Kconfig                              |  21 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 371 +++++++++++++++++++++
 drivers/reset/reset-mpfs.c                         |  56 +---
 drivers/reset/reset-simple.c                       |   2 +
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 +++++
 13 files changed, 672 insertions(+), 172 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/snps,dw-reset.yaml
 create mode 100644 drivers/reset/reset-k230.c
 create mode 100644 include/dt-bindings/reset/canaan,k230-rst.h

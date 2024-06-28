Return-Path: <SRS0=YE/A=N6=linux-m68k.org=geert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D48C3064D
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 13:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1D2BC32781; Fri, 28 Jun 2024 13:16:11 +0000 (UTC)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B25DCC2BBFC
	for <soc@kernel.org>; Fri, 28 Jun 2024 13:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B25DCC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4W9bXw3p9Dz4wwyn
	for <soc@kernel.org>; Fri, 28 Jun 2024 15:16:00 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by baptiste.telenet-ops.be with bizsmtp
	id h1Fs2C0035ECAAU011Fs38; Fri, 28 Jun 2024 15:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBS6-000VGS-7c;
	Fri, 28 Jun 2024 15:15:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSC-00BlRI-3P;
	Fri, 28 Jun 2024 15:15:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas driver updates for v6.11
Date: Fri, 28 Jun 2024 15:15:47 +0200
Message-Id: <cover.1719578275.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719578273.git.geert+renesas@glider.be>
References: <cover.1719578273.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.11-tag1

for you to fetch changes up to 0aea2e4bbc584dd92e0483a6d249f11054a8923c:

  soc: renesas: rcar-fuse: Remove unneeded semicolon (2024-06-28 09:32:33 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.11

  - Add R-Car fuse driver.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: fuse: Document R-Car E-FUSE / PFC
      dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
      soc: renesas: Add R-Car fuse driver

Yang Li (1):
      soc: renesas: rcar-fuse: Remove unneeded semicolon

 .../bindings/fuse/renesas,rcar-efuse.yaml          |  55 ++++++
 .../devicetree/bindings/fuse/renesas,rcar-otp.yaml |  38 ++++
 drivers/soc/renesas/Kconfig                        |   8 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/rcar-fuse.c                    | 201 +++++++++++++++++++++
 include/linux/platform_data/rcar_fuse.h            |  11 ++
 include/linux/soc/renesas/rcar-fuse.h              |  41 +++++
 7 files changed, 355 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
 create mode 100644 drivers/soc/renesas/rcar-fuse.c
 create mode 100644 include/linux/platform_data/rcar_fuse.h
 create mode 100644 include/linux/soc/renesas/rcar-fuse.h

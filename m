Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C271C48BF6
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 20:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8710C43399; Mon,  4 Mar 2024 20:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A78C433C7;
	Mon,  4 Mar 2024 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709584986;
	bh=6Q0OaVC+amlU/ArOfLkB9a5wduKmcnx766kOVBCNjog=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=NrOMckU9v6OdmyLfUL+p7mN77JoXXLtZyzM2P4x8lR1H6EEiAvBW/Mpw0qdyCMvm1
	 ocooN2aZ6PmtCvo5FLMY5EKwcDK9KEyRcomfgwxDu90i69WhrX4qOucgHFG3y0pkfq
	 I3s8rzWDFKI42UQbLVkvTN9Tw+NWephJ6MXM1lf9LGV+UfgcQ2GGIl/iIZnVZl/EZ7
	 eL5axhZmya/7cjqwjMLZDsnqiCD8dTTnG+iQ4llQz4tMUznSGvyWaCZWlg/HwDngpf
	 HKJRIEy05NcsHa1RxrxiJ5oPu1Bc2HJ0vGbQU4+5aTGygQW8MzDFmywpAzW9dT6ByC
	 1yA/Gkqrhyhfg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>
Subject: [PATCH] ARM: s32c: update MAINTAINERS entry
Date: Mon,  4 Mar 2024 21:41:00 +0100
Message-Id: <20240304204249.936140-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

As discussed on the mailing list, Chester is stepping down from being
the primary maintainer for the s32c platform, and Ghennadi becomes an
additional reviewer.

For the moment, there is no full maintainer for s32c, but Shawn is already
listed as the overall maintainer for 32-bit freescale/nxp platforms
(except layerscape and qoriq) and agreed to merge s32c patches as they
come in and are reviewed by the remaining reviewers.

Adapt the entries in the maintainers file based on the discussion.

Link: https://lore.kernel.org/all/20240221120123.1118552-1-ghennadi.procopciuc@oss.nxp.com/
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I would merge this into the soc tree if everyone is fine with this
version. Let me know if you'd prefer any further adjustments.
---
 MAINTAINERS | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 209e6f45a0b6..87e9c8282742 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2542,13 +2542,14 @@ F:	drivers/*/*/*wpcm*
 F:	drivers/*/*wpcm*
 
 ARM/NXP S32G ARCHITECTURE
-M:	Chester Lin <chester62515@gmail.com>
-R:	Andreas Färber <afaerber@suse.de>
+R:	Chester Lin <chester62515@gmail.com>
 R:	Matthias Brugger <mbrugger@suse.com>
-R:	NXP S32 Linux Team <s32@nxp.com>
+R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/pinctrl/nxp/
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
@@ -17260,9 +17261,12 @@ M:	Shawn Guo <shawnguo@kernel.org>
 M:	Jacky Bai <ping.bai@nxp.com>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-gpio@vger.kernel.org
+L:	NXP S32 Linux Team <s32@nxp.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/fsl,*
+F:	Documentation/devicetree/bindings/pinctrl/nxp,s32*
 F:	drivers/pinctrl/freescale/
+F:	drivers/pinctrl/nxp/
 
 PIN CONTROLLER - INTEL
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
@@ -17316,14 +17320,6 @@ S:	Supported
 F:	drivers/gpio/gpio-sama5d2-piobu.c
 F:	drivers/pinctrl/pinctrl-at91*
 
-PIN CONTROLLER - NXP S32
-M:	Chester Lin <clin@suse.com>
-R:	NXP S32 Linux Team <s32@nxp.com>
-L:	linux-gpio@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/pinctrl/nxp,s32*
-F:	drivers/pinctrl/nxp/
-
 PIN CONTROLLER - QUALCOMM
 M:	Bjorn Andersson <andersson@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.2


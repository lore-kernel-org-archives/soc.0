Return-Path: <SRS0=bfhR=YT=fris.de=frieder@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA7C00140
	for <soc@archiver.kernel.org>; Mon, 15 Aug 2022 08:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8F03C433B5; Mon, 15 Aug 2022 08:28:32 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0419C433C1;
	Mon, 15 Aug 2022 08:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0419C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E393FBFADB;
	Mon, 15 Aug 2022 10:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1660552100; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=zj3e45wE4VaaixX25Yhb3oPW7wVrr1tETt65ii38iRQ=;
	b=QFC3+N8y5nSoOQ5LTNqHHDMYGCf1cm9blxBA6e6Sp87YVd+UiWIWKNMmmA0G8w04TiAaNI
	UscwJd/C4GEA/XS8FlMbIkz44mMAGUKbmROdd72J3Jh5WAWN71NnKg12TMA2pE+PJnvr+u
	GWzaJBFRM+ZpoRiYDDoF409SpGvTaUsjBDgTIdPXlJPVVbhVdsQTLRLZLNFPOd2S/w7JrW
	qLYoOvQTEG26ITVpoK4hAwz5Et/z8h00Witn7pvGfCLlXF0q6PKBfe4x1EVzehllabgObS
	rs7Ev89LWXjU1dg/4XiiWneiDOCXxSUQSAwYIc0PkByaXLx1lERVCDzGaqyCRA==
From: Frieder Schrempf <frieder@fris.de>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	soc@kernel.org
Subject: [PATCH v3 0/3] ARM: dts: imx6ul-kontron: Improve devicetrees
Date: Mon, 15 Aug 2022 10:28:09 +0200
Message-Id: <20220815082814.27651-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This series contains some simplifications to the devicetree file structure
and updates the model names, compatibles and devicetree file names to match
what is used officially by the Kontron marketing.

This is a somewhat breaking change (for out-of-tree devicetrees that include
the SoM files) but it reduces the complexity quite a bit, makes things easier
to read and lets people discover the devicetree matching their hardware more
easily.

The first patch also updates the bindings to match up with the changes applied
in the following patches.
---
Changes in v3:
* Add A-b tag from Krzysztof (thanks!)
* Improve diff for patch 2
* Improve commit messages and cover letter

Changes in v2:
* Also rename compatibles to get rid of N6xxx notation
* Also rename devicetree files for consistency
* Squash model renaming patch into patch 2
* Move part of Makefile changes to patch 2

Frieder Schrempf (3):
  dt-bindings: arm: fsl: imx6ul-kontron: Update bindings
  ARM: dts: imx6ul-kontron: Simplify devicetree structure
  ARM: dts: imx6ul-kontron: Add imx6ull-kontron-bl to Makefile

 .../devicetree/bindings/arm/fsl.yaml          | 31 ++++++--------
 arch/arm/boot/dts/Makefile                    |  5 ++-
 ...6310-s-43.dts => imx6ul-kontron-bl-43.dts} |  8 ++--
 ...x-s.dtsi => imx6ul-kontron-bl-common.dtsi} |  0
 ...tron-n6310-s.dts => imx6ul-kontron-bl.dts} |  9 ++---
 .../boot/dts/imx6ul-kontron-n6311-som.dtsi    | 40 -------------------
 ...mon.dtsi => imx6ul-kontron-sl-common.dtsi} | 15 +++++++
 ...-n6310-som.dtsi => imx6ul-kontron-sl.dtsi} | 33 ++-------------
 ...ron-n6411-s.dts => imx6ull-kontron-bl.dts} |  9 ++---
 .../boot/dts/imx6ull-kontron-n6411-som.dtsi   | 40 -------------------
 ...on-n6311-s.dts => imx6ull-kontron-sl.dtsi} | 11 ++---
 11 files changed, 49 insertions(+), 152 deletions(-)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6310-s-43.dts => imx6ul-kontron-bl-43.dts} (93%)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6x1x-s.dtsi => imx6ul-kontron-bl-common.dtsi} (100%)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6310-s.dts => imx6ul-kontron-bl.dts} (52%)
 delete mode 100644 arch/arm/boot/dts/imx6ul-kontron-n6311-som.dtsi
 rename arch/arm/boot/dts/{imx6ul-kontron-n6x1x-som-common.dtsi => imx6ul-kontron-sl-common.dtsi} (90%)
 rename arch/arm/boot/dts/{imx6ul-kontron-n6310-som.dtsi => imx6ul-kontron-sl.dtsi} (28%)
 rename arch/arm/boot/dts/{imx6ull-kontron-n6411-s.dts => imx6ull-kontron-bl.dts} (43%)
 delete mode 100644 arch/arm/boot/dts/imx6ull-kontron-n6411-som.dtsi
 rename arch/arm/boot/dts/{imx6ul-kontron-n6311-s.dts => imx6ull-kontron-sl.dtsi} (41%)

-- 
2.37.1


Return-Path: <SRS0=J1cx=QC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57FACD484D
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 14:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF59BC4CECB; Wed,  4 Sep 2024 14:35:00 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.kernel.org (Postfix) with ESMTP id ECB48C4CEC6;
	Wed,  4 Sep 2024 14:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECB48C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Xibod
	xPLudd8SOYJocGFkxXHI4rleVeme0jx2R7d6J8=; b=WpjtCQ2u0pEDqWF4oidkM
	VpxYsi8Hiku6Ror/Hkp+d3GwgMzsUcoqaqgK7ogBs/YwJ/o5G3NQ1s9xB24n6jKD
	VUaNoOgIfdElPjDDMb+4CcvA4xv1N3jb9zyR6de5SFH25ZRU+Yx/V4cuvvWil42A
	RQRA2L8jHMUWOKL27i6ylY=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S4;
	Wed, 04 Sep 2024 22:34:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] i.MX dt-bindings changes for 6.12
Date: Wed,  4 Sep 2024 22:34:36 +0800
Message-Id: <20240904143439.211552-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFW7Cw1UGF17tFy3uFWfZrb_yoW8Wr1xpr
	sxGF97GryUtF17Jr1aqF4DAr1rX3W8AF13Jr1Sgr1rJa4UA3WqqF4rtwnY9r9xJryxXF1S
	y3WUCrnxK347XrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDhL8UUUUU=
X-Originating-IP: [114.216.210.89]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERdQZWbYQmJzkwAAsN

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.12

for you to fetch changes up to 7dfb497191f0d87c3b3ccfd3039df4c03d6769f6:

  dt-bindings: arm: fsl: Add Variscite Symphony board and VAR-SOM-MX8MP SoM (2024-09-03 16:37:54 +0800)

----------------------------------------------------------------
i.MX dt-bindings changes for 6.12:

- New compatibles for boards: Kontron i.MX93 OSM-S, i.MX93 14x14 EVK,
  Variscite Symphony and VAR-SOM-MX8MP, etc
- One spelling correction on TQ-Systems
- One renaming of gw7905 to gw75xx

----------------------------------------------------------------
Frank Li (1):
      dt-bindings: arm: fsl: add fsl-ls2081a-rdb board

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards

Krzysztof Kozlowski (1):
      dt-bindings: arm: fsl: drop usage of VAR-SOM-MX8MM SoM compatible alone

Max Merchel (1):
      dt-bindings: arm: fsl: correct spelling of TQ-Systems

Peng Fan (1):
      dt-bindings: arm: fsl: add i.MX93 14x14 EVK board

Tarang Raval (1):
      dt-bindings: arm: fsl: Add Variscite Symphony board and VAR-SOM-MX8MP SoM

Tim Harvey (1):
      dt-bindings: arm: fsl: rename gw7905 to gw75xx

 Documentation/devicetree/bindings/arm/fsl.yaml | 38 +++++++++++++++++++-------
 1 file changed, 28 insertions(+), 10 deletions(-)


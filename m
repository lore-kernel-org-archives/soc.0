Return-Path: <SRS0=P+pf=KD=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BFFC48BF6
	for <soc@archiver.kernel.org>; Mon, 26 Feb 2024 03:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC106C43141; Mon, 26 Feb 2024 03:42:45 +0000 (UTC)
Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.kernel.org (Postfix) with ESMTP id B46D8C43399;
	Mon, 26 Feb 2024 03:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B46D8C43399
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=znav7
	z5Pz9k7TXnIDi7pxyWtYj0admOeRx1PN1ls78k=; b=lyZfPst5thvAC2+cfQd1b
	BsHGmCHOYeSfEw8aynENDWk6wztO7YJ2n2xM+hPomQktTiaKW85hYVMpfMEeLaIt
	ABlE0YrD+1Ka9e6bJYh+8PR2NndAI1UKijBdc/YW5rd08YfFr+wnYrLiJLiWyX7K
	RoJCbYOWabTTeA4auL06Wo=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S3;
	Mon, 26 Feb 2024 11:42:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] i.MX dt-bindings for 6.9
Date: Mon, 26 Feb 2024 11:41:43 +0800
Message-Id: <20240226034147.233993-2-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
References: <20240226034147.233993-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DCFWkGr1xtFW8Xw1DWrg_yoW8WFW8pF
	sxGF93GryvqFy7JwnxZ3WDCr4rXr1UAF17JFZxJr10y3W5Ar1jqr1rKwn5ur9rJry7Wr4a
	yF18Cr1vk3WUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlq2NUUUUU=
X-Originating-IP: [183.213.196.200]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAiQZV6Nnjbw4QABsO

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.9

for you to fetch changes up to 65524e1453109c2f94b361274154154fa2120c85:

  dt-bindings: arm: add UNI-T UTi260B (2024-02-25 21:57:10 +0800)

----------------------------------------------------------------
i.MX dt-bindings for 6.9:

- New compatibles for boards: TQMa8Xx, Sielaff i.MX6 Solo, Toradex Apalis
  imx6q-eval-v1.2, VAR-SOM-MX93, phyBOARD-Segin-i.MX93, UNI-T UTi260B.
- Add vendor prefix for UNI-T.

----------------------------------------------------------------
Alexander Stein (1):
      dt-bindings: arm: add TQMa8Xx boards

Frieder Schrempf (1):
      dt-bindings: arm: fsl: Add Sielaff i.MX6 Solo board

Hiago De Franco (1):
      dt-bindings: arm: fsl: Add toradex,apalis_imx6q-eval-v1.2 board

Hugo Villeneuve (1):
      dt-bindings: arm: fsl: remove redundant company name

Joao Paulo Goncalves (1):
      dt-bindings: arm: fsl: add imx8qm apalis eval v1.2 carrier board

Mathieu Othacehe (2):
      dt-bindings: arm: fsl: Add VAR-SOM-MX93 with Symphony
      dt-bindings: arm: fsl: Add phyBOARD-Segin-i.MX93

Sebastian Reichel (2):
      dt-bindings: vendor-prefixes: add UNI-T
      dt-bindings: arm: add UNI-T UTi260B

 Documentation/devicetree/bindings/arm/fsl.yaml     | 41 +++++++++++++++++++---
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 2 files changed, 39 insertions(+), 4 deletions(-)


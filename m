Return-Path: <SRS0=YSAx=JP=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629EDC4828D
	for <soc@archiver.kernel.org>; Tue,  6 Feb 2024 15:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3168FC433C7; Tue,  6 Feb 2024 15:18:01 +0000 (UTC)
Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.kernel.org (Postfix) with ESMTP id 9E70FC433F1;
	Tue,  6 Feb 2024 15:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E70FC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=fNmcO
	ZX4Dq0NofjWuNDi4rGq9SDCY747D1X1PbMP6Z4=; b=mJx9n7IIWa8iZ4zqdCKRt
	H0tRS14wn9xVgYdJUnuTM2PLc+sUGkemRr+P5CtDuqzSDvfmJYPQnlujlRKQ1D89
	/qdyzssHcNCY36UAYTPnkwK6D2kJ/TreIe+CIpDwKmfyDTnOOqq/JMHSETjM6vAT
	NqNsR0QhNvWWCQveDJG9h4=
Received: from localhost.localdomain (unknown [183.213.196.254])
	by smtp2 (Coremail) with SMTP id C1UQrADnzoieTcJlx3sFAw--.45306S2;
	Tue, 06 Feb 2024 23:17:51 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.8
Date: Tue,  6 Feb 2024 23:17:44 +0800
Message-Id: <20240206151744.2459-1-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:C1UQrADnzoieTcJlx3sFAw--.45306S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DCFWkGr1xKF17tw1DWrg_yoW8Aw15pr
	W3ArZrGr18Jr48ZFnrXr4UJ3s0ya15Ar15Ar45t340kw1qyF9rXF43Kr1rW34UtryxZa1F
	qF1UXry7tFn8Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jgzVbUUUUU=
X-Originating-IP: [183.213.196.254]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFR98ZV6Nm3WnlwAAse

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.8

for you to fetch changes up to 7bca405c986075c99b9f729d3587b5c45db39d01:

  bus: imx-weim: fix valid range check (2024-02-06 14:10:47 +0800)

----------------------------------------------------------------
i.MX fixes for 6.8:

- A tqma8mpql device tree fix to correct audio codec iov-supply.
- A couple of USB-C connector DT description revert to fix regression
  on imx8mp-dhcom-pdk3 and imx8mn-var-som-symphony board.
- Fix valid range check for imx-weim bus driver.
- Disable UART4 on Data Modul i.MX8M Plus eDM SBC to avoid boot hang
  in case that RDC protection is in place.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: tqma8mpql: fix audio codec iov-supply

Fabio Estevam (2):
      Revert "arm64: dts: imx8mp-dhcom-pdk3: Describe the USB-C connector"
      Revert "arm64: dts: imx8mn-var-som-symphony: Describe the USB-C connector"

Lucas Stach (1):
      bus: imx-weim: fix valid range check

Marek Vasut (1):
      arm64: dts: imx8mp: Disable UART4 by default on Data Modul i.MX8M Plus eDM SBC

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts   | 11 +++--------
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts         | 12 ++++--------
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts |  9 ++++++++-
 drivers/bus/imx-weim.c                                      |  2 +-
 5 files changed, 17 insertions(+), 19 deletions(-)


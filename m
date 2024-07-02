Return-Path: <SRS0=Dzy4=OC=yeah.net=shawnguo2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E12C3065D
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 14:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F0ADC4AF14; Tue,  2 Jul 2024 14:22:26 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.kernel.org (Postfix) with ESMTP id 6360CC4AF12;
	Tue,  2 Jul 2024 14:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6360CC4AF12
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Xse5U
	t/8KgzCgju3bJR074D18X2uH0iR3vw8nvx5xdk=; b=eLebawGAHosxhB2jaZuBU
	V2JC4/GKs0P23EeoVAlrUUguh9m2RylUqezH0O5sBPXRzxZOgKCJBA54/OOt62+N
	3nd3si6FBYnr3P83b/kemwj6H4BoZ8wIHrrTlifZdKBBKrIeNofFK6cmgNgkOtGl
	kQk6watj013fCTxwzR5/JQ=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S6;
	Tue, 02 Jul 2024 22:22:14 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.11
Date: Tue,  2 Jul 2024 22:21:53 +0800
Message-Id: <20240702142153.413061-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702142153.413061-1-shawnguo2@yeah.net>
References: <20240702142153.413061-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S6
X-Coremail-Antispam: 1Uf129KBjvJXoWrZry7Zr4DAFyrurW7KrykKrg_yoW8JF15pF
	13CwnrGr48JrWrGr42qF9F9FWrAwn7Jr4DJw1UJ34rWry7Z34UZr1DJ34xXFWUtr97GFW8
	J3WrGF1DKr1UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jniSdUUUUU=
X-Originating-IP: [114.218.218.47]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERYQZWZv-d8qowAAsQ

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.11

for you to fetch changes up to 3898bc187cde9ea6918d1a8a9c8e0b4f611674fd:

  arm64: defconfig: Enable the IWLWIFI driver (2024-06-27 18:38:49 +0800)

----------------------------------------------------------------
i.MX defconfig change for 6.11:

- Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
  imx_v6_v7_defconfig
- Enable RAM block device and IWLWIFI driver support in arm64 defconfig

----------------------------------------------------------------
Alexander Stein (1):
      ARM: imx_v6_v7_defconfig: Enable drivers for TQMa7x/MBa7x

Dmitry Baryshkov (1):
      ARM: imx_v6_v7_defconfig: enable DRM_SII902X and DRM_DISPLAY_CONNECTOR

Fabio Estevam (2):
      arm64: defconfig: Enable RAM block device support
      arm64: defconfig: Enable the IWLWIFI driver

 arch/arm/configs/imx_v6_v7_defconfig | 7 +++++++
 arch/arm64/configs/defconfig         | 5 +++++
 2 files changed, 12 insertions(+)


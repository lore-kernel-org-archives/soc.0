Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F978F26
	for <soc@lists.linux.dev>; Sun, 13 Jul 2025 05:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752386104; cv=none; b=Apn0sXyor56d00IfpCRmk/23uTILMcViFCVAqgiag/Oa25joitB0CRZYBjr8h6Rve6bWDl83SdhfNMv4Kyaf7w+vwZCvto1ZbP28Fyv+2ZEN3HXU9F83cSxMJ1upuRz1GIzg7GFS/XoYAnLm3VWGq9UwUIkvcRCyz2z31xJFNfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752386104; c=relaxed/simple;
	bh=9qav35dI38HGnZeLywVrG2HvdYrepMlcUTt/uf9fCvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NudqJZhEhzB/cXkDFkfzSx8ksMobTXu6UdKmC5WqBqU0oHPjKgCxO+LgY/YZfC+mZTTLcBWbpnbGPhkT7TkDcujKxrqP6v893IJ8tBai3Vs9ETyRQs0+G/PS/f1eUYiEj2YCyXiw02hfmUCZZMJwuCKlIgniqvp2A6A4WQzv1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=flyqmU8d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="flyqmU8d"
Received: by smtp.kernel.org (Postfix)
	id 71727C4AF09; Sun, 13 Jul 2025 05:55:04 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E0F5C4CEF4;
	Sun, 13 Jul 2025 05:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E0F5C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9J
	fTmF5mcMbLlkfBsdbeklzsnTl46CTDbZERvcEGyu8=; b=flyqmU8dBWfVC8tSpQ
	C9m66Uu6yh5/LFXL+eq4mLTNWWzWNWMMch+7w62Q6S17l5RZPsbsxtR07H2S936W
	QVz39SCU1tYJ6Zyk+8/ZRZ0hp3nEN1pMpGTkvMQWHec8BooeqRKsvOdXDWVQ2FKX
	gobOM752zpeGfFmmodK2FeR7s=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S6;
	Sun, 13 Jul 2025 13:54:50 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig change for 6.17
Date: Sun, 13 Jul 2025 13:54:34 +0800
Message-ID: <20250713055441.221235-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDXb50mSnNoHrt9AA--.3344S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr13Jr43ur1DWr4DKr4kZwb_yoW8Wr4DpF
	nayrsrGrW8JF1rJrW7JFWvgrW8J3srJr1DGr17t34rZrW7Z34UZw1DXryxurWUJr9rtF1U
	KFyrK3WDKr1UAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jniSdUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgqT+GhzSioYtwAA3X

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.17

for you to fetch changes up to 0c7124658677885b603f1748fb997b3bdc87dc69:

  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503 (2025-07-02 17:58:23 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.17:

- Enable S32G RTC driver as module in arm64 defconfig
- Enable drivers used by imx28-amarula-rmm board in mxs_defconfig
- Enable INPUT_PWM_BEEPER, USB_HSIC_USB3503 and BT_HCIUART_BCM in
  imx_v6_v7_defconfig

----------------------------------------------------------------
Ciprian Marian Costea (1):
      arm64: defconfig: add S32G RTC module support

Dario Binacchi (5):
      ARM: mxs_defconfig: Cleanup mxs_defconfig
      ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm
      ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
      ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
      ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

Fabio Estevam (1):
      ARM: imx_v6_v7_defconfig: Select BT_HCIUART_BCM

 arch/arm/configs/imx_v6_v7_defconfig | 28 +++++++---------------------
 arch/arm/configs/mxs_defconfig       | 14 +++-----------
 arch/arm64/configs/defconfig         |  1 +
 3 files changed, 11 insertions(+), 32 deletions(-)


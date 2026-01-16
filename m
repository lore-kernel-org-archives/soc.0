Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD4317BCA
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569434; cv=none; b=JM/TAt6NDrirtVHt0Q+niO2xM+mkuBBQ9uI6F0k0FwKPKyxHoPkyBb3FDy/c3Brk0uc+4/CVgkbNNNajmRGKxihxWApf+2wORZ58gx6LGcgGhrSwqd0FbFgwlu4e81S3VR1/j5h+nS0qQOmvnnH79ikHg7mPttgsDcIQ2CflWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569434; c=relaxed/simple;
	bh=iw9AAhLT0LshPbazZg9/+/V9To0CbwXv4vifKCG8/iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUSrYEbnlONbgH5tHLuTtf373A47UqzSXSnlFDvmotueKzRrFbqivIq+6yS8cbGEFnU03+3NI78bwp3/9TX5PxqGfasTCsWFajLywDsKEPn/ge5Zue+0+IrU/Z6QLqI19D6S+3v45dKM2rlNemORK/orQ/VMTQHnpk+A5SNtHes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=HffbEYQR; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=HffbEYQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="HffbEYQR";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="HffbEYQR"
Received: by smtp.kernel.org (Postfix)
	id 0E659C19421; Fri, 16 Jan 2026 13:17:14 +0000 (UTC)
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E05BC16AAE;
	Fri, 16 Jan 2026 13:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E05BC16AAE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768569423; bh=iw9AAhLT0LshPbazZg9/+/V9To0CbwXv4vifKCG8/iw=;
	h=From:To:Cc:Subject:Date:From;
	b=HffbEYQRZqRlfVaG19ZFgQZSMVRBYUmJvUF9z0Rq14zi1D5amx82ePGlDXUa5bqdO
	 Eno92g0WCzUReZbAU7yUiusgONRS67ZfU8Dpj4syb4GKSwswkFZBhxGeJVKC0otxbf
	 GWLsI+3lMy0RoGuAIihFaE6yom5WGSxGIwe5v+S0hl9HLbmiHUqMT9VwJonZOUveir
	 K7jy7lh135XgRxjkHZK/dNGVAVE+gEJdm51rdxFxowKO2A3v2rU2nedfsuTnLVTDuK
	 6eJIzyB0DmYmPVm2Y4qSIrNWc5AlxkNAhGgqnv8A2Cp/2k622UCpw20X7SP86F1uYs
	 IUd7/NhusguKA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C57503ED230;
	Fri, 16 Jan 2026 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768569423; bh=iw9AAhLT0LshPbazZg9/+/V9To0CbwXv4vifKCG8/iw=;
	h=From:To:Cc:Subject:Date:From;
	b=HffbEYQRZqRlfVaG19ZFgQZSMVRBYUmJvUF9z0Rq14zi1D5amx82ePGlDXUa5bqdO
	 Eno92g0WCzUReZbAU7yUiusgONRS67ZfU8Dpj4syb4GKSwswkFZBhxGeJVKC0otxbf
	 GWLsI+3lMy0RoGuAIihFaE6yom5WGSxGIwe5v+S0hl9HLbmiHUqMT9VwJonZOUveir
	 K7jy7lh135XgRxjkHZK/dNGVAVE+gEJdm51rdxFxowKO2A3v2rU2nedfsuTnLVTDuK
	 6eJIzyB0DmYmPVm2Y4qSIrNWc5AlxkNAhGgqnv8A2Cp/2k622UCpw20X7SP86F1uYs
	 IUd7/NhusguKA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 1D01A3ECA9B;
	Fri, 16 Jan 2026 13:17:02 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] NXP LPC32xx device tree changes for v6.20
Date: Fri, 16 Jan 2026 15:16:37 +0200
Message-ID: <20260116131637.101296-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260116_131703_826397_369B0FC1 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message. 

Hello SoC maintainers,

the following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/vzapolskiy/linux-lpc32xx tags/lpc32xx-dt-for-6.20

for you to fetch changes up to 2940a49ab7e31e9fc4f43637dc9ef75b5e8951d4:

  arm: dts: lpc32xx: add interrupts property to Motor Control PWM (2026-01-10 03:47:36 +0200)

----------------------------------------------------------------
ARM: nxp: lpc: device tree updates for v6.20

This pull request contains device tree changes for ARM NXP LPC32xx intended
for v6.20, please pull the following:

- Frank fixes device tree checker warnings reported for NXP LPC32xx boards,
- Piotr addes a DMA mux block under SCB, DMA properties to controllers and
  I2S support for NXP LPC32xx,
- Kuldeep corrects values of PrimeCell PL022 'clocks' and 'clock-names'
  properties, this is the change from a waiting queue, recently it was
  repeatedly done by Frank, the hesitation was about a probable ABI break,
  but here in particular the risk is practically negligible due to the kept
  backwards compatibale 'clocks' property,
- Vladimir adds a few missing properties to a number of LPC32xx controllers.

----------------------------------------------------------------
Frank Li (4):
      ARM: dts: lpc32xx: remove usb bus and elevate all children nodes
      ARM: dts: lpc3250-ea3250: add key- prefix for gpio-keys
      ARM: dts: lpc3250-phy3250: rename nodename at@0 to eeprom@0
      ARM: dts: lpc3250-phy3250: replace deprecated at25 properties with new ones

Kuldeep Singh (1):
      ARM: dts: lpc32xx: Update spi clock properties

Piotr Wojtaszczyk (3):
      ARM: dts: lpc32xx: Use syscon for system control block
      ARM: dts: lpc32xx: Add missing DMA properties
      ARM: dts: lpc32xx: Add missing properties to I2S device tree nodes

Vladimir Zapolskiy (5):
      ARM: dts: lpc32xx: change NAND controllers node names
      ARM: dts: lpc32xx: describe FLASH_INT of SLC NAND controller
      ARM: dts: lpc32xx: Declare the second AHB master support on PL080 DMA controller
      arm: dts: lpc32xx: add clocks property to Motor Control PWM device tree node
      arm: dts: lpc32xx: add interrupts property to Motor Control PWM

 arch/arm/boot/dts/nxp/lpc/lpc3250-ea3250.dts  |  18 ++--
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts |   8 +-
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        | 133 ++++++++++++++++----------
 3 files changed, 94 insertions(+), 65 deletions(-)

Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DB1C3DA79
	for <soc@archiver.kernel.org>; Mon, 26 Dec 2022 12:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBF0DC433EF; Mon, 26 Dec 2022 12:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837E2C433D2;
	Mon, 26 Dec 2022 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672059006;
	bh=K3+U7QZiVjxBOUD8E8qTZIN+Mge7kXxEB82YEA4VyIM=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=Ho2qDPyMCyKJLsV0KeWrepojKKOGQgLr3Fs39p4QrZfthCXkCUcoSnMQPFYn0xb/A
	 sEdwtDZijkQS0fe9eEL+tQc9XWE0xvT6aTNbo5OdqwcCUIdmb3chpGDCLq2BMBVpHk
	 jS9KfP1tdaSlYK7/yiAsikbUXjlQzPxNBNNkBIdolZXidzp+NYAor66ify7aPWeIi2
	 L2fP0VNUc506YAMYZrI2okq3Nm4rNiSWWiP4FUeTMxffo3IAcsxRTNfRyBO87icWX7
	 7QVAR7qX7roeQS1oDs2f5vI0Zv6JwUKTRnO/N3CDdDnjvpvHrl18MHs6D11FCvfLa9
	 VWzFDFK5mqxlw==
Received: by pali.im (Postfix)
	id A83389D7; Mon, 26 Dec 2022 13:50:03 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/8] Resend LED patches
Date: Mon, 26 Dec 2022 13:36:22 +0100
Message-Id: <20221226123630.6515-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus Walleij suggested me to send these patches to SoC tree [1]
instead. So I'm doing it.

This patch series contains LED patches which are on the linux-leds
mailing list for a long time without any future movement. Could you
please handle them here via SoC tree? Thanks.

[1] - https://lore.kernel.org/linux-leds/CACRpkdad6WDo7rGfa4MW8zz0mLXmcPHo+SEC-yLQnRz_kdrryA@mail.gmail.com/

Marek Behún (3):
  leds: turris-omnia: support HW controlled mode via private trigger
  leds: turris-omnia: initialize multi-intensity to full
  leds: turris-omnia: change max brightness from 255 to 1

Pali Rohár (5):
  dt-bindings: leds: register-bit-led: Add active-low property
  leds: syscon: Implement support for active-low property
  powerpc/85xx: DTS: Add CPLD definitions for P1021RDB Combo Board CPL
    Design
  dt-bindings: leds: Add cznic,turris1x-leds.yaml binding
  leds: Add support for Turris 1.x LEDs

 .../testing/sysfs-class-led-driver-turris1x   |  31 ++
 .../bindings/leds/cznic,turris1x-leds.yaml    | 118 +++++
 .../bindings/leds/register-bit-led.yaml       |   5 +
 arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    |  92 ++++
 arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |   6 +-
 arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |   6 +-
 arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     |  44 +-
 arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    |  37 ++
 arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |   4 +-
 arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |   4 +-
 arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    |  37 ++
 arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |   5 +-
 arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |   5 +-
 arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    |  33 +-
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-syscon.c                    |  14 +-
 drivers/leds/leds-turris-1x.c                 | 474 ++++++++++++++++++
 drivers/leds/leds-turris-omnia.c              |  46 +-
 19 files changed, 945 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris1x
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
 create mode 100644 drivers/leds/leds-turris-1x.c

-- 
2.20.1


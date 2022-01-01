Return-Path: <SRS0=LxC5=RR=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66455C433FE
	for <soc@archiver.kernel.org>; Sat,  1 Jan 2022 20:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B24BC36AF4; Sat,  1 Jan 2022 20:27:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF828C36AED;
	Sat,  1 Jan 2022 20:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF828C36AED
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MGA0o-1nBOsJ3wMO-00GbrR; Sat, 01 Jan 2022 21:27:16 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Chi-hsien Lin <chi-hsien.lin@infineon.com>,
	Wright Feng <wright.feng@infineon.com>,
	Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
	Kalle Valo <kvalo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/4] ARM: dts: Add Raspberry Pi Zero 2 W support
Date: Sat,  1 Jan 2022 21:26:48 +0100
Message-Id: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:IFSO4SUR/GIS5KxCX2rqPx8bY+J5e6YDOUTd/t3oeHG3mWoStUS
 AX9YcJnrfYrz4qtPGFGKHCv+7TU0r7i+BCJ0vHJR4hO8aCnWTQM+7lQ54tAHw/PDBw6eOUb
 G5giL64OquBD3UCz0yfE3ba43et33AA4GJaVYkId52sxzvofn4udgAMoRbOyzciF+0nZeo3
 f5i6sNZOpDTXNG1N2EQjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RMBwnFZyx5g=:PTRizSkKrKbmSWzLVZGc6P
 ZcSXAb1FX2HHMdsC8kWz4h6/l1iypMbdizOj6zbg1IpaPhMQEpXai+9g6DqObTG4EkZJxqkMr
 UuDC88WT7yma8TzB6nB67trJXLk+E/mn/n+74NaZTTSMHzUIxS7Lx4+ZDFjr0Ju4wYig1vDnU
 U57qD0hz7bMqPoobFfJF21ROv/w2v8LiQ7a/VcNiy+rolUHXxYuGSHh/Q0WK6yVeLt8mLc5TG
 EId8GyC6kX3K80nFI5cmQkMrz2W/dI88sd+wUTmw30nVqIS/mDiNa2z60mdaucaXJ+uzx8EYk
 iH1Jxv69x7iwISlvH1LH51No8D1oagBhr1J7AeQDGa5viPV5PtmdLSbWNhMy7qAHMUQmwFn0V
 a5HTNwnZmaFtPwLQDIiUiY529izbN1O7B9AxnZlEw+dsLOgg3fbYfXR92TnzxoiAZCoD6TFcU
 0pwbvEI3XSwMECn3JTB22MdcPkubVlbhOSOJRWt4HoFCqC19eVXjaozI1VHgyEM2KFnPWy1sz
 KwhLyuIfxWsiWcfSMkLKZ3e81v9784HCvAU6u6Kkagct0wc9ewjfjEGyquxzlWdrrBFRNi3c2
 girp8TbUczpJxHZGvogr7aoiSPoRXLusoiICbhamxU6zMztUy/70MA69HKdxKh6H/Y4k2PN5l
 3fRo5ra8jSiwpZAH90Ke2WBkGMwyEp405iWhohDw51vG+camf5f9o2UokUq41AqqQ7H6w6jTY
 EF2f0mI6k6GsMKWl

This small series tries to add support for the Raspberry Pi Zero 2 W.

Stefan Wahren (4):
  brcmfmac: use separate firmware for 43430 revision 4
  dt-bindings: arm: bcm2835: Add Raspberry Pi Zero 2 W
  ARM: dts: Add Raspberry Pi Zero 2 W
  arm64: dts: broadcom: Add reference to RPi Zero 2 W

 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts         | 136 +++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile              |   3 +-
 .../boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts     |   2 +
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |   4 +-
 6 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2837-rpi-zero-2-w.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dts

-- 
2.7.4


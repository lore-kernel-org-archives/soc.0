Return-Path: <SRS0=/cV5=TC=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE25C433F5
	for <soc@archiver.kernel.org>; Sat, 19 Feb 2022 12:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8642C36AE2; Sat, 19 Feb 2022 12:08:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D885C004E1;
	Sat, 19 Feb 2022 12:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D885C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOQu6-1ncLaP2beg-00Prwh; Sat, 19 Feb 2022 13:08:27 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
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
	linux-rpi-kernel@lists.infradead.org,
	Maxime Ripard <maxime@cerno.tech>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] ARM: boot: dts: bcm2711: Fix HVS register range
Date: Sat, 19 Feb 2022 13:07:55 +0100
Message-Id: <1645272475-4096-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:CEQXljQlq99kCIS1ovn802odaTpnYacaS+3Ogj8ElXNPPTDkElg
 cevyNxcrsfhxgAcO3zh9TnJQ8tNG++GeF7m7PnzVThx3U3a4mqSSI1YISSw4Xjo7TJfx4Hj
 RgkaEzkrOc5oZNEXwZC0bjPMYr6CwIcHIGgDXl9/Ku10S8GuDZGkJqbBKRf43oeNd7qDgWm
 TYXSJFLGa6v6kyyGVyDoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iXlHHJ9AljU=:rI/f2rBnM3wxUNc8i0hOwm
 YlzY3n5YrYROV2XTtERbPCXy5EpV/AiVbIs//ZBP4gA9yORNJr52S7hrxgM/G3f12D/5WQjR2
 HNZcA9SB9kFIEyIM8eGJV8mSW9fgerVipepbvPUzJskjIlQu/FeAmebGZ+AexPgtzyCwVolyj
 XwE045wsjCZrPZ3S8voL2QlgoDQ/VUze1GNxvNYObzjPvMFHU77gSGwo6BJYe/C3uAMtaB+GQ
 Q1KFqZOU0qNSQ2fC+Qrq6t4KehubaHYa7faZvzzrMWnqEj9DelaJGI4Q7/ktQB+ALk+bh+MJb
 UYoIa5yKe08T20ZMP6DiS2M0FMqI/4kGtUcOjEsdz7DGCC9KpXSFqOAYqO1GO43NxVNMlpljm
 cS5UPtysEKqj0V7WvLDL4GVyyT2thy9xFV0YOrWVMhGKQihiZlXzMyiYtflQuJkE8Hqlzt3F8
 bN+8g3LD/+TpsiXBExCbxcVn2wj2YvGPkDvXLoP0+cxjNGgcYKlCFQ0HBGWSJeg0HzrC8QN62
 PuzyTGNZFLxl8+bY3HFcsVLiABWp+0VFuoO+lmCQUcdgi3uwyIBtESCibvXtaFfgY/cjHh2cH
 NYtH9Km0dGxZ+OXEncmXtmknpdiAdNz2zXLCZDFWaAhEXAdyphvPKkq991dEk+dmLzhNMRdKZ
 6zKoYgSM+fmqLPgcuvd7mJmUMF18Lncgdo2Xh17VDkNTcpQic98pNA2QKUhZQRnAhm58qAkXV
 swR2lj39dOdQicEx

From: Maxime Ripard <maxime@cerno.tech>

While the HVS has the same context memory size in the BCM2711 than in
the previous SoCs, the range allocated to the registers doubled and it
now takes 16k + 16k, compared to 8k + 16k before.

The KMS driver will use the whole context RAM though, eventually
resulting in a pointer dereference error when we access the higher half
of the context memory since it hasn't been mapped.

Fixes: 4564363351e2 ("ARM: dts: bcm2711: Enable the display pipeline")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index dff18fc..21294f7 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -290,6 +290,7 @@
 
 		hvs: hvs@7e400000 {
 			compatible = "brcm,bcm2711-hvs";
+			reg = <0x7e400000 0x8000>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.7.4


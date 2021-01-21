Return-Path: <SRS0=ZEVb=GY=v3.sk=lkundrak@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827D6C4332D
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 03:41:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 46E96238E1; Thu, 21 Jan 2021 03:41:41 +0000 (UTC)
Received: from shell.v3.sk (mail.v3.sk [167.172.186.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DC8238D7;
	Thu, 21 Jan 2021 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95DC8238D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lkundrak@v3.sk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 6F214E0AA5;
	Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id SxeCojyWVPUg; Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra.v3.sk (Postfix) with ESMTP id 2AEBAE0AA6;
	Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
	by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8KC0LjPfF8nu; Thu, 21 Jan 2021 03:37:43 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
	by zimbra.v3.sk (Postfix) with ESMTPSA id D2B29E0AA5;
	Thu, 21 Jan 2021 03:37:42 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	SoC Team <soc@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 07/12] ARM: dts: mmp2: Use symbolic names for audio clocks
Date: Thu, 21 Jan 2021 04:41:25 +0100
Message-Id: <20210121034130.1381872-8-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121034130.1381872-1-lkundrak@v3.sk>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These are slighly easier to read.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 445bdcd50b9ed..46984d4c5224f 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -6,6 +6,7 @@
=20
 #include <dt-bindings/clock/marvell,mmp2.h>
 #include <dt-bindings/power/marvell,mmp2.h>
+#include <dt-bindings/clock/marvell,mmp2-audio.h>
=20
 / {
 	#address-cells =3D <1>;
@@ -243,7 +244,7 @@ sspa0: audio-controller@d42a0c00 {
 				interrupts =3D <2>;
 				clock-names =3D "audio", "bitclk";
 				clocks =3D <&soc_clocks MMP2_CLK_AUDIO>,
-					 <&audio_clk 1>;
+					 <&audio_clk MMP2_CLK_AUDIO_SSPA0>;
 				power-domains =3D <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
 				#sound-dai-cells =3D <0>;
 				status =3D "disabled";
@@ -256,7 +257,7 @@ sspa1: audio-controller@d42a0d00 {
 				interrupts =3D <3>;
 				clock-names =3D "audio", "bitclk";
 				clocks =3D <&soc_clocks MMP2_CLK_AUDIO>,
-					 <&audio_clk 2>;
+					 <&audio_clk MMP2_CLK_AUDIO_SSPA1>;
 				power-domains =3D <&soc_clocks MMP2_POWER_DOMAIN_AUDIO>;
 				#sound-dai-cells =3D <0>;
 				status =3D "disabled";
--=20
2.29.2


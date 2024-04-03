Return-Path: <SRS0=tmn7=LI=rnplus.nl=renze@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7686BCD1288
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 13:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45C57C433F1; Wed,  3 Apr 2024 13:45:39 +0000 (UTC)
Received: from mail.rnplus.nl (mail.rnplus.nl [178.251.25.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3755EC43390
	for <soc@kernel.org>; Wed,  3 Apr 2024 13:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3755EC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=rnplus.nl
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rnplus.nl
Received: from localhost (unknown [127.0.0.1])
	by mail.rnplus.nl (Postfix) with ESMTP id C9E46379491
	for <soc@kernel.org>; Wed,  3 Apr 2024 13:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at rnplus.nl
Received: from mail.rnplus.nl ([127.0.0.1])
	by localhost (mail.rnplus.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XWKYp-y20NDk for <soc@kernel.org>;
	Wed,  3 Apr 2024 15:37:39 +0200 (CEST)
Received: from localhost.localdomain (184-179-179-143.ftth.glasoperator.nl [143.179.179.184])
	by mail.rnplus.nl (Postfix) with ESMTPSA id CBDE337947A;
	Wed,  3 Apr 2024 15:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rnplus.nl; s=dkim;
	t=1712151453; bh=J3x6v1j8NItiPEP2ALslVPQ+eLcuXH6rDPyikVVJs7U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Z26dLVShrOqZaVWeKDgn4w32mfSkcvgNAkOzrO3X9xDzIkQIu66+cACZmAdvbrv86
	 kjr6bffH0ynPQYYIyKPNwQN3B+4GBGuok9EkXfnQORJWkEPYozDDcDaQh61F3YxYbG
	 VMCxGa1Nm6fuT3UzR9LBOMwRqrUOitlAZI+IGJ1E=
From: Renze Nicolai <renze@rnplus.nl>
List-Id: <soc.lore.kernel.org>
To: renze@rnplus.nl,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH v2 2/3] ARM: dts: Disable unused ADC channels for Asrock X570D4U BMC
Date: Wed,  3 Apr 2024 15:28:52 +0200
Message-ID: <20240403133037.37782-3-renze@rnplus.nl>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403133037.37782-1-renze@rnplus.nl>
References: <20240403133037.37782-1-renze@rnplus.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Additionally adds labels describing the ADC channels.

Signed-off-by: Renze Nicolai <renze@rnplus.nl>
---
 .../dts/aspeed/aspeed-bmc-asrock-x570d4u.dts  | 29 +++++++++----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
index dff69d6ff146..66318ef8caae 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dts
@@ -337,20 +337,17 @@ fan@5 {
 &adc {
 	status = "okay";
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_adc0_default
-				&pinctrl_adc1_default
-				&pinctrl_adc2_default
-				&pinctrl_adc3_default
-				&pinctrl_adc4_default
-				&pinctrl_adc5_default
-				&pinctrl_adc6_default
-				&pinctrl_adc7_default
-				&pinctrl_adc8_default
-				&pinctrl_adc9_default
-				&pinctrl_adc10_default
-				&pinctrl_adc11_default
-				&pinctrl_adc12_default
-				&pinctrl_adc13_default
-				&pinctrl_adc14_default
-				&pinctrl_adc15_default>;
+	pinctrl-0 = <&pinctrl_adc0_default       /* 3VSB */
+			&pinctrl_adc1_default    /* 5VSB */
+			&pinctrl_adc2_default    /* VCPU */
+			&pinctrl_adc3_default    /* VSOC */
+			&pinctrl_adc4_default    /* VCCM */
+			&pinctrl_adc5_default    /* APU-VDDP */
+			&pinctrl_adc6_default    /* PM-VDD-CLDO */
+			&pinctrl_adc7_default    /* PM-VDDCR-S5 */
+			&pinctrl_adc8_default    /* PM-VDDCR */
+			&pinctrl_adc9_default    /* VBAT */
+			&pinctrl_adc10_default   /* 3V */
+			&pinctrl_adc11_default   /* 5V */
+			&pinctrl_adc12_default>; /* 12V */
 };
-- 
2.44.0


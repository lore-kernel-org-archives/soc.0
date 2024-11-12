Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866071F26C4
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 00:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371167; cv=none; b=KC6vAfj9r/iT/BV4tDLErmMWWH9z6N/zdYw/wU1VuTrdu4kx+Oco2ZpX56FyW8e71YxM3YiI1BCxYIAd7JHC3ISibXjnoqotN+nShiE9LcbkDLOk13upXGNrFQ7MQIE7YWEwPfTgM1AJWiRDVHsvW43l1XFHctOmWUpYELcZyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371167; c=relaxed/simple;
	bh=MjbhBoH5H+ayb1be4EkJarzqz/SJicRiWpjnj+jQOXk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fnoz/7cD8bP3PCevcAVALz3WnwDRPR7dHm/j98377G/p0UH9D5Ngtgz9xrx0zjIr900fH3n+0A5uQqZPcv8AudXsJUVvkdOD2v3j9xWVlwYWo6CTl6xTQJU1FX6xntiJBGDQyenTOFY9JIFEnetv3Knp79ifu4OHImDVBJrqsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Q6gi6AaA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Q6gi6AaA"
Received: by smtp.kernel.org (Postfix)
	id 07841C4CECF; Tue, 12 Nov 2024 00:26:07 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7053DC4CED0
	for <soc@kernel.org>; Tue, 12 Nov 2024 00:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7053DC4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731371163;
	bh=TP/R8yvIxXJ/1bBMlCyZAmKP6FahkNnCn1QGp1CZYY8=;
	h=From:To:Cc:Subject:Date;
	b=Q6gi6AaAB8oVq///JQvfFOWW/mAKHRCpLuF7YSXu6qKWtkr/8WsRxAqo9ZZCQYWow
	 LrV7rtBXeL9LEZlIz0NYBFdRMhVhYZktFMZqgVp9uhJro4zSUfIwFvLJSG4zkhzZvu
	 W1IiJOzyOwMPd8B/xpJUKIuQD+iB+6gDIFFaOsft3GZXiBXqmlPBUE9Q2e4L3iEpnp
	 7F0uYJanTKJsCk2p88aee+vKsNGnf2MNjo+41RWVRxhsAL/JgyX7/Lfby0paQFNxsH
	 2ZtQt45MR7ZrtbZXwCxhatHnJypMrEf7PlbJws6Wkyta6JWqGH2Del2dFP+DyTpGNv
	 AaBQysL1V7Gfg==
Received: from localhost.localdomain (ppp118-210-164-236.adl-adc-lon-bras34.tpg.internode.on.net [118.210.164.236])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E8EEA65FAE;
	Tue, 12 Nov 2024 08:26:02 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc@kernel.org
Cc: joel@jms.id.au
Subject: [PATCH] ARM: dts: nuvoton: Fix at24 EEPROM node names
Date: Tue, 12 Nov 2024 10:55:57 +1030
Message-Id: <20241112002557.26284-1-andrew@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Rob Herring (Arm)" <robh@kernel.org>

at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://patch.msgid.link/20240910215905.823337-1-robh@kernel.org
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

This is the sole Nuvoton BMC devicetree patch we had for this cycle, and as such
Joel and I feel a PR is unnecessary for it.

I realise this might be a little late, but please apply if you're happy to do
so.

Thanks,

Andrew

 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts           | 6 +++---
 .../arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
index 9f64c85e1c20..c3501786d600 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts
@@ -661,7 +661,7 @@ &i2c5 {
 	clock-frequency = <100000>;
 	status = "okay";
 
-	mb_fru@50 {
+	eeprom@50 {
 		compatible = "atmel,24c64";
 		reg = <0x50>;
 	};
@@ -704,7 +704,7 @@ max31725@5d {
 				reg = <0x5d>;
 				status = "okay";
 			};
-			fan_fru@51 {
+			eeprom@51 {
 				compatible = "atmel,24c64";
 				reg = <0x51>;
 			};
@@ -714,7 +714,7 @@ i2c5_hsbp_fru_3: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-			hsbp_fru@52 {
+			eeprom@52 {
 				compatible = "atmel,24c64";
 				reg = <0x52>;
 				status = "okay";
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
index 087f4ac43187..f67ede148209 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts
@@ -824,7 +824,7 @@ tmp75@4a {
 		reg = <0x4a>;
 		status = "okay";
 	};
-	m24128_fru@51 {
+	eeprom@51 {
 		compatible = "atmel,24c128";
 		reg = <0x51>;
 		pagesize = <64>;
-- 
2.39.5


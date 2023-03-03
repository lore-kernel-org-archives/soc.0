Return-Path: <SRS0=n/Pu=63=gmail.com=tomato1220@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F0FC7EE32
	for <soc@archiver.kernel.org>; Fri,  3 Mar 2023 06:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEC0DC433D2; Fri,  3 Mar 2023 06:36:56 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAA27C4339B;
	Fri,  3 Mar 2023 06:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EAA27C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so1337310pjz.1;
        Thu, 02 Mar 2023 22:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUjTuzTTp/FXXoYY/BQnloUngbziX8MGZzy2Wy1/eYQ=;
        b=JC0qTlMTJWmsRiVb1Y+BFH8rXX42ktQzahOVJkBIoDodPtfUJrsYcNFQCwj3l+JXMo
         tRXx2a7UAMiZBe6V4I0bR4UktIV+H0hU7AT9aQomE0ibQx+VGDswpnFYGjPucS1Q3C0p
         hZ7Aj7ybRxjq3scaDaBq/17tvOG7WEG/AES8XOu+PN4CnJ29d2cmnN68iPbWCY1UmDkz
         7r0PxTYEhvv7xwSve25GPBOqcZanmYet/PquzEypPzZRBjUXFjihQR79bCfvbt5PMHsd
         qUOLOmZW3TErqNzmzfgrSogIb5uT6TMDMfbUey0KlDMyAgnA8EOWhXx+F6RFABUohOBh
         UMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUjTuzTTp/FXXoYY/BQnloUngbziX8MGZzy2Wy1/eYQ=;
        b=oxdciOBdSGBKteIXieduKPSujKw6+VUCkza/6paISq1P8aWnCbVzJ4O3dGN4SsJGie
         67bP3yZ+GDC2Isec1vpjlfkLgp9RNkYV4PgpONCJB9jA3ubtKv2gro15ncVH7+3W16QC
         lFiuq3jfFuQCs/Eeh0DlmesCdN/HBw16ViD1eUXt6+LQubEp2yovygF4mXJkFMq6TfHy
         9xmg1N4m9gYOHRGp5Xrvn55c0urnhUG/T+q9CxRh44zGzj0zJm0oIncQ/DNNCbfywTOc
         zDTUtrVJQwaqa4eG/jyIqeF8otJXaDvdGQ648tp3Uc5CiLXnmmGrdyr02a9FNLJihnsC
         22wA==
X-Gm-Message-State: AO0yUKW6/yIkACTWCu7+R4IU1bTfN64OwvYT53vZBLH/AEzc8JirmSyd
	WaFybJa7XPedCxd+ocjg69k=
X-Google-Smtp-Source: AK7set98WDaa+JVAEEXTa16vJKHXteaKqiwrMQSwBheW7GzCdujgBd/N7Jn1lwBGaRTF/gnffERXJw==
X-Received: by 2002:a17:90a:4e:b0:237:b5d4:c0e5 with SMTP id 14-20020a17090a004e00b00237b5d4c0e5mr582481pjb.27.1677825415298;
        Thu, 02 Mar 2023 22:36:55 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:36:55 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	fran.hsu@quantatw.com,
	David Wang <davidwang@quantatw.com>
Subject: [PATCH 3/7] ARM: dts: nuvoton: gbs: Split SPI flash partition
Date: Fri,  3 Mar 2023 14:34:31 +0800
Message-Id: <20230303063435.803097-3-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the primary and secondary BIOS SPI EEPROMs in 2 partitions

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 29 ++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index 9e9eba8bad5e..a33766e430d7 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -414,7 +414,20 @@ flash@0 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
-		label = "pnor";
+		label = "bios";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bios-primary@0 {
+				label = "bios-primary";
+				reg = <0x0000000 0x2000000>;
+			};
+			bios-secondary@2000000 {
+				label = "bios-secondary";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
 	};
 	flash@1 {
 		compatible = "jedec,spi-nor";
@@ -424,6 +437,20 @@ flash@1 {
 		spi-max-frequency = <50000000>;
 		spi-rx-bus-width = <2>;
 		m25p,fast-read;
+		label = "bios-2";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bios-2-primary@0 {
+				label = "bios-2-primary";
+				reg = <0x0000000 0x2000000>;
+			};
+			bios-2-secondary@2000000 {
+				label = "bios-2-secondary";
+				reg = <0x2000000 0x2000000>;
+			};
+		};
 	};
 };
 
-- 
2.25.1


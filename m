Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB17CCA477
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 323C3C341C5; Wed,  1 Jun 2022 15:47:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1619C3411F
	for <soc@kernel.org>; Wed,  1 Jun 2022 15:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1619C3411F
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f48.google.com with SMTP id j10so3408829lfe.12
        for <soc@kernel.org>; Wed, 01 Jun 2022 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+1GcNao+MpcpUVYncd1ScTVUmB5P8PxXyVNWxX2GeI=;
        b=tnQNJHh2vEdrcbhYQuO5shlFnBSNoFpkKp6+nLw5kDyn26ZA6V+dT25LgW2GFD30j0
         Btg5efvrHQE4di3DRW/bks8zTFoIoUxFiE8YTMmzm60Y9NlxPV9hfwFGEjQ+433TAnSi
         INoWF4m/Qd7hbB6dhSz6LNtL6MDwjWAqSxxTgdJndcZsZEbPsDhwaItlMI2h5LnmwSfE
         1NsY1GivAH1Kv/FRH1jxVbgQG83QKJi50lx2ToazfWCukd6oG7Tdm5bX/K6gk/9vafbp
         qVFDJLmC6l1WOBYfcpK+1eXNLbmqm7CZ7213FdANP6gyTpj4znf7ox66XKMSBKf+2SCI
         EcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+1GcNao+MpcpUVYncd1ScTVUmB5P8PxXyVNWxX2GeI=;
        b=kP/HkxmUDb1X7ismu3I+n84hiB6YoWX8hgFqxAzEUzNdWkqFBtIOyEl0Zfc6IUb4WZ
         Lld2R6vgB4OI3y6/Nj4hchD3aBwdaiEy0BUPUrhMLQyq7j3FGnWNTT14p6fUNbnAYBHa
         FQLGk6BK/IIIZWaNYfab5bVGSUVbOGQtyiUmQkGVQdjHMPwT5o9nfJtQ7QTUY/9hfvXZ
         FovKQ3/pj2mf/dIltOs7Yoe5E2MJOAs1ZoJnv5SI6LZinRzGjZ7bNEHWTz4Snfzwsxd2
         VcJNKbzjnrGLBowUsdN2cHCq9Us/yDDbeSFBPpvZJoTqU5rY0mGveQPINUQ03/0tpvau
         QiVA==
X-Gm-Message-State: AOAM531cksuv6Q3m1NZRbKB3rAGrkw0xSuo3it0U6NaEb/P8NcFDht45
	tN1fVO4NpbH3aQ/lzLCanB4I2pS9hwPfRg==
X-Google-Smtp-Source: ABdhPJxrvmdZIE50mE4LyGk8Q7U6bi5QRa+ZXwfv1N+HWB/5Nwi30SD46rFfuu/DH57WAEhFWv7iBQ==
X-Received: by 2002:a05:6512:3c96:b0:477:e016:82a3 with SMTP id h22-20020a0565123c9600b00477e01682a3mr47737lfv.268.1654098462742;
        Wed, 01 Jun 2022 08:47:42 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id f10-20020a19380a000000b00478ad871b25sm431219lfa.145.2022.06.01.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:47:42 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	amstan@chromium.org,
	upstream@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 2/5] ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10 dts
Date: Wed,  1 Jun 2022 17:46:44 +0200
Message-Id: <20220601154647.80071-3-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
References: <20220601154647.80071-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ecc manager is a part of the Arria 10 SoC, move it to the correct
dts.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi             | 10 ++++++++++
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi | 12 ------------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 26bda2557fe8..4370e3cbbb4b 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -736,6 +736,16 @@ emac0-tx-ecc@ff8c0c00 {
 					     <37 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
+			sdmmca-ecc@ff8c2c00 {
+				compatible = "altr,socfpga-sdmmc-ecc";
+				reg = <0xff8c2c00 0x400>;
+				altr,ecc-parent = <&mmc>;
+				interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
+					     <47 IRQ_TYPE_LEVEL_HIGH>,
+					     <16 IRQ_TYPE_LEVEL_HIGH>,
+					     <48 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
 			dma-ecc@ff8c8000 {
 				compatible = "altr,socfpga-dma-ecc";
 				reg = <0xff8c8000 0x400>;
diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
index 4b21351f2694..b0d20101cd00 100644
--- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
@@ -23,18 +23,6 @@ chosen {
 	};
 };
 
-&eccmgr {
-	sdmmca-ecc@ff8c2c00 {
-		compatible = "altr,socfpga-sdmmc-ecc";
-		reg = <0xff8c2c00 0x400>;
-		altr,ecc-parent = <&mmc>;
-		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
-			     <47 IRQ_TYPE_LEVEL_HIGH>,
-			     <16 IRQ_TYPE_LEVEL_HIGH>,
-			     <48 IRQ_TYPE_LEVEL_HIGH>;
-	};
-};
-
 &gmac0 {
 	phy-mode = "rgmii";
 	phy-addr = <0xffffffff>; /* probe for phy addr */
-- 
2.36.1.255.ge46751e96f-goog


Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1888C433E6
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 699476523F; Mon,  8 Mar 2021 17:10:03 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A47C6523A
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A47C6523A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f70.google.com ([209.85.128.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOL-0003M2-Hi
	for soc@kernel.org; Mon, 08 Mar 2021 17:10:01 +0000
Received: by mail-wm1-f70.google.com with SMTP id m17so2280217wml.3
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4L5ptXi6Ff8KPlgqMtzZ9yjH3MQlq6STx7WRAfv4xo=;
        b=jIzFLM/1Vs/GF5UlbcuY77yk5HRltxAsfdhA9iRxaoDPe3JpKBv0oLVOAdsgjZmYnO
         vBHryYvvSeEx4cl7MmVQ6fvLR+5FhoQwptk1oWu76fhXX9WheF1zdos190kXcjjV+3I7
         /hcaHxUk5Vhr+2V1T5WeyqjGcboXB8waVWP1uT6ILSA51T95XQubMkEUrayyIN2lgklk
         DEBTycOWzUTbnrwgdhYq/LzuQpE/XWk8N8egK8euGF5M2QsUQMHUGmOvW0P663KkHWIp
         T+ywngAIFneZZB9MNbaLsLUOZRmZm4IatEjtHj+i0bx7Xl0N99fHfFvR6mucyZ7YJ1aM
         CKDA==
X-Gm-Message-State: AOAM532FD/QTJDKeaM6Mo8bncLAEvB277gZWF1ByCEAqazTfgwX1wwfA
	rtXb2+yGOFHMzU6q99n0fTNpA/zDVXaUPCCMda4cf/Uy0lalzT15AnN91osEHVg+gNJ/kjOWsuj
	puPk6FPoe9bp7XVZqeEndnj4=
X-Received: by 2002:adf:fe09:: with SMTP id n9mr24158669wrr.104.1615223401334;
        Mon, 08 Mar 2021 09:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPagpGsVnOaCHQeGSb/PwYZWcGo1SGrv+aPP1pQ4LRem2ryUxhQF1clMRSwozlnOT1O+X2Xg==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr24158648wrr.104.1615223401185;
        Mon, 08 Mar 2021 09:10:01 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:10:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND 2nd PATCH 06/10] arm64: dts: intel: socfpga_agilex: move usbphy out of soc node
Date: Mon,  8 Mar 2021 18:09:41 +0100
Message-Id: <20210308170945.161468-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

The usual usb-nop-xceiv USB phy node should be under root node, to fix
dtc warning:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:472.21-476.5:
        Warning (simple_bus_reg): /soc/usbphy@0: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index f46d678ba775..103de0a91e60 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -124,6 +124,11 @@ timer {
 			     <1 10 0xf08>;
 	};
 
+	usbphy0: usbphy {
+		#phy-cells = <0>;
+		compatible = "usb-nop-xceiv";
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -469,11 +474,6 @@ uart1: serial1@ffc02100 {
 			status = "disabled";
 		};
 
-		usbphy0: usbphy@0 {
-			#phy-cells = <0>;
-			compatible = "usb-nop-xceiv";
-		};
-
 		usb0: usb@ffb00000 {
 			compatible = "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
-- 
2.25.1


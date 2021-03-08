Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD46BC433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9AD176523A; Mon,  8 Mar 2021 17:10:05 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B0A65245
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35B0A65245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJON-0003P9-CU
	for soc@kernel.org; Mon, 08 Mar 2021 17:10:03 +0000
Received: by mail-wr1-f71.google.com with SMTP id i5so5101418wrp.8
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ncNIlFsguYiY4EF+KxnIV2xUChGRcZpDkfhtUUnJSss=;
        b=sKvtHRZ8BlDw34YTaciHQ5QMV7dPmQvNzC5wvLj4beCHIsjC70lTKGznm/FjhGeANz
         aHjTH02/PR0gVJuzIK0XtMc/irpa0NhbCdSt1IzfgpaNVuad2HbPcyyXaDrFmKy6dk5Q
         vjfxYuxrZ4cYT58YKlJcQOBgvRWEFFHomK7fDs01BitT2sn7Pao92lHO7tLbdCEbpYAE
         O1dWj8HrhGNktjZIzLoY47HazproH+EAkmTzLYuloy+oqLs7skc7SDgAXpYZcIiluNB9
         EVL++qlLEmSzxsEskOyk1m0KfSGAEozeAtRl7O+BRhXz8/OrlcHsfjsphe2YRRhz8tWQ
         eqGA==
X-Gm-Message-State: AOAM531M/MACOMnBFNaIIkkh/Pdx5lwZ5DDNyH0l5Gw1SCkBHnrWhW2T
	clPzn6AlJKztro44N4ioI7HvH7VfKIIVsBy/I3ttl/yp0cakTt69PE70U58f84QoUZYLqy26rEW
	W907iMlwXGvFl8YRvk54F9HM=
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr23064142wmc.75.1615223403147;
        Mon, 08 Mar 2021 09:10:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynHW0REjkwiR9tjpHrXCCFWLKx3SXjo9gDBvdZo+0uKZAhz3wSWTrLAfBYT39sHPr5aWe/nw==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr23064130wmc.75.1615223403027;
        Mon, 08 Mar 2021 09:10:03 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:10:02 -0800 (PST)
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
Subject: [RESEND 2nd PATCH 08/10] arm64: dts: intel: socfpga_agilex: align node names with dtschema
Date: Mon,  8 Mar 2021 18:09:43 +0100
Message-Id: <20210308170945.161468-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Align the NAND, GIC and UART node names with dtschema to silence
dtbs_check warnings like:

    arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml:
        intc@fffc1000: $nodename:0: 'intc@fffc1000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
    arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dt.yaml:
        serial0@ffc02000: $nodename:0: 'serial0@ffc02000' does not match '^serial(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 3cba4c03d560..163f33b46e4f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -78,7 +78,7 @@ psci {
 		method = "smc";
 	};
 
-	intc: intc@fffc1000 {
+	intc: interrupt-controller@fffc1000 {
 		compatible = "arm,gic-400", "arm,cortex-a15-gic";
 		#interrupt-cells = <3>;
 		interrupt-controller;
@@ -316,7 +316,7 @@ mmc: dwmmc0@ff808000 {
 			status = "disabled";
 		};
 
-		nand: nand@ffb90000 {
+		nand: nand-controller@ffb90000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "altr,socfpga-denali-nand";
@@ -479,7 +479,7 @@ timer3: timer3@ffd00100 {
 			clock-names = "timer";
 		};
 
-		uart0: serial0@ffc02000 {
+		uart0: serial@ffc02000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xffc02000 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
@@ -490,7 +490,7 @@ uart0: serial0@ffc02000 {
 			clocks = <&clkmgr AGILEX_L4_SP_CLK>;
 		};
 
-		uart1: serial1@ffc02100 {
+		uart1: serial@ffc02100 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xffc02100 0x100>;
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1


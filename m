Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82387C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4FEED6523B; Mon,  8 Mar 2021 17:10:00 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA246522F
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA246522F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f70.google.com ([209.85.128.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOI-0003JY-HM
	for soc@kernel.org; Mon, 08 Mar 2021 17:09:58 +0000
Received: by mail-wm1-f70.google.com with SMTP id o9so2284576wmq.9
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bdm0sjGtk8ALuy1N/+43SmVtmn6LvoyCFMfDfYjuck=;
        b=DrIZyk2VTz/xog0VTbI19YMtD5dh6Dka7svSjk/4SFDOrjLPhpr4cKT/I8WqxFaapE
         6htjlvNyKJ7NNzDH59QxEIyTIljLMHqDaOkQmWodCrk7khHldRc4F8xe+Zyfbt5bKEZl
         yC62zn7cnitCwXIlSa50t8inKL1RMpsbTKYSRkJiXDj/1iIUGIYCgga9vWI4B15KXRWX
         a+WiTCg2XyEeuXKGuRTvhrwf/XGlZbfhEZ8JmKE5kCZPh0Muc1nHrgfwlslV8gzw2SeN
         BVIkqPw0gXzzYx9aPhlxIbkS8S24dJ9IjdwJYvdvunGecCelZr2bZyvPu/KGebZKFdDg
         cHAA==
X-Gm-Message-State: AOAM533pbKNmv3qIQmn6bpB18OQHvtiZ0srd46B9eEmWoXgKXTmN6mIJ
	rmwDDTWtETbI1t1/Yr/B6uA75kkrkBRb0ESWBAdlve1wO7D3qU/y5yVAeQFlZn0qmPPZvs47M2J
	EamBdsAfvllfv8gPO5/t5dO4=
X-Received: by 2002:a7b:c316:: with SMTP id k22mr12209063wmj.176.1615223398177;
        Mon, 08 Mar 2021 09:09:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/vaioWrZfMyz0ifoB5yEGjPUKvGhG+eDmZX8KoWdrhuVHiFg7sKbEpL2kmn7OTH+70AH7xA==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr12209049wmj.176.1615223398072;
        Mon, 08 Mar 2021 09:09:58 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:09:57 -0800 (PST)
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
Subject: [RESEND 2nd PATCH 03/10] arm64: dts: intel: socfpga_agilex: move clocks out of soc node
Date: Mon,  8 Mar 2021 18:09:38 +0100
Message-Id: <20210308170945.161468-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

The clocks are usually not part of the SoC but provided on the board
(external oscillators).  Moving them out of soc node fixes dtc warning:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:111.10-137.5:
        Warning (simple_bus_reg): /soc/clocks: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 07c099b4ed5b..8f0736e4f3b5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -87,6 +87,34 @@ intc: intc@fffc1000 {
 		      <0x0 0xfffc6000 0x0 0x2000>;
 	};
 
+	clocks {
+		cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		cb_intosc_ls_clk: cb-intosc-ls-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		f2s_free_clk: f2s-free-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		osc1: osc1 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+		};
+
+		qspi_clk: qspi-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -108,34 +136,6 @@ clkmgr: clock-controller@ffd10000 {
 			#clock-cells = <1>;
 		};
 
-		clocks {
-			cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			cb_intosc_ls_clk: cb-intosc-ls-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			f2s_free_clk: f2s-free-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			osc1: osc1 {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-			};
-
-			qspi_clk: qspi-clk {
-				#clock-cells = <0>;
-				compatible = "fixed-clock";
-				clock-frequency = <200000000>;
-			};
-		};
-
 		gmac0: ethernet@ff800000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.74a", "snps,dwmac";
 			reg = <0xff800000 0x2000>;
-- 
2.25.1


Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5745C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6E31A6524A; Mon,  8 Mar 2021 17:10:01 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111D165243
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 111D165243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f69.google.com ([209.85.128.69])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOJ-0003KC-Ip
	for soc@kernel.org; Mon, 08 Mar 2021 17:09:59 +0000
Received: by mail-wm1-f69.google.com with SMTP id n25so5224853wmk.1
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J8s41kTqsk18jArtcexwjcTxcMbClVKzru2/iOied3M=;
        b=sCtA8uo1p1uVHuFPy73ElZuU6af65bwPUMtmAob0tno+KBZ3lrDhc10iEvnr5VoXus
         1Mm5h+Oitaaxo/fKpmXiHxU5Qwn++iI14y4HrkMDbV8Bgu0RYUNzdGFBzSneZ6LlFne3
         38qSaerQs1qhzImA4xC986iWd6Gu/FcRMPQy8L0KxaeVKYY+/hdx4cCVACKdQQzsakkr
         2gZQhTKdLcsAp4lJ1aaR/IkUZdcx/3RiPWQu1yMUimDxleDph/nhQ2QT6xC69KyqwDDd
         WTFTLMjhJCV7aZwnYljnv3m8aRJHhtLwimxKwar7T9rJc8P6g3BlIctDNjW1NKNIUEg/
         xQ6g==
X-Gm-Message-State: AOAM531wyeOMRX1aF7KJs6xoXR7xDl9lw6GVavHd2W7gy2Ea0Dd6h8LM
	ZyppiMzhMQBKoLY+ecIQulWhYAD4fCb4jNKP6VJrf2S5TbcqAxAPjS4VYBeFwqQY8wJSAG0bgZn
	+s0VBWK2L1FbNc/xziTpWBOQ=
X-Received: by 2002:adf:e481:: with SMTP id i1mr8535890wrm.63.1615223399319;
        Mon, 08 Mar 2021 09:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKn+XdN+3exyMy6wDRVvSJH0t5bhxIQlMvXRSWRbJA1ckNgQs8bb12LMytPb2HH9k3ivKNkA==
X-Received: by 2002:adf:e481:: with SMTP id i1mr8535868wrm.63.1615223399142;
        Mon, 08 Mar 2021 09:09:59 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:09:58 -0800 (PST)
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
Subject: [RESEND 2nd PATCH 04/10] arm64: dts: intel: socfpga_agilex: move timer out of soc node
Date: Mon,  8 Mar 2021 18:09:39 +0100
Message-Id: <20210308170945.161468-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

The ARM architected timer is part of ARM CPU design therefore by
convention it should not be inside the soc node.  This also fixes dtc
warning like:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:410.9-416.5:
        Warning (simple_bus_reg): /soc/timer: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 8f0736e4f3b5..25882faccbdb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -115,6 +115,15 @@ qspi_clk: qspi-clk {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <1 13 0xf08>,
+			     <1 14 0xf08>,
+			     <1 11 0xf08>,
+			     <1 10 0xf08>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -406,15 +415,6 @@ sysmgr: sysmgr@ffd12000 {
 			reg = <0xffd12000 0x500>;
 		};
 
-		/* Local timer */
-		timer {
-			compatible = "arm,armv8-timer";
-			interrupts = <1 13 0xf08>,
-				     <1 14 0xf08>,
-				     <1 11 0xf08>,
-				     <1 10 0xf08>;
-		};
-
 		timer0: timer0@ffc03000 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 113 4>;
-- 
2.25.1


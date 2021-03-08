Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18780C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E0F7865239; Mon,  8 Mar 2021 17:10:07 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CE4465230
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CE4465230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOQ-0003TH-3g
	for soc@kernel.org; Mon, 08 Mar 2021 17:10:06 +0000
Received: by mail-wr1-f71.google.com with SMTP id l10so5102070wry.16
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PW2gwp+ApGkfA4Yw2lCHp6cW3AKSzP0k9Br5Vr8VeB8=;
        b=da26jdzH7q7qMwS3GolpiqsQeT3PTSxH2tQZ3r2FvmgvODuba+4RfGuY9tzEqAeiI1
         c2DBR+q5mp7w7ZC6wPernmR2BqNiQedPNRIz9hk1LeC3gNpTPNj+lKlSQimepkudH66E
         um3MUC0CVl8HDd0Kry+Qo0dcTzJHZr3OsdCUqNklu+QOnLlq4T9oVMamDH3VOgqSx4lb
         2mECYISA/gZTqcwieRcdd6IthSRmBWVhDzoqns6+Fi9NBe1BfGGDjpu7wr67A28eCuFx
         RDbM26fXaKnWYqc3qkyqPI4OTz1E6TBcUXeGVNSTQ/k5WBTB24xNhPmZFmLue5FaQYJc
         Ny0g==
X-Gm-Message-State: AOAM530W1Xm/BPgIuQMHMe7geU3n5ceKWUcD9ug/JGD/AoPG5Pcb+0u4
	gcp4ajHlR1Bjic8f8xMcylBDp27VFSov1Hw+S9v77KCMKfp7wCqC++Nj9lf+XPCHbB5r8m+7+Vz
	G+Y2oJ3/u2YZx1d1sUWOM7Tc=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr23783108wrq.39.1615223405494;
        Mon, 08 Mar 2021 09:10:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyngFHucjuFwjLrIfUgXmRE9UU0tfjT6g7o8cF8UxJ/wVkfhO8iMRULHVDy+UA6+IGoMpCOwQ==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr23783090wrq.39.1615223405390;
        Mon, 08 Mar 2021 09:10:05 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:10:04 -0800 (PST)
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
Subject: [RESEND 2nd PATCH 10/10] arm64: dts: intel: socfpga_agilex_socdk_nand: align LED node names with dtschema
Date: Mon,  8 Mar 2021 18:09:45 +0100
Message-Id: <20210308170945.161468-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Align the LED node names with dtschema to silence dtbs_check warnings
like:

    leds: 'hps0', 'hps1', 'hps2' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
index 58a827a5e83f..cc2dcabf34e3 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
@@ -20,17 +20,17 @@ chosen {
 
 	leds {
 		compatible = "gpio-leds";
-		hps0 {
+		led0 {
 			label = "hps_led0";
 			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
 		};
 
-		hps1 {
+		led1 {
 			label = "hps_led1";
 			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
 		};
 
-		hps2 {
+		led2 {
 			label = "hps_led2";
 			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
 		};
-- 
2.25.1


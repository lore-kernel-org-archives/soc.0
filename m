Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4411FC433E9
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0C2FE65244; Mon,  8 Mar 2021 17:10:07 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C222565238
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C222565238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wm1-f70.google.com ([209.85.128.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOO-0003RN-Ht
	for soc@kernel.org; Mon, 08 Mar 2021 17:10:05 +0000
Received: by mail-wm1-f70.google.com with SMTP id n25so5224968wmk.1
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UIxmMoK7O3FkaOob5cP+/PnQ80rUSbfD+m9tRUlmEM=;
        b=XOuv4lTmEKbu8DhcFnWpxv2AFRz8k+BRPpwCX1YIox+QEQHDDq2hsXoE1fLQORdX32
         NdQlhrPI+OL9IZSPFd1vNvMWbcyb77n7Qivlfx7Ue+B/+aMgep0nYFG6YUgEn2/5zN9u
         lXkEG4yVB4fMjQk95PuzY5Ouj7utvvw0UcooGpf0l1uaXxJm9t0gpg4hv8/f1rlxm/Ub
         R48nHOUMiksgYVQb9DA5Z0SM86HSfJakUbnYSEcqA4Zazj7Oc4PRkGm/pHjdMpPN+83V
         Wo9RdDlShaaih9YwLupm3G7lkjdxN98w/7WYU8p9F1+IJUfjNDkAndpkCr/FXrNcx8D7
         1GZw==
X-Gm-Message-State: AOAM533AZG17gaM8DCTVcE/efzi4bo9mGCDs0PObWM8+qXY71ULCq3E3
	oJsJ39CWhrZGWJy7eugD/dSJzUyl0MO9KgCdcmF2fGjJ40xNX2w93NZOUk5PlBC9sp0LT9ebr1Y
	mrfTFNf5o6Le4gfc71hbwXnQ=
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr23492979wmd.151.1615223404290;
        Mon, 08 Mar 2021 09:10:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXltzJ6sLx3WURNyl3beda2GfjyDZjIZYw/h31TUwo0blj0hc3a6mTF7dGhqg3KNsXa1WrGg==
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr23492962wmd.151.1615223404135;
        Mon, 08 Mar 2021 09:10:04 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:10:03 -0800 (PST)
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
Subject: [RESEND 2nd PATCH 09/10] arm64: dts: intel: socfpga_agilex_socdk: align LED node names with dtschema
Date: Mon,  8 Mar 2021 18:09:44 +0100
Message-Id: <20210308170945.161468-10-krzysztof.kozlowski@canonical.com>
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
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index f14a89ca8784..13718ab5ed91 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
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


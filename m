Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F079C433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BE0FC385B8; Thu, 26 May 2022 20:42:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE2EBC34119
	for <soc@kernel.org>; Thu, 26 May 2022 20:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EE2EBC34119
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id gh17so5152081ejc.6
        for <soc@kernel.org>; Thu, 26 May 2022 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zBSottq5B2GJ9FFPovyG/bRnnI/fVKoW6GgzyoAPPks=;
        b=mqm2TyTwLe9J3JzIvwLX0t7OOCi6SC7Ci5LT4ey3rSWSr8XLS4LfCEMPkzVFr2g1gn
         WFOBsQO10LJuTz0PS5+KKEd6B4piYrbVXwbQFbPk16xZzidpogTh/2p8GawS9uDlK2EJ
         75ijNM9oNz2CrSCWfYq9OeQEKcMbdccezQIUnlECkj+1Ga47rpvvfNnmRoEUXS/wX/Bu
         nkpptkYm+hQ2SdifCTJRPuhVGA+ZlcolTCOXKto5mcNNxXpk3MLqekCzj6lywkPtYamB
         J8TOImHlRF9NHnRL5G0QAbZtmRebyd4kErEdpW61miRlVEmQfh/SkdF0KsXxs8jzxrJ6
         jcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zBSottq5B2GJ9FFPovyG/bRnnI/fVKoW6GgzyoAPPks=;
        b=rlF2XiWrFgkQecDbmKvkCsq7mjglqCdQEf4IA067i/QDr8RhVtVh6dekLgbWDq0n2C
         qJc7KqbUU0Do7245Vh4gT++jh7xZW0UtMNZtbOHH7kBqmS+0kLqcGufFNVtKYadMBIdI
         Ybgh0SydSI4oWm4epEUfv2VrlpbGlhBA7XR/EsQXwiQ8msloa62wG7awRZebHTOivJQF
         y+hOeJl1QWLKKZkOTq1UPKlA0YqHFkvV4pn77+GTQgTKh9yRfTNYOLAQ4X9wt8Y6+M4y
         s5FSTlIEwHQtHP8CvcANN0AB1ck/YhcRKinBLB4k/WkmfdodZH+j1r0Mhpl5KH7HKFmC
         hj9Q==
X-Gm-Message-State: AOAM530A+7Q1/XjhWC0pfU2ytdBwzvnZgtWV3Fs9AEatVWUIS5WgKnE2
	NXm/9qpPOJEOWsT98R0fmgvCWA==
X-Google-Smtp-Source: ABdhPJz7O6I5XI5FpXBZSFKsMcuwni2DNPsFAGM+js5EZkfB37k56jQ/r1s0n1NCr6XaDCKTFlOHaQ==
X-Received: by 2002:a17:906:49c6:b0:6fe:95bb:93cc with SMTP id w6-20020a17090649c600b006fe95bb93ccmr34838737ejv.30.1653597754194;
        Thu, 26 May 2022 13:42:34 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ay21-20020a170906d29500b006feba4ef020sm798012ejb.180.2022.05.26.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:42:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: renesas: adjust whitespace around '='
Date: Thu, 26 May 2022 22:42:31 +0200
Message-Id: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/renesas/draak.dtsi           |  2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi           |  2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |  2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi         | 14 +++++++-------
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index 7231f820d601..ef3bb835d5c0 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -630,7 +630,7 @@ rsnd_for_ak4613: endpoint {
 				bitclock-master = <&rsnd_for_ak4613>;
 				frame-master = <&rsnd_for_ak4613>;
 				playback = <&ssi3>, <&src5>, <&dvc0>;
-				capture  = <&ssi4>, <&src6>, <&dvc1>;
+				capture = <&ssi4>, <&src6>, <&dvc1>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 72f359efa23e..aef0896b2f5f 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -711,7 +711,7 @@ &rcar_sound {
 	rcar_sound,dai {
 		dai0 {
 			playback = <&ssi0>, <&src0>, <&dvc0>;
-			capture  = <&ssi1>, <&src1>, <&dvc1>;
+			capture = <&ssi1>, <&src1>, <&dvc1>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 31837fcd7bf0..09ff1708cfa6 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -832,7 +832,7 @@ rsnd_endpoint0: endpoint {
 				frame-master = <&rsnd_endpoint0>;
 
 				playback = <&ssi0>, <&src0>, <&dvc0>;
-				capture  = <&ssi1>, <&src1>, <&dvc1>;
+				capture = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 5bcb84403ef6..408871c2859d 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -206,12 +206,12 @@ pcm3168a: audio-codec@44 {
 				clocks = <&clksndsel>;
 				clock-names = "scki";
 
-				VDD1-supply	= <&snd_3p3v>;
-				VDD2-supply	= <&snd_3p3v>;
-				VCCAD1-supply	= <&snd_vcc5v>;
-				VCCAD2-supply	= <&snd_vcc5v>;
-				VCCDA1-supply	= <&snd_vcc5v>;
-				VCCDA2-supply	= <&snd_vcc5v>;
+				VDD1-supply = <&snd_3p3v>;
+				VDD2-supply = <&snd_3p3v>;
+				VCCAD1-supply = <&snd_vcc5v>;
+				VCCAD2-supply = <&snd_vcc5v>;
+				VCCDA1-supply = <&snd_vcc5v>;
+				VCCDA2-supply = <&snd_vcc5v>;
 
 				ports {
 					#address-cells = <1>;
@@ -438,7 +438,7 @@ rsnd_for_pcm3168a_capture: endpoint {
 				bitclock-master;
 				frame-master;
 				dai-tdm-slot-num = <6>;
-				capture  = <&ssi4>;
+				capture = <&ssi4>;
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 90a4c0629d24..5f390865a4cd 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -411,7 +411,7 @@ rsnd_for_ak4613: endpoint {
 				bitclock-master;
 				frame-master;
 				playback = <&ssi0>, <&src0>, <&dvc0>;
-				capture  = <&ssi1>, <&src1>, <&dvc1>;
+				capture = <&ssi1>, <&src1>, <&dvc1>;
 			};
 		};
 		rsnd_port1: port@1 {
-- 
2.34.1


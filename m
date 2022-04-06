Return-Path: <SRS0=3lNK=UQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F6BC433F5
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 19:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20C5AC385A3; Wed,  6 Apr 2022 19:16:10 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FAB1C385A1;
	Wed,  6 Apr 2022 19:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FAB1C385A1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-e2442907a1so3628912fac.8;
        Wed, 06 Apr 2022 12:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=joF76rv1su2HJkDHzu00cHwinoChYU2eD7dMmYK9hq4=;
        b=mV8mH4woBUKwR29Gbaj6fXN7W3/uFWAWk7PnmmqQ0mwdGvTVgc6ydqLAjukkhxKUM/
         XfIqGoWL7912p5adY4htB4vpChQSzb1GxbjRXNZVXj445q/vVxu5TV520FjAaEwhzBX1
         BdN+evB3SkEEIRR7NU42V7bIjvBVjI2k8N4hL40CcNc13SgXnV0shPM61lqnF8b5/Ttl
         4SrGVxYkjinj+X2Qd1AfAghttsne0knjwkQr4/EiEzUUjF1ZQrsVwyzRaElK4ixYyqyz
         n2CKrUlYCsGmX+GSJeNRwplAjXcCA3b0IvIp3IOmVJIQRbES5Fe8eoxdbxOmJqnktldq
         gpSQ==
X-Gm-Message-State: AOAM533RtanMYbcNzDsITGewueExBrQw8PMHK94mczV2qRCMs/1tVf7Q
	fdyqaf0iWGt4fiNCjTwlIw4qGCRQtA==
X-Google-Smtp-Source: ABdhPJzT/qS77COXOCRXvBFiaDxtp4Pbns326cuyD89xK5mSxhPwPbzIwdSd6Xf2u0GHhg3Wj7L3sA==
X-Received: by 2002:a05:6870:9a10:b0:e1:fe1b:be44 with SMTP id fo16-20020a0568709a1000b000e1fe1bbe44mr4827226oab.250.1649272567951;
        Wed, 06 Apr 2022 12:16:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t15-20020a056808158f00b002e331356c87sm6708039oiw.39.2022.04.06.12.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 12:16:07 -0700 (PDT)
Received: (nullmailer pid 2612457 invoked by uid 1000);
	Wed, 06 Apr 2022 19:16:07 -0000
Date: Wed, 6 Apr 2022 14:16:07 -0500
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm/arm64: dts: qcom: Fix boolean properties with
 values
Message-ID: <Yk3m92Sj26/v1mLG@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.32.0

Boolean properties in DT are present or not present and don't take a value.
A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
matter.

It may have been intended that 0 values are false, but there is no change
in behavior with this patch.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Can someone please apply this for 5.18.

 arch/arm/boot/dts/qcom-apq8064-pins.dtsi            | 12 ++++++------
 arch/arm64/boot/dts/qcom/msm8996.dtsi               |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
index cbe42c4153a0..b4d286a6fab1 100644
--- a/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064-pins.dtsi
@@ -76,7 +76,7 @@ mux {
 		pinconf {
 			pins = "gpio20", "gpio21";
 			drive-strength = <2>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
@@ -116,7 +116,7 @@ mux {
 		pinconf {
 			pins = "gpio24", "gpio25";
 			drive-strength = <2>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
@@ -141,7 +141,7 @@ mux {
 		pinconf {
 			pins = "gpio8", "gpio9";
 			drive-strength = <2>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
@@ -166,7 +166,7 @@ mux {
 		pinconf {
 			pins = "gpio12", "gpio13";
 			drive-strength = <2>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
@@ -229,7 +229,7 @@ mux {
 		pinconf {
 			pins = "gpio16", "gpio17";
 			drive-strength = <2>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
@@ -282,7 +282,7 @@ mux {
 		pinconf {
 			pins = "gpio84", "gpio85";
 			drive-strength = <2>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4f1f88a2ec02..a94b44d44b63 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1247,14 +1247,14 @@ blsp1_i2c3_default: blsp1-i2c2-default {
 				pins = "gpio47", "gpio48";
 				function = "blsp_i2c3";
 				drive-strength = <16>;
-				bias-disable = <0>;
+				bias-disable;
 			};
 
 			blsp1_i2c3_sleep: blsp1-i2c2-sleep {
 				pins = "gpio47", "gpio48";
 				function = "gpio";
 				drive-strength = <2>;
-				bias-disable = <0>;
+				bias-disable;
 			};
 
 			blsp2_uart3_4pins_default: blsp2-uart2-4pins {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index e90f99ef5323..e47c74e513af 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -33,7 +33,7 @@ trips {
 };
 
 &alc5682 {
-	realtek,dmic-clk-driving-high = "true";
+	realtek,dmic-clk-driving-high;
 };
 
 &cpu6_alert0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 7f42e5315ecb..ad0d6147b6c8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -619,7 +619,7 @@ mux {
 			pins = "gpio6", "gpio25", "gpio26";
 			function = "gpio";
 			drive-strength = <8>;
-			bias-disable = <0>;
+			bias-disable;
 		};
 	};
 
-- 
2.32.0


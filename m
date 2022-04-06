Return-Path: <SRS0=3lNK=UQ=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47443C433F5
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 19:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E94AC385A6; Wed,  6 Apr 2022 19:17:34 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 215F6C385A1;
	Wed,  6 Apr 2022 19:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 215F6C385A1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-deb9295679so4000449fac.6;
        Wed, 06 Apr 2022 12:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+elv5nUcYO+9KxIPsGLm8mW7Otl7wTZ4tdEnucwBh/c=;
        b=L0CxdwL5ZLPpq3DAbgiWKuSH5ZFVmYwwnrlad7YpB+qWxfzL6L8lY/Pkob/WpjooMh
         FFcdEtNL2rLze7hSrT4I+ucstSYqxtLB6KeTJQk+KNjt0/vH9WUOOMWJ4nw3/x7OD9d7
         9Ck3fCK5e+s9ly9O20XOEsm1vhqH4aiUaYO/TYNqVEh9vgpZwCmYt2/ryyaRTvSKLpYm
         CqnkzalrtXUkpnc2sjaG8elxknRqswXhPM9Ff7ZnQ15Oi5dYxdsI5IES8i4LoAWWD3sA
         FkinqzD4CRLcoCqgHJb1yW1FpmSBXmn9Km52nLHMqmK5nbaENtQV6S8gS3vNB/1EUNPg
         9icA==
X-Gm-Message-State: AOAM533XRjXnAgP8jIcKaJVxHoYTEs3+gZYr/2+EayGiu1CBIHb8BNlg
	w08iEtXjirL/ozO60epM6pebzVbM4g==
X-Google-Smtp-Source: ABdhPJzWUypFFpBzMufl7IKO2Huhe7Ol7N6/hBhhXxa5wzfiiHRzIVxOp8s5NaDTX2ceV8BZrbhv6g==
X-Received: by 2002:a05:6870:9628:b0:e1:c420:af75 with SMTP id d40-20020a056870962800b000e1c420af75mr4617093oaq.246.1649272652036;
        Wed, 06 Apr 2022 12:17:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k30-20020a056870819e00b000e18ee342c0sm7171247oae.18.2022.04.06.12.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 12:17:31 -0700 (PDT)
Received: (nullmailer pid 2614465 invoked by uid 1000);
	Wed, 06 Apr 2022 19:17:30 -0000
Date: Wed, 6 Apr 2022 14:17:30 -0500
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] arm64: dts: tegra: Fix boolean properties with values
Message-ID: <Yk3nShkFzNJaI3/Z@robh.at.kernel.org>
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
Can someone apply this for 5.18.

 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi            | 8 ++++----
 .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    | 8 ++++----
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi            | 6 +++---
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi            | 6 +++---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi            | 6 +++---
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi            | 8 ++++----
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts        | 8 ++++----
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts             | 4 ++--
 8 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index aff857df25cf..1df84335925b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -262,25 +262,25 @@ gpio3 {
 					gpio4 {
 						pins = "gpio4";
 						function = "32k-out1";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio5 {
 						pins = "gpio5";
 						function = "gpio";
-						drive-push-pull = <0>;
+						drive-push-pull;
 					};
 
 					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
-						drive-push-pull = <0>;
+						drive-push-pull;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
index 4631504c3c7a..1ab132c152bb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
@@ -462,25 +462,25 @@ gpio3 {
 					gpio4 {
 						pins = "gpio4";
 						function = "32k-out1";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio5 {
 						pins = "gpio5";
 						function = "gpio";
-						drive-push-pull = <0>;
+						drive-push-pull;
 					};
 
 					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index a7d7cfd66379..634d0f493c2e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -174,19 +174,19 @@ gpio3 {
 					gpio4 {
 						pins = "gpio4";
 						function = "32k-out1";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
-						drive-push-pull = <0>;
+						drive-push-pull;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
index 0bd66f9c620b..0b219e72765e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -148,19 +148,19 @@ gpio3 {
 					gpio4 {
 						pins = "gpio4";
 						function = "32k-out1";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
-						drive-push-pull = <1>;
+						drive-push-pull;
 					};
 
 					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
-						drive-push-pull = <0>;
+						drive-push-pull;
 					};
 				};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 75eb743a7242..0fe772b04bd0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -59,7 +59,7 @@ gpio0 {
 				gpio1 {
 					pins = "gpio1";
 					function = "fps-out";
-					drive-push-pull = <1>;
+					drive-push-pull;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 					maxim,active-fps-power-up-slot = <7>;
 					maxim,active-fps-power-down-slot = <0>;
@@ -68,7 +68,7 @@ gpio1 {
 				gpio2_3 {
 					pins = "gpio2", "gpio3";
 					function = "fps-out";
-					drive-open-drain = <1>;
+					drive-open-drain;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 				};
 
@@ -80,7 +80,7 @@ gpio4 {
 				gpio5_6_7 {
 					pins = "gpio5", "gpio6", "gpio7";
 					function = "gpio";
-					drive-push-pull = <1>;
+					drive-push-pull;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 10347b6e6e84..936a309e288c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1351,7 +1351,7 @@ gpio0 {
 				gpio1 {
 					pins = "gpio1";
 					function = "fps-out";
-					drive-push-pull = <1>;
+					drive-push-pull;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 					maxim,active-fps-power-up-slot = <7>;
 					maxim,active-fps-power-down-slot = <0>;
@@ -1360,14 +1360,14 @@ gpio1 {
 				gpio2 {
 					pins = "gpio2";
 					function = "fps-out";
-					drive-open-drain = <1>;
+					drive-open-drain;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 				};
 
 				gpio3 {
 					pins = "gpio3";
 					function = "fps-out";
-					drive-open-drain = <1>;
+					drive-open-drain;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 				};
 
@@ -1379,7 +1379,7 @@ gpio4 {
 				gpio5_6_7 {
 					pins = "gpio5", "gpio6", "gpio7";
 					function = "gpio";
-					drive-push-pull = <1>;
+					drive-push-pull;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 72c2dc3c14ea..f6446120c267 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -195,7 +195,7 @@ gpio0 {
 				gpio1 {
 					pins = "gpio1";
 					function = "fps-out";
-					drive-push-pull = <1>;
+					drive-push-pull;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_NONE>;
 					maxim,active-fps-power-up-slot = <0>;
 					maxim,active-fps-power-down-slot = <7>;
@@ -204,7 +204,7 @@ gpio1 {
 				gpio2 {
 					pins = "gpio2";
 					function = "fps-out";
-					drive-open-drain = <1>;
+					drive-open-drain;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 					maxim,active-fps-power-up-slot = <0>;
 					maxim,active-fps-power-down-slot = <7>;
@@ -213,7 +213,7 @@ gpio2 {
 				gpio3 {
 					pins = "gpio3";
 					function = "fps-out";
-					drive-open-drain = <1>;
+					drive-open-drain;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 					maxim,active-fps-power-up-slot = <4>;
 					maxim,active-fps-power-down-slot = <3>;
@@ -227,7 +227,7 @@ gpio4 {
 				gpio5_6_7 {
 					pins = "gpio5", "gpio6", "gpio7";
 					function = "gpio";
-					drive-push-pull = <1>;
+					drive-push-pull;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index a263d51882ee..e42384f097d6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1386,7 +1386,7 @@ gpio0_1_2_7 {
 				gpio3 {
 					pins = "gpio3";
 					function = "fps-out";
-					drive-open-drain = <1>;
+					drive-open-drain;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 					maxim,active-fps-power-up-slot = <4>;
 					maxim,active-fps-power-down-slot = <2>;
@@ -1395,7 +1395,7 @@ gpio3 {
 				gpio5_6 {
 					pins = "gpio5", "gpio6";
 					function = "gpio";
-					drive-push-pull = <1>;
+					drive-push-pull;
 				};
 
 				gpio4 {
-- 
2.32.0


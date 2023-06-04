Return-Path: <SRS0=I9Ey=BY=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45053C7EE2A
	for <soc@archiver.kernel.org>; Sun,  4 Jun 2023 06:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2846AC4339C; Sun,  4 Jun 2023 06:31:17 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07678C4339B;
	Sun,  4 Jun 2023 06:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07678C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f6c0d651adso40271551cf.2;
        Sat, 03 Jun 2023 23:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685860274; x=1688452274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/5Ew/nWKQC0Hp+PQTU4XGdu9OmMQKTpW4O893GVieI=;
        b=HnlYJwm4Zkbm7yG/IaCjrAicxSigatDlp4bx1nsMx1gg9Elv0gZ7Abm0ZBLpe5gFzU
         uIIZ/1XB6ZFrZ0Ig04e3dT+SJjQbHutE+VBcTXdysC10j5K36tFx+xfC1J1Fnb7ecPUq
         I+rhW4A8jdjLGsTw8qNm0+f6Ze0PmdUEI+mhExh6IppK0/YWTlqY8o64FDN+XptCJc07
         zbuSaD2Pfouuj0kOHcA61b8B3IdOi4Vj+iDN6JjytmtuHxS5lTZ+e2Tw3ZborgLpK5OH
         cG/FmDOndYyLfh3yWNEHkEKziD9+ombvbpRIQuO+UiYTC20JA8fEbbWlTFamXpYfvUhL
         tFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685860274; x=1688452274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/5Ew/nWKQC0Hp+PQTU4XGdu9OmMQKTpW4O893GVieI=;
        b=SAbQl7Zb3qkKtmxIe7QXyNzdKTgFG6mH34G6y1joMxPtsz0EH+xSawdNOpfR0nD6wf
         +vjP9kcoAwYQ+hP9ph4ckrWbZWi1PyKlnkM6aZ0zVudNmFdNqVVOlq7J4POa9Cm4UscG
         Mch6o+LmI7utZpZ440U8TSSxMxEVzGTr3M6Fk07fBmqCR6tYsw7HtGrRrO8qNCd1U56f
         1Clq1LMehUvSvD9jVEJrYZWw9iDvU0bJwgPMQzl0NSQia4Yec8IBmAxL3f4hpf0qJO5d
         9paJLQcmtfBMf6NtAvwFOImBiDBaRH5yp9fqkc11o7/hdbTJxN9Aog59uXY+JOOY243b
         MFAw==
X-Gm-Message-State: AC+VfDydYu1h8zLH9EYjZo1BSMWZlqCECq+MS1j6/BCM3I0cOxcrXzgD
	3BrPBkzsq2nTnK81a0/QtkLTYMAT/s7wxw==
X-Google-Smtp-Source: ACHHUZ45R7wzOpIgTXwOOHz3OkdPTRNH3bRGV1/88LFhz8a0+qi+kH4HsWLxDWk+1Evqq7Aj2uf7fg==
X-Received: by 2002:ac8:5913:0:b0:3f5:1f9c:5b35 with SMTP id 19-20020ac85913000000b003f51f9c5b35mr3360428qty.63.1685860274486;
        Sat, 03 Jun 2023 23:31:14 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:ab78:dd77:aea4:8d1a])
        by smtp.gmail.com with ESMTPSA id e10-20020ac85dca000000b003f018e18c35sm3044163qtx.27.2023.06.03.23.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 23:31:14 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Rudraksha Gupta <guptarud@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] ARM: dts: qcom: msm8960: Add USB node
Date: Sun,  4 Jun 2023 02:30:20 -0400
Message-Id: <20230604063032.365775-4-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604063032.365775-1-guptarud@gmail.com>
References: <20230604063032.365775-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required nodes to support USB on the MSM8960 SoC. As it's very
similar to the APQ8064 SoC, the nodes are almost identical

Add a label to sleep_clk for the USB node to reference

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8960.dtsi | 34 ++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index 2a668cd535cc..581b3ab5c4ca 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
@@ -71,7 +72,7 @@ pxo_board: pxo_board {
 			clock-output-names = "pxo_board";
 		};
 
-		sleep_clk {
+		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <32768>;
@@ -370,5 +371,36 @@ gsbi1_spi: spi@16080000 {
 				status = "disabled";
 			};
 		};
+
+		usb1: usb@12500000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0x12500000 0x200>,
+			      <0x12500200 0x200>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
+			clock-names = "core", "iface";
+			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
+			assigned-clock-rates = <60000000>;
+			resets = <&gcc USB_HS1_RESET>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			ahb-burst-config = <0>;
+			phys = <&usb_hs1_phy>;
+			phy-names = "usb-phy";
+			#reset-cells = <1>;
+			status = "disabled";
+
+			ulpi {
+				usb_hs1_phy: phy {
+					compatible = "qcom,usb-hs-phy-msm8960",
+						     "qcom,usb-hs-phy";
+					clocks = <&sleep_clk>, <&cxo_board>;
+					clock-names = "sleep", "ref";
+					resets = <&usb1 0>;
+					reset-names = "por";
+					#phy-cells = <0>;
+				};
+			};
+		};
 	};
 };
-- 
2.34.1


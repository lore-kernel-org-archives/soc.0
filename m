Return-Path: <SRS0=vM+f=B3=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08258C7EE23
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 05:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF299C4339E; Wed,  7 Jun 2023 05:00:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1D2DC433EF;
	Wed,  7 Jun 2023 05:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1D2DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6261367d2f1so51148316d6.3;
        Tue, 06 Jun 2023 22:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686114039; x=1688706039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/5Ew/nWKQC0Hp+PQTU4XGdu9OmMQKTpW4O893GVieI=;
        b=sCQf8tot4oqmWjxpMQ0kqLiG5RTUw0gals+TACDuNbqIlpTtLL8PSCUnapJMW6wcJd
         fGSyPl4oOB8D7IQhx/A3wSpdpPAkR9zZjXjA2z6w9etbZIyiMAk9wWUx8SnJJ2AX7Y+s
         JcGL58EsE+cuflsVH3phzlieHNl7Q6IekyjPBeYbhN5OWHxG4qbZXxNlK8MuwHrc36va
         /zJzv7ZA8ABA/sQUZA37GfKdjEIauW0Gpgh9RLG+MPL6tV/3oj7Iz/VA7/1aSVxFri9g
         w365LcNE0UwN2I1whQO2H21QGLUOfvM/8myMN1H7jSu15dzKMZUWfuqnPNQNRTqsLdHE
         blzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686114039; x=1688706039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/5Ew/nWKQC0Hp+PQTU4XGdu9OmMQKTpW4O893GVieI=;
        b=CuVPubGSAWqShv6xNUDXjwmOKHvNJmwelDrtW8t/bGM5y2rydE407xzOHv0llvIie6
         JGRYwXtnsRvZwHeVCo9w2vyM34Nodm/gVSZ27CsGDwGPuLLAOnatehQ1Xq21BkUjqMJG
         6hM5drUT6SNlH61PHAbFxfuAjDZvDNwqopu7uVMx56VkCqL976gZLH/ogenQoup4lPMo
         te/NjtF2cueeRj3c3fBwNL9dC3G2SrLU81g3lmT7ZkdKbNX0LrRvgLkKT9yFMjeUf7h4
         lPMTIytiDm1GVCAS5hBKrYfL7jSl5NTZRgV+8KJ72uCJBGHLZatV4n/wVfwR2fn/e+DX
         3KWQ==
X-Gm-Message-State: AC+VfDxyaKNgQAieGJPEm8IqvlrcaKxqlmWEKIWdes+eF7rLmbi1C6I6
	kRbxaTpFx9dBnjPzRh1ChzsmPA05FOtJEw==
X-Google-Smtp-Source: ACHHUZ6iC8+WAnaSXhcTXsEM1Sy/Gc/mtMLM6eziiMleK5oK7t1+6j0M+QWw5yKnE57VqFA+TAW/lg==
X-Received: by 2002:a05:6214:d63:b0:62b:33cd:e0b5 with SMTP id 3-20020a0562140d6300b0062b33cde0b5mr2497726qvs.26.1686114039118;
        Tue, 06 Jun 2023 22:00:39 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:c358:f4f2:89b6:ca7d])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44481000000b00621430707f7sm5848980qvt.83.2023.06.06.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:00:38 -0700 (PDT)
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
Subject: [PATCH v5 3/4] ARM: dts: qcom: msm8960: Add USB node
Date: Wed,  7 Jun 2023 01:00:22 -0400
Message-Id: <20230607050025.86636-4-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607050025.86636-1-guptarud@gmail.com>
References: <20230607050025.86636-1-guptarud@gmail.com>
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


Return-Path: <SRS0=PaLb=MO=quicinc.com=quic_vamslank@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06880C4320E
	for <soc@archiver.kernel.org>; Thu, 22 Jul 2021 21:24:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E064E60EBB; Thu, 22 Jul 2021 21:24:24 +0000 (UTC)
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A802260EB6;
	Thu, 22 Jul 2021 21:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A802260EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626989064; x=1658525064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z6zOtxzK0SvEBwDx41Sq8+UntB+PqRhBZVtb+Sd6CmM=;
  b=QzdbE1bah0lZ7VP3epHVThJOm+TTIBFv/Bz7n2sTHDDvhvzLFTfEwCJx
   pJ2wcefFkoES6X5Qvzei1TY6aLRINQoRWQDvjakcY70FPH3/zEixWHuSL
   o032htSPofo7/S/r9akUGZhWFnSVaf62YKQzRrF2Sic/yifrAQULuH+7k
   c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jul 2021 14:24:24 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:24:24 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:24:23 -0700
From: <quic_vamslank@quicinc.com>
List-Id: <soc.lore.kernel.org>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <olof@lixom.net>,
	<soc@kernel.org>, <linus.walleij@linaro.org>, <robh+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Vamsi krishna
 Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 3/3] ARM: dts: qcom: sdx65: Add pincontrol node
Date: Thu, 22 Jul 2021 14:24:05 -0700
Message-ID: <728983e44148367ab5d6ba2c66420b1e37df72b7.1626987430.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626987430.git.quic_vamslank@quicinc.com>
References: <cover.1626987430.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Message-ID: <20210722212405.6VD1CX2uAqQQ_3_oOO8TWNhW6GMtqfBELyvtHRDupDE@z>

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

This commit adds pincontrol node to SDX65 dts.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 arch/arm/boot/dts/qcom-sdx65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index fb240213cc35..db269c73c0e9 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -79,6 +79,18 @@ blsp1_uart3: serial@831000 {
 			status = "disabled";
 		};
 
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sdx65-tlmm";
+			reg = <0xf100000 0x300000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 109>;
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <2>;
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx65-pdc", "qcom,pdc";
 			reg = <0xb210000 0x10000>;
-- 
2.32.0


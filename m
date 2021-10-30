Return-Path: <SRS0=vZuc=PS=quicinc.com=quic_vamslank@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0822FC433F5
	for <soc@archiver.kernel.org>; Sat, 30 Oct 2021 00:02:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2E5760720; Sat, 30 Oct 2021 00:02:17 +0000 (UTC)
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88A5760E9C;
	Sat, 30 Oct 2021 00:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88A5760E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635552138; x=1667088138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=pKhLKd3HeFaf9tleIGKG+WmWBj2p+UL6++d9dJEuRK8=;
  b=sDU+ywkXuwRMU27BfPyVfhDQuZ7n/B2Zyv4NvCQpXmaDoPM/S2us+HAI
   kzDaRVUY2Ou/9dW1drvUNCKTBaLV7ojR7myYzPHvwCCivklf99xvYfnm6
   oSIL0iKCeRW4anwJUwSTwYVHjmLG96hJAVexGBEAgnvCk8Z71Nz8zjMPX
   o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Oct 2021 17:02:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2021 17:02:16 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:02:16 -0700
Received: from hu-vamslank-sd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 29 Oct 2021 17:02:15 -0700
From: <quic_vamslank@quicinc.com>
List-Id: <soc.lore.kernel.org>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <olof@lixom.net>,
	<soc@kernel.org>, <linus.walleij@linaro.org>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<manivannan.sadhasivam@linaro.org>, Vamsi krishna Lanka
	<quic_vamslank@quicinc.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document SDX65 platform and boards
Date: Fri, 29 Oct 2021 17:02:03 -0700
Message-ID: <1635552125-16407-2-git-send-email-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
References: <1635552125-16407-1-git-send-email-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Document the SDX65 platform binding and also the boards using it.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 880ddaf..813a5a4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -45,6 +45,7 @@ description: |
         sdm845
         sdx55
         sm8150
+        sdx65
         sm8250
         sm8350
 
@@ -208,6 +209,11 @@ properties:
 
       - items:
           - enum:
+              - qcom,sdx65-mtp
+          - const: qcom,sdx65
+
+      - items:
+          - enum:
               - qcom,ipq6018-cp01
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
-- 
2.7.4


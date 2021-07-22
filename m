Return-Path: <SRS0=PaLb=MO=quicinc.com=quic_vamslank@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B610C432BE
	for <soc@archiver.kernel.org>; Thu, 22 Jul 2021 21:24:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D50B560EB5; Thu, 22 Jul 2021 21:24:22 +0000 (UTC)
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9219A60EB6;
	Thu, 22 Jul 2021 21:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9219A60EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626989062; x=1658525062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b9U7KlNjO5J/+WVfc7lmVC0tSSbwnkEZUsnzlsBuwKk=;
  b=Vwb0I4U/elRkJ3goBIeCpcLHgqy/0bZtvYdt9cO/ZoHV2JBLsF8j027I
   2Oo6VDgjWEI315BBpOdUVTyChPX9sTWltlOBfcVNovcYw3YJnbxDTzq0l
   UgPY8EG2VMvjKnQpaTDZqOApqlSmrd0kQpqPHc5XKEfX1kuhHKWagoyqx
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jul 2021 14:24:22 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:24:22 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:24:21 -0700
From: <quic_vamslank@quicinc.com>
List-Id: <soc.lore.kernel.org>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <olof@lixom.net>,
	<soc@kernel.org>, <linus.walleij@linaro.org>, <robh+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Vamsi krishna
 Lanka" <quic_vamslank@quicinc.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document SDX65 platform and boards
Date: Thu, 22 Jul 2021 14:24:03 -0700
Message-ID: <500c75eb1bdc37ad66dc2ebd51ad21a211d9ed27.1626987430.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1626987430.git.quic_vamslank@quicinc.com>
References: <cover.1626987430.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03d.na.qualcomm.com (10.85.0.91) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Message-ID: <20210722212403.1Rd1G7f77EfvVI__H_BlADfre7fNMBULdUnXbrdZzeY@z>

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

Document the SDX65 platform binding and also the boards using it.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 174134f920e1..bdf1da8fc557 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sdx65
         sm8250
         sm8350
 
@@ -174,6 +175,11 @@ properties:
               - qcom,sdx55-mtp
           - const: qcom,sdx55
 
+      - items:
+          - enum:
+              - qcom,sdx65-mtp
+          - const: qcom,sdx65
+
       - items:
           - enum:
               - qcom,ipq6018-cp01-c1
-- 
2.32.0


Return-Path: <SRS0=7SpG=5T=postmarketos.org=newbyte@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DADC54EAA
	for <soc@archiver.kernel.org>; Sun, 22 Jan 2023 14:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E6CDC4339C; Sun, 22 Jan 2023 14:50:27 +0000 (UTC)
Received: from proxmox1.postmarketos.org (proxmox1.postmarketos.org [213.239.216.189])
	by smtp.kernel.org (Postfix) with ESMTP id 4892DC4339B;
	Sun, 22 Jan 2023 14:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4892DC4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=postmarketos.org
Received: from shock.lan (2-248-191-197-no36.tbcn.telia.com [2.248.191.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by proxmox1.postmarketos.org (Postfix) with ESMTPSA id 771D71403FF;
	Sun, 22 Jan 2023 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=donut; t=1674399024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pdicd3tjV6rFnR9JTCAIXoIfHA5EEQt3WzmfJJRjUHI=;
	b=uA63+8fqo7a9Q9cQBbZsWpr1xLZEW0qJ1FKgpcrrs6CnSp82zqMS8/lhH0XsGFApBvZqlH
	bv2qp3sXnhzzSj0qpnxSCX68tBMGi9rWbgo0TP6vdtLK79ACOEMoncQH+Sc2Gr0bEgnYXx
	ne8Sj7F0dpcLiJFvoPwi5H96IbWtxM4=
From: Stefan Hansson <newbyte@postmarketos.org>
List-Id: <soc.lore.kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	matti.lehtimaki@gmail.com,
	Stefan Hansson <newbyte@postmarketos.org>
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8926 and Samsung Galaxy Tab 4 10.1 LTE
Date: Sun, 22 Jan 2023 15:47:49 +0100
Message-Id: <20230122144749.87597-3-newbyte@postmarketos.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122144749.87597-1-newbyte@postmarketos.org>
References: <20230122144749.87597-1-newbyte@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSM8926 (also known as Snapdragon 400) is very similar to MSM8226 and
APQ8026 with the primary difference being that it features an LTE modem
unlike the former two which feature a 3G modem and a GPS-only modem,
respectively.

This also documents Samsung Galaxy Tab 4 10.1 LTE (samsung,matisselte)
which is a tablet by Samsung based on the MSM8926 SoC.

Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47913a8e3eea..7a0b2088ead9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -35,6 +35,7 @@ description: |
         mdm9615
         msm8226
         msm8916
+        msm8926
         msm8953
         msm8956
         msm8974
@@ -219,6 +220,11 @@ properties:
           - const: qcom,msm8916-v1-qrd/9-v1
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - samsung,matisselte
+          - const: qcom,msm8926
+
       - items:
           - enum:
               - motorola,potter
-- 
2.39.0


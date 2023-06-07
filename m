Return-Path: <SRS0=vM+f=B3=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85567C83005
	for <soc@archiver.kernel.org>; Wed,  7 Jun 2023 05:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69254C43446; Wed,  7 Jun 2023 05:00:38 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ADFDC4339B;
	Wed,  7 Jun 2023 05:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6ADFDC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-62b3b505961so23674726d6.3;
        Tue, 06 Jun 2023 22:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686114036; x=1688706036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InNCRBFCVMAHRg7WiAegvwd5G8nBYWhLOZCACH97Qks=;
        b=NjQQi6X5A0njTI5DDSxjm0LWsJUyKKR3vJn9jnNOMjq+JnQWy0citPCe7DoOZxbWg/
         jenX6DtpOzlBSu+C4vPZl+MQdwP5EzCHnLNU1bHv79xUm+4Rvj+U0koigf90P1B6RFvv
         imwFm8/60luDl6DYFGpko6+kWbk8o+ubeQF6vGgtljOc7bTAHjVuaMbT9Iipax0xH/Ze
         p88qsHXfLdaWgpjjiaU6Vkxm2xVv8AkaurWJeCFUgAinIPNmibHFHd7ZfFq/xwYXaJVE
         S3K+QibqojhUy00hTBT/rpieqZxAwrKAbNw8/VF1fGUrnASi/Lf86aKB59GFfeufKHWC
         cJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686114036; x=1688706036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InNCRBFCVMAHRg7WiAegvwd5G8nBYWhLOZCACH97Qks=;
        b=M+o9KYX9Wbwf/Dizh+pyw8JcSloKj8qbChqpSlyt4zwzDff0X7fkgscc9K5R6mwqAR
         gwDFCKrJYBjwpVKCwlC7JW8SZIEygXLxn52MUmbfMkI3Op4B6n2AvM89d2n8Qij0Y75i
         2Dfro6FNPlIO6ibZgHJfoVc1u/kXay3yeXug/FUOEZQ9UCA9qtacCOkS8nWwcDV3DGKg
         A2oXV6PpHWyS6WkeGS7PdHMmMECdJn6fFUoGyGopQ5b/r+o9K9nPhcu318PeRee6/448
         PuxWOvGXUWyi9Y4x/Pg2dlifX8/NE08V6QbugoOoEb19JFwctfZXW8z/g0dMePQUx7c2
         pvnQ==
X-Gm-Message-State: AC+VfDy2QkUSMLcW8Rwd3xZGAqB471C7d3v7fxaRhNWB6MjWLLWsrW/R
	6oZvPr3b+2mmS/uhM/pxwruz5hlOBJqm8g==
X-Google-Smtp-Source: ACHHUZ67ua4QqB8D/EpRugVFld375BJ7JpcXkvv7idb/0bZDgZBksaFRzAEA9X39AnUcgtAbqa9wTQ==
X-Received: by 2002:a05:6214:2124:b0:61b:6fcd:34ab with SMTP id r4-20020a056214212400b0061b6fcd34abmr2570897qvc.0.1686114035697;
        Tue, 06 Jun 2023 22:00:35 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:c358:f4f2:89b6:ca7d])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44481000000b00621430707f7sm5848980qvt.83.2023.06.06.22.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 22:00:35 -0700 (PDT)
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
Subject: [PATCH v5 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Date: Wed,  7 Jun 2023 01:00:21 -0400
Message-Id: <20230607050025.86636-3-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607050025.86636-1-guptarud@gmail.com>
References: <20230607050025.86636-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds qcom,usb-hs-phy-msm8960 compatible

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index aa97478dd016..f042d6af1594 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -13,7 +13,9 @@ if:
   properties:
     compatible:
       contains:
-        const: qcom,usb-hs-phy-apq8064
+        enum:
+          - qcom,usb-hs-phy-apq8064
+          - qcom,usb-hs-phy-msm8960
 then:
   properties:
     resets:
@@ -40,6 +42,7 @@ properties:
           - qcom,usb-hs-phy-apq8064
           - qcom,usb-hs-phy-msm8226
           - qcom,usb-hs-phy-msm8916
+          - qcom,usb-hs-phy-msm8960
           - qcom,usb-hs-phy-msm8974
       - const: qcom,usb-hs-phy
 
-- 
2.34.1


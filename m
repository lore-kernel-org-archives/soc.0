Return-Path: <SRS0=I9Ey=BY=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1991FC77B73
	for <soc@archiver.kernel.org>; Sun,  4 Jun 2023 06:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2219C4339B; Sun,  4 Jun 2023 06:31:05 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6FCCC433D2;
	Sun,  4 Jun 2023 06:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6FCCC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f6b2f1a04bso40523661cf.3;
        Sat, 03 Jun 2023 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685860263; x=1688452263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxOPjAsaZ9AVOYNeDf20wz37OzM0ix4j2H0BVngyGV4=;
        b=dGai88tpFQCWZH9NL/nX18vad8F+5nyE967geRtVAerQHgbGJ/f4XWn5ITBdwjMPle
         AX1Ix8ZB99kfBhkeYbioSWtNIs7pwW4/uEN10K+Hs4RRCq1VLVV0y4+7PhYad+F+W57L
         XITPUjBIAZbIpvKO2+Y4+YanoLV9017GtMWsgA4Epm9WEAK8oO0twy2V0K77ms5Y6gYH
         J7T1cUAEn9dbCE9MdTBaYYZva0L2zH/4R+FuIg0L/a1j9fcbaYatFlObQfwYRvDSIb2v
         DFoCFF+0OSXImFykY/sSnnGMCV3VkUyibYclbwd3RD8i5kQcZ1YiGGyvYmVPNYjSA81z
         KmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685860263; x=1688452263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxOPjAsaZ9AVOYNeDf20wz37OzM0ix4j2H0BVngyGV4=;
        b=ddOtmEQApWDyzRLozHz5K2R9Ur66alf5f604Dc5kd7AMNqvUv5uBSJlp9Lj00sfWBv
         zOrDdN0aZt863OAsdTKIbNbuRAyZu2cyzyFMHYSaPff6j4xcBVaeg2Z7L9+YBfDZqvbS
         NW5q2sCUPqxzidR3QX+9ecEVMNLhDYBxXpFune/MVlI2lPafJ1WL/CvYcATiz/romOmL
         8j4VAj4fBGceE2Y1kVlSAO0U3USNcHPt8oPQxEGMrqIkoj9i5P1e9rMaTaJNMBK6F50E
         /DtIEbM7be6O8ufJ4n7AKmpGDURblOUa1X4Kg7kSSvPETGZUOn7b+bbsTVnTt2yYZHjD
         OLLw==
X-Gm-Message-State: AC+VfDzgJSH1BuVweBndAUQlRBoOGvhd0AMz1OBFwBS0ucQkCLsWNDqs
	NJayFcABs+wFUU3aoSCBwPRGFlIon2Gs9w==
X-Google-Smtp-Source: ACHHUZ4dL3Kz5HI5I6+ui9aifYxduaqhbMhmWcsOwaUA1rvniBFUb6e0+QHmq2UCq8Dtvsc4Mx8Jzg==
X-Received: by 2002:a05:622a:1801:b0:3f6:c52e:21b7 with SMTP id t1-20020a05622a180100b003f6c52e21b7mr4214480qtc.17.1685860263240;
        Sat, 03 Jun 2023 23:31:03 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:ab78:dd77:aea4:8d1a])
        by smtp.gmail.com with ESMTPSA id e10-20020ac85dca000000b003f018e18c35sm3044163qtx.27.2023.06.03.23.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 23:31:02 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Date: Sun,  4 Jun 2023 02:30:19 -0400
Message-Id: <20230604063032.365775-3-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604063032.365775-1-guptarud@gmail.com>
References: <20230604063032.365775-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds qcom,usb-hs-phy-msm8960 compatible

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index aa97478dd016..63b6914993fe 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -13,7 +13,9 @@ if:
   properties:
     compatible:
       contains:
-        const: qcom,usb-hs-phy-apq8064
+        items:
+          - const: qcom,usb-hs-phy-apq8064
+          - const: qcom,usb-hs-phy-msm8960
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


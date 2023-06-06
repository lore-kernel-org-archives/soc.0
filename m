Return-Path: <SRS0=nKH+=B2=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A2CC7EE24
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 04:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4015FC4339B; Tue,  6 Jun 2023 04:05:55 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 462D0C433D2;
	Tue,  6 Jun 2023 04:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 462D0C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f9a949c012so12735591cf.0;
        Mon, 05 Jun 2023 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686024353; x=1688616353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kT0moiiobscuB0+NsDGuf/3XRp74J+Z+JV9UAE5BGPo=;
        b=OKQ/uXf9JJggxqFYM381S1YpMl5oMCXwRkIIQCP56TCZKw3J7MxAZx5gk6kHbvpyJE
         GdNOg1HWKFVAhGBRwre3MZKpSzbyyi5lRu5+Cc3TpGV4B6uF0verXrao0AoLb20u/+bZ
         361O3Q7fW0e/xUTL0PClQLK+XBnagwxjMmThespktOkXbh6gidNU8XOb2BEnDLfnkIqM
         bvhjLDeWWzzmGae+f8J0i0sga4dM7hThrVRL+A7XqVCg4C75PX36TMdoMf5lSwg9oHCb
         r2Hw4d2M+GZp+6DWVDzhy2lAwvyMSOwfqKIQTMGETBO8cehcELWGaLOQh4AeTDxTca83
         zOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686024353; x=1688616353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kT0moiiobscuB0+NsDGuf/3XRp74J+Z+JV9UAE5BGPo=;
        b=OsoaHAHR0lW/v+wiYRTcmh+6fTtglHUlHGVT79JmmBtt9xZBZiwlVTysvH3WLdgfkI
         NHGVxBHLYfKyVK4yCaUzPNkEYvSKM9N+ec/Q1fy1jw/8RStG05O0IOkOAGTBcfWqOQoF
         EGxau+PVQ/8ppBtZcM17FIO6fYtWd036IZ68uSDzf8wS8w7TCWweCR4B/8QA6NquK+Xm
         +E5ittg4Ii1YyU3TrtlJftCsKdzo0msl3vD6JL3SHfv6/yMsA5j9GyBmChjmCGO9Lzul
         fbNrMC6E5nt+ke7HxT7bKrfJUxNMb/b0GzHKs4snhAF1s0IH40rnMjyy1svW9Zq1XmJr
         gbAg==
X-Gm-Message-State: AC+VfDyrQqM3Mn9rq+RA8NZABgs0qyKNqD0k//Ix26j0/SPX9M2AM1AC
	Yuh1upwgzKST/R+rNSl6n7xRN1k/d65qGw==
X-Google-Smtp-Source: ACHHUZ7F7AbVrX/UOcT19MIL6WBTFBpTWsjGYcUZEY36uwH1cqqPWN7oyyxvyVw4oDoQxZFPNs5Hlw==
X-Received: by 2002:ac8:7f07:0:b0:3f9:af04:e9e5 with SMTP id f7-20020ac87f07000000b003f9af04e9e5mr743482qtk.57.1686024352689;
        Mon, 05 Jun 2023 21:05:52 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:aac8:d62:35cc:958c])
        by smtp.gmail.com with ESMTPSA id e2-20020ac84b42000000b003e388264753sm382980qts.65.2023.06.05.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 21:05:52 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Date: Tue,  6 Jun 2023 00:05:25 -0400
Message-Id: <20230606040529.122433-3-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606040529.122433-1-guptarud@gmail.com>
References: <20230606040529.122433-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds qcom,usb-hs-phy-msm8960 compatible

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
index aa97478dd016..bdeffb52340b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
@@ -13,7 +13,9 @@ if:
   properties:
     compatible:
       contains:
-        const: qcom,usb-hs-phy-apq8064
+        anyOf:
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


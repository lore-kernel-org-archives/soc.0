Return-Path: <SRS0=nKH+=B2=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6499CC77B7A
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 04:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35D63C433D2; Tue,  6 Jun 2023 04:05:50 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30440C433EF;
	Tue,  6 Jun 2023 04:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30440C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6260a9ef126so47567476d6.2;
        Mon, 05 Jun 2023 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686024347; x=1688616347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9dG+oN5uOmuQYXLewl1nCF0/Os/UQTTZl0+MY2RxWE=;
        b=hLyGyWV/wGxIlyRivBrflbF+AQbpydmNAc8eXG3Gavq7XrHayn3xuwfSjthktb+cCM
         UAyKKLnEcETGMR93/halHxRTijsVfyFbeGRzssPjqJpm4LIcSKXZ7Isz0rf6oa7//Kg4
         uGdPt1yAyTDjUUdKbFU4GAbwbfyaoJJwIY6LjdVwEm+VPdWMjax1S7EG5AkQAtVE552s
         o5LeamESV6p7DCgXRG5L09p7ttxy9VmayHhhNRkcqE7iyl//4gbjvM3873i6bcmgj7vd
         JqM2/bp4s6ZfoG4edNR/IqVeP4Pds6B3CEhhcrqUXQzcga8AQ0ISPePQB1pROM2jSxGU
         C0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686024347; x=1688616347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9dG+oN5uOmuQYXLewl1nCF0/Os/UQTTZl0+MY2RxWE=;
        b=Bxs3g+Y2O5DT2TI9RbJCe13zv2J6fXQanFmVhAZWw7CnsbrYwdaEwrEf7yZU8iYf/S
         ebavxyZUXW59R1MwYGO/EWjkSvwJKWvF0vePAzgOC5tJqfbnWGH+1BBLxCRqFS1GzrGY
         JFQtIsJaIlsTDPmpChD25lHEYcGZm0sqaIS7tZrE6RUO1lJnBqnveV9taoZmxefnhLgy
         PH2G9lYr3cy6Jd/7Ul8sQ0ITG/xDqKlNM6xI968iQxNPcE+MZMlaBqQz1o8gyFzI46uP
         5lDN+kmzyH+t/4Wddd3cJGOtF8YnLUlssqfEGS2+3UCGlSebA8BsxZTaqnxorH6jTqNq
         SNvg==
X-Gm-Message-State: AC+VfDy5fgju/vcmlb4DZvrzOnhTg9TVxca7BjA6d8QMa0a1UJQhnmQL
	Bx6KG6lG2fSO0oPVPg/odc7j6cfQfUavWQ==
X-Google-Smtp-Source: ACHHUZ7495EQIEA7GLHtQNJCW54CYVAnY5RakUHE5KqDf/3f8O1Dz+WFkoCSBwsXmG5zveMkh5TTKA==
X-Received: by 2002:a05:6214:d4e:b0:623:4ca9:5b25 with SMTP id 14-20020a0562140d4e00b006234ca95b25mr1017669qvr.31.1686024347531;
        Mon, 05 Jun 2023 21:05:47 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:aac8:d62:35cc:958c])
        by smtp.gmail.com with ESMTPSA id e2-20020ac84b42000000b003e388264753sm382980qts.65.2023.06.05.21.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 21:05:47 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Date: Tue,  6 Jun 2023 00:05:24 -0400
Message-Id: <20230606040529.122433-2-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606040529.122433-1-guptarud@gmail.com>
References: <20230606040529.122433-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Samsung Galaxy Express SGH-I437.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d9dd25695c3d..133d69b2b73d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
       - items:
           - enum:
               - qcom,msm8960-cdp
+              - samsung,expressatt
           - const: qcom,msm8960
 
       - items:
-- 
2.34.1


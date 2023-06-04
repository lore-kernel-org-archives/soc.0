Return-Path: <SRS0=I9Ey=BY=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51277C77B73
	for <soc@archiver.kernel.org>; Sun,  4 Jun 2023 06:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3130BC433D2; Sun,  4 Jun 2023 06:30:55 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02196C433EF;
	Sun,  4 Jun 2023 06:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02196C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-3f7fd59bb13so35630061cf.3;
        Sat, 03 Jun 2023 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685860252; x=1688452252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9dG+oN5uOmuQYXLewl1nCF0/Os/UQTTZl0+MY2RxWE=;
        b=gCJ5TP16lpl3NL9edgkLyptik5lxamQvDz9/NcrrCB5/qLi0RFhmGMOrw07lKHIXKl
         MvqiSGXAwqeddk7gJoREoOIbmNq4x1iutytGUo+XsmK60SbnHiuiW4tF/dBG6cjDXW44
         lPRJGjkDPeqL4X5xxTZAFoQketE5thpSVIdC8MPD1krE97GhIod4NaJ9ML+2i1205FAe
         /7UqDG4ncHlXQvf0ofRSM5McjxcrGoKZuUsn7sWdowWTEAAUfldA8xjq2JxrWT3CA4zx
         zciE6ybOjqCxs8jAEnN+hhmM/DMnEY/0AyE+QhOR9DM4vZ91gYxf2bfgiaHRj3bOqKpD
         HWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685860252; x=1688452252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9dG+oN5uOmuQYXLewl1nCF0/Os/UQTTZl0+MY2RxWE=;
        b=LrP38zRSk27hfyYWTG7Bw3B0GP5Nu1aNKwTepx6Id7vxlWEBzc07FHSFcagRydo0uN
         XZ0xs8sVX6qLDoXebMMj3k6PmmE9PbjEhhMdMdvFIy3kq63ig1jp1ujoyHy35oTKSGGh
         X7AFRQnkXj1dqDyhZbPPxHJuLhh0beV5JUpJvX5lYQr/xj9dwc0bXnAs3Apo6pjonIlj
         VoFvHbZ1Ij57eP/sxl0wMdOiQwaZ4hI9kJE7rT4PHiErgE8s2ZPzh7uMAIqGYiowkAgh
         p8PCRavV6mzBDNJ5BDY2nLjfHC4MYrvL8pu4vzn3KMfXKeUIYXNqFNO4Tj3vnFbpoQv3
         l95g==
X-Gm-Message-State: AC+VfDwIJdTtZpxqZ8TBRwqSRWEirMg1SuHYapUGH8ea0EYlt+5n/whE
	bLWLMdp5/tRJFWtePj3/DNAbYfMBaSuAgw==
X-Google-Smtp-Source: ACHHUZ5iCQcREmJp1oKpaQjZpi78wA4hoUCp69qQTizw8BsmlhFgInVn73vbiI3SQZtsLLwE2MFSvw==
X-Received: by 2002:ac8:59d3:0:b0:3f6:9678:9d2a with SMTP id f19-20020ac859d3000000b003f696789d2amr3671891qtf.47.1685860252380;
        Sat, 03 Jun 2023 23:30:52 -0700 (PDT)
Received: from Latitude-E6420.mynetworksettings.com ([2600:4040:2007:9800:ab78:dd77:aea4:8d1a])
        by smtp.gmail.com with ESMTPSA id e10-20020ac85dca000000b003f018e18c35sm3044163qtx.27.2023.06.03.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 23:30:52 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Date: Sun,  4 Jun 2023 02:30:18 -0400
Message-Id: <20230604063032.365775-2-guptarud@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604063032.365775-1-guptarud@gmail.com>
References: <20230604063032.365775-1-guptarud@gmail.com>
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


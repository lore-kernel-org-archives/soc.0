Return-Path: <SRS0=Dfbk=5Q=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B7FC678DD
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 18:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A94DC433D2; Thu, 19 Jan 2023 18:59:07 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 725B1C433EF;
	Thu, 19 Jan 2023 18:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 725B1C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso1971664wms.3;
        Thu, 19 Jan 2023 10:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPjtd9vBOZ8O5Mrti16lqrA6uxjKjDMRhW8Vexk68HU=;
        b=b9wbkgslkSIKtuBsDIe3np7vnMnmwj7O4DDeK98xCRfOQKA9CAcIgCjUjNd6wnaPdm
         VWidvEhg20ABZB2BiXHZP8LTokcJtp8IEFQE4UWiWImRPK+ZKj0dk88CxXc+koDbTZS2
         Qk4qPcZzwujFrxjN//RrrsnlxJKlxaLX6fuszX7SMbVczc/9fyt+cCFsjCjT2EBotwSl
         UQiPbH8OyO6VQAwuk/HDkNnRKzivpW8oYE6mmCwfFzuWyJiEjAK0C4skYVlxN704QW9J
         mLsIscziOWCLpCPiUFl6VGhpI6WocGBwBWork6PqDbNy3fGqUEK3qlXNzKyblxDLGC0b
         nTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPjtd9vBOZ8O5Mrti16lqrA6uxjKjDMRhW8Vexk68HU=;
        b=AJPYKJ8T5QcFCEjNGz+eLMmCD3V5yH3ekDj/XyoBmWkGor7UzSziK07f4SjAoPciYM
         XpLlLy/Xw6gA4/264ADvHdZE4NQPJU91FbD65FjH4pUrWGh1KNVmtdhAO+lQQXl98T1k
         48ZiA2Rpx6oDIYbv/hz3HO4YgYLBmxyWoXrRjwv8cdEvpJilU4xD43KgQCwBMksF7R2g
         GpyIpfHAtE60Onzt6JRVt8OAowaajAm/oUyZ+SRnqeikKQkGPllL14HdxLRRoDxNmebF
         ev0hfCT2UCcUZuMtaeF042po6Zt7A5dDhEOl0tBpitSk8KFwltZcRYXCVK4oMgp6xy1v
         f1xA==
X-Gm-Message-State: AFqh2kr8tiSYBHLNBYw8VZIUQzNuF6gP38J5Gr4UW9xVGhoFBo2N7JTp
	5+tEETMAJMdyS5kZV6oG7z8=
X-Google-Smtp-Source: AMrXdXvi2SVpCQp1FIuN46xi+H4vwKIP0jE1XUp6OmzopqSrwM/aE3KphrtE2U/DQoBE/yfGAk7D1g==
X-Received: by 2002:a05:600c:17c6:b0:3da:f672:b0e7 with SMTP id y6-20020a05600c17c600b003daf672b0e7mr11303597wmo.26.1674154744858;
        Thu, 19 Jan 2023 10:59:04 -0800 (PST)
Received: from localhost.localdomain ([37.55.203.63])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003daf6e3bc2fsm7757544wmq.1.2023.01.19.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 10:59:04 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] Documentation: devicetree: bindings: Add compatible for Samsung Galaxy S5 (Exynos)
Date: Thu, 19 Jan 2023 20:58:43 +0200
Message-Id: <20230119185848.156502-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119185848.156502-1-markuss.broks@gmail.com>
References: <20230119185848.156502-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for k3g in the Samsung Exynos5800 boards section.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index faea33e4f731..fc7c191640ae 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -171,6 +171,7 @@ properties:
               - hardkernel,odroid-xu3-lite      # Hardkernel Odroid XU3 Lite
               - hardkernel,odroid-xu4           # Hardkernel Odroid XU4
               - hardkernel,odroid-hc1           # Hardkernel Odroid HC1
+              - samsung,k3g                     # Samsung Galaxy S5 (Exynos)
           - const: samsung,exynos5800
           - const: samsung,exynos5
 
-- 
2.39.0


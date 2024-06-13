Return-Path: <SRS0=wOK4=NP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF0C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 13:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04C41C2BBFC; Thu, 13 Jun 2024 13:49:41 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 056A4C32789
	for <soc@kernel.org>; Thu, 13 Jun 2024 13:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 056A4C32789
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso145420966b.2
        for <soc@kernel.org>; Thu, 13 Jun 2024 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718286578; x=1718891378; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEvA9jroZsDs24LkJE27e1G6AbVYrGCtuXUJX4MNe1s=;
        b=XQc5TVSiOHA6vW8MxfxW0zhSX2kn4sKNfx9Nc/7fJR9nA/e4OisoO8UzQdeiC0NpSL
         lIvfyx4ZAWrrNdNjYH35jfWAyMZKsTlN2HccqGGsrf45LUwsZ8twSxWGearvPd4VEi7x
         CAiQDVVeTJ6i0ovVMvLrn2moagqOKmH68E5hCd4mLcoyB2dIGNGo6ZaJ9FgavUdqq3rt
         ArJ1JacA0yQK+9E1PfK8XOBkOtqCN9zajTU60bzxc3PCgrkhzWdlW83Qaw9qj31f4RoC
         2/zUDz7Pbm6tSagZR0VdCAjI/tKoazHzkwM3yfFR6rxB/VABBiF5xWTHjA5gsi+cAr8V
         YLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718286578; x=1718891378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEvA9jroZsDs24LkJE27e1G6AbVYrGCtuXUJX4MNe1s=;
        b=vsxaW7ktdrhiG6dMOaVqKEdc0aKgvoFBb1DitF0tQzLc5+HO7vMGkvZbww69+kvsYH
         IJhWgpJDz8pveu8RxQ3lqN16rWpuzJcdaJIcXL9WsvMuBXtz/u/UJDUUmXpIJP8wYbjB
         xuO6s4OVpOp0sAU5SGImJmzozno157b6kwMiKsKT/B3ErJwaY6plxgbZZy7B1J1WzuxX
         2fKhpKSifoMws8ieMsAfSHeRVGL36etQ8XhGjRU97JYSzAUza/E97VGXroSg+FHUMQbo
         Cy63sAg8ylSPGy6oh5miQoV4JHMJrbytGpA+ODKBSN/fYNzUdMBgsUGMxiY9POyjRw9W
         BrGA==
X-Forwarded-Encrypted: i=1; AJvYcCVZg2CofyhGDTxE28+nkk1TTt/UNJhL/Uc+5VPXkGibvqBxBtnkj7D3DlOxFc38RbmBQitqSitvllNsbD+v9A==
X-Gm-Message-State: AOJu0YwkIhVKrqTy11jhHH1Q5/iXYgLWQqERgcNjzolZ1z4J8kDtQktB
	VEd7slQz1h++Q3D38V2Cxz5M4hNUfleBEvoZI17jcRoVCYSFswWDIWfvDOfgzM0fAY5/z8rNs8T
	0
X-Google-Smtp-Source: AGHT+IE8JSarZGMRvnKm1sM0hW1gVfIATdlYWc5pmUAEWGuxrgcsVbMkkFTyUXFdWA7D5wJfcseu7g==
X-Received: by 2002:a17:906:517:b0:a6e:2a67:7899 with SMTP id a640c23a62f3a-a6f47f7fc60mr284236566b.35.1718286578234;
        Thu, 13 Jun 2024 06:49:38 -0700 (PDT)
Received: from krzk-bin.monzoon.net (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56fa4030sm73785166b.207.2024.06.13.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 06:49:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as maintainer
Date: Thu, 13 Jun 2024 15:49:10 +0200
Message-ID: <20240613134910.7862-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no maintainers entry for the ARM LSI AXM SoC, thus patches end
up nowhere.  Add such entry, because even if platform is orphaned and on
its way out of the kernel, it is nice to take patches if someone sends
something.

I do not plan to actively support/maintain AXM but I can take odd fixes
now and then.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e7fd595b8f5e..60f2815f0453 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2127,6 +2127,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXM LSI SOC
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/arm/axxia.yaml
+F:	arch/arm/boot/dts/intel/axm/
+F:	arch/arm/mach-axxia/
+
 ARM/BITMAIN ARCHITECTURE
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0


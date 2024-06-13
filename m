Return-Path: <SRS0=wOK4=NP=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1995BC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 14:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8EE0C4AF1C; Thu, 13 Jun 2024 14:00:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 024F6C32786
	for <soc@kernel.org>; Thu, 13 Jun 2024 14:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 024F6C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bc1261e8fso1326535e87.0
        for <soc@kernel.org>; Thu, 13 Jun 2024 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718287205; x=1718892005; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F2RDidzm7GpI6kx4jm5uYVlPtBVF5KxxK5vmQkl3iB0=;
        b=HE000ynwbhuokDKAoGn4hPadZsZODvo8LJCP3YzJpWTqaMnVDnsXydu84Eh0oWnQoD
         I73Xo3CpzZVnUWpNayv5mDpWmZnLqUmGkomgUhOcqa9N+alVqTc1wCKD7Y3DKlDqkAt7
         zLNLqDTYq/gYDNZWurCb6ECVPSs9McYFAuIr0QiDfvSsc7NQZ+z8NqeL84COyrrkpkLi
         kraRW3E4+1opwpgIejgdZlx7NI9WUNaYTthV9Wfs5bHLwlKFxQIq2h0Yyk9AMMPrqLi2
         ycq+lYrOtscIJx9A7OPt2x51K5rtxU1JDHwkCa1rrTlNJbEKxxm3nloS6fduKDhQ+q6p
         ooGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718287205; x=1718892005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2RDidzm7GpI6kx4jm5uYVlPtBVF5KxxK5vmQkl3iB0=;
        b=fOjHH7Ecf24//6MLyzwGoLOYVPuwAHibgjtybzgomrD+jBe7nvHkh+Otw802R83iAU
         oKDcytreXNCBvKa2SaNyI0PUBYdKwhkA+dsQGZJpfYPYD4W0yZ90wBFBrb65ArCnROtO
         +I+P+Q9RbeDt+1OX7khTOMAj5jsoUMorbOw8QJaStzL+L3OtwhgtXFBm5HwZenZfuI/u
         Vi8N1B6pthq/r+LpZzC+T1PUR7xFObiHKXGJUeDRPE+V+3VGnLNuwLz2gs8JOEADknw6
         75Rb6FEDBCq/apnJSYUBZbbTpn9CVo99GTVd7HMYYYSJAsBbq+oTPbmWSamS+HY+3OuT
         Zgvg==
X-Forwarded-Encrypted: i=1; AJvYcCVEQwZbTvZJ0zZaMXriUl3cH2+qMdvgyhm+n6zcvOKyCFfmByEIPtL9VWMzM7kHfSLG/XNyiunsV/IVJ9aduA==
X-Gm-Message-State: AOJu0YycE3o/wVuxQh4hv9ygjpK9OZbKiZDH/sP+t3uPnboIdEFGDo9B
	Y0TTVcb9T63MMAj4pB91f1EYMkHCeZKd9Y5B3VOXH0KHzJj9uxfmdZ3+8uOsVw4=
X-Google-Smtp-Source: AGHT+IG3A84sUkMMQsZJo4N+iSVC0jvNEqXBxVLO3aeIjcOTK4qYHH0z+w7CeXo0QEtY4uBZFdeLyw==
X-Received: by 2002:a05:6512:108e:b0:52c:7f12:61d1 with SMTP id 2adb3069b0e04-52c9a3b972dmr4185902e87.1.1718287205201;
        Thu, 13 Jun 2024 07:00:05 -0700 (PDT)
Received: from krzk-bin.monzoon.net (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33ccesm25578295e9.3.2024.06.13.07.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:00:04 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonas Jensen <jonas.jensen@gmail.com>
Subject: [PATCH] MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as maintainer
Date: Thu, 13 Jun 2024 15:59:56 +0200
Message-ID: <20240613135956.8899-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no maintainers entry for the ARM MOXA ART SoC, thus patches end
up nowhere.  Add such entry, because even if platform is orphaned and on
its way out of the kernel, it is nice to take patches if someone sends
something.

I do not plan to actively support/maintain MOXA but I can take odd fixes
now and then.

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Jonas,
If you want to maintain it instead, please go ahead. I send this patch
only because it looks abandoned.
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60f2815f0453..fde9ef6f3f0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2555,6 +2555,15 @@ F:	arch/arm/boot/dts/socionext/milbeaut*
 F:	arch/arm/mach-milbeaut/
 N:	milbeaut
 
+ARM/MOXA ART SOC
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/arm/moxart.yaml
+F:	Documentation/devicetree/bindings/clock/moxa,moxart-clock.txt
+F:	arch/arm/boot/dts/moxa/
+F:	drivers/clk/clk-moxart.c
+
 ARM/MStar/Sigmastar Armv7 SoC support
 M:	Daniel Palmer <daniel@thingy.jp>
 M:	Romain Perier <romain.perier@gmail.com>
-- 
2.43.0


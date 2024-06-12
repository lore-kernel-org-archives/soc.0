Return-Path: <SRS0=tuuZ=NO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9DFC27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 11:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36196C4AF49; Wed, 12 Jun 2024 11:16:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25C5CC3277B
	for <soc@kernel.org>; Wed, 12 Jun 2024 11:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25C5CC3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4217d808034so33068015e9.3
        for <soc@kernel.org>; Wed, 12 Jun 2024 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718190986; x=1718795786; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSoXMnr/AHLsd2eigsBHGTPuPHmBb5vzNsTv17MtRpc=;
        b=uIHdV8TI28TlEWeAQcaHpOTX1dkD+KwO9dpf1OHIK2DhgsYNKDr7oCaECMT04DUiuj
         fyRTn5CThQ5reJQCKNib/ULZZF1eVWnSggRdnO4NmvaxvWaRLOm6NbTtBAp5Gns3sI++
         aLowGuVTtb7hp1tVuu0REAK318uGGSqkPy3TqgSG63xkt1wjIV6d0Ub4I1+pfNvGaSi7
         N8+ni7KHYk9al0/kA9GZnb439J1YMH2BpbOS/We7fzrJ8Wb8k/8aF+aaQppvCoieoHQS
         qxQw2NDzoShULkFUIYUDuwdHhczLfLzlsRULjtf7QvNHFOf0Zb7bdU3fc4qa+D34Fk1r
         E+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718190986; x=1718795786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSoXMnr/AHLsd2eigsBHGTPuPHmBb5vzNsTv17MtRpc=;
        b=F9eoKMQo2uFxMsugvaS//6fds9+YFjcZLugJ02LYJQ1t1x2+uetzqeEgE/Uvd5HF63
         ZWmRxtCfA7rQO2WOTjKq5ZL88D87vYqojHwnJqaz8U2GHsOziI3H3lWOoe5lJOBEpjtK
         IeISV/ua/ZSdV5uJ2k/qBKU8ewMhic4/pYVTkgIMB2DNUTpIeqBZAsujQyalJiEBPXtU
         0KdIdqOZimzDsZ3eV4/wiixOYYlaYPGnHxUJgsUP3K/zuTZEeFMbMbuOq8qj7R5FT8+/
         ME0Bw9jVoRvqaZXJyorph2qqAK4ceC+Ckh/y/CefIvR4ynHoxTIAhFGoP3q11Hvbc0+W
         Zp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbUUkIx4rT1Xqj00SvmO9xGLijGCSPY5dhpFnH4BZSpt/KQ6zK/ovvHW0UZSz/9rFC7gox0TQcYOb5FTfQHg==
X-Gm-Message-State: AOJu0YySCZ9tkm9c0KlJ0p0wamrTz+m6wvdTRNHJOTJGnFWRm277BNEb
	m3hkoppKS0JhawD5q60t2KPym07BaygJy7VyVKF4tBTJVntG37tujVQ/bFmA23Y=
X-Google-Smtp-Source: AGHT+IGOCZNcIyA/tr5UUm+USYoqBR0ZQJOtGZGPrc28TlspHiIvoT/2tTuJfzTVrYDnOoe731TUlQ==
X-Received: by 2002:a05:600c:2192:b0:41b:e0e5:a525 with SMTP id 5b1f17b1804b1-422864ae1cfmr14089625e9.17.1718190986533;
        Wed, 12 Jun 2024 04:16:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe75c4sm22852375e9.5.2024.06.12.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:16:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: ARM: vt8500: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 Jun 2024 13:16:23 +0200
Message-ID: <20240612111623.102868-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARM VIA/WonderMedia VT8500 platform became orphaned in
commit 8f1b7ba55c61 ("MAINTAINERS: ARM/VT8500, remove defunct e-mail")
and clearly it is on the way out of the kernel.  However few folks send
patches to it and it is nice to actually take them, till the platform is
in the kernel.

I do not plan to actively support/maintain ARM VT8500 but I can take odd
fixes now and then.

Extend the maintainer entry to cover also VT8500 DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: linux-arm-kernel@lists.infradead.org
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 63d991d95c73..c7a13170b697 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3107,9 +3107,11 @@ W:	http://www.armlinux.org.uk/
 F:	arch/arm/vfp/
 
 ARM/VT8500 ARM ARCHITECTURE
+M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Orphan
+S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c
 F:	drivers/i2c/busses/i2c-viai2c-wmt.c
-- 
2.43.0


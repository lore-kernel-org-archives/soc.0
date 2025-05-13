Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B312459C6
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131044; cv=none; b=VD7pKHUxqm8L/Z1df60aQiGNBzPOyU9tFShCX5m2mj8sy2VOXLjdn/zIJ+0vcuTrYFyC4VXn68yj54tRyXroGK6zcEuFzahfVBrPXwGbC2qeLvm0MNcwNBH6GtDU6UR7/NtouWmmfbAIQrD1zkCQrq92cO5eLu7z1HKGjxHbWFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131044; c=relaxed/simple;
	bh=5NfpZm+2LpIuUUv/LKxeqdm9mkh2vEADHgfvGUBG+Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xbb0n+FcD9C+pYsToX3xlF3DJXAd4817QT730O7R1o5k0Dq5dl25yTNi4VPPlYaOFGIW6T90stWBztGkaN3frTpxqrB5QCcHbl5ZY+5ZWBb3oGHvhtE9O2i+LhlKidiLp5ZgeioZmlOMRA+nDXJhUtEx6T4knfHTB4b0iPOeNnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzWJowkx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzWJowkx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441c0d8eb3bso5270635e9.1
        for <soc@lists.linux.dev>; Tue, 13 May 2025 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131041; x=1747735841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=;
        b=TzWJowkxiQsyrGchXd02nK5kRUUqxNKyot0ow4lv877WXh9Hv6dcY8kLkuMZHl2lVm
         7igaVsmuTScnn0dXbJmfQkQtfLbyou4KXKUK6IKfx6UPtX78yRlV8K1doS5dbMQjhwYv
         IWueM79xcEJQ81JYnOAHLf0k9ROko6AIdmqiGdnXh+DfyIX9g+zRgfcOD+RgqmIM5LPs
         hR34nM4veUojPRMK6c3Z2DF9HO4siw+/+AwYd69HYcW9my/+rpy52YBd52THaPqm+TqW
         W3a/PuuZ2RsVK3HwCEjkWLJz6K4Zgn7TsujOQJTlfWcydRl/lZ+bXZIMX5XuvKjivTtx
         fceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131041; x=1747735841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8dBK6vbp1JpEHHLt8/xtt79SEaE3cK2HcOeapRU9QY=;
        b=D+9RG4TnlyhjQGhYrCeClzrNsTixQlv2bki6du39cC/W1hSGleHvRjDMobCkvuO/PQ
         7kvrBWqcaKcISNd0T4E9J4e4YApjfNrYoDPH/sMquITeQYoEih2LYnvIlAitexloZMMo
         iWVDv1ISsJC7ELF59hG1wmVsbb+iG4wI7qRPiWiJfYRBVHBXnu9sbwVoFhnUBdujanxt
         Vrmo8qwcAcxQ0CSNAxJWHDNbNm3pu/RVOU3BKFrtI8HzXtF08HgV0y1hEcTNCbaSiwoy
         dlA7Zbm0RXgfyVC29T8lcmH8K2rNxnrNVENsCKgbjHhnFbltE5lVsC+vyw780EpKwF62
         mLwA==
X-Forwarded-Encrypted: i=1; AJvYcCWc4orcljOmeER4j9QZWtEeQphJhW4tkfbPd1L6wSRuPLTvjqo4WVSPyenTttfDW3W9usc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt40mZh0eCDJkihFn1NFYqvruwjbcCu4GN3NERmCTdDA9FoI2U
	XPPUZLexBm5T9GpJJmqxsF83CB3JxJFpg/PlIlheQwPbfldxc0MNj4sMTy75XSQ=
X-Gm-Gg: ASbGncstJPh4a58B9r/yew9fedtZOmbPtJ+eLwDdEYEMKx4UB+I/sokmaXLEtUKqVcw
	3byG15MNRZ0zaOHzxK3UWECELjaL7sk9yMR6+aLeS3v3Qe8hmZmTshxbzsa6cM2XzzMk/iHVuFs
	Oc3uOpMQCQfnzqTNh/GzhYHa+TiUHcClAVVdWpAAkxD94W4MS7JixyGoDaIcBrzg8ZKrf4O2JZr
	QiNFAQairp2UHjvyDOhh7f/4VkTCCeZ+K2LQbWS5RMQbKPDqRKFZrH/48TZKNJ0e5QQeFGZFtUe
	B9Rdk6ui0f7sKDvbObW7n4X4bDfXt7iyR70WPI1hTlfp9giH84+VaDetTMzcaUgBdfeuc1K9JIi
	JVuuenuDIqxEvuoPF2I0Uj60P0IwzDuW8LfyptWs=
X-Google-Smtp-Source: AGHT+IGTa8DSyODAQzBZKZ5d4ecGtFrjDgOJkla3p4mKacsE9TPMC3VixJsrixwN7OQ/qL+vFjc8kQ==
X-Received: by 2002:a05:600c:4f43:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442d6de7911mr53186185e9.8.1747131041032;
        Tue, 13 May 2025 03:10:41 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 4/4] ARM: s3c: stop including gpio.h
Date: Tue, 13 May 2025 12:10:25 +0200
Message-ID: <20250513101023.21552-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=bTvi/Wlka4LN1Gko7gZZp6DhLneFC3PKb0/XbChbsbs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqSgi9HNbWtstkm3Z3A0GUl00WkCIY7pKtqv
 bOCMTw2E8GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakgAKCRDBN2bmhouD
 13MxD/9Aw74xNyjJwRIgwVKUPalXjz/+g5Z7eOUhQTnCoclouaD8LEGtCRL7rDaSMf3Fj5HOrRF
 6lN6J281zgiiZHHer1bQCt0E/t0WFZ9DdXEPX5pKwWAE7A3jaeLJ4AVucC1qI1d0OOZdiol2Rqf
 1Ps/nAHELq/COxJZphBGSZbJMOBGNzCT2RqsaC1vRkmyvKMYk4Geew5gr8Ur/pQLlqJD60kiXFv
 W6vRDLbj7LaP/Z9dgQ2btHNyR40NUB6BfzlRCgjZCXhUK7C8sfPmP8yAXaq3TbE3USOpjGL6sgC
 T/E4Fy61CArIUzY5UIDC8xnwjBI115aKmPsMgepiTD85MULQEfXG4Npc/qkc1z7e9O04mL0Jmxc
 Mp43csEyv4c2AW4dBCXR6z8OtUfFDjwfaaRASPpVic2yC8ZVcgnKa5eiNI+TMtqinWVZ041HbfO
 HH2J0vWo23OP/Nxgb/2RXU7Hn6iMPt99J6A21D/hm7snJDKN0H6OLEQ03/h4nAZBIHSa4BAUlFD
 lWkh7n0jYysRA9MPDkft0Z1nr1A/F2yL8A2dElslb7W5+dI7oEOBWqpyLFYqGEkeTe3YCY2a1GU
 ZH4kn80kZQZ7Tb9nzielaVffA+2B6THw15avhLmVp3jFCMj1U6tzHXquaQifcJim8pbEv6FlLm/ bldpnWXxn1iVXDw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The driver does not use legacy GPIO API, stop including this header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20250331093650.4028999-1-andriy.shevchenko@linux.intel.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/mach-s3c/gpio-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..79fdb52c4a6b 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -11,9 +11,9 @@
 // Samsung - GPIOlib support
 
 #include <linux/kernel.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
 #include <linux/module.h>
-- 
2.45.2


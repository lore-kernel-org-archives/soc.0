Return-Path: <SRS0=tuuZ=NO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D742C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 08:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D7E6C4AF50; Wed, 12 Jun 2024 08:40:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4246C4AF4D
	for <soc@kernel.org>; Wed, 12 Jun 2024 08:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4246C4AF4D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6ef8e62935so259329366b.3
        for <soc@kernel.org>; Wed, 12 Jun 2024 01:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718181651; x=1718786451; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WiwpAVIIzI25M3vt4yA+PqF3qDsIr7sGRJOC2cnv2A=;
        b=EyIFcI+qW4tky8vHRpD3QJK2yvEVeKvzoIX77XHF3v1NjyWBvYlSJdiTC7L3a3cSt9
         2MpJDC4Q1RuHKz5FezkQYjbr3HIwrgCJqT8xrOjWYgIcZ1keNuoaHo6a7V49D0DHHkBT
         XaVFAU8s2hNb/6+WLiAR/FOyzbTnbA/2BIklRi4j/khCLPHoBAaD3yenK7OQs6ox9vIk
         Ua8zxZbb0CZ1CEiQAWI70oXmKNiFQkQkE76cdf2rnUEickXaXo8cinQoO/yebG9AvC2K
         hoVfmn0JwYYqnQTWqqY/S3W9jlEe3xvDyXniAWs843Tih/IaAywWck56/IRtOE8+SP4l
         6LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181651; x=1718786451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WiwpAVIIzI25M3vt4yA+PqF3qDsIr7sGRJOC2cnv2A=;
        b=d8/a8ll+z9YQG59dWphwD6AHyaqaxRZOjQpiaIvFaLYDrpRyEGjWQfy/re4gslxNb+
         j/5gA/GlgTIeTkFs4BEPIngBR5L+LaSmsi1tS0TIZwhsxY7g9Z5C+XaW2g8YjX7xw0Fc
         TqwhozHeXQt29jxkQdCO+0CuI0QLqGBeD2PK2tlEZ4D5AjFPxnAgbPKrBUiqDS6PUTYa
         qgHiYuN7nn9pa1FlE4XshenHEjIY7teKYXkfAmj3Nd8Y9yoHlhkZkSyojQwzN44UdbXL
         x9XIJod2jPIFP1r0iW4BRISqelKBzZGCsXzoy8OVBv/F46giGwjZQuufPW12DQWl7L0y
         9NFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY3mIjH0ZORG+cmiB/3vuzPVw3HZmGiKtLpuCCQolaRNHyBeo0mxh3d4RfG4rMJKeK6qfcVO0Lkg1OtfB0EQ==
X-Gm-Message-State: AOJu0YxJ3tLsiFzTixLRBb6GoeaJdZvnKuTUWTXOGJPTheY2jLwefRp+
	GkFRvSLGnzdFy+3vSKgivaV/42Fwvm4crBmJuNPL6So1MqEiuXTLZsKhZLXVr7U=
X-Google-Smtp-Source: AGHT+IGAvQiUcW8VL4sfb0qoE6C7is4cXciMhqvZWnwVopNLvFYJ8YfuyjbzeXxY/mf4M9KlfYPkjg==
X-Received: by 2002:a17:906:190e:b0:a68:ccbd:bcf0 with SMTP id a640c23a62f3a-a6f47f589d8mr87717366b.28.1718181651095;
        Wed, 12 Jun 2024 01:40:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efbcc252esm604812366b.143.2024.06.12.01.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 01:40:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>
Subject: [PATCH v2 2/2] amazon: MAINTAINERS: change to odd fixes and Tsahee Zidenberg to CREDITS
Date: Wed, 12 Jun 2024 10:40:38 +0200
Message-ID: <20240612084038.18519-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
References: <20240612084038.18519-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last email from Tsahee Zidenberg was in 2016 [1], so move Tsahee from
Amazon platform maintainers to credits (thank you for your contributions
and maintenance!).  Stale maintainer entries hide information whether
subsystem needs help, has a bus-factor or is even orphaned.

The Amazon platform still has active maintainer - Antoine Tenart -
however there was no maintenance activities coming from Antoine.  All
my patches from last 4 years related to Amazon remained unanswered - no
acks, no picks - so document the actual not active status of the
platform by changing it to Odd Fixes.

[1] https://lore.kernel.org/all/?q=f%3Atsahee%40annapurnalabs.com

Cc: Tsahee Zidenberg <tsahee@annapurnalabs.com>
Cc: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 2721aa9122bb..93c05f1884f8 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4369,6 +4369,10 @@ N: Haojian Zhuang
 E: haojian.zhuang@gmail.com
 D: MMP support
 
+N: Tsahee Zidenberg
+E: tsahee@annapurnalabs.com
+D: Annapurna Labs Alpine Architecture
+
 N: Richard Zidlicky
 E: rz@linux-m68k.org, rdzidlic@geocities.com
 W: http://www.geocities.com/rdzidlic
diff --git a/MAINTAINERS b/MAINTAINERS
index 0a2c9163933a..63d991d95c73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2001,10 +2001,9 @@ F:	drivers/soc/amlogic/
 N:	meson
 
 ARM/Annapurna Labs ALPINE ARCHITECTURE
-M:	Tsahee Zidenberg <tsahee@annapurnalabs.com>
 M:	Antoine Tenart <atenart@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
+S:	Odd Fixes
 F:	arch/arm/boot/dts/amazon/
 F:	arch/arm/mach-alpine/
 F:	arch/arm64/boot/dts/amazon/
-- 
2.43.0


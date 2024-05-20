Return-Path: <SRS0=BIus=MX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F20C25B79
	for <soc@archiver.kernel.org>; Mon, 20 May 2024 07:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99906C4AF0D; Mon, 20 May 2024 07:41:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96989C2BD10
	for <soc@kernel.org>; Mon, 20 May 2024 07:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96989C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a5a4bc9578cso639577166b.2
        for <soc@kernel.org>; Mon, 20 May 2024 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716190885; x=1716795685; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A/avYP5YPpm971N8IK0uubu89NMozFIaDiylX6PsHQ=;
        b=CYctmq6YJjy1QgksV+agYU4DSA++JTLOv/E2BE43vOwgeAetlAE2asRz4GfeY8+EZ6
         JXF+9EoqYV8RARVRmT00Mt1ckk+PSKFJ2jHbWLw8iQ8dJ2bl2XvnSlKngbOs4z9scMol
         CqYnwI6CTIJCYBOjLbM/EKi951XMcAvpfAa0B0uEPDHFEsrfbsEgs2xjAdNKvrU7NY0X
         Rz5WazasRPMzzisZM1Hn8soX1chmbOrdJPTR0uRgjIPpcUKdQO3lSaerWT2mwVQ7/3Op
         tzG8KYKGmCsVMjFfbsO/5U58r/zYuZ0w+Jy3zRJ/7PTKmG/H1ScWNXKFl5YHz4wVZK/A
         YHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716190885; x=1716795685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A/avYP5YPpm971N8IK0uubu89NMozFIaDiylX6PsHQ=;
        b=hqJLBGE/mmKj2f9BMVvD6kuK0gQJxt6JqHYze91Pq8ojdgiRX3NHOS3QaUVmZxTx3K
         nxdFhqnUA+/doazj7N8ZklPRdJmpZZiFuYBuT/kI1GtOEcxOpW5Qo6MqH36QL8gtnpFW
         c+JQ4h98mHMdwtt4SPuZApPyvP8yJyzA79YhOdYSq6dV2IO/Ym33WrYyW28uAvdvDfVu
         lkJXmW435Py55FudCG1L080JzMnSAj1HHaZe2NajeVypJ9RNTVDOyccNFdpcuMvB7X9T
         vuMlOhfFKiXdJZbm2mD7FjJH41/fPZNXJAkCI9QUpwytU7h8gisods4bgubyBseh6Cgo
         smuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa4hAFhEISgUEczoOI+rC/1eTtJ9gMJ/ojNzYGYbMIEr2IUfaVLnyo1unUhj291qOT21MVnia/ThbFwd02iA==
X-Gm-Message-State: AOJu0YxADRi7b0HbE/2nYQsWGoFvfoeSKZfG9K7KZo0fm/E0V29cXH3V
	+KgMCo7aFB9AB7srhXjl+nh4ft2nd6b4KDEQFeMeajhSOxoWYPtgncGQJ5hpydM=
X-Google-Smtp-Source: AGHT+IGaGv6w5Ejo+3PCQdIkO7sIlmQZTkHvXrWEWEQy4bzPDzHGkbybTDIi2J4UNNkyIEUhf7BVeg==
X-Received: by 2002:a17:906:4f83:b0:a59:ea34:fe0d with SMTP id a640c23a62f3a-a5a2d65ed4bmr2937020466b.47.1716190884722;
        Mon, 20 May 2024 00:41:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a893a91b9sm754853166b.7.2024.05.20.00.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:41:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] amazon: MAINTAINERS: change to odd fixes and Tsahee Zidenberg to CREDITS
Date: Mon, 20 May 2024 09:40:13 +0200
Message-ID: <20240520074013.9672-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
References: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 CREDITS     | 4 ++++
 MAINTAINERS | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index ea84fb373310..bdf592e0bd25 100644
--- a/CREDITS
+++ b/CREDITS
@@ -4367,6 +4367,10 @@ N: Haojian Zhuang
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
index 8193bd95c84c..3e1ce64801ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1958,10 +1958,9 @@ F:	drivers/soc/amlogic/
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


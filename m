Return-Path: <SRS0=BIus=MX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02EFC04FFE
	for <soc@archiver.kernel.org>; Mon, 20 May 2024 07:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1D78C4AF07; Mon, 20 May 2024 07:41:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D828C4AF0B
	for <soc@kernel.org>; Mon, 20 May 2024 07:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D828C4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59b097b202so498408166b.0
        for <soc@kernel.org>; Mon, 20 May 2024 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716190883; x=1716795683; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y2+R5Z+lMlXgJtdu7Zc9o7DnmU5CSj/l6XtGSHRsxY=;
        b=OlDCas0VpAfp/EMqrzm5uNDScH9SfT4quKjsemjpT8DRc96PsddKS2zHELHV6P2KtZ
         ngMbQ0/x0b6mZcAKmWaahqW4GNw5381LDo4l+Gv2di3NXf8IYjyQ5fHNLK73Nb8nhBmh
         EAeLTXSTqVTyhyHzUKG+dg79ZY7niF2O8x7lt87QdiCqvi5qApQEi0C5VP44R/GHZMhz
         TSLjyVg4CJ+emWmRxEKZ5rrCrpz4XsWbKK0SHjtGe0d2zoRPFaWEbvbxRYWnd2m7UNjz
         kHpzJk4sbzfN4k788QUfFcEAQM/+NN9HgrAX4R8qfpVJQqNWmEVVB9GX1MhLmo1P5H+X
         B2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716190883; x=1716795683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y2+R5Z+lMlXgJtdu7Zc9o7DnmU5CSj/l6XtGSHRsxY=;
        b=sX5N8BSf886q9mk5eFPPsyLjOOCr7P5wxcSI6o4/0kLj8W9cPboZFRaV43SUvSlQ2m
         8CVtW24Vnvkh12IY67zmHQ9zA3tyLwSojyUnSM9HQYu+YUFzbL8sHmvJozfc8lfc/EWK
         Ew1F5VN0PW2XakdbfDh/YO84AUohVG5Ba3ZCAnJ+s4nH6zuvn1Ua+f0nqh6ZRo2s0Gq8
         OYWpSswoJDO8IGIun2MfAOP/bNNviKZe88U9VMeq2jEh0T2hKkS57PVeGqzGVwfPtZim
         Z2YYmiZkCQkE0jn19rSkN6c0rJY3gEuH9GdLE8kD9sz67ydF+DegooO7yO/oVjredERw
         +iRg==
X-Forwarded-Encrypted: i=1; AJvYcCXWoPG+kcXalzzUkJMQdn1FGakwC/Ys8303hJxKd9B1nNEVeSdqW1va7+XsQGG1lYh1ckFg7OhormW9BBcZgQ==
X-Gm-Message-State: AOJu0YwgtvM4DPSkYj78Niv95YcmpijKYPh6la/cQ8F8ovgDLwx/503k
	caiLtT//OzJnOYh9StomPZDChTxsCEZieSdxZj+UzdIRa5VtgWxN5DyBJo2aZuE=
X-Google-Smtp-Source: AGHT+IH9haA9iR4YwoKX0PzjzpCIy5yTTINDqwVFObjzHq50kZ9iLXtPJQM9TPGv9QNsFnHhLLi5EQ==
X-Received: by 2002:a17:906:6a02:b0:a5a:7c7e:a0d3 with SMTP id a640c23a62f3a-a5a7c7ea16fmr1445195766b.44.1716190883404;
        Mon, 20 May 2024 00:41:23 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a893a91b9sm754853166b.7.2024.05.20.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:41:22 -0700 (PDT)
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
Subject: [PATCH 1/2] =?UTF-8?q?ti:=20omap:=20MAINTAINERS:=20move=20Beno?= =?UTF-8?q?=C3=AEt=20Cousson=20to=20CREDITS?=
Date: Mon, 20 May 2024 09:40:12 +0200
Message-ID: <20240520074013.9672-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Last email from Benoît Cousson was in 2014 [1], so remove him from
maintainers of the TI OMAP platform.  Stale maintainer entries hide
information whether subsystem needs help, has a bus-factor or is even
orphaned.

Benoît Cousson, thank you for TI OMAP contributions and maintenance.

[1] https://lore.kernel.org/all/?q=f%3Abcousson%40baylibre.com

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 CREDITS     | 5 +++++
 MAINTAINERS | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index 0107047f807b..ea84fb373310 100644
--- a/CREDITS
+++ b/CREDITS
@@ -796,6 +796,11 @@ E: luisfcorreia@gmail.com
 D: Ralink rt2x00 WLAN driver
 S: Belas, Portugal
 
+N: Benoît Cousson
+E: bcousson@baylibre.com
+D: TI OMAP Devicetree platforms
+D: TI OMAP HWMOD boards
+
 N: Alan Cox
 W: http://www.linux.org.uk/diary/
 D: Linux Networking (0.99.10->2.0.29)
diff --git a/MAINTAINERS b/MAINTAINERS
index a482f2a499e4..8193bd95c84c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16147,7 +16147,6 @@ S:	Maintained
 F:	arch/arm/*omap*/*clock*
 
 OMAP DEVICE TREE SUPPORT
-M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Tony Lindgren <tony@atomide.com>
 L:	linux-omap@vger.kernel.org
 L:	devicetree@vger.kernel.org
@@ -16202,7 +16201,6 @@ S:	Maintained
 F:	arch/arm/mach-omap2/omap_hwmod*data*
 
 OMAP HWMOD SUPPORT
-M:	Benoît Cousson <bcousson@baylibre.com>
 M:	Paul Walmsley <paul@pwsan.com>
 L:	linux-omap@vger.kernel.org
 S:	Maintained
-- 
2.43.0


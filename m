Return-Path: <SRS0=SbT8=D7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B324C001DB
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 11:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12A5CC433C8; Mon, 14 Aug 2023 11:41:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1DEDC433C9
	for <soc@kernel.org>; Mon, 14 Aug 2023 11:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1DEDC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so6670530e87.3
        for <soc@kernel.org>; Mon, 14 Aug 2023 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692013266; x=1692618066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lWNijrQfWmRWOHz4Gyb5anJXxKlZtHDWGQoXSDm4EU=;
        b=mjWW53JZkhIjgJfVXm5P6VSskYfsPXV5SIiz59tntKW3ocgiEY39RzlTZ7WALrxbKF
         95ZqOgtBp8PaLnxX37+K0bhkmmi67I9mKqgZeoYdOzmMcXy/hvBEdejq2joxuee8tJqV
         Bh5uo2FU4+8S7jCnQ+45his8Bxi1S2g/uYnSbu+iqY9t8lI7mHiGuqNaEnwLNlck/QMT
         WVTRsVTFy+9Iu62m/CJ3rcYf+ZPiJB3kObrNtZJr4w76pDgo4g4SF41cVUeZBQERSZBM
         Ln+GOjS+5xw4F8Qbl8zVmp1zcxp0nMJqQVOgGdxCde1huMNbCI1PlD3KqQ4a2H9fkY5m
         Ya9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692013266; x=1692618066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lWNijrQfWmRWOHz4Gyb5anJXxKlZtHDWGQoXSDm4EU=;
        b=M3X2NFi+2C+YLElHMD36b4XsRuk8Wv+XwlAw7VFaW7YoBAqygmuXF3LFFAvBYAqaQT
         +UxaMCUm+tvmx02lv7IQxNTDqGPYVhWy9/J53Kj44Cx4ZkXzqoxBy7e2zyOWwtW7oPhm
         h4quSbWDdqIZSspS/btiOmqmfvswkn6sMd2BiYZ01Zv+XEywyOOoGxZ4aI/FRz6ZFvmT
         UmhB5M42Z2f9mEI3oNvdofrGsvg2xMvl48lAXwI7gAvDgYszkyuXog9qk9OX+J5MzFWU
         kUE0+2JBcuWcLFr3fi0Km5lF2wAJZ5ist3Ih0nU9/1E4DsfP9uMIzYn2ghYNs2u/m/3x
         iSRg==
X-Gm-Message-State: AOJu0YyFS98Gcc6VH58GVcqZVw7XtIiapfgGv41LfzbaboRoc1uXVjMr
	2+eHAbFMuxftxo8LyYHc34yWfw==
X-Google-Smtp-Source: AGHT+IHTN6Vp9JDKr7T3XtFmKhNbxj94kt9wg4IAgyJR9rWB9eL1SbWoZqAF2mdsnrmeOezj3CcqKw==
X-Received: by 2002:a05:6512:3d16:b0:4f7:55e4:4665 with SMTP id d22-20020a0565123d1600b004f755e44665mr8634707lfv.56.1692013266577;
        Mon, 14 Aug 2023 04:41:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402516f00b005256771db39sm1020463ede.58.2023.08.14.04.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 04:41:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL] ARM: s5pv210: Explicitly include correct DT includes
Date: Mon, 14 Aug 2023 13:40:51 +0200
Message-Id: <20230814114051.25840-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Herring <robh@kernel.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20230720172751.2918776-1-robh@kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/mach-s5pv210/s5pv210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s5pv210/s5pv210.c b/arch/arm/mach-s5pv210/s5pv210.c
index a21ed3bb992a..7d4a10184160 100644
--- a/arch/arm/mach-s5pv210/s5pv210.c
+++ b/arch/arm/mach-s5pv210/s5pv210.c
@@ -7,7 +7,7 @@
 // Tomasz Figa <t.figa@samsung.com>
 
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-- 
2.34.1


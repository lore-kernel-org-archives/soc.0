Return-Path: <SRS0=QZMW=Y6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B5BECAAA3
	for <soc@archiver.kernel.org>; Fri, 26 Aug 2022 11:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0202DC433B5; Fri, 26 Aug 2022 11:24:01 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC5A1C433D6
	for <soc@kernel.org>; Fri, 26 Aug 2022 11:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC5A1C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id bn9so1279047ljb.6
        for <soc@kernel.org>; Fri, 26 Aug 2022 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=nNq0QtezWkJQD6INywwld67V5mE2ngczW6mF7dnhb1g=;
        b=zVtNj1kXMDW5vkoFjNKFVh/mUsZNb/THXNVK71LoQ2DKRXR7q3jbtUOz+o2T+xl3hd
         JtYT+L+oHQsAN7PJoVzyQWtX8qLXrW8XyMhN9biBhFVFESQjC7ktlLgPXwmt3w9OYug8
         G/gzmC0IblZDpu7P9ACnz2QskZY5iekMzd/i9TPfvIZXSYmdOxzVGBr9Rjo/ynJL55TX
         NLPYXeqb/2q00vE9HnmciA2bXk37KfGfAxMfzitJWQw1oSSM/sZB6+FwZYNy266L/zwB
         kmEtB3W0Ew/9kD1AuJEC4R72XN0s6Rpw3O2aymgyAGQ5o+7cDOzDKd80O5VwXfGSsmEu
         4Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=nNq0QtezWkJQD6INywwld67V5mE2ngczW6mF7dnhb1g=;
        b=p53nFKjNmHq27/lkI75UQbRBQgcLgRcq43oSyIKxv5HTa+TVnwuY0Y3m9+MEUV9ue9
         wL8G8n1sC9qH4ocAuCd1sp6LCJY6FUKzhJy3PmUlcHqYhjEKPxmBlQev6oHEQX1CaSKM
         hc7Ok4QpXle1VldxZwuwQlLCIMBNzD8D0vOwKGrFnQIBbNGdsJRqLOrKT2i+q33fF51Z
         AkputJPJ2gYOw+/ANLwk23hiTVKuNd2BhIPky4NKNGTMU0asFCAaGbVgAwpIbVSyF7iW
         +/XFgVQz94LKUjikrFYhUs9zYdsfPVVXzzcAIxs35l8DsBye5tJX2HKKCyGMgsL5t0fs
         FmZA==
X-Gm-Message-State: ACgBeo3Qol7yz00rHKdco3cKUWw2DTucXaKsJ5fNB2WmYCYxxO6QtEDE
	oNW86+Upems/XD7fDYUu68YtNQ==
X-Google-Smtp-Source: AA6agR5Pynaa6COjwc1HLQQlE85rZHkQwPdYrd+zY9sU/copETQIkLfOZyQ8lB7IS5OtB8gSDVxaBQ==
X-Received: by 2002:a2e:b809:0:b0:261:be83:a2b0 with SMTP id u9-20020a2eb809000000b00261be83a2b0mr2190570ljo.219.1661513037924;
        Fri, 26 Aug 2022 04:23:57 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id k13-20020ac257cd000000b00492f0316273sm342452lfo.285.2022.08.26.04.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 04:23:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: ixp4xx: fix typos in comments
Date: Fri, 26 Aug 2022 13:21:53 +0200
Message-Id: <20220826112153.438829-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julia Lawall <Julia.Lawall@inria.fr>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Link: https://lore.kernel.org/r/20220318103729.157574-26-Julia.Lawall@inria.fr
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for non-urgent fixes.
---
 arch/arm/mach-ixp4xx/ixp4xx-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ixp4xx/ixp4xx-of.c b/arch/arm/mach-ixp4xx/ixp4xx-of.c
index f9904716ec7f..f543e2adae0c 100644
--- a/arch/arm/mach-ixp4xx/ixp4xx-of.c
+++ b/arch/arm/mach-ixp4xx/ixp4xx-of.c
@@ -46,7 +46,7 @@ static void __init ixp4xx_of_map_io(void)
 }
 
 /*
- * We handle 4 differen SoC families. These compatible strings are enough
+ * We handle 4 different SoC families. These compatible strings are enough
  * to provide the core so that different boards can add their more detailed
  * specifics.
  */
-- 
2.37.2


Return-Path: <SRS0=P3UP=4M=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA58BC4167B
	for <soc@archiver.kernel.org>; Wed, 14 Dec 2022 20:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77E0FC433F1; Wed, 14 Dec 2022 20:42:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FBACC433D2
	for <soc@kernel.org>; Wed, 14 Dec 2022 20:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FBACC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id p8so12422437lfu.11
        for <soc@kernel.org>; Wed, 14 Dec 2022 12:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulkwhva9cFiCZ3DfN5HMaK+ouxtKXlzHQfl9jczIYvY=;
        b=QedPgbCddn5Dl8Pu35rNQD9NUC2ON0XtSslW1s6NIJEVBx6CcY3joE/8HJjounByU7
         PjXBQ8mKPOMCjuJKsjTygGEmycGbRwUfN+6rQ+fSq5B6mJ4pXRckOcmNXL66MghpICRr
         kmmqgqk8ujaNMp9MqEQbWo2poYkDA+aJR+CRvvhAR3o1CaasyBKdtD4TbF/qT3OB4+nZ
         2Mrt/rdzNKiggIZKY6aRdKTvF6BXKgji6/HpPIaP/PyKN+dx7C5r0PozCD3OPgWk8mNC
         pTZwMIOkGX+CeoQuXLCPAKWx5jm6d33OAyb3va9WdRbdNg0pFXUz38fYYOzOk334723K
         88VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulkwhva9cFiCZ3DfN5HMaK+ouxtKXlzHQfl9jczIYvY=;
        b=0qPyfIJ8neGT/JLVQRfzOemRcVip/DAsQ9xQQkHvYPwz37gomf9KaFrQg2PTe8ydN6
         zV186pydruIzUtYzfOhEFldKIoQe17sGcqhV5ssqZ9HF8Yoqsmz3GvcHebssBgdMBOiv
         odhjmNx5r7wHhNEt6oekwpVhv5Tie6MsuGPbPZ96Mjhn6blI52r6+Ty44mi1qWL50uZ4
         HR2b4UtZyBAEUCTJgW7rHgp9hCEBWrk3EJQCjdFJLdgFTCtjAxHvLxZ885HOi0zpsRH4
         6hMjUUJMIofklGQDJ7dHmpj+EGzHv1s9eZ99l4I7+WUMpcdmkrZQkVmZwngQFkBSaVut
         0Z6g==
X-Gm-Message-State: AFqh2krlhfpRBKeDQ2+s4orG46cZOTdeOkKmaonWBWCqAedzIcymO37C
	wSMiS/pVH8OGCEkxkleV7vHPnw==
X-Google-Smtp-Source: AMrXdXsExJ20ybZANnvTzStr5gfZwAZiT8CnbS5yBYp0fBPG774IbG2xctsAYWiNq8YsrSUPN17w3w==
X-Received: by 2002:a05:6512:224c:b0:4b9:f5e5:8fbd with SMTP id i12-20020a056512224c00b004b9f5e58fbdmr1111670lfu.52.1671050548362;
        Wed, 14 Dec 2022 12:42:28 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b0049a4862966fsm929120lfr.146.2022.12.14.12.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 12:42:27 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Corentin Labbe <clabbe@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] MAINTAINERS: add related dts to IXP4xx
Date: Wed, 14 Dec 2022 21:42:23 +0100
Message-Id: <20221214204223.177807-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe@baylibre.com>

get_maintainer.pl currently give no maintainer on all IXP4xx DTS files.
Add them to the set of files handled by IXP4xx maintainers.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Link: https://lore.kernel.org/r/20221005105734.3513581-1-clabbe@baylibre.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this patch directly for MAINTAINERS
changes, wherever that goes.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06f2eba42809..9ab448592f5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2266,6 +2266,7 @@ F:	Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.y
 F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
+F:	arch/arm/boot/dts/intel-ixp*
 F:	arch/arm/mach-ixp4xx/
 F:	drivers/bus/intel-ixp4xx-eb.c
 F:	drivers/clocksource/timer-ixp4xx.c
-- 
2.38.1


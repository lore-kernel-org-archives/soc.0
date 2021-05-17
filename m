Return-Path: <SRS0=sRvu=KM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42594C43461
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 19:32:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1AB3A6128E; Mon, 17 May 2021 19:32:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F9CD6134F
	for <soc@kernel.org>; Mon, 17 May 2021 19:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F9CD6134F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so489463wmc.0
        for <soc@kernel.org>; Mon, 17 May 2021 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avksdsVdDMZgIQ3gqsIJUobMN9ruEWR0vv/Un1XX3xU=;
        b=hTgaBFCmuFToWxc8asnrsyshPzpqHvZ3IqBoEB57RqwsPd/debGCK6X5Q4ySKDo/k/
         8cOZpGUfYySaYQi1oinmuzNTaUcu5HSCVVLFnknxFgvSV2CR6itIKY5KvlhcugGcJtEM
         wEwc2uY6AGNTufVQrlxgHA88xa61dMnwgDvf83/teANds9U5IkoUQ5n58Ac/ciCFNugf
         d9fvnxrI9KkWkcMYDfacBOtEDSsosmy65IEAMEOOS2FlIa0BdQ8jksW8mQF8jBcBW1k4
         /1fXfgtwXOBQNDBJ0G6HITTHnMy6AMRf2NPJES6wqGUU6MKJyLNsdBEozk5daSj/HV1I
         SuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avksdsVdDMZgIQ3gqsIJUobMN9ruEWR0vv/Un1XX3xU=;
        b=oasyOs2RexpuAD7prQhu0tPC2BPGH0ZmbTO954xYwJH/IZFKBetKSQbUow7fovJ5aC
         Qfbcn3tPuRd3ZJMnnzZi55LaBsqt+j4jv7g18YBnkN0u/iWPimh/RyoDSmVUha7ZtD/d
         tiUlE3Dp7nR4H5zTJZv7idbm/sP3PSold3dRwpB70+7FZhkOal1XsMIAuAczOJKz8NHD
         0VC/jGhr/pGU1M0szbVsRGxEENPkm0J3lV07/N4EqyVWhpxKaDVprhcgFX6nk7AXrhqW
         Z+yIo2qSxtXmxVFKsDYApdsj08JcBJxzeHcmSmM88qeiBCoC3Qp9DizDnXDLYrRU0TfC
         gj7w==
X-Gm-Message-State: AOAM5306ZfNiVL9Xn9brVR+CNTaFbOePQZfjdPrMYwHdM8cy/d5shpzZ
	TV3CMcGZZmEGqsKBwqIRk+7lt5D1hI5ILw==
X-Google-Smtp-Source: ABdhPJw8RZbZSLGMEc2ndPTw06YXtCitfg1ZKJ/xrkVPyubmbaf6haCN+bTuDb9k6W+bPk20b0z48g==
X-Received: by 2002:a7b:cd01:: with SMTP id f1mr609530wmj.177.1621279938739;
        Mon, 17 May 2021 12:32:18 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 12:32:18 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	linus.walleij@linaro.org,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org,
	ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] dt-bindings: add vendor prefix for edimax
Date: Mon, 17 May 2021 19:32:02 +0000
Message-Id: <20210517193205.691147-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for EDIMAX Technology Co., Ltd (https://www.edimax.com/)

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index cf69dfd3d522..003f6354db04 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -329,6 +329,8 @@ patternProperties:
     description: EBV Elektronik
   "^eckelmann,.*":
     description: Eckelmann AG
+  "^edimax,.*":
+    description: EDIMAX Technology Co., Ltd
   "^edt,.*":
     description: Emerging Display Technologies
   "^eeti,.*":
-- 
2.26.3


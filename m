Return-Path: <SRS0=Ao5Q=DF=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78911C001B0
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 14:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36325C43391; Wed, 19 Jul 2023 14:33:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B45CC433C8
	for <soc@kernel.org>; Wed, 19 Jul 2023 14:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B45CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9924ac01f98so960160666b.1
        for <soc@kernel.org>; Wed, 19 Jul 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777195; x=1692369195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yRPgsPQ6rnjc9HE0FU9FTxzdnmLqudrZiplmwVgLF04=;
        b=GVqoIydLhu+L/ceOGLBUPwuBYp9PsY0pXhMtf07b0/+qw+fouVzb5loonGlyR5eYbG
         biYV2CJJVfxi/cX+KA89vT8ooBM3nukw6TmJziMdnct/+J44Vkt45I4kuxUYuLVnRUYG
         eB09FlB3yxPTt8iIG7zBgORr5rdj5zCtl9qfzCEE4XcB6u8E/LbspUK7OduLHdh7whRc
         mnWdDEZhFMsS8Gz9diWIRtjHDs+4Fis5pZnxZiMeBpTKIQx7PsVJe5e7GgbsxCTqnA8Q
         ltTyi+GZrosWMtNTVxeRkclF5UybJePDT0HWPKp+XGNbQiDiJImNPmtL13T53NXp8LLq
         rpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777195; x=1692369195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRPgsPQ6rnjc9HE0FU9FTxzdnmLqudrZiplmwVgLF04=;
        b=lL6oMgIKN0TH8nRM8LSXw6ay4nEJg99HytXEfy7nIGoOodw54AmAr1fAF9h+/5Kk7S
         CNN6De9iD6yXcyxh9FAhC8cwpdOQ48lD/g7pm7odQPWHLtgMePC1Ja0XSDZ/G500vwbs
         81i3+bZY6+NwuNoGgMqmBJLkgp8tZFbhd0F3XRTrHPjKBPBXItI4SMpvYCejdD99dDI3
         z1P06jTNuytR/BKnOxRH8137Mf7OwM3EH76/QpelVz7GNh17jggFDBczTg0SG9O3fjqs
         kKfBuGkWtgReI+TtyTcqq5PefwS4FiNJU19b9Y1T0OIrsiSa1tsUUjvL0KD4tHpmWX1T
         xeqQ==
X-Gm-Message-State: ABy/qLaeWSwDFevsGdIcK4SlqNrFclv1ij6WOofzJnnTJLG/OwbBmsvQ
	GlxAgRtnOuXLx1DI6n2Xjf6unA==
X-Google-Smtp-Source: APBJJlEwRkFb27k8FoPkGWYStYAeFHuQmt4W3pAQlXmZnBWOWpKR8QGlzVztPlnEmWXodj3CPpBlJA==
X-Received: by 2002:a17:906:cc5b:b0:991:f427:2fd8 with SMTP id mm27-20020a170906cc5b00b00991f4272fd8mr2382943ejb.74.1689777195309;
        Wed, 19 Jul 2023 07:33:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	arm@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/3] MAINTAINERS: soc: reference maintainer profile
Date: Wed, 19 Jul 2023 16:33:07 +0200
Message-Id: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mention the SoC maintainer profile in P: entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

---

Changes in v2:
1. Add Rb tag.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a83f19d2b46d..ba5e7344f30e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1570,6 +1570,7 @@ M:	Olof Johansson <olof@lixom.net>
 M:	soc@kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+P:	Documentation/process/maintainer-soc.rst
 C:	irc://irc.libera.chat/armlinux
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
 F:	Documentation/process/maintainer-soc.rst
-- 
2.34.1


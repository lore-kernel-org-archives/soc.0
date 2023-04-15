Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B724C77B76
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9028C433EF; Sat, 15 Apr 2023 10:43:28 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B0E6C4339C
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B0E6C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-504efe702d5so2720592a12.3
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555406; x=1684147406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JU+5r6JwnlkZV5udDpSU3TN1NmnqBEFaQ3l0VUaFTms=;
        b=u511iv3WysXlmqIRNEbk0a12CsPPRkaNq6plomGGvHIsvGFq/gHRz5u4Apv3X5I9s0
         LnhTO02jB3h5e+5tG8C4HTPKnnbraGhyQGJnY3vx0dUIPGe8kjAN01ztD3P3rsle9bXd
         RJ+Us5PbPLRGW5x26AnX/lnCpPJFKFMGKp906BrPG5cUYil/21+5n1u1kJJX3/2u2USy
         wB9ouYXLn9DEbc1kgwSpzfE+LwUkVbRa/cwSbk3YXnoMvVljlaqH82dMgNv4MpJyfJuS
         1wi7X36BOoqU3el55JPTw3aPFth82d3dDJS2TODyYhEViZqO500J3JhRFDbDCVr1HiLd
         WZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555406; x=1684147406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU+5r6JwnlkZV5udDpSU3TN1NmnqBEFaQ3l0VUaFTms=;
        b=fMkEXokWjxNjAQVIE5U6D+52b+DGCecuJYDtwXhC83kZE0LipPBF7QlN2eqvVX2a86
         oDQYyBizDUbnj/btCRrNCDIOhn2NqaEHKbJW4VMC/Vg+j8Wf+n34Bvv1UmoKlOt3kmQ3
         VgpWhlHiuUssDp2B0jYT/AcdjkxoiKwfyT+0m3y4zMGPYmc0ikDfeft2tZCvKzZKvJHX
         SdH/eev24C44zwBgjtyWw984SLt27MKOhOm2KLIq6wVn1OQb4oeTmj8noh29pXje2WJt
         U1OsvMEPU8fXJIhxefmH4ABl5o0QX7eLwSaWgpPtgjJL81fAqJCga5ZcD/GRg5Xk4MAQ
         Y4HQ==
X-Gm-Message-State: AAQBX9fSMoMSUX74XHUJVYb3/LP4SIJp4hKFXirymBGVZUK5m7TgRRpI
	2j1wDE39ar5auAb6Q8qz8T4F4A==
X-Google-Smtp-Source: AKy350YyOTMpW+nN80cP1bbacqd+TASdoxSP7lVeVgOVVD1mXbr+acvFjhul8bei+0eLKe9bJgdTLA==
X-Received: by 2002:a05:6402:5168:b0:506:75e6:6321 with SMTP id d8-20020a056402516800b0050675e66321mr7198815ede.30.1681555406465;
        Sat, 15 Apr 2023 03:43:26 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/15] w1: matrox: switch from asm to linux header
Date: Sat, 15 Apr 2023 12:42:58 +0200
Message-Id: <20230415104304.104134-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

linux/io.h is preferred over asm/io.h:

  WARNING: Use #include <linux/io.h> instead of <asm/io.h>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/masters/matrox_w1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index 94a1f3fa2dc3..662108b1d806 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -7,7 +7,7 @@
 
 #include <asm/types.h>
 #include <linux/atomic.h>
-#include <asm/io.h>
+#include <linux/io.h>
 
 #include <linux/delay.h>
 #include <linux/kernel.h>
-- 
2.34.1


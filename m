Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F95C77B71
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8227EC4339B; Sat, 15 Apr 2023 10:43:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 633B6C433D2
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 633B6C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-94f0dd117dcso34977366b.3
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555396; x=1684147396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6aFDy/SB7tnUF0+eQ7zFT5mQKFJQM8aVqeD2imV3VFQ=;
        b=YQEkWEK4VR8sC/8J0bTo0pPtA5ui12m+R4UvuHGj1HnX7Rq88fDAaf9QOhDXbO2yAl
         Y6icCppsb5LAK3+IWX2txT9xtOeV1PSM1x0ZjaEECRZGv7rhumJb1C0NS2R72MHLTkAR
         jPTKO7QHkfWTjn+Hn4iNlw0USmKQN6Hm1ppS5Frr3Th+IXX7yVfVF+GWUS2duwsg6Kff
         l8D54PAk2fKpq5bdHRy3Qb3qPcR2+/qzN+yNPOGqAPfIYen2Y6IwbRpwcuvMlgNQFaAI
         B/cc7Cu6MpxZELECRwgBqGcWbqXdBQ+lYVt2Jjqoo/NdkXCZbTgkzLK+YWQAjdY3NqAR
         W+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555396; x=1684147396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aFDy/SB7tnUF0+eQ7zFT5mQKFJQM8aVqeD2imV3VFQ=;
        b=UnJSH6RNLf/xFkCPLwKhNVioh6sJ6c7WPOEDacdXzCXOTm3hjQ5AOhYEglneX1rZAx
         32PZKrfTcl+I9qkwiPOSzL3TAQDw4O+QyUtPvH4pdx1ai458WdHn4pGp02k+GYk7hWu4
         q3quTS1YA0pg5IkTuHxg1jlrCty/vKeFU6cq9yknBKLSWhFIRyxWUQEkISNNvrMA5bcI
         ncr6PcXkhV4Cak5Twv06hCpU+HDF9WiMxgykOt9sn1sj+HwIU9oWPyusLgNwj5eE5C/H
         toDiCE294bNsnyTOj7u8bz6/6XnpJYnWG7lYEoV0qi3ZXXw65qd/KVCpG+uwlLB8AVO/
         HK2w==
X-Gm-Message-State: AAQBX9d387KakSKsJvpyiCYVEmEmnHo9JH1pu+6UHFi7NmcE5GFq0ylO
	yH75YFU0qGTv7DRWG9CddDZVLQ==
X-Google-Smtp-Source: AKy350Z43wpLjbwwzoveofc5k6ZjhabN/INplT3i3zKAYsqb/f/i29jvpuHEVTH+7+a/rogzU+ed3Q==
X-Received: by 2002:a05:6402:517b:b0:4c6:10a7:c422 with SMTP id d27-20020a056402517b00b004c610a7c422mr9151637ede.18.1681555396527;
        Sat, 15 Apr 2023 03:43:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:16 -0700 (PDT)
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
Subject: [PATCH 01/15] w1: ds2408: drop kerneldoc annotation
Date: Sat, 15 Apr 2023 12:42:49 +0200
Message-Id: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop kerneldoc annotation from comment which is not a kerneldoc to fix:

  w1_ds2408.c:210: warning: This comment starts with '/**', but isn't a kernel-doc comment

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/slaves/w1_ds2408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
index ad102c577122..7fa911989193 100644
--- a/drivers/w1/slaves/w1_ds2408.c
+++ b/drivers/w1/slaves/w1_ds2408.c
@@ -206,7 +206,7 @@ static ssize_t output_write(struct file *filp, struct kobject *kobj,
 }
 
 
-/**
+/*
  * Writing to the activity file resets the activity latches.
  */
 static ssize_t activity_write(struct file *filp, struct kobject *kobj,
-- 
2.34.1


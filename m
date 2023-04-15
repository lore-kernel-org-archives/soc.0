Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D99C77B76
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 410D6C4339B; Sat, 15 Apr 2023 10:43:21 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DA15C433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5DA15C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id fy21so8887755ejb.9
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555398; x=1684147398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSLSErlIH/a5nW5Ta5oh6CbddfCcyu4mj1K7g4WIjAI=;
        b=HhTnbJQEImdGA4e+HXumaOJ6UMXiuni5QBZrUxtJ1Sug7SWnr1jkjOnSwg28LhxJU9
         xl78Bea62KjaIvGHIT8yrbvsAH0mPjKzR+J0pZN4zVam2IVLIBnJk/6pYrWtjBgeBFo9
         QiVdcQr7+X21OyvhCBa/G32aFyEvYF03A7oF+2hM42/k5bH3WBtb1TevhedL8muQSiHv
         WcdQNNLrMFUMq6L/AOUPsTi3fE3OKtkttB47mDIMXLn6iBpFh2mb2Jra1P/vhMOXdKwG
         7EcJnbAAPquWrfqYVCL3Ehu/E48EvM8hiMFluOBLYAwrq/Rdo3GIP+RtLfZvpEakgNxk
         3ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555398; x=1684147398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSLSErlIH/a5nW5Ta5oh6CbddfCcyu4mj1K7g4WIjAI=;
        b=cPSVDYaQ9eojAvgomJwFqKAd09h9Qu0FnKgtIzjzHa/M+FLRn4QPeFmQs7++K2mSa1
         Geu+aDGwe+pZMbEdbpewsJsQOGabIeIeXh3L25Jwb1WXblBree1wfIni5U3An0zm0AcB
         BH5sTLOh6dG0vgzxEH5BHOmnEIrwx/4Ey6xB7Bq3M6ibxwG0pRWkTA2FHc8Du/PxhnEI
         SCas1XLb1YANEK8HhlCH17gr14VG54XJlJBTjTRkHjglAoCzH3Kc2lxsbANTNAQT4Tdh
         HbZYWcSuGxm/2SyEiUCVGKS+beYrg60/+1jSe0dTLSJdWOulEgx80sk4XclqelzcWW7U
         6PkQ==
X-Gm-Message-State: AAQBX9dc1ObYLonL7gLpgtVA4YuQNC9DXSfp7BHfj6BbygrkNekShRMB
	xNJDLT5ioihdNinC+e7I5uM6Hg==
X-Google-Smtp-Source: AKy350bVdWLpfybIr/5BIXy/EYZJTe3HRjjltyZoeJ6ALCY3Bkd7hTW/mmp3WSLZhqFffOHW7eauoA==
X-Received: by 2002:a17:906:b190:b0:94a:785e:6a46 with SMTP id w16-20020a170906b19000b0094a785e6a46mr1969337ejy.24.1681555398671;
        Sat, 15 Apr 2023 03:43:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:18 -0700 (PDT)
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
Subject: [PATCH 03/15] w1: ds28e04: correct kerneldoc annotation
Date: Sat, 15 Apr 2023 12:42:51 +0200
Message-Id: <20230415104304.104134-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct kerneldoc comments (or drop annotation) to fix:

  w1_ds28e04.c:57: warning: This comment starts with '/**', but isn't a kernel-doc comment.
  w1_ds28e04.c:149: warning: This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/slaves/w1_ds28e04.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index 6cef6e2edb89..f54d6afd79c3 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -53,7 +53,7 @@ struct w1_f1C_data {
 	u32	validcrc;
 };
 
-/**
+/*
  * Check the file size bounds and adjusts count as needed.
  * This would not be needed if the file size didn't reset to 0 after a write.
  */
@@ -146,16 +146,17 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
 }
 
 /**
- * Writes to the scratchpad and reads it back for verification.
+ * w1_f1C_write() - Writes to the scratchpad and reads it back for verification.
+ * @sl:		The slave structure
+ * @addr:	Address for the write
+ * @len:	length must be <= (W1_PAGE_SIZE - (addr & W1_PAGE_MASK))
+ * @data:	The data to write
+ *
  * Then copies the scratchpad to EEPROM.
  * The data must be on one page.
  * The master must be locked.
  *
- * @param sl	The slave structure
- * @param addr	Address for the write
- * @param len   length must be <= (W1_PAGE_SIZE - (addr & W1_PAGE_MASK))
- * @param data	The data to write
- * @return	0=Success -1=failure
+ * Return:	0=Success, -1=failure
  */
 static int w1_f1C_write(struct w1_slave *sl, int addr, int len, const u8 *data)
 {
-- 
2.34.1


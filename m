Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9367BC7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55B2CC4339B; Sat, 15 Apr 2023 10:43:20 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F038C433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F038C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-504e232fe47so3565944a12.2
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555397; x=1684147397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW9iSx5IP2gUGmfeEvoHgXw1NIUTLCMqNNP3AylUxdA=;
        b=u97N5aYGxUM2vtu5i8b70KpwA6ql/hlHHL8q/LpGxBX0WpaGP45Xix9afoFsymFy+v
         BlY66ql6Bo+C8ojSi5FHvaZaZ+lF75hKh47W7UCAJvNWrPMrscOS1BJ0//qYJVqw2j4T
         NV6CNwfajlTeJddXW7RhRtSyLrtzXS8mkDDm+XsPiXnd4CeaQ9l4jFm3FzhI6kcPzpAw
         BFsRHR7BEXviQriGJs2ofbV5magubWSi7V5kxpjqI+MOhoTCPSof/XZXAj/CPw4lujfC
         iTa8dOnCQ1SBqjdOiLBjCQWGTIYy0oqSSMv1NKLtSQCVoBrh5E2LFGk+AWYCNYFhFbhx
         VqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555397; x=1684147397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW9iSx5IP2gUGmfeEvoHgXw1NIUTLCMqNNP3AylUxdA=;
        b=an+6eog8L6lP3osmDZnyaH6OIlsMRcp31DFLmwjIykWIrkUJ1B6AAIUdDKz9duZEo5
         cGP6z7eXgBdUUKnWd1ZpsAYGG0fgqNjFaD2fubey+NvW4mf/CIuad47jDaYVp4HscFGZ
         6clRlT7pjDy3K9o1xbdrcgSqqD8s+NmI+tzBNL6dpTfNaf5oTbtfsx0/lZ0Ax47cUtb+
         qDcUi3RfrR/iB5H4Bwj1ZNj84xP3SGNDfExNMEw2tTdjtT5Nu+knLvlCswK5m6ZDj0zp
         fM5fxeKhvys1CGIYxAwRSdXy//B08mAObdu8spAFlR9cboeqlxA2ER23gGz3FJkdCI9O
         kr9w==
X-Gm-Message-State: AAQBX9fLWZ0tvQdcr5gmLM4+wq2QNW4MD6Gq2K1lJV483cCc5VW7Cyr0
	7lsRMuxSxry6NOa6GGvM6x5fkw==
X-Google-Smtp-Source: AKy350bjVhUQTb5JJQ7z/tqW66lylAGSuqRM4Coc7UVcca4c8McioxFauSi36KBt89MymEg2zw/R4w==
X-Received: by 2002:aa7:c2d4:0:b0:506:bdc:49c6 with SMTP id m20-20020aa7c2d4000000b005060bdc49c6mr9123965edp.23.1681555397563;
        Sat, 15 Apr 2023 03:43:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:17 -0700 (PDT)
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
Subject: [PATCH 02/15] w1: ds2433: correct kerneldoc annotation
Date: Sat, 15 Apr 2023 12:42:50 +0200
Message-Id: <20230415104304.104134-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct kerneldoc comments (or drop annotation) to fix:

  w1_ds2433.c:46: warning: This comment starts with '/**', but isn't a kernel-doc comment.
  w1_ds2433.c:141: warning: This comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/slaves/w1_ds2433.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2433.c b/drivers/w1/slaves/w1_ds2433.c
index 0f72df15a024..6134ca2f37fe 100644
--- a/drivers/w1/slaves/w1_ds2433.c
+++ b/drivers/w1/slaves/w1_ds2433.c
@@ -42,7 +42,7 @@ struct w1_f23_data {
 	u32	validcrc;
 };
 
-/**
+/*
  * Check the file size bounds and adjusts count as needed.
  * This would not be needed if the file size didn't reset to 0 after a write.
  */
@@ -138,16 +138,17 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
 }
 
 /**
- * Writes to the scratchpad and reads it back for verification.
+ * w1_f23_write() - Writes to the scratchpad and reads it back for verification.
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
 static int w1_f23_write(struct w1_slave *sl, int addr, int len, const u8 *data)
 {
-- 
2.34.1


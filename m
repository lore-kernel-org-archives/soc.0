Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C996C77B77
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 10:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E840CC433D2; Sat, 15 Apr 2023 10:43:25 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DC21C433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 10:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1DC21C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-50670cc3abfso1882331a12.1
        for <soc@kernel.org>; Sat, 15 Apr 2023 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555403; x=1684147403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MjSoC4TCDNhW7OuBd0aJYjoOlcx2Rf2xm/2TifHqkY=;
        b=r5n0teVtYfgLHJ9wzgJf36fggiHajrPhV/1oicQB5mindesT092j8KTlCn7LyH2mEs
         WgoDF6KkjqBEUHazPhB9mv4CS/ITzw4m/vUtQzaLxgJJERgkLDO5lXr5opoKYyg1w+yj
         amr5Gi2NoJ6mAY9/ImrkB1UNslGEwrdYoJrz5IYX46Gm0Wt3JklNeWrXg0ie8PU/i6ut
         o+VPu82oVbRRLiCAMkrqHexsp1wbFfL1KSuJdYYiq2taL8UAS8zZaFuBpY7DlPxh617l
         vZADQU4ytdiF4fpYPijHzxO2SCcsdJFgd4zLqJ9qk7DI206XS63S9hy/YMq5GNi3YJ+a
         j7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555403; x=1684147403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MjSoC4TCDNhW7OuBd0aJYjoOlcx2Rf2xm/2TifHqkY=;
        b=f3Lxcpdlkmh56MAbAFNR6wqsPgqet08KgFSxae+4g7d9+ffwN4yknv7v/fk3zlvd+t
         bdJ7Ew5wf/lKXeQLNuLNJv6iayu6cog8PuUNJsyONx7fMhF6A32/Ev7acfEo6uw4HGyK
         XdZrhP4uXHvTKOTa0huvovsJb8yquTR5PlO8CjTTBBCl8dlTLGNjOtOPg0Mz6KiItFZM
         CB4EHt02GxofT9SPSIhfvmQcM5faP0zYeOc+Cl1tLlRaLRcx5LNmVgdzk0lBlSeHjjX4
         NjiLRSWsD/9ZY8mFJF8HTmHcX5Q1PJT6IyqE+WZrBZibTQnyqrqo5tKvtf8Qi5FSKAV2
         pJVA==
X-Gm-Message-State: AAQBX9f3lzi2igBSTSeFDY0dYR1mEv7EUEuvXdnd6po4IEveb1SdYlw7
	5UjQGh0ntcmP810+BmVVbQq15A==
X-Google-Smtp-Source: AKy350Yrv9okA+dGhbqDF/SEess+c9iNTOKwIXP3omv9uneJhrdzxrKiFw0whbsWdpmvHHdnSmQOQw==
X-Received: by 2002:aa7:dcd4:0:b0:4fa:ee01:a0cb with SMTP id w20-20020aa7dcd4000000b004faee01a0cbmr9434833edu.32.1681555403256;
        Sat, 15 Apr 2023 03:43:23 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7d48a000000b004fd1ee3f723sm3157481edr.67.2023.04.15.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:43:22 -0700 (PDT)
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
Subject: [PATCH 06/15] w1: ds2433: do not use assignment in if condition
Date: Sat, 15 Apr 2023 12:42:55 +0200
Message-Id: <20230415104304.104134-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
References: <20230415104304.104134-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

  ERROR: do not use assignment in if condition

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/w1/slaves/w1_ds2433.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2433.c b/drivers/w1/slaves/w1_ds2433.c
index 23cd099d032b..9f21fd98f799 100644
--- a/drivers/w1/slaves/w1_ds2433.c
+++ b/drivers/w1/slaves/w1_ds2433.c
@@ -98,7 +98,8 @@ static ssize_t eeprom_read(struct file *filp, struct kobject *kobj,
 	u8 wrbuf[3];
 #endif
 
-	if ((count = w1_f23_fix_count(off, count, W1_EEPROM_SIZE)) == 0)
+	count = w1_f23_fix_count(off, count, W1_EEPROM_SIZE);
+	if (!count)
 		return 0;
 
 	mutex_lock(&sl->master->bus_mutex);
@@ -208,7 +209,8 @@ static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
 	int addr, len, idx;
 
-	if ((count = w1_f23_fix_count(off, count, W1_EEPROM_SIZE)) == 0)
+	count = w1_f23_fix_count(off, count, W1_EEPROM_SIZE);
+	if (!count)
 		return 0;
 
 #ifdef CONFIG_W1_SLAVE_DS2433_CRC
-- 
2.34.1


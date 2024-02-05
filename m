Return-Path: <SRS0=h8cn=JO=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475FAC4828D
	for <soc@archiver.kernel.org>; Mon,  5 Feb 2024 10:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 035FBC43390; Mon,  5 Feb 2024 10:23:50 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 213ABC433F1
	for <soc@kernel.org>; Mon,  5 Feb 2024 10:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 213ABC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a359e6fde44so437300166b.3
        for <soc@kernel.org>; Mon, 05 Feb 2024 02:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707128627; x=1707733427; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XX4Ym3d2uPw+/HY4vPGG7XwZmCRiTXwEgrLOAbWQDn4=;
        b=Xiy9Uaz+ZrB7CkZJjVucJViav4vgr8wMPz2IIRX99vD8JaBogG2ZWek3+2OgO2wLS+
         E1GlRx+APYTKf9ydZTkB+umrv+NiFIP72JQso4S4S2i2tm3Y4QwvZTBzbsTEVlKITMMj
         4Brqkp6sAZhBmPpJsPrqv+W/1mT3m6ke1ynNQxBrLC2sH9m27xrj2ZDLkYkMzlmu0xEU
         yLBqj16tGLj2nK0N5/gWUgCAHCVUduL6sHVmUCPgQVm75aHvZxi/0yn3PLRiZg8prQpV
         a+rIvYnhwdzs/uQdhLlohysoLTLXT3VRKwyezy6jgJ7sO8OTDGlblRObaNw1CCsPjzbf
         0pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707128627; x=1707733427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XX4Ym3d2uPw+/HY4vPGG7XwZmCRiTXwEgrLOAbWQDn4=;
        b=eQ4xfTFD3+UbC6XlkVqW2EuWdN6hYKlysHUCF9utx8EQQ9SjnIoAiiRecYhT9N9VaG
         J5MfEGCPumjX7hOYwMk9NWdU1NnbnruOXQfAfjxBSR951Xl6ZU4P6bJKKzNhzn2Q1udV
         OPpSPxMDir6cy8tPQ108KfWsKUKv4JmIQjfy+Oc9AqfHBAjmyVi4rIIhv4woUeGHk1z1
         rHj3VoSeih2vvdpP/UG+iPcYsyjasRoaZognnyS2Hkxw7yUMxuU89MwH8BjLmFd6T/mU
         UxQwXMUBEIK3owWfvxX5d6srsP6arbZVyAv9eY7ebypvj7Mo5kUo/XmAJINdcowIwRDA
         GBIg==
X-Gm-Message-State: AOJu0YwaN3yQHz9l1Wrkq9fw9gD4Oplr7sE/upw/A4WlwI6/01odhkG3
	OipmOM5NFmKPE+6WEyl+VZhrnu1md2XNiAsss68fUeVuIS1lK+yiudVaajHBOn8ZRQ==
X-Google-Smtp-Source: AGHT+IEhgC7WpQxUeQ7w9jPqIfihBfLgrkJnQPKhaKfxYJQOVq5OuY1YA+3A/JW3juiNLHkOHk1kzw==
X-Received: by 2002:a17:906:194e:b0:a37:e7ee:3ba4 with SMTP id b14-20020a170906194e00b00a37e7ee3ba4mr565762eje.20.1707128627157;
        Mon, 05 Feb 2024 02:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUebXMJzoW8NsFszB6JpWkjxUdvAicQboDttoHPbN0WsjspbdhzsPFJda6aPJXWwbl+JhZNTdV/w/IrsNtPLUGzfAlTARSg+7WtavOZFwmBGpol5IIFic+HnPzk/+aZ7oVFts+fnQtR8HIhZ4ulBkUfzkJRpPr/rSazL32pTy2NsbQzjV4IiVTUsEeJ9bdmRNCD7qDQbx0GZUJkZg==
Received: from localhost ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id vg11-20020a170907d30b00b00a37669280d1sm2450005ejc.141.2024.02.05.02.23.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 02:23:46 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nikita Shubin <nikita.shubin@maquefel.me>,
	stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH] ARM: ep93xx: Add terminator to gpiod_lookup_table
Date: Mon,  5 Feb 2024 11:23:34 +0100
Message-ID: <20240205102337.439002-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikita Shubin <nikita.shubin@maquefel.me>

Without the terminator, if a con_id is passed to gpio_find() that
does not exist in the lookup table the function will not stop looping
correctly, and eventually cause an oops.

Cc: stable@vger.kernel.org
Fixes: b2e63555592f ("i2c: gpio: Convert to use descriptors")
Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm/mach-ep93xx/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-ep93xx/core.c b/arch/arm/mach-ep93xx/core.c
index 71b113976420..8b1ec60a9a46 100644
--- a/arch/arm/mach-ep93xx/core.c
+++ b/arch/arm/mach-ep93xx/core.c
@@ -339,6 +339,7 @@ static struct gpiod_lookup_table ep93xx_i2c_gpiod_table = {
 				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
 		GPIO_LOOKUP_IDX("G", 0, NULL, 1,
 				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
+		{ }
 	},
 };
 
-- 
2.42.0


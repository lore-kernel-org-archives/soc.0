Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97353C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D77CC433CA; Wed, 13 Dec 2023 19:16:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D453EC433AB
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D453EC433AB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c580ba223so17587215e9.3
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494985; x=1703099785; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCozS9Tm/Y8mGnGnquLyOf4tn+xIeETpzkS1V8OEWrI=;
        b=efUe0+ET7sSfZMoLomgFrYh5RhIMmkFUn09I/VFxpJ7gkPOFDn338sCcUtKACnMnCa
         2OEoXmiE5B84fYWgWg86SQQOPeJ1DatMY2J+ZnusZArwAhWGHokM4vaQeZOoPd0tSCTV
         B7NvTCfG206w8KeHk63sTnsE4/EWNWSSW+CZznbGgkzR5x2nZQEKAIFmh8DacOxENBsj
         E8E4E2/3FGHK1w9khmKmtsYn6RQXLjV94b+IOXopYPWgvfHnkltBckTz5eJi1JnWpARl
         eB0j9t4BDMY0FqTTQK500f0E4qZWGegCKH8Wo9S6KBmrTWoyv9FSItb1xgLqVgfPoYo2
         G4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494985; x=1703099785;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCozS9Tm/Y8mGnGnquLyOf4tn+xIeETpzkS1V8OEWrI=;
        b=foPBEciYu76Y1KFbxqGrJUT7tmSKb/vvA/7xPXOD+mxYGC/JKc78ERnqikhcAaLCKk
         fXnaISKd0yEmNgjCwRqd/M4KLzGFUQh9J0Jpg0tBzj7gVCykW5FTNUj59Bn8ZM216dhE
         JyzVrCHyOPeeV6ZpOuY/DyJxwUg623OeBJS3qwtjisQ9yW62F+O9YSoA6wgf6K2K6Y0Q
         soErGvILkOUY7ZUAOrLlLVLBcaBtF50yAvtcYEJpWjGEOs0KFJe+/u86cvGKVf4t12rU
         wVSrUkufDok+urguholurtmzHSOHWGPjGVipGbLsq+neZMB3NSTN8THM8eQN9GsEzIkf
         Fl9Q==
X-Gm-Message-State: AOJu0YzwB+vKyCleUUtCV/WunDgtEenT8Sb5RCJAYCK66Uk8jAQnDOOt
	vTCZvcGROW5WQ/4aQjc07SF9fA==
X-Google-Smtp-Source: AGHT+IG74hq6EJrwdxeiFaPlj9yTpc587I2CsuoYOiT+2xrmbHNoJdVw30J42Tdk7L0P36ombllYEg==
X-Received: by 2002:a05:600c:474c:b0:40c:4575:2050 with SMTP id w12-20020a05600c474c00b0040c45752050mr3504020wmo.96.1702494985203;
        Wed, 13 Dec 2023 11:16:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231211162331.435900-13-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-13-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support
 for Google gs101 SoC
Message-Id: <170249498306.308886.7093117515363733145.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:27 +0000, Peter Griffin wrote:
> This patch adds the compatibles and drvdata for the Google
> gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> 
> Similar to Exynos850 it has two watchdog instances, one for
> each cluster and has some control bits in PMU registers.
> 
> gs101 also has the dbgack_mask bit in wtcon register, so
> we also enable QUIRK_HAS_DBGACK_BIT.
> 
> [...]

Applied, thanks!

[12/16] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
        https://git.kernel.org/krzk/linux/c/796bb2d3a16c1e786ed51183162783405b5c8f85

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


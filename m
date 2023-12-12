Return-Path: <SRS0=QVJy=HX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B19C4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 19:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E134C433D9; Tue, 12 Dec 2023 19:39:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59620C433C7
	for <soc@kernel.org>; Tue, 12 Dec 2023 19:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59620C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c55872d80so4578405e9.1
        for <soc@kernel.org>; Tue, 12 Dec 2023 11:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409983; x=1703014783; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HU5RbQo6yU19wzCnPIdhHQhCfrzZV9IA9nmUM54hRn4=;
        b=oNK/ybUDFKMngk+arNAl5ud5Njl0I2WMj9EsuT+6+jUdOta27DHQ32Ugs/E+mnEvAC
         hzkYoiCK5Kx2NIjhJiYvMsqaObN9go85rmeqAc1FlF2nAmENz2EsFLmtHGAXI53Dk3zz
         ucNzjjjhEHR33/oABY4LcgBiyO0lj5M//RhCnkc1388FU9jrd9L8QYe1YaCnFn+N1d8s
         hxR9cE7BZJ4nJHnMdVWD75hxzwW2OZgEKh1fJrdCHHZkJMy92YFfVziKY0HKtOgieeql
         FAhqgpffvks2p92pwbmK9cr5w7VXFjQCsUNneq49mFBsqGvp/YgnDQUNbIpG3fSdmIuy
         CCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409983; x=1703014783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HU5RbQo6yU19wzCnPIdhHQhCfrzZV9IA9nmUM54hRn4=;
        b=BmUdGUjjVIYlgxqscSAmM5/b4ot7ENkuWzmhBwNptz4Gx4yad0MnN9fcbNxBzBU1PX
         QNVa4QfT7ZXsFRMrgErvS1JiPIoWqMhCBnjPvmw7JkpOy2zuhd2T6m5KMVdyGmknlPE7
         FX1Q9hm3wZTXdmxUs1j8Wfl+tuvAKQ9Y8h8WDYwbzjSdNrXQ4+H3c+RZhz7h5b2valsP
         nrfZaehXgctQYxuiqkkjuHgiV3xJMdI5zbej0vg5/0HAQieyUC1TcUqfCaTa8CbrLOkt
         v80mL9aJhjVZCM+vLaFyWezbJZq8u9H7qkWGWHJSoGBV6XhqOneBVeZouBrzXictLZ/+
         VpCQ==
X-Gm-Message-State: AOJu0Yyp0fQYE3wLwUf2RxTRMArQPHYzhkMgveN7qqlWFChtmlhE+m40
	laJLxPVsoqCwsgWW5vUMO2j/GQ==
X-Google-Smtp-Source: AGHT+IGPurVjTAMMlyJVVpPYaeBs9uu+XLoCG94/B3i6Isrtg80koLVV4yN6mfxoVxf49RaSEPKFpQ==
X-Received: by 2002:a05:600c:4f41:b0:40c:2d74:b9b with SMTP id m1-20020a05600c4f4100b0040c2d740b9bmr3324675wmq.24.1702409982887;
        Tue, 12 Dec 2023 11:39:42 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 13/16] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
Date: Tue, 12 Dec 2023 20:39:18 +0100
Message-Id: <170240988144.242356.2200926663420450424.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-14-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-14-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:28 +0000, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC and a common
> fifoszdt_serial_drv_data that can be used by platforms that specify the
> samsung,uart-fifosize DT property.
> 
> A corresponding dt-bindings patch updates the yaml to ensure
> samsung,uart-fifosize is a required property.
> 
> [...]

Applied, thanks!

[13/16] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data
        https://git.kernel.org/krzk/linux/c/c95f5b21a0eaa4a2701c28e2b209f9a7e09cd4f0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

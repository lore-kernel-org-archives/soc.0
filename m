Return-Path: <SRS0=2rx6=HV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6EAC4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 14:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B28AFC433C8; Sun, 10 Dec 2023 14:01:48 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D300C433CA
	for <soc@kernel.org>; Sun, 10 Dec 2023 14:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D300C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c9f8faf57bso45124511fa.3
        for <soc@kernel.org>; Sun, 10 Dec 2023 06:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216905; x=1702821705; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=509ouQXj36I5/HmX907dzCDtwty3xLRM03HHWK4ixvQ=;
        b=qCNEdA6OTDJliEVCXU+68z4v8nuZY53yGdWu32zyS6GNc03xR/SbTiOWfVX6TpjZJZ
         CrtAW9u/TfezPIO3/0N+BHZId0s3S42+hOpTVyhWhLP/eAyORlQOdBhkseqTP90SNdrU
         IfYZjBqLCyT4LLRVFvmvfvKPRKoHknkH66vhOf7egaIaMTK6lPeQxCEFLQJYMS2a75nR
         6NR7t5n3Yz/sef9VxG0mgokWPXxVWYTBaFp943qooIfkWO7GkXUhnvDD8/9LDm4PDvrQ
         3yMl6DyRKb0AbQt6ZAXobrrnvvt+QOug6+UzRHwl8VgILBqXCjrqq+eEjLzdCM/unckL
         Y2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216905; x=1702821705;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=509ouQXj36I5/HmX907dzCDtwty3xLRM03HHWK4ixvQ=;
        b=TU2o6meoE3MhY7TNRXO30fx/8xQuP+6FwtCwnFRUj0AOxrDgyEoJ7NWaoTd1sayjof
         eTvMyWJzmgQYGISgA4BIxwboyRjyZ3puUxURQNYC8I3Ee0662m3RSBLkrZGaXP9KpNps
         ENy5e3mWhjjggnWziQjLltp1CDMqaJeD03rxoZ6dGjWB7uS9irT6bPtVpNybwPcTvpmW
         8EwiCgkgcdhGBkFwieBSJFc6V73AxleBVHarw/0mRH94lDm0uB6RZS1E/sqiD5DSqUax
         nkuYFIMGFMTkiF6tt4X4sYmmlhj92zmjPocFVuF585r30sI6ZJ1Kd9VUkWgce1mKOPov
         gUlA==
X-Gm-Message-State: AOJu0YxRNpo0yUv24pnpUZy5xgav7D9YxAYWB8YhLy810tPgw4rWO/aN
	4aJZPsj0JhLJNjlBDjjNHXup7Q==
X-Google-Smtp-Source: AGHT+IEZmhO9bfzbn9JehG5hOmeoOZbTHQz/rhyB/WkPhsdghbEEi7AQ8p1xd7LZWL25BdUtRojVkA==
X-Received: by 2002:a05:651c:10b6:b0:2cc:2189:7f5a with SMTP id k22-20020a05651c10b600b002cc21897f5amr36215ljn.93.1702216905124;
        Sun, 10 Dec 2023 06:01:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tg10-20020a1709078dca00b00a178b965899sm3458691ejc.100.2023.12.10.06.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 06:01:44 -0800 (PST)
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
In-Reply-To: <20231209233106.147416-2-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-2-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 01/20] dt-bindings: soc: samsung:
 exynos-pmu: Add gs101 compatible
Message-Id: <170221690211.46013.5711996168125251211.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 15:01:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:47 +0000, Peter Griffin wrote:
> Add gs101-pmu compatible to the bindings documentation.
> 
> 

Applied, thanks!

[01/20] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
        https://git.kernel.org/krzk/linux/c/fdd78ff04ccc96f628c2f93e0d48ab0a74bf34ef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


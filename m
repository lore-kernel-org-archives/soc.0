Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A69BC4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77DF7C433AD; Wed, 13 Dec 2023 19:16:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20AB4C433C9
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20AB4C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso44200815e9.1
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494987; x=1703099787; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlTpAm/op63WnQxBaylZlpeqHoqAOxaydKFKKqlx8Ys=;
        b=lDQs3/y6K+YiIdyPsOecesS9jt3eOE8yBa1ClB/Yfps/dok3IywcSA6R0Rpa7barmj
         Y5KO0Kz/ZAIGHZvM7+T/eNvkErRoGpMz13LUrDOPKcGG3ESwLJBHuxsYs0QTD0fLJVmt
         rPdiUWGjVpvYhYNFGtob8SClwtMCeeFTVsrrjHOFozzdkCSdQpEBxYoc4w3vBRB40U5j
         EdWQa548YIfvAiTfdOnJAGRMDH/4JaGkVPNmGnYL3DHTXq8KI3ns9mHQtr+Z8LPVs6oL
         qKHMggyf/I879pOVBNV7FTLdsHrNp8uEfD/uQ/xjR2stYlDXTNQePZzpq1sCNxcogSzO
         BfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494987; x=1703099787;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlTpAm/op63WnQxBaylZlpeqHoqAOxaydKFKKqlx8Ys=;
        b=rMfDSjz4Sqx1FHk1juTOUjvAv0dkg2a4qpH7WKWbcE4CtP99GqRs/gQamn3yrDJaE+
         NrmGDC+6j1Q7M95lyKvOT5TPak+z+00CdtLHapMundbtLub8Rt3L1A5s9Uyq7SXhGplo
         8AG9BSxYOesVOb9ccHwNcEeE0NLu9+SC8zQePaI5WLKTegbhRtoDbTh1E8LgEm0sj90b
         630Db1XhhhmU8ZuFkGaMLwpUa/R/fTqiMkCT9SaQv7HacV7P+bQ72o9Rgp4nRwMEYWka
         VxXMx5fm+Ag2vXnoF8rxAmRMSP+ulRzGUTMkMTGs+025sGZiqi25uxK3oXl3oUnpSvCf
         3D0w==
X-Gm-Message-State: AOJu0YzShMqb5/7oIuvqHjd6eyH9D62wTYEV1WtgrLg6q2x3Fzsgjpx6
	2uQg2LYspbDFyOaF9ObHBNRd2Q==
X-Google-Smtp-Source: AGHT+IH1ybS2vp4ps4bx5XfivcvSrtfbsmpPh+9TZiuzBpYyh8K77ozNJBAjVyJ9cyE16seU6Xnbog==
X-Received: by 2002:a7b:c457:0:b0:40c:267f:6e79 with SMTP id l23-20020a7bc457000000b0040c267f6e79mr4619281wmi.4.1702494987371;
        Wed, 13 Dec 2023 11:16:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:27 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-15-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-15-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 14/16] arm64: dts: exynos: google: Add
 initial Google gs101 SoC support
Message-Id: <170249498523.308886.9560205658028235022.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:29 +0000, Peter Griffin wrote:
> Google gs101 SoC is a ARMv8 mobile SoC found in the Pixel 6
> (oriole), Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> phones.
> 
> It features:
> * 4xA55 Little cluster
> * 2xA76 Mid cluster
> * 2xX1 Big cluster
> 
> [...]

Applied, thanks!

[14/16] arm64: dts: exynos: google: Add initial Google gs101 SoC support
        https://git.kernel.org/krzk/linux/c/ea89fdf24fd94cd37a7e2c51e09c39423ced7ccb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


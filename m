Return-Path: <SRS0=hgb8=FX=linaro.org=tudor.ambarus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1550BE95A91
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 12:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D09CBC433C9; Mon,  9 Oct 2023 12:01:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8EADC433CA
	for <soc@kernel.org>; Mon,  9 Oct 2023 12:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8EADC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32003aae100so3323144f8f.0
        for <soc@kernel.org>; Mon, 09 Oct 2023 05:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696852866; x=1697457666; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dQhgAOJRNqoOh1Ien+h0xhg7sd11cwuiObrfM0AE80=;
        b=P1oFTzIrMnncVegNLO1AAre0ExVq78eolj9lmESvePL1CgLpTkJNJT1eSdVUi5YzRs
         WkQ/nVpBQ5vvmdM/uZMg0E+xlTLooh9VJ5HIUCLMwHF+bO6GrQLa8Xj/R4EpnHT281pZ
         w6o0wr7RXk+H7Dk9bZeDyje5b3kxtWg7fm6u5u4Rd+2i8aOun7RFdVFopAe8epXLcPo/
         ic8CS17h5D/Jb11QdCFezPDb2J+jRcBXNQA6lSvtlux8sts3ofM0sP49lNxP4Ab8qe0a
         GTLnCIqKUIXmmcbC/T0E3TfSE6O5lMDoun7D+vYFQYESq6ajdCcGhGl4KHjrdactIc7W
         2Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696852866; x=1697457666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dQhgAOJRNqoOh1Ien+h0xhg7sd11cwuiObrfM0AE80=;
        b=f4p7JIkSESsbTdLei7bqd8ekYd0iQchXWevlLknMNGzQyjCK1f22krm/9Gg0KqaIm/
         owiJlnhM8x3lYTnPXjGsn/M9FSJc2WH+ZqIsE/s4IcnsTPOsAvTYickxgBqa6IlrpTkR
         yn/zX6IR2M5bNA2dqEaqfBsfBWRxS58vK2f8m97evB8m1zXH2recEFOzHyIpzujEUDkf
         NHYBGDER3qzZezDNP0AcJJ3eBgwMD4OepqzfyYEO3EGG9BNJVSIZTrvNZxZXuhSoM/AN
         0wJjLYLWuueuSEBMdqFFAhwhP68YTsERqdBxg++fXPt2U+gW0xylyM3+Y+T0RH/ZSZbB
         pIhA==
X-Gm-Message-State: AOJu0Yxg7QXrcxhjE4C+SkMtwtBBGBao/WboCaDV/6s5QGVUQRYlG9l8
	+AbbX+GiME1GQp0eLPNswN0ZbQ==
X-Google-Smtp-Source: AGHT+IH7e7GhrAvk0ajA9tZ0NEiTbxzb/d1XRPhB3D/cod7tcEkZk77rF0aFAvoTRaN60f7E0kWhBw==
X-Received: by 2002:a5d:658e:0:b0:329:6b53:2c82 with SMTP id q14-20020a5d658e000000b003296b532c82mr7129118wru.31.1696852864934;
        Mon, 09 Oct 2023 05:01:04 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d6b0b000000b00324853fc8adsm9384768wrw.104.2023.10.09.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:01:04 -0700 (PDT)
Message-ID: <5c2442e7-8e03-433e-9b6e-bc9aa6881cd3@linaro.org>
Date: Mon, 9 Oct 2023 13:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: andre.draszik@linaro.org, semen.protsenko@linaro.org, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231005155618.700312-19-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Peter,

On 10/5/23 16:56, Peter Griffin wrote:

> +	serial_0: serial@10a00000 {
> +		compatible = "samsung,exynos850-uart";

This deserves a SoC specific compatible so that any further quirks or
incompatibilities can be easily addressed.

Cheers,
ta

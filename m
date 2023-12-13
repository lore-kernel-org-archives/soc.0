Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE44C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E654C433AD; Wed, 13 Dec 2023 19:16:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A0FAC433C8
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A0FAC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50bf69afa99so9447825e87.3
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494992; x=1703099792; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fxr+fjlAkMW1BoUJOkEvhkSbaf/iRruRVLO4t551dxY=;
        b=g4LfUfChV0eWk+0OrODR5I2wgm7EW1F2l2IFzAlJCDB2FgGWLAb5fdUCBZjfBADCDq
         4mpXPC26ayHd8nE+n0Wdi3ZTpTt0ms+FbpcEQfcxZOM/CdrfkxRJFO3e07mM1V/qkeB9
         S4TQ3/P1NtYjYs7DMfG5GrXYXSv09297japbmt6bIWEzy6nNevL3Lrlo+0dY8KIm3JaJ
         twEyXt6FgzcECIJwxvrFMaPGPmaI12Uyp9Pa9npZPpSnV6MaDyGFLSashF/KiI0WiOpO
         v1QDHplWXxnB9Kdh+Ab464/B3t4ge0Y1r3JiqFDTGWU1JSs7tHXjCUF8Vn3xOaOevFjj
         Ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494992; x=1703099792;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fxr+fjlAkMW1BoUJOkEvhkSbaf/iRruRVLO4t551dxY=;
        b=lILKrCsIsm1OEZTsJkMJJ6MZ54YXGec6ZzuXcRHlpZVjBm0yvvPlZYIEtJHFLf0C8w
         +7iOGTRFeNua58OXEZa0SyE+V8XJ5U52hffad+QcXKeZ32ZhMvxoJFh0CPY310tdAwjk
         o5yRjvQ0Nz2wAShfyR0aPB5tYDk5Tz7zrNlqh+cHl/82bbbr4g0dgLbi12H/aypbxomz
         3ssxM+LvGTPxLq8kyL8G5fuGTcl2f90NXhOB79W7vLadC4mh2LUrSwopvLgPfxWtBuAX
         iSdfF2/zagT6QoncrwaKQTs3nSrfncn1jf36EICCD0mCApyMG+Px5Sz5akeHXUklhvyw
         BgDw==
X-Gm-Message-State: AOJu0Yy8gObnCiJcZQqe+fNRkNB9X2EnEcaXy9KPRWsaRwMmRW6VBztg
	9cHjzvtLKGACxf1kjvqfcVInbA==
X-Google-Smtp-Source: AGHT+IH7A7P8cAat4Pmc2C5Ik3HbVVkGH1myXeoFgv50CExTJyQx5Ka2M3v3P34rdn6oHqbjrqU7Rw==
X-Received: by 2002:a2e:8447:0:b0:2c9:f68f:541f with SMTP id u7-20020a2e8447000000b002c9f68f541fmr3880477ljh.10.1702494992083;
        Wed, 13 Dec 2023 11:16:32 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:31 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-17-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-17-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 16/16] MAINTAINERS: add entry for Google
 Tensor SoC
Message-Id: <170249498967.308886.12609033691141279701.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:31 +0000, Peter Griffin wrote:
> Add maintainers entry for the Google tensor SoC based
> platforms.
> 
> 

Applied, thanks!

[16/16] MAINTAINERS: add entry for Google Tensor SoC
        https://git.kernel.org/krzk/linux/c/9d71df3e6eb773f23d6f1f3f8790bae6aba1a088

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


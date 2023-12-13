Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F10C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 366B3C4339A; Wed, 13 Dec 2023 19:16:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1072EC433C9
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1072EC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso52646375e9.2
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494978; x=1703099778; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6cP8t0MJYLz6rLmgs8KiUa+iuYrpTNSW6yO1mAwDQo=;
        b=fQLCic05D0Fmr49zvSaHJMFceIrw9aZBRee59d1W/M/W24Kn+sSXk5VipUL2yluG/A
         gLPEj2ZmunzEkSBGebTbtMRJQMZVtZCWVFkHksD3P5APkon9m8hQHDtuBbT4Hfrnt5/O
         RzUE/Sfv8ckgDANTsr0ya/p9BGWMzv0BqMR3JNBkYZQVk5GPglnqPGYo15M6fsm/n3f3
         6TtmZop70+rJR2ICi133iADqv8nyVV+5X0EYT/wNeF/LrS14OiqX1vCVB6boJXIFjkgX
         Lq76rXeXySeNjTu+yIGWHhSdv2LqxQwZM8qwPGSeiUPRK+PMOQ08hUNgWVGHqSz6YZI6
         mSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494978; x=1703099778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6cP8t0MJYLz6rLmgs8KiUa+iuYrpTNSW6yO1mAwDQo=;
        b=GpMhazc+X+ie9N13MwtmHgb7FBxlUHQIImXw1F14Z7N5ZSGX+/BM3koQj6KNbpqcHh
         AD6IR2kb4hRC9baU+BoG+saa3qUOXpd5gixXxIdq38YKfo6XdeyhDxz4o+1Dx5SC4VtX
         wBekRZPwFI8Jok1p4XroBmo0ITj7z7ifAdUJv8cu642pFwnflkyLgPNEP7LHw/8He+jQ
         5C43WG8tgGg90FF8+fvwH/8u7WKqIzM5d0CljvPDvnFesqiWnxUwAhUO4HhFbpg7kOn/
         jTgRrUHDTlgQ1VRNaqAQIheTq2Ldo09VJXu2R3qITBr+LZ9K0aAeXGUY/bVsxR3e1uWn
         x9ZA==
X-Gm-Message-State: AOJu0YznDpwUUouHZNgP8WsVqE1j+2BYUqNhOEcLEvM2mG35I0zhhH7C
	Z/cB8fOFpOURAPhqq9piXFF9yw==
X-Google-Smtp-Source: AGHT+IGAL4eUGQ5fQSZsHoZjOQb5ZOk3HVPTsm+ctMmdOqN54tZUoc3cy5SaarClUhXrdXogfPeW6Q==
X-Received: by 2002:a05:600c:512a:b0:40c:317f:3cbf with SMTP id o42-20020a05600c512a00b0040c317f3cbfmr3242790wms.172.1702494978240;
        Wed, 13 Dec 2023 11:16:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:17 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-3-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-3-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 02/16] dt-bindings: arm: google: Add
 bindings for Google ARM platforms
Message-Id: <170249497603.308886.8052027202781573184.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:17 +0000, Peter Griffin wrote:
> This introduces bindings and dt-schema for the Google Tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
> 
> 

Applied, thanks!

[02/16] dt-bindings: arm: google: Add bindings for Google ARM platforms
        https://git.kernel.org/krzk/linux/c/b3582328b9c52f179de7fdd7694c42548d416e39

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


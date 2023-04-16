Return-Path: <SRS0=JHH0=AH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B36C77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 17:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C32DC4339E; Sun, 16 Apr 2023 17:55:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EE54C433A7
	for <soc@kernel.org>; Sun, 16 Apr 2023 17:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EE54C433A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-506767f97f8so2616389a12.1
        for <soc@kernel.org>; Sun, 16 Apr 2023 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667724; x=1684259724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x7wT7n+DJMWXCwF/JmEqtyfQLfvwMTp3PMeKPlacVvI=;
        b=N50SBxfRyEvNTrmfJYbWrp3K5WfAffRN7269lKy7ZahDLbF6YzyDwCeQmn5st8ZNVU
         TiWP59+AIx+c+ZAGcexmwq8zozFdGU5WSKa0UB25+PDCSc4DR2aFOxSshDG+yG6lZTtE
         VMUmyj7xEqwhgDxlwjVLbKZKrUgLZnSKjeZhv+bN3aVy2SnxHo3wD+ssFpSxvT0fw9Ji
         nJvfEOqJZiPies9FMmCiYIx+QgQtaXzqnJjIOFIiaOXhUbVZsKOGnjX81ore0i2FBzsQ
         emUEEbZhA3wQAmVg2rwJObOsNrFJMsE1DgyeFgvnwHPLIUuX6x4NX+GzS89nY5R8k+q6
         g9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667724; x=1684259724;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7wT7n+DJMWXCwF/JmEqtyfQLfvwMTp3PMeKPlacVvI=;
        b=eS77Kz2vOR2unQfz1yCRRCVkCy17FIYPy7Ms8nZVpETPTgfm88rTtOyrLjsU/q+Zha
         45uCFo13jpsLyQGYcUft+7ibuAHgTR1lNB2LPpPQrdXcNwDe19fgxIoS23048hbWgQET
         6tchJbUz6phAuY7tWWUqW8NzdHP2h5oKxn33Ark76nRHl9Svs+D0+P2lW12vJ0wduJk9
         ld6mDRpweS/asFkI2ydqzU1whdY0kq5mp5wGNl4CFKjTICgijeehlc0XD0CAfVk4Iovn
         n1KiclE+kwca2DGdIupU5qV/xYcw9JdIf52V9/VTMQWlnI3VdGmsxH1DpmBpAGOoPB5R
         lmmQ==
X-Gm-Message-State: AAQBX9eJZTKUbhDSYJjPrxmqmqf2tk7FOUk11CbN7nrVtH22uiyk9QOH
	p3zzPFcxswQR8MTlcV/gQnKPgw==
X-Google-Smtp-Source: AKy350avKh9PmUHvsOygNn3GPct8a9xHAE66Mg83Bz+YU/JqH0f5dabMl/mfcrMIbTTp5Lai6EdXjw==
X-Received: by 2002:aa7:d352:0:b0:505:394:157b with SMTP id m18-20020aa7d352000000b005050394157bmr12230901edr.17.1681667724514;
        Sun, 16 Apr 2023 10:55:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id b11-20020a056402138b00b0050690bc07a3sm2240983edv.18.2023.04.16.10.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:55:24 -0700 (PDT)
Message-ID: <99b7f216-114b-c01a-cb27-7dbcfc0c3b5c@linaro.org>
Date: Sun, 16 Apr 2023 19:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/12] dt-bindings: clock: add Exynos4212 clock
 compatible
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-3-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-3-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2023 15:34, Artur Weber wrote:
> The platform was originally dropped in commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), as there were
> no boards using it.

Also wrong commit. Reference the one which dropped compatible from bindings.

> 
> We will be adding a device that uses it, so add it back.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>


Best regards,
Krzysztof


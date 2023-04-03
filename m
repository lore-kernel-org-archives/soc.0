Return-Path: <SRS0=Mhi8=72=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0312CC76188
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 18:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9F87C4339B; Mon,  3 Apr 2023 18:37:59 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B00D1C433D2
	for <soc@kernel.org>; Mon,  3 Apr 2023 18:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B00D1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id x3so121023115edb.10
        for <soc@kernel.org>; Mon, 03 Apr 2023 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680547078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBrToP8ip8ocuqQF5W3QQfJWFoKsm6DBA26HLC3P3NY=;
        b=jH3iD00emCIeIOQAy/2nwD+lALHu/U3KzksgBkyiZTqngR4P5+z0T6Gdvia/0QPjFj
         xWRmH5Ly+OrRaA4xl1BrbIaJS0ZIMUxGGXOaX8k3lKlNaiNhEY4fc3R/h66sIn/qK0AI
         Jh5gjyYgdlN/ZEohhKH+bLPaqmTcdiXDtj4m+28dXNwNt8k1PnHm3HIRGJqsqd1Heehr
         SfPD/xqYnu4Uw4Rlv1wHjnaRsYPpS0plbmbA0tqewf2yKYaQCwoarKqMjE+6XoXQW2Mo
         Y0JJKxoLE/a15nR5PbP7DpLpMrZFfsb3J4osANE31UFmylgSUgRr+dE2C2+l4kULkWuz
         bdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBrToP8ip8ocuqQF5W3QQfJWFoKsm6DBA26HLC3P3NY=;
        b=gmJFVrUL4JBUulQfro1CSIV+J6RHoPNzirIdKDFs4qBQVcPoszqF8O1mqX648NJNcQ
         VZTP49gZrXEDu3mPuOmML+wkvrlu+te1+bUP+PNX/wirGWCAV8W9BBQcDUNprjhdy6am
         6eu8MpbO+JJFKzGcmIXQnJjq0wnro6qBTDDlIS+ju3HUdhDbSjxJt9V9RxUSJBf0PokF
         2EbCHIV7EZQdmXYnLTEWNUNGMDdg5pYGt433J7i+9+W6oJmkWujcZNTTPK0OPYNUlwFM
         FRSF9v8U867wP/Fwgusd1cTQxZUjtkU+YrDEnlZPNz/gJSBzG7AkzFgWnp/1CILYgX2m
         CWtA==
X-Gm-Message-State: AAQBX9fnlnaeOBXrq0tfYHotJWUA1JysQSmcSzTFpdYcdf6YUp9ItWZf
	nPkO8Gji05b++727SLrTj0hSnQ==
X-Google-Smtp-Source: AKy350aXsD3/6dOMyV0mSeSV3/PpyXT4CKhCn/SEkoN08la6HF6ZObp6PbZ7cMouaDVeBQU++4SuUQ==
X-Received: by 2002:a17:906:9f19:b0:93c:847d:a456 with SMTP id fy25-20020a1709069f1900b0093c847da456mr40363176ejc.22.1680547078135;
        Mon, 03 Apr 2023 11:37:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906101400b00947732c6521sm4905391ejm.79.2023.04.03.11.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:37:57 -0700 (PDT)
Message-ID: <bce9adba-d08c-78a1-5949-85155802c9a6@linaro.org>
Date: Mon, 3 Apr 2023 20:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 15/20] dt-bindings: gpio: gpio_oxnas: remove obsolete
 bindings
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
 <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 gpio bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Return-Path: <SRS0=Mhi8=72=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558CBC77B6E
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 18:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17339C433A8; Mon,  3 Apr 2023 18:38:15 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB265C433D2
	for <soc@kernel.org>; Mon,  3 Apr 2023 18:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB265C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id cn12so121147445edb.4
        for <soc@kernel.org>; Mon, 03 Apr 2023 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680547092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CySdEehWspubmXAcFc/gUkZ6ALWiIO8Dims2v4pC7cI=;
        b=XxNS02hVI+u4D2pE7UGlx7ntA7oWIlCwkuRm3Gyu0E+L6ULQyC+6ShlqR4ekLzDFlT
         pRslLrKcSR/9KsmwaW7cNkZ4sBLMBrrx13XQF615coXajYG/D2tRgvu66pGLfEkrm/C8
         2A12Wh9pO54frQbFLcjovLAct7UkfQ9S1TjuUtOPvPyfN9wP6JUhxmt2lMVWqNnXPliV
         rx/sm1EdhuYRfJXOSQ0ApUnyqwfYJXx+sqa2wWwvgay1iMPZZRXTCENV4sZ6NYwUwRpY
         /YoYeDYiuIdE9FWPQg9xmmoXwmNDiV7gsagK762uIJSgjXuFP8gohz0DLGqClEWw0WV8
         4NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CySdEehWspubmXAcFc/gUkZ6ALWiIO8Dims2v4pC7cI=;
        b=uxvWyvnFMuH6PQ93xLDWxjICZYHydm/sF3y6R2XkJngsv9pfIgd2i2Wu4sVos66e0Q
         1zEKYQX4s0gAvQE/gVpFHPo1FQ2gtl+5aVQ2O/Qo6DONDLUv2ztenu7Qy7ho2KwMtlUJ
         qno6ZYnoRa/PY+5+OtjBHr/qwUom3ncgqjp7jMCut2RmAiACblOvNxJQllwdFAKvHjtC
         ZXayb8JbrLUJXwJRd+h3bqXTeG+8JmtBcajCMfdgQU0hUdTV1ut8jXC5IDv6a8f6FJDb
         J77wcrCNsc81Kt36OBePxZEX5Oy32/oWe+GKXTXD5IVqAUdFV7UIHf5m2K31/wXRguPF
         3e4Q==
X-Gm-Message-State: AAQBX9etQkr0rsq+HAi17NDedfYmnIA6IKYMwogdEyw80YrOSfbAWEGN
	IU/9Tk+8Xc4MsVGMZdKrM9d4Wio88zVzSY4DfZo=
X-Google-Smtp-Source: AKy350a21SUvVW8zkI0jUgi5Fki72Pdn7B89a65yFrUkCNuucXQuzP/aqKcsR7vvEISiRfXbpBAEfA==
X-Received: by 2002:a17:907:8c83:b0:939:a610:fc32 with SMTP id td3-20020a1709078c8300b00939a610fc32mr38202123ejc.53.1680547092335;
        Mon, 03 Apr 2023 11:38:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id t17-20020a1709060c5100b00927341bf69dsm4868907ejf.88.2023.04.03.11.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:38:11 -0700 (PDT)
Message-ID: <ac0a61cc-942e-191a-76f2-855b482247ff@linaro.org>
Date: Mon, 3 Apr 2023 20:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 14/20] dt-bindings: pinctrl: oxnas,pinctrl: remove
 obsolete bindings
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
 <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 pinctrl bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 -------------


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


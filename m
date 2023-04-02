Return-Path: <SRS0=Kx1M=7Z=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E3C76196
	for <soc@archiver.kernel.org>; Sun,  2 Apr 2023 10:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97C76C4339E; Sun,  2 Apr 2023 10:18:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C52B9C4339C
	for <soc@kernel.org>; Sun,  2 Apr 2023 10:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C52B9C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id t10so106259157edd.12
        for <soc@kernel.org>; Sun, 02 Apr 2023 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
        b=jt9PRfw5VQJUcClBuDD0yW3taPLHmIYTZT+hRzcnTsZeLzqTwOu592kOF52dyvMgmN
         jWia1f1dvudUnIMCqV/J9ddLPR4fuDVkJM/43X+6sdC0vLh4pkc4zEOBUy0H2h0enKHJ
         /IbIgWIWbuMI5DZwbCxvTn8TD3CPiLHME9Qjd/Pu15AtH27jrmtxex4QLF0fjsnN+1CZ
         TKvYD5ccYK1rb3AWi6KkV+vQnvdUd5CI87AS8JYq/dA76yknzmqbx5ErPLNiJgBKps2i
         0336/3xyzwLIt2xofO6kU6atVVguHVcQwncUdT2PkiUg+34YkOH58yJpOdEaK4T/dIl0
         pByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vbY+hH9xlDJ5JkvEylzYvLfmOyGSfk8lVRHgqhEHvY=;
        b=vxOO+GF4CadhCmPj6Qm2RvSBGlzFSAv9UHzydHQcsMrN364sMGvzqApqkiyyiT25FY
         jDEujKiMLiJUMCPzizxJvyAgQxmyH6YPjxd4EiEXTIdfA0F2WyZBR8CgswQ29PNgV+FG
         GiDuEYuiFViDYbrtdj7KZHy0FQknpCy6jAYMhk9+plAIIwBp3FfDmCCmQNouHWoQ2JlO
         PHLBGSUNrIDQdIaCKj3EGOhXveN2bwtLs1iaKjZWB1cqAQElbO8+LE3IWQUtwiUbg3TN
         KejYZg4kvMXkcjmr1Pw4gbBSZpi03GOWx6TFJFsXayzDMwbQZpW6LXebO6nLM22xL71W
         l0NA==
X-Gm-Message-State: AAQBX9eQrFqa6/LpW6Pz/tTihXy4uRF+HYJrMEnWx9OWuOTPcJ4XUxpq
	H5OInmev6d9Is12DhTwKJ/u/fw==
X-Google-Smtp-Source: AKy350Z6IQ1DInGgJ1tkTuG1NeZ3Izk22lBovEOzygEIjFvMr1KmPSan8ScnFcJMV6jOJPTmKXwNWw==
X-Received: by 2002:aa7:c859:0:b0:4fb:78a0:eabe with SMTP id g25-20020aa7c859000000b004fb78a0eabemr32523704edt.14.1680430709888;
        Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id 9-20020a508e09000000b00501dac14d7asm3129576edw.3.2023.04.02.03.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:29 -0700 (PDT)
Message-ID: <d79d35af-792d-4f42-03f0-37ff0abce461@linaro.org>
Date: Sun, 2 Apr 2023 12:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 04/20] dt-bindings: arm: oxnas: remove obsolete
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
 <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 SoC and boards bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


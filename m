Return-Path: <SRS0=Kx1M=7Z=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A44C76196
	for <soc@archiver.kernel.org>; Sun,  2 Apr 2023 10:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 606BCC433A0; Sun,  2 Apr 2023 10:18:41 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E633C4339B
	for <soc@kernel.org>; Sun,  2 Apr 2023 10:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E633C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id w9so106432474edc.3
        for <soc@kernel.org>; Sun, 02 Apr 2023 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sN4W0uppG11n4amgZQQ3mpLKRvCRZOSROsn8m2Kimkg=;
        b=jb+VJPdBqQST71dfQdR2PxUbmb8b02IKUIK2Nl00BYhPfKddUdEroPOVgXh5zH8cjW
         hT3PIhI0fncDCliWCt7mzQiKdfPcLIS9NpPFlqPg1wjloSsgZglYv2g9tXo6sXxlVhpv
         F1ZxTeu+g4yT8WAUGbizJsWrfQrI9Ck6M6ajArriv3d6TMFBfAupw95heEeutndZ2eZM
         h7A5KKcasAdAz3+zklThNj3h5nGmdqSI0jnHZBDxGlLh4Vag+yZ6jWlRe3RHzdps3aMZ
         WiXHL8dsKu+q+NaWMu12ZNa5se19Hb8+i3pVJXYsDDqt35BrNpNdRiqQWoBscwibJq3L
         w5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sN4W0uppG11n4amgZQQ3mpLKRvCRZOSROsn8m2Kimkg=;
        b=8ARZ3k+9SknrTyvQjFX/ZAFyKageX5NQNcBwUyGD5fEuz6KilBKpfVwAIIyPqixx6S
         eYurFqA/Go6r6c4UsmWlQwJaq635t2IsqK8gFhHK1dtxC6FQRC+S5ObW8mTJWnB8PPUg
         MZLP0pn11LQh2LVLYL7lcJJLofPIPSaB53lWupJjdRLXTf5jtNiPgLo8X54bDavYoj8K
         C3cyvw4IIpvTdMAbIMj2n7SmVKMo5yHy8FoO805hWx6WzhV82860Y8+0eWGQCDF6+Y72
         MHza6M/8/euylg9dPcv2Rml9U+opE2v/6MuqNnn9O+uCntfTnvBfZhkAuEqOIIP3npxf
         qkoQ==
X-Gm-Message-State: AAQBX9c/iEwzG6DjeKY7o0j3EMe4gqi6LVodxmxMCnWvdFwR7e1UIMWq
	iVZykk/LACFCuvErI1rko7n3TQ==
X-Google-Smtp-Source: AKy350bl5AI/ffJhjWXPUZDpoMYhYVGYbPhasRbUNkSaaqKcK5VPx7QaTdan03JTQnaAu7+DbiZjzw==
X-Received: by 2002:a17:907:744:b0:946:fa68:1a91 with SMTP id xc4-20020a170907074400b00946fa681a91mr17736295ejb.75.1680430718427;
        Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id h3-20020a1709067cc300b0094776b4ef04sm3145749ejp.10.2023.04.02.03.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:38 -0700 (PDT)
Message-ID: <2c7e2f62-9f0e-3be4-0da2-e0cb89a197dc@linaro.org>
Date: Sun, 2 Apr 2023 12:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove obsolete
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
 <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


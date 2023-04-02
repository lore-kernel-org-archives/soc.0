Return-Path: <SRS0=Kx1M=7Z=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3B3C7619A
	for <soc@archiver.kernel.org>; Sun,  2 Apr 2023 10:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD769C4339E; Sun,  2 Apr 2023 10:18:47 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A12D6C433EF
	for <soc@kernel.org>; Sun,  2 Apr 2023 10:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A12D6C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id x3so106331447edb.10
        for <soc@kernel.org>; Sun, 02 Apr 2023 03:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rAiXCax5IEv3GbtrRjNdKeaqlkFvh50Ja+hlmWJztM=;
        b=CZ6AIWc+LYoqh0eKEeSfubGzY7nIZAjyELJDiSiiYYbEOgKtzDqCe3DdPPU2HH7+6l
         XyE76sN9/H2OjdE+O6lBy8jz9tirH524AiHcq1uu6AWrGQVgzo7qvWaxmZKqTdWk0xhq
         cnFbpfbEBkdTCWpkG0xdGy7sedCy1zlVtGLZDH3RJ0nB9toyOSb8AnnyEUDn4EUF8Vtk
         iOAiBOR+Ggh5Q4EdePZCLxCfhws6xkFYnx50q2m/KqpmtBgbz9yCfA70877PIDqFQUfn
         lTbFradnLqyvCRVf2pcUT4UXXy20oY+tZMVT5JF8h9Gvuv37ODIhzGz74Q2d91Tbt8U4
         l1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rAiXCax5IEv3GbtrRjNdKeaqlkFvh50Ja+hlmWJztM=;
        b=Y1jrJ5UfdUAvCep2DzpAmeDh8bLJDD+QxCvYYr4EJ2KMl2eu630zKc/Yguhjl86/mY
         jYRCo/DLBq7+ORKo/iNgGNHmGgLSFZzOqffyIoa2NVjjIZ+XYIjmC3izA8t6MrDCWX7U
         hF2FtHjq4aa/b9gOGS2arwxQCTuQIMTEm05Q/1wzV2VGptYX3c8j7wH6UkuOHJm34GxT
         5g8oSRllxJAJd8lbZk3cgijskKo3lJBom+ermDJDOmRBig/rbD5R4RVNbZStNNar7gW2
         huuihWPMVePGsD82WN9svCKAhxyQbtnSbS9rybDdqmvlbRbtAEHa+yYQqahs6NrW20sl
         GGKQ==
X-Gm-Message-State: AAQBX9cynT2B7RCkVHIYnQMv4rf3839zgWJ9x9UtMgawYfxHO/aw0lbT
	aZ7Sz0r0Ka19TR2pOPkaFJuklg==
X-Google-Smtp-Source: AKy350a58/ZGMnWVhUq5Dhq9lLiSkEtxFuGyfG7+T6kIeXZ4waLFXxIO23QvKHjBcWD0NzsEIN9V1g==
X-Received: by 2002:a05:6402:cc:b0:500:5627:a20b with SMTP id i12-20020a05640200cc00b005005627a20bmr30009201edu.1.1680430726087;
        Sun, 02 Apr 2023 03:18:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id a65-20020a509ec7000000b004fbf6b35a56sm3133164edf.76.2023.04.02.03.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:18:45 -0700 (PDT)
Message-ID: <626b9c03-2425-3d26-b088-66412f386657@linaro.org>
Date: Sun, 2 Apr 2023 12:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 08/20] dt-bindings: timer: oxsemi,rps-timer: remove
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
 <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-8-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 timer bindings.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Return-Path: <SRS0=Kx1M=7Z=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE066C76196
	for <soc@archiver.kernel.org>; Sun,  2 Apr 2023 10:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9508EC433A1; Sun,  2 Apr 2023 10:21:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83C62C433D2
	for <soc@kernel.org>; Sun,  2 Apr 2023 10:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83C62C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id b20so106451029edd.1
        for <soc@kernel.org>; Sun, 02 Apr 2023 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680430886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dHtm6rEwdmIURaK6uwg13/SivrIWW9+hRVkQN5p4kM=;
        b=hWRZFnUzy/AO/MrrHGptqieSYv8r5ivl++6jYZxkWvmMxEye8miSsugXiCJBi5sqvL
         s719hTzx6xAsRH6O+8+R9ZEN4ZJOlMD6r2NdJ32bzEnaZmYynk5Oc2nlmJmRHXdUSkfQ
         qsbxUVvKFP7ACEIsS4RBi2a3SONFntKaxPE5/QMz4WxQD3+uAHQJO6pFs4XTeMC3pSGT
         onjtT+bDjrtAZx9GKQ5NBHQZEDwIaZRLJaOvD/2SIFP+Dhx0u02i4Uvx3y4spp4V8PRL
         g2AylIyMAALt7BOVeMXKB/5gE8oSD9J36tN636+e0ps1uHv2/DxBdfi/DCpIQ6LBfhEC
         B+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680430886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dHtm6rEwdmIURaK6uwg13/SivrIWW9+hRVkQN5p4kM=;
        b=4z3839GE57VA6u7PL+e8w+HwPJ3Rgk/w8mm+kPjbHVUIwIaaeBKMx1zcAlRJIyF+V9
         XjMhMs5cg2TTO8nKSm1QARcuoYICR8wwXGzpjGrC61lYysHvLc51iMN5LyM7ZeOOByY6
         aMfGt2ZyTUi3UHn/7fdohgiUWi6eDXS/h5p3w9SsSyx90p9T0qIvK6u+A4/NWrTrTtYH
         jfKKD5hg+Y5Qcn1/X0S/+m0+1N7m1yei9LGc5X4972wpZbGAd/dGV1pwI77XRqC1/5IV
         q2xKzt64OJevfaXdN+8WW6H42usYdzF8wwv5tJpNMd+5X+BLInMF1le/cgFaoYUme0qh
         HcpA==
X-Gm-Message-State: AAQBX9ew39LlSGiZGlRYkhrf59ysxlkiLc+uAK5SAFnFlC+NzYuNOxyu
	bxeW57/K78/Ozuo/Gv6vmVQkIiQZTFWAei6f4hk=
X-Google-Smtp-Source: AKy350b7C1SmwO8vWgBCIzK+/qLm6HfLt8cxKJ4Flko7Ti/4JiMy1EgB0vrkdSSZLLB43zm7wiLJkQ==
X-Received: by 2002:a17:906:3da:b0:931:95a1:a05a with SMTP id c26-20020a17090603da00b0093195a1a05amr33727013eja.62.1680430885727;
        Sun, 02 Apr 2023 03:21:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id cw1-20020a170906c78100b0093de5b42856sm3055582ejb.119.2023.04.02.03.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 03:21:25 -0700 (PDT)
Message-ID: <b207a77f-18ac-0da5-e95f-bd38fc1f0d11@linaro.org>
Date: Sun, 2 Apr 2023 12:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 01/20] ARM: dts: oxnas: remove obsolete device tree
 files
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
 <20230331-topic-oxnas-upstream-remove-v1-1-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-1-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove support
> for OX810 and OX820 devices.

Lack of development and new features are not really a reasons for
platform removal. Platform can stay in decent shape for many years,
without new features.

Lack of maintenance could be a reason, but first we usually make
platform orphaned to give community a chance. The best reason is lack of
users and any relevance, but your commit msg does not focus on that.

Best regards,
Krzysztof


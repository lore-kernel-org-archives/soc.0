Return-Path: <SRS0=Mhi8=72=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC2AC76188
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 18:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2467CC433A1; Mon,  3 Apr 2023 18:37:47 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04329C433EF
	for <soc@kernel.org>; Mon,  3 Apr 2023 18:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04329C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id t10so120945014edd.12
        for <soc@kernel.org>; Mon, 03 Apr 2023 11:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680547064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=woHQBzslpxQn8sWqqC0TN46wIMWpqjyxk4syqknSbnU=;
        b=bFvBbagm8aL0eG1WpkUMpZ7aBLUx6PKp4lseK3TKYNSJLKFTvbdAL/UOpVLQNG7W80
         6+T9nAIO+CFbrpm+FWmXGLv3iRlsx77POHfwFU7a9hg24cauINgniJsEiBKhlm45+9Zt
         jdiSe4FQmK1ZDt9moJ7wCgte6na7VoYwXmxWvsdvyoUvAbqvjIPbDOZoIrfa+thb2oen
         pJKuwQuT1MPNg+BYN/L+ZUa0yIcZL3V7ad9X2JSCYn+GbtBET4ExYrhzv/dGLWNKMrX0
         aY8Wq8zP6tmnwHk2JvG3m5+v2BlZ5wTQPHX9GIHg7/lCDDWcpU5ePfRmEIyP882gWeQr
         nULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woHQBzslpxQn8sWqqC0TN46wIMWpqjyxk4syqknSbnU=;
        b=AqijF73Bdw8OsrvvfcDGhIm8vPRrJ+UytZF7Wz07vBC6SDDRm0XZ5vA2+Tnr5bqisQ
         JAqp/k/cFUEO856nOUjL69DX2i2SPfK9H+q7+xi0ZJrus6Uojz4vxQAW0u2b+Y5peN2T
         4upyVtzYSPPOypjKw20hlDcZJkzdhf9cGG6d/Qe5bojZu5AHxoO90gWMdLNq/ajthPqK
         EvojlH8xFbi971EVSO2MzXy/hr9/swJ4TMnvyocjWxEoCY4vnlYAnak2d8LG1fLLpAjZ
         qJpBOmNj7tTMo9zglqYKDvR8MgI/k4zovetdgepA0dSWNV+FTd7rga8dfXD4MTZVfS/D
         PNkw==
X-Gm-Message-State: AAQBX9ev2JCtCTDg+bPb7ra18vKc5/rnOHIKLGiEE+3KWyAA4TnUS/Vy
	jU1VO3mKW7/TodlhniXpkilffw==
X-Google-Smtp-Source: AKy350aGwqQCodZpb/gzcGe1S8OGxNbhVHt1iC2+Dk0P5OGvd+2PK7IQlx/UQ3iZewsFT9iUWIorCA==
X-Received: by 2002:a17:906:1c19:b0:92b:f118:ef32 with SMTP id k25-20020a1709061c1900b0092bf118ef32mr36754487ejg.48.1680547064210;
        Mon, 03 Apr 2023 11:37:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id b17-20020a170906491100b008e57b5e0ce9sm4826642ejq.108.2023.04.03.11.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:37:43 -0700 (PDT)
Message-ID: <ba5cf9c5-50b2-b31b-eba4-d22eda2de0f3@linaro.org>
Date: Mon, 3 Apr 2023 20:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 19/20] dt-bindings: interrupt-controller:
 arm,versatile-fpga-irq: mark oxnas compatible as deprecated
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
 <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-19-5bd58fd1dd1f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2023 10:34, Neil Armstrong wrote:
> Due to lack of maintainance and stall of development for a few years now,
> and since no new features will ever be added upstream, mark the
> OX810 and OX820 IRQ compatible as deprecated.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


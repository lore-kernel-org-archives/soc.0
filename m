Return-Path: <SRS0=UEPf=GV=linaro.org=daniel.lezcano@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06FDC433E0
	for <soc@archiver.kernel.org>; Mon, 18 Jan 2021 18:09:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7ABCF22CB1; Mon, 18 Jan 2021 18:09:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0722122CA2
	for <soc@kernel.org>; Mon, 18 Jan 2021 18:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0722122CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=daniel.lezcano@linaro.org
Received: by mail-wm1-f50.google.com with SMTP id i63so14397085wma.4
        for <soc@kernel.org>; Mon, 18 Jan 2021 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mKnu4Yy0ogp9EfG9YlOvCv8Tt32pBE+moBbd1rQQFc4=;
        b=OaplsSuJ7GorOCYPZNe5DPX8TAZXmYteYZDBa6YS62Kg+zrYO2Xn6ySD8vsEYmoGCG
         x6xhP8cTgAmg3FhgffFCFomalu4OKGqArtZfv62G5RQBZTZOnKREQ+6LWSJG0sXFQgCO
         H1kHXluj9pS0MhMmbuJJWkYEJZRZYJ/6eLrSoC5taeIbwAst80uKwYjaClHeBgB1/jyy
         uwpCIM+OjalWmJ0Fq5NN+y24A2wS5k4/dPxS87gI/ctvOZi4IK/YBtL81YRBwVxuApI2
         hINLgujbtPeGaIYdaLfU+94mHtxcIvyAQ4qd8PGiNYLH4ShCORAcp1QOzUCZSoDL4/CS
         BvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mKnu4Yy0ogp9EfG9YlOvCv8Tt32pBE+moBbd1rQQFc4=;
        b=G8r06gpTm5f2fqsnpU/zOX/HSrRiiwkgc7zL9GQjuA5cjXDhu9sc5yatnwbx3/jNIG
         +uIq5E76hh72IuzzrEPV9psl1jCmpVtn/Q6YOXed1T8EECJeink5K242FRk1CdHeVs2z
         Rm3lEnwZggr7I7v9/f37GCflvSffghPIittlkFVUZ0ZHfuddkqaDhLlLmGGlHm2zjLd7
         HKqVYUfQC512a25Lz1v4dcFzXyH4nc2R8+QQ5vsbfb/aAolGlixVCQkJ8b4skG/eYZlf
         wzqSAQIs4YyqVgvwGc/hjVczDh0z/OIOOoHZJA9HHtPLJ/UihUGmJbZQ669a07PTsi0z
         o2ww==
X-Gm-Message-State: AOAM530iXV4UFHKohDBnneuLZGY++kzPlM8yM4ZgXEyggU1kxzUCpH4P
	P3aZsBnuWORA2Yvi+8nOyjmQ5g==
X-Google-Smtp-Source: ABdhPJxebkVqMVQKgrO//bNnPR+mMA9bYV2CDqUfJUPEOcp6nAmWPboAQKoI0lqKm0WkNs5ootvLFA==
X-Received: by 2002:a1c:b78b:: with SMTP id h133mr525052wmf.151.1610993363227;
        Mon, 18 Jan 2021 10:09:23 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:2095:8614:d69:136f? ([2a01:e34:ed2f:f020:2095:8614:d69:136f])
        by smtp.googlemail.com with ESMTPSA id b10sm259767wmj.2.2021.01.18.10.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 10:09:22 -0800 (PST)
Subject: Re: [PATCH v2 3/7] clocksource: Drop unused efm32 timer code
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Thomas Gleixner <tglx@linutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <20210115155130.185010-4-u.kleine-koenig@pengutronix.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1fcd0b4d-583c-4602-69e0-31ca13b788fc@linaro.org>
Date: Mon, 18 Jan 2021 19:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115155130.185010-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15/01/2021 16:51, Uwe Kleine-König wrote:
> Support for this machine was just removed, so drop the now unused timer
> code, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

I've applied this patch in the clocksource tree.

Thanks

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

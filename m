Return-Path: <SRS0=Fpm+=KJ=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC33C433B4
	for <soc@archiver.kernel.org>; Fri, 14 May 2021 07:37:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 60283613DA; Fri, 14 May 2021 07:37:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DD9611CE
	for <soc@kernel.org>; Fri, 14 May 2021 07:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7DD9611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=narmstrong@baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso949512wmj.2
        for <soc@kernel.org>; Fri, 14 May 2021 00:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xie40h+gZ1kzYUn1rROBwrR8QVBZ1vuhKr3GMAIK+Q8=;
        b=TgVhJZN35mBTuD+cC15AfqK8ykz9udZlYfRFTLu9xXjgyLVHyoxCmmiA2XQ6mn7GQ6
         8+k32KSLVWn4LMs3+3ZnbRxeSb1X9Nzo8HyoPuP1zJTCmBiS54FMI256xNZ4YaJP9Unb
         2OdJkpT/f1RYZk3iDJlRqKDJMWgFUjS5D838OhtG72eqq0XV8ZXuv1dWpV4S/gl5hO9l
         y0KU5idVxel5dpb6LLKxO6bckYUiVW0kewFbnWGdNZJ9ak9yXUZZbO+A82/eU08EzFHB
         fXQ5B3Pwf2zcsm6kensIlmiSLxGwtAEBDtCtbKdpU7QfgslEXBqmiWDeTPwmrp5JNoiE
         BaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Xie40h+gZ1kzYUn1rROBwrR8QVBZ1vuhKr3GMAIK+Q8=;
        b=CS0a+CrjFKDlQt7PEHLFJLR1eYd6HteRAiUJUFh/TlMtxmMG75XGfs4FRucCkv2hGU
         aFSx4B4JremvJqWCQWKr8pLoSvC8ZSg8sCrpWhPMvMTAU+gVrbXqK041SoidgHAnArii
         TjO5QGn3Sy1j2TzHANbM2Qaqy0LYGTXrmh8yqBAmMmkSoh42r10Vih0gBsh6xWB1/5WR
         ZUMjAzfTwDyekYayThswLBCv+juv0iKQWYqmDa3bTmVqAMDjbc1CVh7jx5W2wVoptnm7
         SMtC3MJYL9T6wOclmr4uycIUP/8IRKnQJNQGpq+/yC6xuGPXrBpA9q8y4pmQ8mcEhBoc
         +3wg==
X-Gm-Message-State: AOAM532YrPUrPKCHYLLzYzf5fb7M/ZKr7smNsg7pZAaLJHNDb3V99JYB
	5xTsvnS4QVm8Qvu6cjToSrY9Yg==
X-Google-Smtp-Source: ABdhPJwmhFrIvmqlONGCF4CpJDAkVPbQ35AP7JfhIb8MDmNU4+MHO5abZDYy/w/+WsNn4AWmn99G0A==
X-Received: by 2002:a1c:20d2:: with SMTP id g201mr8102333wmg.48.1620977825427;
        Fri, 14 May 2021 00:37:05 -0700 (PDT)
Received: from [172.20.10.7] ([37.164.52.111])
        by smtp.gmail.com with ESMTPSA id c14sm5664839wrt.77.2021.05.14.00.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 00:37:04 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary
 maintainer
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, soc@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210511190054.26300-1-khilman@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <45188686-7fc2-e48f-e249-0483431e9d46@baylibre.com>
Date: Fri, 14 May 2021 09:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511190054.26300-1-khilman@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Kevin,

On 11/05/2021 21:00, Kevin Hilman wrote:
> Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
> will now act as co-maintainer.
> 
> Neil is already doing lots of the reviewing, testing and behind the
> scenes support for users of the upstream kernel on these SoCs, so this
> is just to formalize the current state of affairs.
> 
> Thanks Neil for all of your efforts, and keep up the great work!
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..1f64aa7de84d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1618,8 +1618,8 @@ F:	Documentation/devicetree/bindings/sound/amlogic*
>  F:	sound/soc/meson/
>  
>  ARM/Amlogic Meson SoC support
> +M:	Neil Armstrong <narmstrong@baylibre.com>
>  M:	Kevin Hilman <khilman@baylibre.com>
> -R:	Neil Armstrong <narmstrong@baylibre.com>
>  R:	Jerome Brunet <jbrunet@baylibre.com>
>  R:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks for your trust, I'll do my best to continue maintaining the Amlogic Linux SoC drivers & DT !

Neil

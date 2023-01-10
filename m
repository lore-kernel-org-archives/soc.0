Return-Path: <SRS0=trVk=5H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78980C54EBE
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 09:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BC5FC433F2; Tue, 10 Jan 2023 09:51:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43FC2C433EF
	for <soc@kernel.org>; Tue, 10 Jan 2023 09:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43FC2C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id g10so8347332wmo.1
        for <soc@kernel.org>; Tue, 10 Jan 2023 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrQzOa9EiO3FMfIzNKHzQ3EJooWDcByw4FpVYo3LxlU=;
        b=Pp4SFUbS129IGAbhEsVjQoc5E5ovtTjU+hsh6jYN+BKENx/6Xoeqzx3afnbfz451fL
         6L6ab9gLkQb2muLgNIxbPrpeOjIbKXQJaIJOlef9FFG8PE3ObK7GkrBbo+h2dOZnRr+J
         KkDeWrnnCFgWb30BB6JBLG1TFRG36JfGVocEMQ16qDgC94jRBHRZ2sexLDVZSMOMOsMw
         28bygG4Kv2CWUu9mvlnjPN4Tz8CMxPQ0q81BH39BYb6ifOjSjHqW2UCugtHF4tO17wEw
         hTCtVBHthIJ2OYitMOgt8xSSlSPbg5gkDNl34C8TnF6z7OyRShUccMeJhhA2SQtv/MYJ
         SCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrQzOa9EiO3FMfIzNKHzQ3EJooWDcByw4FpVYo3LxlU=;
        b=UZJxXfxdUCUxXyB6yMW6m/CyskzGpgmt7AlZIgpIi/nse6cUkykET+t7Ebs2IEjIBN
         r0I5OszIx0sdJ1YgoM7A94fvk0biIAiCruBUsWkHZOJ3/w2MKYUUloqQEGg0xKFWdvhq
         cu6umz7XnNadcD+nR9mswzw/m22vaDf95UdWbCER4Feh5VJSc7JNyM1Lt/1AJXH4H01Y
         isDR6I05B1Pl6ItbqH3UEhUY13x03dWDeV9Eptrq0vPajaM5+PIm0cQzEXbxnnqbI87k
         duP1pUzhX/j3aUOTsaD/6GZot+uEVIjuwUKzS8/p4NE3VQ98j/HunhxSyiiZjQSOKHEQ
         v3zQ==
X-Gm-Message-State: AFqh2koyEYh5XuL4U3shHSXqrEFSjWhfBvslO+AP1x2VNJaaAA4I74oD
	HhKoSh7YjuXO0lYV1dwpCXbGww==
X-Google-Smtp-Source: AMrXdXtMklGbOTYDwKJIdQhxGy8wSTO8g3hNPyeO13I2MacEos0LoZRtrvbAlFBRnPJOdOR79a3eHA==
X-Received: by 2002:a05:600c:1c21:b0:3cf:9844:7b11 with SMTP id j33-20020a05600c1c2100b003cf98447b11mr58927717wms.23.1673344262653;
        Tue, 10 Jan 2023 01:51:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003cfa80443a0sm16128859wms.35.2023.01.10.01.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:51:02 -0800 (PST)
Message-ID: <83e7b2b0-1840-bc8b-e657-ab94975b955d@linaro.org>
Date: Tue, 10 Jan 2023 10:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/5] MAINTAINERS: Add maintainer of GXP SROM support
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: clayc@hpe.com, linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 verdun@hpe.com, nick.hawkins@hpe.com, arnd@arndb.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk, olof@lixom.net
References: <20230110042533.12894-1-clayc@hpe.com>
 <20230110042533.12894-6-clayc@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110042533.12894-6-clayc@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2023 05:25, clayc@hpe.com wrote:
> From: Clay Chang <clayc@hpe.com>
> 
> Add Clay Chang as the maintainer of GXP SROM support.

Your commit is not doing it. Nope. Either make proper entry matching
this commit msg or make commit msg reflecting truth.
> 
> Signed-off-by: Clay Chang <clayc@hpe.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea941dc469fa..164571ac1cc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2279,14 +2279,22 @@ F:	arch/arm/mach-sa1100/jornada720.c
>  ARM/HPE GXP ARCHITECTURE
>  M:	Jean-Marie Verdun <verdun@hpe.com>
>  M:	Nick Hawkins <nick.hawkins@hpe.com>
> +M:	Clay Chang <clayc@hpe.com>


Best regards,
Krzysztof


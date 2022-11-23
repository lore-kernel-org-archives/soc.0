Return-Path: <SRS0=gsxc=3X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9D8C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 10:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D960C433B5; Wed, 23 Nov 2022 10:51:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0319AC433D7
	for <soc@kernel.org>; Wed, 23 Nov 2022 10:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0319AC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id r9-20020a1c4409000000b003d02dd48c45so796236wma.0
        for <soc@kernel.org>; Wed, 23 Nov 2022 02:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=agDVV6DraxSox23J7he9F5SAzbVldvrCrvEWw1B8iX0=;
        b=azgb+gOo2rnkXkaWB0hgmT51zrOTplmQTjwYpklcBFwr+sWuSRQYK47K7a4bJY4FIz
         ELOE3FmCpcR2RbIgM1WVpOOO8hygA2BKahCA0tIbaA3to3Ydl6k6HGSqnZ9qcGY89lKa
         4LnFP/eHIH+cEz4KYlyHRYnFMl2hWuzm6+pU8O1jfhxG6A58QrVpzvS7Jh9pFjeEs8IF
         eTuNa3iwYNHHn2SHZ2uKiF9eBCt/TzzDhQbpqjqYfpQSjmIZheInMVE5YOk+tmdYiQvc
         zWaZpCYCu00enml4e4LB/8mY5Y4+R94Ng9fJL4/NGwCeEYtuf9ETzHqf1mLe8KMTvHaG
         FxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agDVV6DraxSox23J7he9F5SAzbVldvrCrvEWw1B8iX0=;
        b=h/tnNPMoWbUFHvhr1ffCq0558IfYdm9+4Zuj/JUaAVZIbCi7ktYtVBOIOruD1PTrBM
         P+cRBPq8ZVhWPMpi6elMR+UubX6+RBfPAm5+qu/O905QG6RKy41oVx/5TUPqATmaPwb6
         qgWjUUJWNvMwIgsWYkyzAm+JyN8SqRCWUHo8dnzL7HxH16CYcIB2bGyRc8JiJ/YhHbrR
         7oToJH6IP8tzwgrbiC+KwpMP1JURon6Im+3ngZsQA/abszApEKfs8DicoBxrfedHxZXu
         f192ylVj17l9vv86ow84memKqi/4yzgJ0NoMahVinDbI1UP6icecUSO+KktNgGkLJJoX
         bNgQ==
X-Gm-Message-State: ANoB5pm+3irT7tqDSTfLzLr0DoljK/GG0EqjMA+MjAVJl6r7hOIw54XF
	BUpGytzOWbZWyjkthMu/2ggzUA==
X-Google-Smtp-Source: AA0mqf50gOVwqVJVHjrBbPSUHOYN4PCW7GS9QrtNjRCnKKQfX1lwCmse1TAs9eEweY/cecvNqhhgbg==
X-Received: by 2002:a05:600c:3109:b0:3c6:7abb:9d2b with SMTP id g9-20020a05600c310900b003c67abb9d2bmr12389185wmo.182.1669200683265;
        Wed, 23 Nov 2022 02:51:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e551:24c3:152c:7c05? ([2a01:e0a:982:cbb0:e551:24c3:152c:7c05])
        by smtp.gmail.com with ESMTPSA id r64-20020a1c4443000000b003cfaae07f68sm1883416wma.17.2022.11.23.02.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:51:22 -0800 (PST)
Message-ID: <9ae1bae2-67ac-12da-7d4b-16dd73e13d5f@linaro.org>
Date: Wed, 23 Nov 2022 11:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
 <4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com>
Organization: Linaro Developer Services
In-Reply-To: <4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2022 22:48, Arnd Bergmann wrote:
> On Tue, Nov 22, 2022, at 16:24, Neil Armstrong wrote:
>>
>> for you to fetch changes up to 7dc69c7d073e6004a281db8f7f15cf6ebf702ea0:
>>
>>     firmware: meson_sm: Fix memcpy vs iomem type warnings (2022-10-17
>> 17:19:04 +0200)
>>
>> ----------------------------------------------------------------
>> Amlogic Drivers changes for v6.2:
>> - Fix memcpy vs iomem type warnings in meson_sm driver
>>
> 
> It looks like a trivial fix, but I think it's actually wrong:
> The real problem appears to be the use of the ioremap_cache()
> function in meson_sm_map_shmem(), which returns an __iomem
> token that is mapped cacheable on architectures that support
> this function, but behaves like normal ioremap on others.
> 
> This is probably not what you want here, instead this should
> be converted to memremap(), with the __iomem annotation dropped.
> In the long run, we should try to kill off ioremap_cache
> entirely, and not introduce new ones.

OK will have a look into that,

Thanks,
Neil


> 
>       Arnd


Return-Path: <SRS0=qp11=C6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE895EB64DD
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 19:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7072C433C7; Wed, 12 Jul 2023 19:37:09 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A136C433C8
	for <soc@kernel.org>; Wed, 12 Jul 2023 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A136C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e566b1774so5035161a12.1
        for <soc@kernel.org>; Wed, 12 Jul 2023 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689190625; x=1691782625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=181nRb34mOchYAye6iVohgQkjGw1ad08V10xOFxDSTo=;
        b=Je6UUMmaidGnv0Fo0srK1gDbpcBFzA/8I0i8Hz6wr5CDI8G5GY6m6S8p/1aSzZPD5E
         wkK3QhrjuVrKLjIPAot0WktP4GhdW6SIK+yyOKui+2HrhWbMe0mZRoM2+Szcd2+expLN
         75iUfVtIXKguXYqnSBmrIvHB3YTCA3D0eM1+7/piKWktu0jfKzjA/Pje3HkLkZPR0xzY
         0e1cC6uMIeCdnmez16qNSW19W7vVKjLWoobxtfIiya/4uHBeuh8Rf5JvMepOKQ82234/
         U43MF3ZVjgz6qdJtwEVo7AN2pawOukAnfYhpYKtv1+r0yLAM/FsT4NFeCGc5f6hlY8fP
         cmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689190625; x=1691782625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=181nRb34mOchYAye6iVohgQkjGw1ad08V10xOFxDSTo=;
        b=R5ta2pB6R051UbPhlN0+5whNVQvE1Z0PRC4WLUkvRuLlqbuvlF/3tGFjjc+h+tcY06
         ZIoq+XcGa2MNhzQcOUNNoM/J7j8dz192YJLyWIX43gEx0PI8pehdiKe7zKbLNcV5cNFR
         Ov1nY/UzOuvmJGbjXoF1iKAld5DQ6oO7PbmJTIJteBXUqldBzfXZ/E4Fw842Nh9GIXVF
         Sp4ilHwVtzvWGIBNjsoHPc1wu/tU5fIy8MQfWju6BexNPj3wMW4UdjJdNb14UuJqChQN
         SiCQwYR67G+TL2AIZVLBALtPNbsz/I544P0JRjNSU0uzVys4x+Vb3SQKM5ndPi0/YuVO
         wKNQ==
X-Gm-Message-State: ABy/qLaQLUaAnpMODD0s7zCyS4AesuKC0cbjpTzClmAskJEj/ffPLDKk
	bq9dGwEpsUF5pyoLia9hpAT3Kw==
X-Google-Smtp-Source: APBJJlF+g5n2353+b/lgRe+uVfxvvxpHFQBAfIRl+jrS3le4CKoUwHgcKyqYYTIDFLe4gKFeQBe7uw==
X-Received: by 2002:a17:906:c30e:b0:992:16bb:2b6e with SMTP id s14-20020a170906c30e00b0099216bb2b6emr17483852ejz.29.1689190625528;
        Wed, 12 Jul 2023 12:37:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090636ce00b0098d486d2bdfsm2992208ejc.177.2023.07.12.12.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:37:04 -0700 (PDT)
Message-ID: <0beb714b-7e8d-6699-6f09-df68b9307f1c@linaro.org>
Date: Wed, 12 Jul 2023 21:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document
 dtbs_check requirement for Samsung
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
 <20230712-skier-ribcage-0d82be7e16fd@wendy>
 <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>
 <20230712-unfasten-trespass-d57b3ff1f134@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712-unfasten-trespass-d57b3ff1f134@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/07/2023 14:34, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 01:46:20PM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2023 11:48, Conor Dooley wrote:
>>> On Wed, Jul 12, 2023 at 10:41:31AM +0200, Krzysztof Kozlowski wrote:
>>>> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
>>>> bring any new dtbs_check warnings.  In fact this have been already
>>>> enforced and tested since few release.
>>>>
>>>> Cc: Conor Dooley <conor.dooley@microchip.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>
>>>> Not sure where to document this. Creating new maintainer profile for
>>>> Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
>>>> this list, so this also scales poor.
>>>
>>> To me, this portion of the document was "information to the
>>> submaintainer", which would be you, not information to the contributors
>>> to the platform. Adding the comment about Samsung SoC seems aimed at
>>> contributors?
>>
>> Yes, I want to document it for contributors, so they won't be surprised.
>> Any hints where to store it? I could put it in the "About" tab of my
>> kernel.org repo, but no one checks this for contribution guidelines.
> 
> I've not got a better suggestion for where to put this, but under
> something labelled as "Information for (new) Submaintainers" isn't
> where I would be looking as a contributor.

Yeah, true.

> Is adding to the generic DT documentation that dtbs_check should not add
> any new warnings at W=1 too extreme?

It is to extreme. Several sub-arch maintainers might prioritize features
than DT schema compliance. I would say it is their choice, even if I
don't agree with it.

> writing-schema.rst has the instructions about how to run dtbs_check while
> writing dt-binding patches, but we don't seem to have any docs about
> running dtbs_check for dts/dtsi changes.

Maybe I will add generic maintainer-sub-arch-soc profile doc which then
can be linked by multiple soc subsystems.

Best regards,
Krzysztof


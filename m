Return-Path: <SRS0=JI4/=6U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EE4C61DA3
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 12:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09744C433EF; Fri, 24 Feb 2023 12:53:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99F15C433D2
	for <soc@kernel.org>; Fri, 24 Feb 2023 12:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99F15C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id m25-20020a7bcb99000000b003e7842b75f2so1664525wmi.3
        for <soc@kernel.org>; Fri, 24 Feb 2023 04:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B43T0AEPZJigOIS/UyBFbfsmEoemf/SiYcHZlZbArDU=;
        b=OGkN0CXJsVpWhKLUzO+2J2EP6C2ZwB2OfxpxnFiy9L1Ff+oeVtGaepYwATvJ1ZZ2pK
         hufBlMrsd5ufeluzrEuT2G6PrqLLHAaEj7ri3YUxeIxkHrE4IoovPC7ZgmmfsffFQqsU
         l8WMxxt1p91VeqyXKQpa+1NBGX/TvqdlWA1ebvxb9jJqb6nd7OETN5acxdOZrwT3LeJk
         AjMddVKub+kRR/yfFld6Vgb0sXEcu2Ij3T+7YWPVi+pE0jTucksi8gBObYgLYBoMHyP1
         kcctMIK+wi9WUWr86QW7tJUK09EBVwTMFmx2p4HG9FEJPMBfQ7KrVOifpmLjKTqhTveX
         stXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B43T0AEPZJigOIS/UyBFbfsmEoemf/SiYcHZlZbArDU=;
        b=benI3KfngbW09/cuta239xUdSEKn/Roqq/tsjaUG8Cbh42kg/vUQk1oFh8uDQdw/6z
         RKWKZdfVPy8/7WMjmrCXr2vIT/rIVLc/PkNPCgyGker0c0D0ieQOdbdtcieoZreXpzaG
         Eh3JdzVuFuVdsmhiBd1yobxCWuWxbBzANHFQ82Dnq6OanDhb2xov0lQZuqWOsVKNhJwB
         9IsslNpOgW370uE/Ag6zLsB/dCm04QZwFYLvixaRBed1M2KcdSsJw8WQ73YyvPH68W7g
         T3+Tsrs5eoeQCbYmv4NrKNk1uHHhzzXOBG4GVsNGZVQW8FGA3i98C6gYHnr3LgY0ZT5/
         rkNg==
X-Gm-Message-State: AO0yUKVrN1NNAbo3yTSooJ+D/mldC4UKDp7oOH/d6l/+Pr9oBcuvEQqV
	ZKiKalj5C5Mczmwq8euDJ8yZvw==
X-Google-Smtp-Source: AK7set+9lbd6dHt3hcDH3Rll7jbmvT9hwcj+WcM08mZeJj4pNOSU1eN9J5AAw4Qd2Tb4Iivb4brDXw==
X-Received: by 2002:a05:600c:348f:b0:3ea:f132:63d8 with SMTP id a15-20020a05600c348f00b003eaf13263d8mr2323258wmq.5.1677243201812;
        Fri, 24 Feb 2023 04:53:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f5-20020a1c6a05000000b003dfe5190376sm2713538wmc.35.2023.02.24.04.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 04:53:21 -0800 (PST)
Message-ID: <9a25020c-de26-5c1d-f7ff-c2dbb38d3872@linaro.org>
Date: Fri, 24 Feb 2023 13:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Content-Language: en-US
To: INAGAKI Hiroshi <musashino.open@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
 <76395d89-1c56-12b2-b6f7-e77603019b70@linaro.org>
 <e9da7a1e-d48f-014b-a0a7-841c77feb12f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e9da7a1e-d48f-014b-a0a7-841c77feb12f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/02/2023 13:28, INAGAKI Hiroshi wrote:

>>> +
>>> +/ {
>>> +	model = "IIJ SA-W2";
>>> +	compatible = "iij,sa-w2", "marvell,armada380";
>> It would be nice to start documenting the board compatibles, at least
>> for new boards.
> 
> So...how do I do that?

Start with something like this for Marvell:

https://lore.kernel.org/all/20230222203847.2664903-2-colin.foster@in-advantage.com/

But maybe someone already started it for Marvell? Marvell SoC
maintainers might help here to coordinate to avoid duplicated work.

Best regards,
Krzysztof


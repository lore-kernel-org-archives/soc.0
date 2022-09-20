Return-Path: <SRS0=4tTZ=ZX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24D3ECAAD8
	for <soc@archiver.kernel.org>; Tue, 20 Sep 2022 07:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 650D5C433B5; Tue, 20 Sep 2022 07:06:50 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50996C433D6
	for <soc@kernel.org>; Tue, 20 Sep 2022 07:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50996C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id k10so2261322lfm.4
        for <soc@kernel.org>; Tue, 20 Sep 2022 00:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=BpGibXFgS0C/8+QW13M1OlsPel1EQHzKXdhl+DKxo08=;
        b=HPT/6Gjgl4SGIytwzUcr3sYP2ohP3kgKY6hkpB3irXCTIxpy/JZERpkhxabAiTD6PM
         JPoD0D24wIcG83ptsDEsJrx79haAbkb+ktr/KxcNEFhDBqlNoKetTEEtK6mNpnfg5cWi
         zTRMF9FeN+iOx7g1zheSFkh6CtR43QtgJvAzb1iKgswKJL2VNE9GODHQ4bUM/fAxV2co
         Wq0xuhIegzSTISXDNoadzzEgeib8bnQG3F/qiJDFUcswKZv1Naqu/oe7V9AcFscUywHL
         XYYTHDipmu7HeoZhRWf99LSdm1FjrO4rOq/anaDb9z9us9v/Lqlne2diVY2I+MPzAz5v
         uqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BpGibXFgS0C/8+QW13M1OlsPel1EQHzKXdhl+DKxo08=;
        b=yvrBydUAECd8WGAxZKugSyB6oxA8xBRKKJQHBoyKUaU1BAHYS56rCnapDQVOldCLbw
         7ZTYHXypmeAgzaq+Ak4dg07s1OH6dgaxbLXiJlZ2wIcehmDKhjW4flhG+AU66wKGHLZ1
         oMZe90y1H1sVqsrtznx4vMeo9wlxCd11KiQyI0GAFNzMiDjbv5twK1z/4SOc0n67VqOe
         1JSMcVhURskDWpnUZuDYZCCz1PKpurd5FoQJBH7/vrL8Kluf6W72ZLjDNIZWbWkwrLF3
         /D8Vfsf7hRc5U3NwnHXJrJfxkG2gXPziy9vHYZaA0O8pbJlh4qywBbJr7p8+u3aLfD93
         BgGA==
X-Gm-Message-State: ACrzQf3FsEiZ6UOMrsgoyM2ilsxbuiJDfLToPa/KsNFYUPgV3bvPWX7X
	5u0hYt4dtKj7v4BhCBCH9+jbIwRS8V/N0g==
X-Google-Smtp-Source: AMsMyM5ppkFWKFY0q7coi2ylM45dStSfuK7WNLNglTVeYJNwKlA0P10H0k8wQBoC6MA5O/rI6AMKvg==
X-Received: by 2002:a05:6512:400d:b0:499:d9e:e04c with SMTP id br13-20020a056512400d00b004990d9ee04cmr7127207lfb.400.1663657607344;
        Tue, 20 Sep 2022 00:06:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v11-20020a2e9f4b000000b00261eb75fa5dsm113836ljk.41.2022.09.20.00.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 00:06:46 -0700 (PDT)
Message-ID: <1b03d24e-7bd3-f912-b59b-f2199770e9d8@linaro.org>
Date: Tue, 20 Sep 2022 09:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ARM: dts: aspeed: greatlakes: Add Facebook greatlakes
 (AST2600) BMC
Content-Language: en-US
To: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
List-Id: <soc.lore.kernel.org>
Cc: patrick@stwcx.xyz, garnermic@fb.com, Delphine_Chiu@Wiwynn.com,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
References: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920023042.19244-1-Bonnie_Lo@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/09/2022 04:30, Bonnie Lo wrote:
> From: Bonnie Lo <Bonnie_Lo@wiwynn.com>
> 
> Add linux device tree entry related to
> greatlakes specific devices connected to BMC SoC.
> 
> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>

Do not ignore comments, but either implement them or keep discussion
going. If something is not clear, feel free to ask for clarifications.

Since there are no changes and you resubmit the same patch - NAK.

(...)

> 
> WIWYNN PROPRIETARY
> This email (and any attachments) contains proprietary or confidential information and is for the sole use of its intended recipient. Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited. If you are not the intended recipient, please notify the sender and delete this email immediately.

This means we have to remove the email because I was not authorized to
copy/distribute it.

Best regards,
Krzysztof

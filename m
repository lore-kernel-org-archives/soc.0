Return-Path: <SRS0=f61G=EQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC00C83F32
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 12:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1726DC433CA; Thu, 31 Aug 2023 12:38:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14D93C433C8
	for <soc@kernel.org>; Thu, 31 Aug 2023 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14D93C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99bed101b70so83680466b.3
        for <soc@kernel.org>; Thu, 31 Aug 2023 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693485484; x=1694090284; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi/kPn02IZFct2zYJEPtTAuOz/cjkMO9segcjaWjsPU=;
        b=wFdO9aTn2VFN1t2LU87cY5syr+JwVoWI46CBF2LyQBWCf0JBNEEOc6VIu1A1E/but6
         kVrhoRNbfoumZ47Moy2AjH5XVZR89PU2OpHccTff72n6XtbrMwmm8qEVbdrxSOlV/kRd
         Qev6X3xcfO8UmDsnIM3p0V99q389kI4ZZZmQxNW/HL4kL6lzVAOU6qxjiVU8nbV0QM+5
         6vP1TrIR7er81x123LpHl6t06etVcJ7bqxW/rQne9JVUGY/X9AWvCRm2bHpTpVicCwoI
         KRB7ZC5/yxhTLROY2prCuqcgyUw2DiXTbg2bOucbqG1BzlXiT3w1WldffMWFeU2grizT
         Z/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693485484; x=1694090284;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oi/kPn02IZFct2zYJEPtTAuOz/cjkMO9segcjaWjsPU=;
        b=I3mgXcm2vytL20+5T9DQ4UVl2DnWZ350Vg+3SWu6vSfZbgT2aNkQ8O5vRKh81PHyBj
         8sbwlA2//aWeJIhRUk57Pm7PRk5LK67sUmoIoJS6sE/XL55+7LpnUdxxOwH+ykZSFsdk
         OyikkDUBltjuvLQ24YHV+Hj+/MIU5z2AXqaYVmufuTxqrIFQr7nYLIzYMfspwBePBw08
         7362fjJyJUWUcBUqEdMPMWuFj7Xvblmcu9MYy4iGBhp0UrI90FKwl0qk4uacq+kgY6hV
         CpCfc2X0CEEqCVMne1TYByW85lKizGfIxyCCDTLqcW2wkZbMsTd/AZ030mqI3GXNPhiQ
         qiqQ==
X-Gm-Message-State: AOJu0YwlEw54keRMI/TjG6vzNaw2zc78RXHJ9vrGIQbD/9XMWqsYughD
	KMuDqF0rB5y0jEC9UUuK6ZIRUw==
X-Google-Smtp-Source: AGHT+IG66AMgUP5PIYRzzikgOWnqFE+4vnEiMaeZV40mxCPYbDRmK8oHkefsRLF75BkzCPNNJnRbmw==
X-Received: by 2002:a17:906:2d9:b0:9a1:d79a:4193 with SMTP id 25-20020a17090602d900b009a1d79a4193mr4105717ejk.23.1693485484212;
        Thu, 31 Aug 2023 05:38:04 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id p27-20020a17090635db00b009a168ab6ee2sm701844ejb.164.2023.08.31.05.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:38:03 -0700 (PDT)
Message-ID: <7b241edd-4775-afbc-e5a1-63f5ecfce331@linaro.org>
Date: Thu, 31 Aug 2023 14:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
 <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 10:28, Peter Yin wrote:
> Document the new compatibles used on Meta Minerva.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


Return-Path: <SRS0=/3lf=ER=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37207CA0FE2
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 03:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB03BC433CA; Fri,  1 Sep 2023 03:22:53 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD91AC433C8;
	Fri,  1 Sep 2023 03:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD91AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68becf931d0so1265842b3a.3;
        Thu, 31 Aug 2023 20:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693538572; x=1694143372; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBLPQzPIWAWSC+qsvJbFVdMdGKth1jrainH5lRp8kgI=;
        b=iHmSIBy2Tm5IzYYD/TuQGhDz09pUNk2BDMWDK30sgWcF4KBL5VylNokj1dKZyeL1Kn
         MjvsqhBXmQ4uCzK0fHj7RDcXi6GD2MIyjtPLt2J8NxG5V+f7OYjNLmcCJP+T2rhn7cD6
         P0AE9Eunoeu1TgUfcxxmnPN0q+6I8HbPAMmbQ6g0mBJhHm8Aq28Q97dMuNtz1cpIrwfb
         x/OAEdSy00eLMGJJmySYSmLklr0h9WND8BPm66yeNL62LughHKZYq0nhFOFf26EwuFJ2
         /ianVihkaNTF3XNgrchwhkqgIkCwceZk7azMLG5w8HbkppnybmYcv3VBu6pVXGCvw1QV
         2IxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693538572; x=1694143372;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBLPQzPIWAWSC+qsvJbFVdMdGKth1jrainH5lRp8kgI=;
        b=bsiwkXq/H+0xGyQEx9I+Ppts6SNlm+av/0c0KOI5SodmnmpoToArlIAY47OK4pgpXg
         Oqg8dBOzYZQkfzZrTR5pvN+zC4Eg/NQsdVGXFgjW855wedfcJI3nn5+AmUCWbif2wxY0
         ctIi6UcvUX1YqIZbt1znmVcCmTs7KwGHceNzEsVxeGSG5LR4AWBRBFNnyT90EA6vgPXd
         xQMfwBSgW4kKtuAroLMb2MxkKWs1GJ4C8DXg+JQSUcNszm6alqOCopBP9AFi5wjjnXfy
         +GRfTiS7ZS3UZA0wBtdhoROkAzfiaDgoGzQ/SVvf/A/Tku+h5KusI0rPZ6xpv+OSNzba
         2S3w==
X-Gm-Message-State: AOJu0YwlVVRqpNK65x3U2U4ZmWZJIzTyNfpx1Lif8s1mF06pkil5S+c4
	EO49xYWlF36Zppn/pF3TdrI=
X-Google-Smtp-Source: AGHT+IF5ywUa7Qg+xJbjyDPhgXCzWKPknLqcwuD2RE4g0BKWwqAHqS2Q0t52zJrFjKRYQwdObFdUrw==
X-Received: by 2002:a05:6a20:6710:b0:14d:5580:8ff0 with SMTP id q16-20020a056a20671000b0014d55808ff0mr1193033pzh.25.1693538572050;
        Thu, 31 Aug 2023 20:22:52 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902fe8200b001bdf45eb5b6sm1908358plm.284.2023.08.31.20.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 20:22:51 -0700 (PDT)
Message-ID: <ffe1aff7-5216-ce3c-d57a-1163731d1158@gmail.com>
Date: Fri, 1 Sep 2023 11:20:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Minerva board
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20230831082819.4000425-1-peteryin.openbmc@gmail.com>
 <20230831082819.4000425-3-peteryin.openbmc@gmail.com>
 <7b241edd-4775-afbc-e5a1-63f5ecfce331@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <7b241edd-4775-afbc-e5a1-63f5ecfce331@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/23 20:38, Krzysztof Kozlowski wrote:
> On 31/08/2023 10:28, Peter Yin wrote:
>> Document the new compatibles used on Meta Minerva.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
>
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state why and what changed.

Thank you for kindly providing me with the information. It has been helpful.


> Best regards,
> Krzysztof
>

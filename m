Return-Path: <SRS0=Fita=VL=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC95AC433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 15:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABB4CC385B1; Tue,  3 May 2022 15:57:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D63DC385A4
	for <soc@kernel.org>; Tue,  3 May 2022 15:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D63DC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id y21so20386401edo.2
        for <soc@kernel.org>; Tue, 03 May 2022 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D+3ayXGiIWunG5xftXtSVJKt5SyAcJy2+fwwapTKiuY=;
        b=r5n8OtbrS3K9irtBKE+b++XUYBykqYPbxxjb16ReRhJbBOoiJG15shu5v90AGUTXNB
         Zgja5/5KVmxkqpIDW8QBQcPdjKo2qiy7ztbJSbMWWU0Qegxdi53Q2PjiNtGQxyQH+YQK
         qajUFNtnae9QpldA1oUuOAM8BZbjb/3nttvp6/R5W/6pZv4Wy1KbX5DCrouoUe1GkU0i
         iO83KG6mUY5Ho1WB/DBL2xrrha0HXRiwXBciFlhkQPuRf8xwB2VZRGPb7td/FHdSpQ8a
         d3kvyBWMdyuMPAb3dqHzCPfCC9o9ZMbH+ohFE4hSbcbR1NlZVI/KBIq0dD308+VXDIua
         fDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D+3ayXGiIWunG5xftXtSVJKt5SyAcJy2+fwwapTKiuY=;
        b=Clq9ATZNyFsK1ytJGh1ap2VV2BjF/rtlXlBSYTrh6VqvvCBkIoAgCu32LCAR3OSRvc
         NxUzMSc3IVR78bubZgBWybG6kU/bUnFWUsJMo5N94g7eqzcZyVSTFgkdIc66CQaK2+gn
         HEHAwSR9ocmcVRRadlXDbhLYp4zNXoJWtYbfZK9tQSl6+OEdTPQqQQclgnVjqRpwkBtP
         hZ1jKrRx5mN8K1cUoL2UsjG+gISvQR9UqzJAvVH7x+4NfFE86pcUuq8bAQW+PxJy7sn4
         wvMDbx34e1n86rgc7J2jo6534770mxU5qVQlhZ83rIEhIZLK/GBMy2ZsKceVm0AX0oJw
         2znw==
X-Gm-Message-State: AOAM531ETCafwRmNDV3SS9eWWt8NhdqiQCMguxo/ZvDIFLUIo4AMBTxE
	xb4je/Iql6XP4VHCu9HEvRMXWg==
X-Google-Smtp-Source: ABdhPJxKrhXYiytBuBL2uMw9/17lCFEgVDX5YAwj0edRfiBrkDBcoqsP3eMgwqKrnOsYZ/vZMCTb8Q==
X-Received: by 2002:a05:6402:1770:b0:425:b2b5:6248 with SMTP id da16-20020a056402177000b00425b2b56248mr18454740edb.281.1651593475606;
        Tue, 03 May 2022 08:57:55 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz1-20020a17090775e100b006f3ef214e27sm4814174ejc.141.2022.05.03.08.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 08:57:54 -0700 (PDT)
Message-ID: <0df2fd83-951c-d253-6494-3b70f5762aae@linaro.org>
Date: Tue, 3 May 2022 17:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 2/2] arm: hisi: enable Hi3521a soc
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
 devicetree@vger.kernel.org, gengdongjiu@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux@armlinux.org.uk, michael@walle.cc,
 miquel.raynal@bootlin.com, mturquette@baylibre.com, novikov@ispras.ru,
 olof@lixom.net, p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
 robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
 sumit.semwal@linaro.org, tudor.ambarus@microchip.com, vigneshr@ti.com,
 xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-3-hanetzer@startmail.com>
 <4cda3645-c4e8-1b3c-bd80-891afd56449a@linaro.org>
 <20220503134459.pplgvhcckja4ivcg@proprietary-killer>
 <75a48dfa-6fc9-aed9-b00e-d928bd9f33af@linaro.org>
 <20220503155141.ekbysx6fjom5el2h@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503155141.ekbysx6fjom5el2h@proprietary-killer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2022 17:51, Marty E. Plummer wrote:
>>>> A bit weird interrupts... the same?
>>>>
>>> Yes, though I am aware that some sp804 timers do have a separate
>>> interrupts per pair.
>>
>> They have also separate interrupts, one combined interrupt or one sole
>> interrupt. However what you described here is one interrupt line
>> physically connected to two separate pins on the device yet still not
>> being somehow shared (shared as "combined interrupt"). I don't think it
>> is your case...
>>
> Unsure. datasheet just says '33 | Timer0/Timer1'. I don't think these
> timers are attached to pins, however.

So it looks like a combined interrupt, doesn't it?


Best regards,
Krzysztof

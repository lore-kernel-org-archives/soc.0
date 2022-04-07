Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D00C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 20:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 847A3C385A8; Thu,  7 Apr 2022 20:39:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6EAAC385A0
	for <soc@kernel.org>; Thu,  7 Apr 2022 20:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6EAAC385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id d3so9566469wrb.7
        for <soc@kernel.org>; Thu, 07 Apr 2022 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fqtKr787N6Vy1cwaYaYZc9PI8pUmju7Cz4kLVR3rNO0=;
        b=xd/uN/+Wfa0+DJziXe7CM988LNaoE/LluwkoUHTwQ9+zH3ooZE1UWwe7s2BIb3c1My
         +esS9mC72qFXdlzWLyQnaolMh3gfwuzHDc4OALOUZAkHKljGW/17t6SY2BefhYkzmR9j
         s5w/ym9EyM1G11gyyb8n0f1speuoHsrdCRrMjd4uydyz+uNmsUAz2Bv2uvCsmDDbUTht
         CMAS2VmtJcNiWBQiF3YDbR+DbtTez2CXIt3x89DCv1ZWbq5FeH4kLl8vdIT0pt/NjK/4
         BvErXNsFnFwcldyNvMR5l37DqHw/QXSkKDJ/R0HYkjnkdQD1vH1yozKEsvj1CUz6ui5/
         zp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fqtKr787N6Vy1cwaYaYZc9PI8pUmju7Cz4kLVR3rNO0=;
        b=wLocABzT8gZJPFBN4zoltL6IHbkG2wHPUGl27gqLJaHBhH2VtrGdJxhqRrUqxkQUUV
         EbQ01gYtH3GSkyN2u3WD2Lq14Nk5xRciFKOVoyS2ismH9846DSLgQkBsvsgaHvrfXrQv
         i1DemeBPI654eaKzYc6WJoCacfQXV3ynXxk2ElLG5CPRZtJLYVh6ALLTwNWtELBNI610
         LqEr82HWl0286YOWjdtRWhljbimTYvzvbdKqgwwErL0g0dgrcEG+U3/bZNl3YX28SEAb
         nhSMAz6RtWHPIKry28NHM3UPOutboOGISlpOfOhou/Pb6a8eUx/1xrBuHvrMogPNupcM
         6GFw==
X-Gm-Message-State: AOAM533yxGCo/l4pZyEW5G2lQ5NZ2K68dHP1FHz8wd40uspMABI0GK2M
	3vDYhJgdG7Ety54NzPtsi3JL2g==
X-Google-Smtp-Source: ABdhPJzFnUZMpklEvBXqWfIprKr3SeUKOVHJYtNHafYjioDtHTrl0Yu/4IrS7rpVQtAYsGOUPaDGmQ==
X-Received: by 2002:a05:600c:28cd:b0:38e:72c5:5259 with SMTP id h13-20020a05600c28cd00b0038e72c55259mr13665875wmd.176.1649363951008;
        Thu, 07 Apr 2022 13:39:11 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bcc0b000000b0037e0c362b6dsm8584615wmh.31.2022.04.07.13.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 13:39:10 -0700 (PDT)
Message-ID: <8fa6212c-a914-dcc4-c852-32a3948db99f@linaro.org>
Date: Thu, 7 Apr 2022 22:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: synaptics: add DT for AS370-RDK
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Rob Herring <robh@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>
References: <20210820173108.01d5c6de@xhacker.debian>
 <29e96ece-8541-a7a2-c6a9-453be6644eed@canonical.com>
 <20210820182708.51d13e29@xhacker.debian>
 <CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a2vkZVt1bb7-iDGaSHp20U9d8QXu6AcrUMceJSS9Q_-4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/08/2021 21:55, Arnd Bergmann wrote:
> On Fri, Aug 20, 2021 at 12:27 PM Jisheng Zhang
> <Jisheng.Zhang@synaptics.com> wrote:
>> On Fri, 20 Aug 2021 11:59:30 +0200 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>> On 20/08/2021 11:31, Jisheng Zhang wrote:
>>>
>>> There is no such binding. You need to update the bindings file (first
>>> patch in the series).
>>
>> This is my plan ;) In fact, "berlin4ct" related binding is also missing.
>> I want to convert Documentation/devicetree/bindings/arm/syna.txt
>> to yaml, then add missing bindings. But it's too late for 5.15,
>>
>> If it's fine to keep as370.dtsi without board user(s), we can drop
>> this patch. I will solve this issue in next development window.
> 
> Yes, doing it for the next cycle is ok.

Hi Arnd and Jisheng,

This patch was discussed in Aug 2021 and since then there was no resend.
I assume that AD370 will not get a board, so I propose to pick up my
removal patch:
https://lore.kernel.org/all/YRbDNInfG7caSr2r@robh.at.kernel.org/

I will resend it.

Best regards,
Krzysztof

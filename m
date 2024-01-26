Return-Path: <SRS0=MYJy=JE=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FCC47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 17:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 606F7C433B1; Fri, 26 Jan 2024 17:37:26 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 862C4C433F1;
	Fri, 26 Jan 2024 17:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 862C4C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-361ae51a4c6so918625ab.1;
        Fri, 26 Jan 2024 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706290644; x=1706895444; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1Ro8eImqKyMDojfhK7NZjLZ366TdUdIdjC84QGYHXw=;
        b=nfs/wMXWZgVVIqCalUMbvGKHpkKO8ebndRu9K9MnYvYxgzz8U39cz4ML+YYAGICBXe
         pKMtsimMj2UgRB2CoWgXPmblrxYLMWG9rZ9TKQoXrlkU+W0WnFgdj/9ZXn69V4i8ajqs
         HdHoG+qTX6/bSYU9DCZVuj/tLN8DWTli/6adPtEDqYBC/FKjOJ77BQ04pRYEviE8QBPH
         Y6aPA2W/Ki/10N4KNMtqDGE+yJ8xEg2tUvhgL5o+fpOoQGNJPdeVQprMi3bE63JsS5Qz
         /I/SBGVPcSIiAkgDLsUUKGB1vN5o+LkEYnCjsACZkV06w6OQd8vLuovxN5RJyHzEtLzq
         OsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706290644; x=1706895444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Ro8eImqKyMDojfhK7NZjLZ366TdUdIdjC84QGYHXw=;
        b=byemFs11pqLJXL9Quzwx0L3ml1z2XpaT8Hslw6p3cF5IqMUrSXDZCaKhwgEXROdbQC
         H5TAy8K6hA+MJJeB1u77pvJu12SsTdLzaKw2VyDVUlf9o7KxDcAWvuZ0k5z1p80v5adA
         nJlNQ53quLVbnRnR8sLFy/H8vzHgXrnC5WWc5Wr0wYogeZQVsIZIr5fBJ+Lb87j99RnN
         rrxom+y3+jeBB7VVsMuIjm1GfoGcP8lKCINrbIu6nzukghzQgcfTpaoHcRu+9/biQvvq
         x28zgNbw+5NV1R9BP3pn8H54r4Fb4sQ5ZcY+2qBA5JUG+etgNXY6LndlDc+8VynRDgGf
         9GqA==
X-Gm-Message-State: AOJu0Yyifbvdr00itnRqOOmsaUs6tQme2Wz2ceCOSSJVoUR8PuuP04l0
	402HtsUZ+QHbWRMPHFc/9nidORJ5F7ZbbzljP/sP+LaXhNCKd5TZ
X-Google-Smtp-Source: AGHT+IGgnPpbE6+6FCdji/hySmEE6M5oeUKpZVzvGVc+JesyKmnNvIpD53mtNhXUGLbhbaehbOLgVg==
X-Received: by 2002:a05:6e02:1b8a:b0:35f:b42a:6f2 with SMTP id h10-20020a056e021b8a00b0035fb42a06f2mr125523ili.17.1706290644451;
        Fri, 26 Jan 2024 09:37:24 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id v8-20020a056e020f8800b0035fedce3160sm403331ilo.33.2024.01.26.09.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 09:37:22 -0800 (PST)
Message-ID: <b9f827f9-e2e7-43ff-acd5-09a54f7ed4c4@gmail.com>
Date: Fri, 26 Jan 2024 18:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: airoha: fix pcie ranges properties
Content-Language: en-US, ca-ES, es-ES
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 devicetree@vger.kernel.org, John Crispin <john@phrozen.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <95e2d79c1c36663cfffce5a20c95f8201670bbec.1704468417.git.lorenzo@kernel.org>
 <CAJ0CqmW2AoXa8XxKzXOtBd3VfnOUjRYwjhj0KXg4mgKKHZ1gQw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <CAJ0CqmW2AoXa8XxKzXOtBd3VfnOUjRYwjhj0KXg4mgKKHZ1gQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/01/2024 17:35, Lorenzo Bianconi wrote:
>>
>> Reduce and split pcie controller memory ranges for en7523 SoC
>> in order to properly load a pcie card on the second port.
>>
>> Fixes: 08a4aeb2c23f ("ARM: dts: Add PCIe support for Airoha EN7523")
>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Applied to v6.8-next/fixes

Thanks

>> ---
>>   arch/arm/boot/dts/airoha/en7523.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
>> index b523a868c4ad..bb78d54e94f6 100644
>> --- a/arch/arm/boot/dts/airoha/en7523.dtsi
>> +++ b/arch/arm/boot/dts/airoha/en7523.dtsi
>> @@ -159,7 +159,7 @@ pcie0: pcie@1fa91000 {
>>                  clocks = <&scu EN7523_CLK_PCIE>;
>>                  clock-names = "sys_ck0";
>>                  bus-range = <0x00 0xff>;
>> -               ranges = <0x82000000 0 0x20000000  0x20000000  0 0x8000000>;
>> +               ranges = <0x82000000 0 0x20000000 0x20000000 0 0x2000000>;
>>                  status = "disabled";
>>
>>                  #interrupt-cells = <1>;
>> @@ -188,7 +188,7 @@ pcie1: pcie@1fa92000 {
>>                  clocks = <&scu EN7523_CLK_PCIE>;
>>                  clock-names = "sys_ck1";
>>                  bus-range = <0x00 0xff>;
>> -               ranges = <0x82000000 0 0x28000000  0x28000000  0 0x8000000>;
>> +               ranges = <0x82000000 0 0x22000000 0x22000000 0 0x2000000>;
>>                  status = "disabled";
>>
>>                  #interrupt-cells = <1>;
>> --
>> 2.43.0
>>
> 
> Hi Matthias,
> 
> Since you applied the original patch from Felix, I am wondering if
> this fix is expected to go through your tree or applied directly by
> Arnd.
> 
> Regards,
> Lorenzo
> 

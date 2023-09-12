Return-Path: <SRS0=or3r=E4=baylibre.com=amergnat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD37ECA0ECA
	for <soc@archiver.kernel.org>; Tue, 12 Sep 2023 13:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FA61C433CA; Tue, 12 Sep 2023 13:10:22 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12AADC433C9
	for <soc@kernel.org>; Tue, 12 Sep 2023 13:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12AADC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so6781863a12.0
        for <soc@kernel.org>; Tue, 12 Sep 2023 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694524218; x=1695129018; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkg4dOxircu0CypR4iVJaC4UA5MgleI1a7GPOXfeFc0=;
        b=Ol99nArHK+H02ndiq7vS6ULa+uoPPPKx8kMGkpRrEdU2sKBsAfLcBIOEGXg2QZMLFT
         KGjcg6JvVh89GWVduSJQ9itjvmaWPvxzmQm9ShyIem3v8erxsU6fN0IYBjdmGAWQDMaA
         W8BkjsK2nOXrf1zHFdurffC1vRYhWF7p7XQOoPkLfwxameu9jxcDHK1xw0ChGzz0kXkQ
         z+Ve3Z+NwHtRW31gdoLE/U1b15OU8E0nPGhNLc8IIPO26c0Pp8ov+c/LKC3fRbMu+K0E
         SpjxrTkw7eMWMcQI3WFimqps65B7vMmq3G+8snt/0JhpE5iinQUS6D4hvAqKB35/cpI4
         ABkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694524218; x=1695129018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkg4dOxircu0CypR4iVJaC4UA5MgleI1a7GPOXfeFc0=;
        b=mrGwX36R3yefLSE0GMDF8TG3L86HTVv0NzZwCcNGeV18pjLYqw72QC6BAErJtEghBb
         JZkIc1ZoX9KYsBZGPisXTQtp/zAPgBi9k0w5j5oIJS2X09wdR53YYvKzQn+flJqCZtQ5
         meNKW2wg9Xb9BsGW4KOkfk9Omf35W6u+3mo9d5DtSE5OlSMovSpXYRwDmVxiWDXw3cJG
         LJ96D8SPa/9qmVQ4KLOMBl5mNwnY9hMz37+y+RcWV9WOuTmuTV4x68gc+TQd8aJ6ItHz
         r20m+L7UzWiiEpyE6RK2leqIW4UcSod7V+lx9DZFWzHG1/L1ZUlLOKXoztC++vkxfzDl
         z0BA==
X-Gm-Message-State: AOJu0YwjcQnuF3WN4aObQB/1QfFMhOxPL1zygB3vBdsuIm0JKGoO5KzX
	O9e0GL4xKwtOQwO6ZJY9ybz8iucznMyT5u4X/OE=
X-Google-Smtp-Source: AGHT+IF9FtG/P/CA2bdUyaN9tNAyaXDTWKcSZgO8Knq6251cqFC3kMveGTT42yqBJk4qwEUbkIX6tg==
X-Received: by 2002:a17:907:2cc9:b0:994:577:f9dd with SMTP id hg9-20020a1709072cc900b009940577f9ddmr9981438ejc.9.1694524218002;
        Tue, 12 Sep 2023 06:10:18 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id v14-20020a170906338e00b00992b1c93279sm6758341eja.110.2023.09.12.06.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 06:10:17 -0700 (PDT)
Message-ID: <4c99c180-3b79-6aef-6ff2-d430e575957d@baylibre.com>
Date: Tue, 12 Sep 2023 15:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH] arm64: dts: mediatek: Fix "status" values
List-Id: <soc.lore.kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, soc@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20230804225813.12493-1-robh@kernel.org>
 <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <f8759d51-f808-8082-ceaf-6c6dcaebe2d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/09/2023 14:54, AngeloGioacchino Del Regno wrote:
> Il 05/08/23 00:58, Rob Herring ha scritto:
>> The defined value for "status" is "disabled", not "disable".
>>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> Arnd, Please take this directly I guess. I think Mediatek maintainership
>> needs some help. Maybe AngeloGioacchino should be co-maintainer as
>> that's the only response I seem to be getting.
> 
> Sorry but I've seen this message just now as I've been on holiday in 
> August.
> 
> Thing is, the MediaTek scene is starting to see more and more code, 
> bringing
> an obvious increase in the amount of reviews to be done and in the required
> efforts to maintain the MTK bits - and we will possibly (hopefully) see 
> even
> more of that.
> 
> If Matthias needs/wants a co-maintainer for MediaTek I'm here and I will be
> proud to become one.
> 
> Cheers,
> Angelo
> 

I started reviewing MediaTek patches for some months now, so I'm still 
new. From my PoV, I'm agree with Angelo when he say the amount of patch 
is increasing. I support Angelo if he wants to become a co-maintainer 
and continue to do my best to review patches. ;)

>>
>> I think for future .dts patches I will not bother splitting them up by
>> sub-arch because it's a pain to chase down the maintainers to apply
>> stuff in a timely manner. /rant
>>
>>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts 
>> b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
>> index e4605d23fdc8..86cedb0bf1a9 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
>> @@ -585,11 +585,11 @@ &pwrap {
>>   };
>>   &sata {
>> -    status = "disable";
>> +    status = "disabled";
>>   };
>>   &sata_phy {
>> -    status = "disable";
>> +    status = "disabled";
>>   };
>>   &spi0 {
> 
> 

-- 
Regards,
Alexandre

Return-Path: <SRS0=cKhR=56=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBA4C05027
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 11:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F098C4339B; Thu,  2 Feb 2023 11:52:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 428D7C433EF;
	Thu,  2 Feb 2023 11:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 428D7C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id h16so1435537wrz.12;
        Thu, 02 Feb 2023 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0y8ikm0/uriJSrqR7napvMGotKjya5U7k4Py4klJVM=;
        b=k4Y1r2IHPtKLh0AA9EYiXCpQj9K9hbGt2ZIfW8wYGCDjCxQn+BKftGq1bCqmuT/l1i
         Uo8LpaGBMm9FVzMCcxVGikiThovS85InR6NaYjQPn+xo6s86o8KAMSCR+ujIVX3r5Udp
         mjSjJro1leJAitZa+LK+5uQwIS9HTIEGoi3IL6L7KtdTUZYEvTlZLZGso16mQgbGgPPs
         sPcuOBZ2EiBGoGr3CvHA1mEjOxXemEpWcvQ9inm1ToDUDVcVD9Kh+RDOEklW/bOSn00N
         fcHb6WaTpKTR9hrcsUE2DxL+CbvrhPcxaFbr62e9vkz3c3lPicBSwDfNZTRgoOJM7kAM
         oz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0y8ikm0/uriJSrqR7napvMGotKjya5U7k4Py4klJVM=;
        b=AFseXdH14A2qNCHSK72tEjjAZwB1wH4q5VKDNdaQySqLGYzMHQz/SraMKfdzAFyqz9
         chM8WUBsnTzrjv1C+8KGBEzgWomp8Yy0MVS1n8SxkzSJSUMkLQbWKMFM0A1887fkkEZO
         5jH3XGCLM5ag7zOyNDZO2a3L2ehrB5N78C4hZPXWhDfwWXSSPnorlo8qRzJfDgORPAQa
         sanspv2R7NRjnxa8tfxFrhuwc8Ojtyq3l67VeUVR7QvMfnmmBIoFh9YlCBIJ3wg3Z5pU
         jTvjDoucdIx7GKxABVdjByvk13iH3mopC88mHbsmLEf/Vbhl6v8RjjWkN+iGnHAzOEui
         EkEw==
X-Gm-Message-State: AO0yUKWXUDldifbhyCjN6cnvzlan+eg1G8SUhn4isUTokfQVZxo8vggi
	8KpfF+JuyBCdAUTa8rUfkSY=
X-Google-Smtp-Source: AK7set9kleGI9cl0RhP3cDudtg26Ip2ps3NNEmSBY5Glzqw4jyllNyvlkx+BwH5dsmHf735GgWGxQw==
X-Received: by 2002:a05:6000:789:b0:2bf:cb91:a40a with SMTP id bu9-20020a056000078900b002bfcb91a40amr5828501wrb.46.1675338747445;
        Thu, 02 Feb 2023 03:52:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i14-20020a0560001ace00b002c3be49ef94sm2151632wry.52.2023.02.02.03.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:52:26 -0800 (PST)
Message-ID: <4f6f8801-9101-482e-6f3f-bc011df42259@gmail.com>
Date: Thu, 2 Feb 2023 12:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix vdosys* compatible
 strings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 soc@kernel.org
References: <20230202104014.2931517-1-wenst@chromium.org>
 <4b5bb022-eb5d-2ed1-2123-eb9e502299dc@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <4b5bb022-eb5d-2ed1-2123-eb9e502299dc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/02/2023 12:42, AngeloGioacchino Del Regno wrote:
> Il 02/02/23 11:40, Chen-Yu Tsai ha scritto:
>> When vdosys1 was initially added, it was incorrectly assumed to be
>> compatible with vdosys0, and thus both had the same mt8195-mmsys
>> compatible attached.
>>
>> This has since been corrected in commit b237efd47df7 ("dt-bindings:
>> arm: mediatek: mmsys: change compatible for MT8195") and commit
>> 82219cfbef18 ("dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible
>> for MT8195"). The device tree needs to be fixed as well, otherwise
>> the vdosys1 block fails to work, and causes its dependent power domain
>> controller to not work either.
>>
>> Change the compatible string of vdosys1 to "mediatek,mt8195-vdosys1".
>> While at it, also add the new "mediatek,mt8195-vdosys0" compatible to
>> vdosys0.
>>
>> Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Arnd, Olof, will you take it directly or shall I provide a pull request once 
-rc1 is out?

Regards,
Matthias

>> ---
>>
>> Since we are at -rc6 and Matthias already sent out pull requests, I've
>> CC-ed soc@ so that this may be picked up directly on top of them. This
>> should be merged for -next.
>>
>> Thanks
>>
> 

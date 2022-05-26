Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9249C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 21:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F879C34119; Thu, 26 May 2022 21:10:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BE31C34116
	for <soc@kernel.org>; Thu, 26 May 2022 21:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BE31C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id y13so5290440eje.2
        for <soc@kernel.org>; Thu, 26 May 2022 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n5ISJ9yLZ548Mz4jCd/68AcqRvOzgjUn9wXGD+ASjI4=;
        b=lZVmHfF6LYBzFMaqjGMVB2ZPV+hPOKUic6CjH+XhRrRzKSyO43nCBJPvX05Nyk6k4Z
         OdiUk/r7NaOsPqwT9VJG3jgoNjCBThtKaCQuyOkBv8Vi7eqN0eoTgN9ncK6bkGZcKeyC
         bsoL/H3dLQIWCQfPyEHsnzG4UGGThjGdhCyn9djsqxIL8GWoLBr5U+0C9TU5YJvtn2XJ
         niDhVthqOEERTZoQjUTgCkyEYs2WmQ8uU8pSswjn9UeW6Xd7qvg567LHcltuktw5tImZ
         798/3PEQm5cQFgmBuj4ndBuBAp8jRAjdcvNVCUmzJiRqnvefQy1rm3HsUyR8/7BdpDhv
         oKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n5ISJ9yLZ548Mz4jCd/68AcqRvOzgjUn9wXGD+ASjI4=;
        b=gVZJrvzOz17xo1ScdjLr0C/MKCkN+jEMnKVk7p7Rze2of9Zb6XF8rjzsOQWf5EfISw
         xHWaKm9M9gQCg8AYJHWDj6Qt1UnBTtNMTy8I+TEUXotx5ZHGLxFUnZqUQT4NqFKIJivE
         Wn4XUgkcGx7eEtu7AjDe5AWteSnx74YjFIhBVF3/LV6RIGDtMooE7MVlkrDFC+y1WMO2
         i/jCJdWtWmxw0lVhQrD9RuJeWjjsvCVQtaVpD+nI1PVPiuelHnJCQbPcLIVgYF0FmbS7
         GqDKgiJMu9HSYb9lR8npDirQYj4GR3FM6E+iqPber/Zt6ly20V/psJ2Z3wUTjE6Y+q8x
         F9Rg==
X-Gm-Message-State: AOAM531KzM9gMjvfvCYAjN2Qh+eLhPoNtrXEdUZ7PCsKMkOvYhMCNMxP
	YkwkCGKdiVnyOfWI3K5W+3mdnA==
X-Google-Smtp-Source: ABdhPJzH2AYsc87sKJTEJvKhEp90igqSe7vZ4SuRlgUhjJrY2/j5+u/fAOVedF+0min99G5EjJX2IA==
X-Received: by 2002:a17:906:6985:b0:6fe:988b:d248 with SMTP id i5-20020a170906698500b006fe988bd248mr34031598ejr.226.1653599443354;
        Thu, 26 May 2022 14:10:43 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s23-20020a1709064d9700b006fe8b3d8cb6sm851155eju.62.2022.05.26.14.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 14:10:42 -0700 (PDT)
Message-ID: <9ad3b26e-5d71-72f4-1a16-9ab3164141de@linaro.org>
Date: Thu, 26 May 2022 23:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm64: dts: renesas: adjust whitespace around '='
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220526204231.832090-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdWvfbbB3578aFAx6twdKNCkB1T-Uihf3OzGLHmcZG047g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdWvfbbB3578aFAx6twdKNCkB1T-Uihf3OzGLHmcZG047g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2022 23:05, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, May 26, 2022 at 10:42 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> Fix whitespace coding style: use single space instead of tabs or
>> multiple spaces around '=' sign in property assignment.  No functional
>> changes (same DTB).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
>> @@ -630,7 +630,7 @@ rsnd_for_ak4613: endpoint {
>>                                 bitclock-master = <&rsnd_for_ak4613>;
>>                                 frame-master = <&rsnd_for_ak4613>;
>>                                 playback = <&ssi3>, <&src5>, <&dvc0>;
>> -                               capture  = <&ssi4>, <&src6>, <&dvc1>;
>> +                               capture = <&ssi4>, <&src6>, <&dvc1>;
> 
> I think the idea was to align the playback and capture properties,
> for easier comparison.
> Hence I'm a bit undecided if this needs to be fixed or not...

yeah, but then one should align "frame-master" to "bitclock-master" and
several other properties.

> 
>>                         };
>>                 };
>>         };
> 
>> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> @@ -206,12 +206,12 @@ pcm3168a: audio-codec@44 {
>>                                 clocks = <&clksndsel>;
>>                                 clock-names = "scki";

like here ^^^ - clocks with clock-names...

>>
>> -                               VDD1-supply     = <&snd_3p3v>;
>> -                               VDD2-supply     = <&snd_3p3v>;
>> -                               VCCAD1-supply   = <&snd_vcc5v>;
>> -                               VCCAD2-supply   = <&snd_vcc5v>;
>> -                               VCCDA1-supply   = <&snd_vcc5v>;
>> -                               VCCDA2-supply   = <&snd_vcc5v>;
>> +                               VDD1-supply = <&snd_3p3v>;
>> +                               VDD2-supply = <&snd_3p3v>;
>> +                               VCCAD1-supply = <&snd_vcc5v>;
>> +                               VCCAD2-supply = <&snd_vcc5v>;
>> +                               VCCDA1-supply = <&snd_vcc5v>;
>> +                               VCCDA2-supply = <&snd_vcc5v>;
> 
> Same for the various supplies.

I don't think there is benefit to order few single entries, while entire
file does not follow that convention. It would be different for some
multiple-line entries, but that's not the case here.

Anyway that's only my opinion, so I am happy to trim the patch to the
last part (although then it is a bit churn :) ).

> 
>>
>>                                 ports {
>>                                         #address-cells = <1>;
>> @@ -438,7 +438,7 @@ rsnd_for_pcm3168a_capture: endpoint {
>>                                 bitclock-master;
>>                                 frame-master;
>>                                 dai-tdm-slot-num = <6>;
>> -                               capture  = <&ssi4>;
>> +                               capture = <&ssi4>;
> 
> Right, there's nothing to align here.



Best regards,
Krzysztof

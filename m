Return-Path: <SRS0=5k/X=WY=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E700AC43334
	for <soc@archiver.kernel.org>; Fri, 17 Jun 2022 10:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7AFBC385A2; Fri, 17 Jun 2022 10:41:31 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F34AEC3411B;
	Fri, 17 Jun 2022 10:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F34AEC3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id d14so5616631eda.12;
        Fri, 17 Jun 2022 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=hkp4uK11/4OrCEaz4XjJ83xXpjDH+S9v2Ae5rIMepB0=;
        b=IbJe/gK1k4fHKqOVKnPxE8nZTqSlRC79Yfe71BoqEPgwqA4lei8xO41woON7CzD3jo
         2U2gcLr3zjHGaPsCwuJeZUUs671h5K3x6RoqOi7jjpfEVh5zlcEy+Fr2WSN6NMXmRH2t
         GkV3OUxyd7JyF2fB/GawNHu3nhLnsOqzGJunDcCm26ikQZUo5XhCqdhCchzplyH1JTqB
         q0Jcmikt/70zFb14mBWo9xodn0RawKh3/TdzJIRzlqmHJumGwPLvJnBvMJsrjXQW7jGL
         bgwriH9nisl8rcT5K0ycBDvIyBOTEyKncSFsT3P4qkfk35OnFERacVtv3w+P0HnLZTa+
         z4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hkp4uK11/4OrCEaz4XjJ83xXpjDH+S9v2Ae5rIMepB0=;
        b=KVg4Zz1ozTieq2MTfNnnr2Lrfo5mgnsQSdoaoxMWqs1uZ1QcolP3pcDK6lla+f4Qqn
         ojwl3pE92dQssWIAnCzE0k0sApsNH6Ymy1dxppyxkrUM7HPXp/Tpwswo8QSfnFjrr87e
         A1+jT5hcNcrQ3z7hoFNEoyiyr/enTlWd9H2DRdeSmE9l/gMJo+z7+tZV9+ISqZAz9OhZ
         zZffDNzEYtKhKkg7HTTAOVEvQ1qVFxjLwWmH44zrRRV9ugRHZu+zu+z1RkRDnrEHfGRg
         /8GUfHtwaD1/1fWREqKJuOsEEXAHBzSM7X9dSw++u2w2vfTltM0qZWLA+vHP1XAcWo8e
         VHrA==
X-Gm-Message-State: AJIora9PWDJbX9EAfDb6XgRf9PUpEeWylAdXcV6OKNDyzNEqLneIfmI+
	Nwf+OZOILJ+XwSW0eoYbDcw=
X-Google-Smtp-Source: AGRyM1upqkFvOJmB/mMBOlwf8qUMZi3Mn3x6lcJ0th8pgh5jhc5LwNGxznaYkOW3GVsCG4Z5WAv9Fg==
X-Received: by 2002:a05:6402:2682:b0:42e:1c85:7ddc with SMTP id w2-20020a056402268200b0042e1c857ddcmr11367546edd.143.1655462489240;
        Fri, 17 Jun 2022 03:41:29 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id b14-20020a056402084e00b0043565c79879sm467500edz.43.2022.06.17.03.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:41:28 -0700 (PDT)
Message-ID: <fcc5f00b-0776-9511-845a-5eac5d4c7876@gmail.com>
Date: Fri, 17 Jun 2022 12:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 17/40] arm64: dts: mediatek: mt7622-rfb1: correct
 gpio-keys properties
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 

Is it me or doesn't the commit message match the actual commit? Change looks 
good, but message puzzles me.

Regards,
Matthias

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index c28da9323a9c..1a86857c9027 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -40,7 +40,6 @@ cpu@1 {
>   
>   	gpio-keys {
>   		compatible = "gpio-keys";
> -		poll-interval = <100>;
>   
>   		key-factory {
>   			label = "factory";

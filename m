Return-Path: <SRS0=9nHD=35=linaro.org=konrad.dybcio@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AEFC4321E
	for <soc@archiver.kernel.org>; Tue, 29 Nov 2022 13:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C4B5C433B5; Tue, 29 Nov 2022 13:27:55 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0E66C433D6
	for <soc@kernel.org>; Tue, 29 Nov 2022 13:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0E66C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id l8so16907288ljh.13
        for <soc@kernel.org>; Tue, 29 Nov 2022 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PmRFYGyYdbomgXkit0MMs8ehV3RXkJmrU7GDKsG78s=;
        b=VUePx4qvECkqnQ0YIPu5364NXyE5UqBSqSzHyJdxpjRT/vrHUlCm54QcDJBtx/YVR3
         TPlaILyOS1afeqagHfWuI7EmETi8QPkJOD9LAB7pvw79gc3xZrew1LpwrR5h8holNvYA
         Uj+57YCdiydcCu2NykaVXVfjBgPdCF94ZPVVF/O8ds6kLveaLWtz3OaD6KF14Qlxb5nz
         OA2JPDcYQ4vXkdVJf7gAOc1bXPE1WRTFLQ8zGdhEWTTzk6VFZTWf43T6B57SUwy/HWTK
         SDLzZYU5qfoSrk/NAqtgaCf+xuPsRfwP86R9boplNkEIuNLU7YpCe48Hb6GW1s4TL5be
         s0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PmRFYGyYdbomgXkit0MMs8ehV3RXkJmrU7GDKsG78s=;
        b=DUY5EeI0wyczAG36v4f0M205HAV7ff5J4op3Fdzj91b6+3CA5uZO/M+Hfffhf96Nas
         c3C+eLjE22MbCrvgFvr+lJME3Bb9Zmj8dAJC6y0uo/tycChGHjPbgGuWWY89OtRYn8SA
         MS7kLvsTs5+8oJrlpD5PPllVSA+GIDRtcaG0jg/NOdqfDo+M+k7ndjKGsCqYc+ZSt/J9
         GTETNSCheUT3nlBVljVVE1Xi5wNFS5rUDHyr18arxyXtOJQ/ThKy16hzlkTqSh1CNDN4
         ZvB6d2v7mzJdaVp8D+uTdxLwSu9DqxOeepwH9zmd3QDFmhDWqyqEG/kOAFKbYtHrxiSE
         0lhQ==
X-Gm-Message-State: ANoB5pm6c8hhdeGgu7PYblSB1eXt08UjxV6XI/MFjhSaT0zpLtCV6DCO
	376gUELYuvcHpNRD5W06x2oOUg==
X-Google-Smtp-Source: AA0mqf53oo4k2w1P+YWN2jUk9NjBP1cX2xWtpuyCVtH3Pd2T5tAsuNCppvtfwQqwEiNCI5xbcnLMhQ==
X-Received: by 2002:a05:651c:1a2a:b0:277:50d:b270 with SMTP id by42-20020a05651c1a2a00b00277050db270mr18675230ljb.135.1669728472042;
        Tue, 29 Nov 2022 05:27:52 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id e15-20020a05651236cf00b004b4bab7d5a9sm2218491lfs.46.2022.11.29.05.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:27:51 -0800 (PST)
Message-ID: <e2ad6aaa-5d1e-bad7-94f4-8092a07a5f2d@linaro.org>
Date: Tue, 29 Nov 2022 14:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and
 Pinctrl
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 linux-arm-msm@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de, agross@kernel.org, bhupesh.linux@gmail.com,
 linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 me@iskren.info, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.11.2022 21:08, Bhupesh Sharma wrote:
> Enable the Qualcomm SM6115 / SM4250 TLMM pinctrl and GCC clock drivers.
> They need to be builtin to ensure that the UART is allowed to probe
> before user space needs a console.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 03b61f846a0e..851e8f9be06d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -560,6 +560,7 @@ CONFIG_PINCTRL_SC7280=y
>  CONFIG_PINCTRL_SC8180X=y
>  CONFIG_PINCTRL_SC8280XP=y
>  CONFIG_PINCTRL_SDM845=y
> +CONFIG_PINCTRL_SM6115=y
>  CONFIG_PINCTRL_SM8150=y
>  CONFIG_PINCTRL_SM8250=y
>  CONFIG_PINCTRL_SM8350=y
> @@ -1106,6 +1107,7 @@ CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SM_DISPCC_8250=y
> +CONFIG_SM_GCC_6115=y
>  CONFIG_SM_GCC_8350=y
>  CONFIG_SM_GCC_8450=y
>  CONFIG_SM_GPUCC_8150=y

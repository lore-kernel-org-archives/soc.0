Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB101C43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 14:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93933C3411B; Thu,  9 Jun 2022 14:15:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B53D8C34115
	for <soc@kernel.org>; Thu,  9 Jun 2022 14:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B53D8C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id g25so1273046ejh.9
        for <soc@kernel.org>; Thu, 09 Jun 2022 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xMZyHB+w1HZyBtjYMs8VhyGH58NpWoIROf4SCsJgVWE=;
        b=IHfLfPqINk7QaemV+fnV7fo1ZYEA9/I2MgUtE2RiNbc6CjqAc2dVvhHP6lyYYroDa9
         Btg7oV8h6m2pfWzlCHGvCcDTcw7pxjsTyjpbIYw6dPKrpXJHHisL2zCA2yuGtrk7QCIp
         px21nXKdE0RpOq3V6GbPTBVyPpt4hkWmU9JLFuVFSGu4IK7SLMQpP248PfFxY+wx6KLE
         ZR0cMC6Lic7+BaBSEH6kXcnedohAd5llgl5UciHgNnTKDqeOZZTEPFbg6qmJDqxPguLg
         VzROxqS2E9P1v+lvmA5yA8oQTUewsPFedXXNZ15QsBxmGxQmreKxQs5MjO7ij0JiBfTg
         8ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xMZyHB+w1HZyBtjYMs8VhyGH58NpWoIROf4SCsJgVWE=;
        b=m/z4Em/J8qa71ck3cD3hIhPKlGOxbigi5hlxgk10mgGwuJ57rlFh4pYLNk48f9R72s
         MPiAWLrQ4YRxd2/UWWfvm2F5OQyVdU2L8tFQYRJFr8+KB6kl/n+tQWADArKy1pvROKGm
         noO4kR9ORA74+cMLEs3WD+tUoiSAxwwAqneRyFIUpzIjnl+UFeAAFd08mF1er8K5nVhX
         bOIIWD0D2TZLrHqGlcqYuKnyEUoO9fOPunETroNPgQPEodOWhviDntPWtaxPhYircyCM
         h0OWakUb/VDpt4ujPdw9YmCn4fK+o7ZI3sRLpN+IsmdBn0UVCUWNTlp4FVTF+hAi2TW2
         vC/w==
X-Gm-Message-State: AOAM530frTdn7w05QEUUrMamdoD1spxnRHTfv6u5m2Zrwb2AvVHmLGGK
	xX5+HikhTwJcMiyyHc8T2Lb+8w==
X-Google-Smtp-Source: ABdhPJwsQpdC8zY3pVgw5zuU9Lvz3PaHrGxutuHe3kM9BTzGZe/6dDFTxGXvB8QTefO1W0gh7jjJeA==
X-Received: by 2002:a17:907:d24:b0:712:1142:88c7 with SMTP id gn36-20020a1709070d2400b00712114288c7mr1505148ejc.435.1654784126853;
        Thu, 09 Jun 2022 07:15:26 -0700 (PDT)
Received: from [192.168.0.198] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id rn13-20020a170906d92d00b006f3ef214df2sm10603243ejb.88.2022.06.09.07.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 07:15:26 -0700 (PDT)
Message-ID: <e0f7146d-3ccc-a194-bb1e-c3475ca8c29e@linaro.org>
Date: Thu, 9 Jun 2022 16:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 32/48] arm64: dts: rockchip: align gpio-key node names
 with dtschema
Content-Language: en-US
To: Maya Matuszczyk <maccraft123mc@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree <devicetree@vger.kernel.org>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-kernel@vger.kernel.org
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
 <20220609114026.380682-3-krzysztof.kozlowski@linaro.org>
 <CAO_MupKxvaXRQvMyEUZMThBZ9033OeJec+BtBndjs5oZ3etTEQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO_MupKxvaXRQvMyEUZMThBZ9033OeJec+BtBndjs5oZ3etTEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2022 15:57, Maya Matuszczyk wrote:
> czw., 9 cze 2022 o 13:56 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> napisał(a):
>>
>> The node names should be generic and DT schema expects certain pattern
>> (e.g. with key/button/switch).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3308-evb.dts   |  2 +-
>>  .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 32 +++++++++----------
>>  .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   |  2 +-
>>  arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |  2 +-
>>  .../boot/dts/rockchip/rk3368-geekbox.dts      |  2 +-
>>  .../dts/rockchip/rk3368-orion-r68-meta.dts    |  2 +-
>>  .../boot/dts/rockchip/rk3368-px5-evb.dts      |  2 +-
>>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |  2 +-
>>  .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +-
>>  .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  2 +-
>>  .../boot/dts/rockchip/rk3399-gru-kevin.dts    |  2 +-
>>  .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  2 +-
>>  .../boot/dts/rockchip/rk3399-khadas-edge.dtsi |  2 +-
>>  .../boot/dts/rockchip/rk3399-nanopi-r4s.dts   |  4 +--
>>  .../boot/dts/rockchip/rk3399-nanopi4.dtsi     |  2 +-
>>  .../boot/dts/rockchip/rk3399-orangepi.dts     |  2 +-
>>  .../boot/dts/rockchip/rk3399-pinebook-pro.dts |  4 +--
>>  .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |  2 +-
>>  .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |  2 +-
>>  .../boot/dts/rockchip/rk3399-sapphire.dtsi    |  2 +-
>>  .../boot/dts/rockchip/rk3566-pinenote.dtsi    |  2 +-
>>  21 files changed, 38 insertions(+), 38 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3308-evb.dts b/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
>> index 9b4f855ea5d4..4b5413b12bfa 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
>> @@ -75,7 +75,7 @@ gpio-keys {
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&pwr_key>;
>>
>> -               power {
>> +               power-key {
>>                         gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
>>                         linux,code = <KEY_POWER>;
>>                         label = "GPIO Key Power";
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
>> index ea0695b51ecd..72328dd993ee 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
>> @@ -71,82 +71,82 @@ gpio-keys {
>>                  * |------------------------------------------------|
>>                  */
>>
>> -               sw1 {
>> +               switch-1 {
> Wouldn't it make more sense to rename this and all other
> renamed nodes in this dts into "button-dpad-up" or "button-1",
> as on the physical device those are buttons and the naming
> scheme of "sw" + number seems to be a carryover from
> downstream sources.

Can be buttons. I assumed SW comes from some kind of switch.
I assume you mean only this Odroid Go2 DTS, because some other DTSes
(like EVB above) explicitly call it "Key Power".


Best regards,
Krzysztof

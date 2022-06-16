Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0E3CCA47D
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A79AC3411E; Thu, 16 Jun 2022 00:18:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A04C0C3411A
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A04C0C3411A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso293643pjl.3
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=BlXLrh+w6iAEnbbaKkgWXS6h862hDv6DtV9NSq4RxDQ=;
        b=SSvaBcb2PDkzAHI5210PXM4EULUEyOnHgq3tomN4SbOSyNixZO61uekCz3S2o8vNL/
         FaozSUF+SDRam8ROF4Drv9pi2fBnxWxmE4np+M2+5iUj5pdnY3AydnO67acIEbs3xj+T
         Kvx5UusxuxtzJgUt+qpQztFqJjW8RLVAq98KjjheVGR3rOugRFqf6u+a5WkhQ8k1IL5L
         Ek3Whq4Mu/8dufnrSjTymB4mij2dA8JrjKTy6pnpLP6a1eLsT+Do0WhiJSZ4LV40HVSM
         sTfj0ubHUpELIZbyqCGsKGkP++mNRughAVzb7gn7EWlRaDBSCooB/njkmSr9jJpju1v8
         Dwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BlXLrh+w6iAEnbbaKkgWXS6h862hDv6DtV9NSq4RxDQ=;
        b=QD2rugF+aXLy8Q9JaXkOKXlPsu/tcpdmAalQS8NjzZuHoK13GiyEUDLqGEkUiUz1Wc
         Bn8EtlvXQeufAe65DcPYPA1Lf3gTqaXnjnZxAygLMljQ5HfQxbEXpmEJtjMzBKVVPTg1
         iITFi1HdmIlNL889ztkZjZH88xSLJzihMQQkLvJ04LdDtof6l7NgHbEUo9/8MBpROOfS
         7BLUc8vfwYdzIZuF9mFmtnJHb2GkEEm206HSE8wBVxObnpFrfxG8XFCqmN41h9VzUXBl
         KCWgcpFOloqCJcmzXyj6VVowWGmXA4pKal857QbtSsee1CPFLjJo+1vNdSHNsj8/LU94
         WAIA==
X-Gm-Message-State: AJIora+igMprIeoBF8bsADSyVpIXkwIKCZpdoeTu9ENSCP49cHnmGAsD
	BD2LZCs/XT61QtkWGnqVx9XXEA==
X-Google-Smtp-Source: AGRyM1um7PLc5JE4aT0snHxaDPEkbGJanTCL04ITZiHCM879PLK2zUgx/8FxogW4/ZwbtacQiWzyrQ==
X-Received: by 2002:a17:902:f64c:b0:156:4349:7e9b with SMTP id m12-20020a170902f64c00b0015643497e9bmr2251860plg.139.1655338737145;
        Wed, 15 Jun 2022 17:18:57 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090a588a00b001e2f892b352sm2397897pji.45.2022.06.15.17.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 17:18:56 -0700 (PDT)
Message-ID: <7f641ee5-ba10-53d0-5056-420b751e77c1@linaro.org>
Date: Wed, 15 Jun 2022 17:18:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] arm64: dts: marvell: adjust whitespace around '='
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526204525.832847-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2022 13:45, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.
> ---
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts    | 4 ++--
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi      | 2 +-
>  arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts | 4 ++--
>  arch/arm64/boot/dts/marvell/cn9130-db.dtsi              | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Any comments here? I can also take it to arm-soc, assuming there are no
objections.


Best regards,
Krzysztof

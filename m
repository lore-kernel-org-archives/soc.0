Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3B3C433FE
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 12:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2388FC36AEC; Thu, 13 Jan 2022 12:32:08 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AB76C36AE9
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AB76C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A63693F1E0
	for <soc@kernel.org>; Thu, 13 Jan 2022 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642077119;
	bh=FS/F/TlvVCSdyoU7kWP8bufXKEAoLhbWFtD9KWwk3o4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=wVOU3am2ORQVz8wG6HMZI5BuJjmUdYY4GS9nXFn5TFz52sqTsPtoQtTVedgEceHnG
	 afHP0AFJV0kbzbCjuiBNk6XvEB1/jdZRF8K6yH+PrSbFAM2NXBFjSb1cSn6autTMll
	 75WUsBjOeEn27zVb4UAZW3FLUmzDT4luui1MsmCLsmqIyD+/uTmDQS0N7bkqtfQyGR
	 SMLutnATCDrzsPNb4qGFBA8W8ro2ZTmhYqLFWDScQ2bf/x2VbuTuAiFJnij9muWkzM
	 Slvl8QQedoJa6qB+TBhGrhrnYV2lb7cHWjJBQhLOfN9OVeKNvHUXMon/TINWmEA92v
	 ZeVH1n6r9vrvg==
Received: by mail-wm1-f71.google.com with SMTP id o185-20020a1ca5c2000000b003478a458f01so4049342wme.4
        for <soc@kernel.org>; Thu, 13 Jan 2022 04:31:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FS/F/TlvVCSdyoU7kWP8bufXKEAoLhbWFtD9KWwk3o4=;
        b=g053ht7M9zy6kczzAUFgrK0cbacwiEZppEeRt0g3dS/VqYJ2y3//KwfZrr1B0Bp/RI
         optlK3TGnyMM8VrhMpaRiXpSlYEEvXPvxajSUqEov1YOAtuhIUWDDCe6qYc9T2uQe9V4
         uIb31Zrg0PqfE3IRm6VeJYHQc5vxHR4nfDOUXmb79tbfg+xEJLl7PGiMpn8oaZL6ZgbO
         EUSnyPkBV3o2vVPusweE7NbqSOaJ2ypeakZlHrp38fualkeAHvarpnjo2ATYmsXqqvKi
         6mX6K91tNrq02ml0h9Urbi9E2jWgg4ZL6bNEOCcQpitIJLJVYXH4jK1V1amjMCdIjUi/
         clXA==
X-Gm-Message-State: AOAM531eED9+ezbre88XTlaba2JY5AEwXOK5B+W4zVdQxdYOVIJWzG4A
	xt5oEBsOrVSSNwpCXavyzj8/WGvSDqrOA2uTr0oDqEmuIerMnWuWRGVje/pDwpnVkvrji8ke9zM
	caKWL5R41TTHymcRxVM1fz1I=
X-Received: by 2002:a5d:420e:: with SMTP id n14mr3724223wrq.293.1642077119255;
        Thu, 13 Jan 2022 04:31:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQfIKQD3y1atrGTO3ll5AyBzkhE238ZBX+7qN6TR3TyZPEQWe0UjPAwheqscqdBIG0C76OOA==
X-Received: by 2002:a5d:420e:: with SMTP id n14mr3724211wrq.293.1642077119106;
        Thu, 13 Jan 2022 04:31:59 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n7sm2398562wms.46.2022.01.13.04.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:31:58 -0800 (PST)
Message-ID: <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
Date: Thu, 13 Jan 2022 13:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-1-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch set adds basic support for the Tesla Full Self-Driving (FSD)
> SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
> as well as several IPs.
> 
> Patches 1 to 8 provide support for the clock controller
> (which is designed similarly to Exynos SoCs).
> 
> The remaining changes provide pinmux support, initial device tree support,
> and SPI, ADC, and MCT IP functionality.

Does FSD have some version number? The FDS, especially in compatibles,
looks quite generic, so what will happen if a newer SoC comes later? You
would have:
 - tesla,fsd-pinctrl
 - tesla,fsd-xxxx-pinctrl (where xxxx could be some new version)

This will be extra confusing, because fsd-pinctrl looks like the generic
one, while it is specific...

Best regards,
Krzysztof

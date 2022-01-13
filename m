Return-Path: <SRS0=+ipK=R5=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01BCC4321E
	for <soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6EC1C36AE3; Thu, 13 Jan 2022 13:30:12 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 930DBC36AEC
	for <soc@kernel.org>; Thu, 13 Jan 2022 13:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 930DBC36AEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F33C3F1DE
	for <soc@kernel.org>; Thu, 13 Jan 2022 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642080610;
	bh=Gdbdjf8zVy+P14tpf21E4rjEbB+nBaQfGlpLQYdJfQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=um4wYXqGEqt5EkfeaYyVH1ordYRkiqEH8UE6pCZVvDD4VFf0UluD0MTZjT3Mg9TeQ
	 Cl0VQmcvRd6tprIqpvCgWLWeN1BDRPm9lNWYncAUoplKyS5mmXM4xwxBCbU9dp+twT
	 va/tzBHF/UJ5AdRKWIb6ietsuMsxvCYSOPAK5V7PouqI3IxPhRQYD5mBzZzVEPx4tj
	 kkY5dc8NzY0FQqPaItnVUFiAPREA0bmkhvjpKhMF3Hr9Abbnb36XW3eb1918EtPH/U
	 qCYS/UXYg5QyT+t4ICp3TCg5bzBUlxOOG9cQG5AAFnIMVTQ51fmDKrAuYdJZOIc1T6
	 DSzz628MhIGdg==
Received: by mail-ed1-f72.google.com with SMTP id o20-20020a056402439400b003f83cf1e472so5324361edc.18
        for <soc@kernel.org>; Thu, 13 Jan 2022 05:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gdbdjf8zVy+P14tpf21E4rjEbB+nBaQfGlpLQYdJfQ0=;
        b=UdTJXnKtBYcPhmRNVsjJJoAzKdVB8NdP7qLj1fngioT60MJhLzptzzlqnjbQfy7Qw8
         sMK8+//wawEILkJPyroVAaiUB06c+XqtwsLdy6KyPmh2Krsgs3eumsD+T8xeBq8PLNeS
         HyoH+iZhB3MCL7sJF7YWhBdZp9yL8iWXqyXDWVWdFOAn+PSp2HX2jjC2AEuaFiurl2zg
         gg0z3mGZbS/CxaqpDoIK1qEb/CKqTNEz3UrifnmmfodUSucfprw3RW+sdEa7hh6Msgs9
         vIIJpjouAE5VKToZIcM9o0PhJ29/mt0SHRJSBL1VeNbeXsGf6MZA38gOuRm8UYYOzQaE
         SrOQ==
X-Gm-Message-State: AOAM531jD1vatDpyYu/Nyn8fyf2nOXE5MRSxkWzWIz/tQeEEAtwkcVtA
	lS4DodHDkT+QscMMHhY2y9E3qVVeDnQoLFEkMyIXuhePoLmfCnuygEfbcuaySBH8BAUKTxgUgnJ
	VQFXhTE3jT31KEMdAzgemnhg=
X-Received: by 2002:a17:906:a109:: with SMTP id t9mr3500769ejy.718.1642080607703;
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMNkfQi4+m47jbNQiciQP+7ptefZU6skQjA2XWtlYYF4xXnLw2qZV1JKz789+WCaQqP5cfCw==
X-Received: by 2002:a17:906:a109:: with SMTP id t9mr3500755ejy.718.1642080607579;
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w3sm877146eji.134.2022.01.13.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
Message-ID: <9c3ef183-2872-f070-4d22-0ab2e79d2555@canonical.com>
Date: Thu, 13 Jan 2022 14:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 19/23] arm64: dts: fsd: Add SPI device nodes
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 Aswani Reddy <aswani.reddy@samsung.com>, linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122440epcas5p4651d7cb2fc6d6a70fd5eaab5eadcf996@epcas5p4.samsung.com>
 <20220113121143.22280-20-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-20-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 13:11, Alim Akhtar wrote:
> From: Aswani Reddy <aswani.reddy@samsung.com>
> 
> This patch add device tree node for SPI IPs and needed
> GPIO pin configurations needed for SPI IP
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd.dts  | 12 +++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 57 ++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

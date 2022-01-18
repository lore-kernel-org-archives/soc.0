Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02429C433F5
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB4A1C340E0; Tue, 18 Jan 2022 18:34:58 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD7F7C340E5
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD7F7C340E5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29F273F1E2
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642530896;
	bh=el8J3PPct0S+ev5GdXyAPVCnFytQqf1PBg78OHl8Ffc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=qkJpGJOQE2H3w73Q3dtLSxheHguD158HyudbvZxNCGWqzsMX36jHPSiXcaSv8lDB9
	 yBBr5cjAr2dW23+bFHnSuiRBtbkieeKhRyFL1Y2LuaVv0vukwIGDAtMyGxDre46GyI
	 1w116ZAmPh994R/rbtHfeaxz5q1WtW0l8ztecM9LnDAmymh3mDaM9KtOLo/YArmWAa
	 EH9DZqYcJ5NL54sdidySMNb3p2rancTtheu4N/DTmLscR3EMqd6CRjXNBNJyJ6wOJQ
	 HqNZMbcQwiNsrSN9ItEEUhpnkK21+9YEodqolxcaR0vX0UkMlx0icBOSKoeW5S9Czy
	 W9Fr5KdGS2GXA==
Received: by mail-ed1-f70.google.com with SMTP id el8-20020a056402360800b00403bbdcef64so1916703edb.14
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=el8J3PPct0S+ev5GdXyAPVCnFytQqf1PBg78OHl8Ffc=;
        b=rH6irR0EMpBlhz8LgwvFl6cbnlfq6eeTiAK9BYF/Qu5TTUqvd0Yd/0ZtOgQ7o9Fxsg
         VSkypsMcDrEGrN8yZuBU26OaX42mcZQcfCmlnogfu1jEMdQVotBV8E671XfFSuMCadam
         rviIsUaphw2APL3XLdDOUOUz1vAkPCxqGMoPJIeGwRibb+0v3VqhBOfMkld9WvFMr+kJ
         ATU8dWRKrJ6/z961jheU96wMBItYvqVWcw81Rckkk03H6ReuiuuYLm14YYz6L7+cw/iO
         Sfbk22iOQcTIrM3o/bnV7nDPlK6qsQeyMO9H3FdZ5KygYKfrQs24nuUmdIY8xBTZdFL0
         W4IA==
X-Gm-Message-State: AOAM530GD6WGxxmUEvrEebg13DWtV5mFq2fDDYWneUNk6Q6D5cHCMhF1
	QTD2f8RpTGEfB3eZXbUCHwr1vvRbBmTWIaEMHZ7FGQwbAV+Mr05Djpqijd4L51Sz3wi9xga0JUL
	0Djjso6R1+AlrwYQI26VKo5o=
X-Received: by 2002:a17:906:26cb:: with SMTP id u11mr22377068ejc.630.1642530895899;
        Tue, 18 Jan 2022 10:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhvVGjHzZuQ09wopbadcVRPRuqKkPuSKlwacLl86koXiI0x4vNr1HBDnVEXOEfMu4WgODVng==
X-Received: by 2002:a17:906:26cb:: with SMTP id u11mr22377049ejc.630.1642530895742;
        Tue, 18 Jan 2022 10:34:55 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h11sm194326eja.119.2022.01.18.10.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:34:55 -0800 (PST)
Message-ID: <ea4d5b07-c14c-4558-9ddf-c55e9a6ff657@canonical.com>
Date: Tue, 18 Jan 2022 19:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 07/16] clk: samsung: fsd: Add cmu_fsys1 clock
 information
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150041epcas5p2634381919d0e9f60867d6087162fa134@epcas5p2.samsung.com>
 <20220118144851.69537-8-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-8-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds cmu_fsys1 block clock information which are needed
> for PCIe IPs in block FSYS1.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 175 ++++++++++++++++++++++++++++++++++
>  1 file changed, 175 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

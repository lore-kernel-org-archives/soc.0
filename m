Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500C7C433F5
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39AC6C340E6; Tue, 18 Jan 2022 18:34:35 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54BC0C340E0
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54BC0C340E0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 21B1D40515
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642530873;
	bh=2sNtXURDOFY5YeHmaa+6rq6KkuL9DgoBnkrsKI2ksQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=AvegWNprzGdxTR8Rufkkmbqm9b4UBJYgg4ICYSeXlyVNzehsflUzYG0C6LvxE3/t5
	 HEIHFsvobPKmtKlFbHcWN3DZbWT2H99yRx8GXuHQLtbA1VTjAUWmIguYFZZ4N0wOLi
	 GtgdpoLDXa5vcVUd8+ixUX2KcWskyXUbjyL3ExZrw7WqWpBIgzYfXffy/wq25c2CXk
	 TRi1FIV88kjktmJBFmixGjy1eP5n+jI02ZucCEg6o4z1XqkXIvk4cTAXpeOqtxDog8
	 71jRkiTIjxt7A5EBgrwcg83BgjPHC4jRmuQyMfkGdAtAfwf5myjczJwTfegOz0GZqz
	 55S3g45yI4nzA==
Received: by mail-ed1-f69.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso17869639edb.10
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2sNtXURDOFY5YeHmaa+6rq6KkuL9DgoBnkrsKI2ksQ0=;
        b=F7M06ALaKwqlYiR1zOewCb7unMGNMN8UAF679wTsrsfLzADclcb7Z9e6VlqP1nzFa9
         mjgsRSAIBPgeRoOAPfgjj6JbhkWTETlrOHqTiYBP60Cvt97syA4qvLo6nHnjXTLYA1SM
         fngrPk+G2jZGp96JmJD2PkGNuMRgbTwEOsarKLtEEVbWqCjns0QY0szE7dobxVhuHcSC
         K3oKFe5VWzssZ9zCdHCyGb5ZvRQz10ZjyTaNsRlrwuVEwCoLj6yqzVHEsoYax6EexSKm
         NvgYp1KRUMhCHuyO8dJJZE3+B3of2bEY5Et6XO+rFGU03Z4Bv1RbV5oUyjg7ZvuAKek7
         mv3g==
X-Gm-Message-State: AOAM531Ne2zxA3Fic7I4HNadzXnjsKlVgFePmnUR/loWkrsdQhQz3WzM
	gf5yCfXzPCrN2H6TMI0L9TdIeWvAYTosUYxKOA58a4PDzglaRUL46bQ1uYFEHkL3x8YyezZhA7o
	WzDYnmuK09uMgvbI5Rv7KvQA=
X-Received: by 2002:a50:d69e:: with SMTP id r30mr1416873edi.284.1642530872196;
        Tue, 18 Jan 2022 10:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFfk4qysqwQQ+JBGYnqeMFUI+XaHpezXkBv6eaAh0acQ0crMg2NxWfal3ZD4TuQozsNPJjAA==
X-Received: by 2002:a50:d69e:: with SMTP id r30mr1416854edi.284.1642530872062;
        Tue, 18 Jan 2022 10:34:32 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l10sm5590235ejh.102.2022.01.18.10.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:34:31 -0800 (PST)
Message-ID: <3c400f9f-9d02-050e-cf21-c3376bf15127@canonical.com>
Date: Tue, 18 Jan 2022 19:34:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 06/16] clk: samsung: fsd: Add cmu_fsys0 clock
 information
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Shradha Todi <shradha.t@samsung.com>,
 Jayati Sahu <jayati.sahu@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150037epcas5p1624361eb48fa14cdf9ed88de6f890db4@epcas5p1.samsung.com>
 <20220118144851.69537-7-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-7-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> CMU_FSYS0 block has IPs like UFS, EQOS, PCIe etc, lets add
> the related clock information for the same.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 302 ++++++++++++++++++++++++++++++++++
>  1 file changed, 302 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

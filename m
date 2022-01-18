Return-Path: <SRS0=YOi0=SC=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B828C433F5
	for <soc@archiver.kernel.org>; Tue, 18 Jan 2022 18:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7EBDC340E0; Tue, 18 Jan 2022 18:34:19 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 120E3C340E5
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 120E3C340E5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0C08640049
	for <soc@kernel.org>; Tue, 18 Jan 2022 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642530851;
	bh=ys9fbFG6FrwU8wrOLNvr69yPd+OIURRywK4KztzYv+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=qUnIKppX1ep5UlVEGt/RTVicStXWs/BjByLd6sAzIhjKuzSP3NNY7iWlltDauP30R
	 E3Uf3JwD+03Z1Yb94+ovikyPLQI5Kcd04zoOAA5iPbBjA0uHFBuzKaJe1BT6vj2iiL
	 MJAkhhhl9EWbPjXB+FbxQDkkO77Laf0Dr6vierb+0TYioDXkY6aBsnxcu1n8ojOM8A
	 qyVbpHLYpzTFAqHjdpAzWiB9qSFjkhc9LdS00GhVYDduV8p5sXlXoANDM+ZXoFAT0I
	 XwUzG7t/Ag1ZzrSfNIlFIIYFv96ZTdpjiBUjLs+1mr/g4NQrZjIGQ/76eksG89OgII
	 7KOX8QNCdZiaQ==
Received: by mail-ed1-f70.google.com with SMTP id a18-20020aa7d752000000b00403d18712beso779821eds.17
        for <soc@kernel.org>; Tue, 18 Jan 2022 10:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ys9fbFG6FrwU8wrOLNvr69yPd+OIURRywK4KztzYv+A=;
        b=qMLS+x0vUSZRuegaQGMmW0JpqF3JTjgT1hGhTDkgQNlT9026A7yvJCdYsQbX0ypijr
         37dCrvw45YqfqO5LopjtWTFsxjV/F+ALRRSWuRXPQIU/27RDday1ZgrR/8Xr5ynR+13Z
         45iTdNnog0u6enAYmX8wjNYgBR1JwsRzxOW5uuLex/lsvb7YImrZPiemfs6QmjAuwCTQ
         3X5wQw1zSDZnqui+bb/KrT2Tf4+NKUak54E0fP7A+YszfY5Vi3DR5n7BxGcOciVK5i6T
         P/Mg+J2KFDn0/TYoWS1LK/fp7JdTbuKU4zeHBzjY34qRNaAX/zxxafZNQY0+wLv9aalv
         rlCw==
X-Gm-Message-State: AOAM533aafaX3fAboFlltSelaNr4p3qsnN2rdBqo5fUbpZhqCGdQv1nE
	fNpzXfTDM88kEwdDtZFbXxixrJBq/b9Tdkf+TqWJAuLUmH3e+RaG5aNJpPR8zVkSzTbe6SmoA8H
	qDtDjme0zg/Wxb0c8jnh49sY=
X-Received: by 2002:a17:906:f02:: with SMTP id z2mr22210699eji.499.1642530849089;
        Tue, 18 Jan 2022 10:34:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeXYDGBJEK7l/U57vJp7HToUWrta7Pd/0gP+bMho/GHw6BP3wds5zuz/OgfUqhy0vc56VI6Q==
X-Received: by 2002:a17:906:f02:: with SMTP id z2mr22210677eji.499.1642530848938;
        Tue, 18 Jan 2022 10:34:08 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 7sm5544523ejh.161.2022.01.18.10.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:34:08 -0800 (PST)
Message-ID: <d61c2cef-4f59-53ba-7135-b9acc2defeee@canonical.com>
Date: Tue, 18 Jan 2022 19:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 05/16] clk: samsung: fsd: Add cmu_peric block clock
 information
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, arnd@arndb.de, linus.walleij@linaro.org,
 catalin.marinas@arm.com, robh+dt@kernel.org, s.nawrocki@samsung.com,
 linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
 linux-fsd@tesla.com, Aswani Reddy <aswani.reddy@samsung.com>,
 Niyas Ahmed S T <niyas.ahmed@samsung.com>,
 Chandrasekar R <rcsekar@samsung.com>, Jayati Sahu <jayati.sahu@samsung.com>,
 Sriranjani P <sriranjani.p@samsung.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150033epcas5p15b88d4f0c695fc515f20d8dffe15202e@epcas5p1.samsung.com>
 <20220118144851.69537-6-alim.akhtar@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-6-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add CMU_PERIC block clock information needed for various IPs
> functions found in this block.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Niyas Ahmed S T <niyas.ahmed@samsung.com>
> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 405 ++++++++++++++++++++++++++++++++++
>  1 file changed, 405 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

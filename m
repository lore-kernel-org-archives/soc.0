Return-Path: <SRS0=dXuL=PB=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E63C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 15:01:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D792561163; Wed, 13 Oct 2021 15:01:18 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A95B6113E
	for <soc@kernel.org>; Wed, 13 Oct 2021 15:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A95B6113E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4DC4B40010
	for <soc@kernel.org>; Wed, 13 Oct 2021 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1634137276;
	bh=xYuV2MmQladXcPP7bw44n/vAd85hc1wnSNxzKdpoKHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=h/QXGNQ6m1uR7tRK3CIgv+bWw+nupVn7pe1kAe5t9gLcWICbqxFktHubqMlefJyXZ
	 r9h/t08O0MBlx3IK3OB0k+exGFDs55Zs+JezlrzE6UtYngOOJQsf6SVXd2+QPql2Ex
	 omo5Zh/p+ywpyP2Z4NPqn0X9bmxlz2Bzi3lDwV4tC5uZ9Vg8Wbs93ORlvyuZRZ20rQ
	 9o69lMx7hNW9oRyHC/o09MJSDcgx8mpp4P/vShDjdMR/yR1U1xyQFxyumsND5uE59I
	 I9+CwOPfynNFba8zHE7e7RDXwvUUBp03k6Le/XRWTqfNbsXtAIR2jD6uK+8cDnHxem
	 T9zFtS9pJZ13w==
Received: by mail-ed1-f70.google.com with SMTP id d3-20020a056402516300b003db863a248eso2474238ede.16
        for <soc@kernel.org>; Wed, 13 Oct 2021 08:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYuV2MmQladXcPP7bw44n/vAd85hc1wnSNxzKdpoKHU=;
        b=pgACoiQrSlWW3mfmgWxXeDHE5n0tNoHGyLoHjfiF6T50KzSLVXY3qJOYUQLQrocF+/
         7cn6srgNxkvnuxPHVrUWN4JZXI1Ed10DjNFqQmIH82w4QQ8JMgE5LPDJ9d6PPqNaPqSL
         JjogdaQd2i4gkhi8TH4jLdiEnv9b/J2JkGaFv4IKeKouutYA6WE7tA46wDBgZa2A2A8C
         5PtrdQjmx8Loqu9GQYzQsclsxfvF2hBZLZSbCIOxKZ0GF7UR8HNmatxzI1qSL02IL1MA
         3NaV3pZz8rC+QC4oFX+3LENmE2Minp198bRPlm+3kKLH+yuz1l18QmgQecK5ILKRXjY2
         EXqQ==
X-Gm-Message-State: AOAM5305qU318t1Uv2bA21DeOobQkPBDjK9A87TaKDr1mo435ubNhUqz
	vBDAjQzhP/CJHN/KrU3G7h0Und4kCK7xuHtMusy2p/+f5cwlW+rxEkDTUlLWiEIhHAXZTpCe/K2
	Kilb4KMWEZ5/COiooWbaS5DBqfxHXk/RzwkZw5Og=
X-Received: by 2002:a50:cf87:: with SMTP id h7mr10281322edk.330.1634137275950;
        Wed, 13 Oct 2021 08:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwegVNQSzIUZzqwL+kBl/pg71DIpq9sCZIiDU4Wb8xJespMOYwK9v10kYYfIdkQ4bJOR0ucGyI5yMK1rTxX1ro=
X-Received: by 2002:a50:cf87:: with SMTP id h7mr10281285edk.330.1634137275716;
 Wed, 13 Oct 2021 08:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org> <20211013143810.2101838-2-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-2-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Wed, 13 Oct 2021 17:01:04 +0200
Message-ID: <CA+Eumj5Fx6tQv9B9R9iBCP4C=f2dk3szCGcisvPHYfMWpsCCfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: exynos: fix cpu unit name warnings
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, soc@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Oct 2021 at 16:38, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> dtc started warning about some of the CPU addresses:
>
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:78.20-83.5: Warning (unit_address_format): /cpus/cpu@000000: unit name should not have leading 0s
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:85.20-90.5: Warning (unit_address_format): /cpus/cpu@000100: unit name should not have leading 0s
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:92.20-97.5: Warning (unit_address_format): /cpus/cpu@000200: unit name should not have leading 0s
> arch/arm64/boot/dts/exynos/exynosautov9.dtsi:99.20-104.5: Warning (unit_address_format): /cpus/cpu@000300: unit name should not have leading 0s
>
> Remove the leading zeroes.
>
> Fixes: f695b3f4c45d ("arm64: dts: exynos: add initial support for exynosautov9 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Thanks Arnd, but this was fixed with the next version of patchset.
It's my bad because I did not drop the patch from my next branch after
spotting it, knowing that Chanho will resubmit the next day and then I
would replace it. This replacement happened next day but linux next
got the older/buggy patch.


Best regards,
Krzysztof

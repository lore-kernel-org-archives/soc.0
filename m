Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED25CD6E77
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 14:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 742E6C433C8; Wed, 11 Oct 2023 14:43:26 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8B5CC433C9
	for <soc@kernel.org>; Wed, 11 Oct 2023 14:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8B5CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d77ad095f13so7244658276.2
        for <soc@kernel.org>; Wed, 11 Oct 2023 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697035403; x=1697640203; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHSGgNwplrQByUQEFDMoiW6T88xkz7+Z7CzZX4tel1c=;
        b=Jf8o2JcCRLV6xOFyuNVPNR7h5F1r1MliyDGlz9eB7hROCxYA5dnYFWMq4Ly0wfAFOB
         ODmsuV/Arnwbq2eBO2oLfsnf+sY7dwzV0w85Jf9vn39l30n63TjFiUct0OPkTdJUDCel
         MBSpK5oLoYvoEbcubRiLLA3pLNSK8lXzr+Q6C8TSK2Kmtjw9TvjHtfvc72AclojhNUtE
         +m0T9IoVvxRFy4n1yv0HleNWmyBCeVQWgdx4Q8NKAuikRewYmEbCVc9Q7s25dJuG1BGG
         9TaMOF7htdqkw7iLoOI/yom5kMfKo06V/tgo4CW87WAa/dr0epsJp+bBDf8Ah4gYw9kv
         a09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697035403; x=1697640203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHSGgNwplrQByUQEFDMoiW6T88xkz7+Z7CzZX4tel1c=;
        b=GzK+S62hgMa0Ee9fL/m6PNXQD2VlXuHacrr8i4UmVO1rTkMm8hYuj7Xs2JJEPmWR+i
         YorjEppm2rDcCukYZ9Btpqe6Y7BbYu9pvTD9VTYW87Q1JLF0kN6Fz42KUSCNeKWMknQD
         Gm28641M0K7Vf2ig4LuUTj9l+awN0xvFrYFiF5vMf4VS5WZVjd7YuDdxC87LmdVBw3xZ
         uLJ5w/deDioVeewAczMWFZ/lJMMnDlv39wqzknJqIAGgQYVW38A+t11Un8l+xH+S9znY
         Id9A9oUkunOiHybd8Q2SrOWrOItsHCqmsiijf9PG5WKeFoKxPQnhLeBKbcWwzGzMexwv
         clkQ==
X-Gm-Message-State: AOJu0Yzii8R84gWgfP7j8j6B3hk7IpbO2PGCQD2az2W4IhspW6gzf9Ek
	SCW+Kzf45rVda4cfEQFl44MdPXXvQbBaedwHYJpy8A==
X-Google-Smtp-Source: AGHT+IG6ejFYIQqSBlCuZeoLJFdvXD5HM2pcfGye3trv5p0ja9AYy6Vps/U8uovRHfUX5MkuYivucvBJhgbz9bJ3CCY=
X-Received: by 2002:a25:5d1:0:b0:d9a:501e:95d7 with SMTP id
 200-20020a2505d1000000b00d9a501e95d7mr4970434ybf.8.1697035403592; Wed, 11 Oct
 2023 07:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-16-peter.griffin@linaro.org> <e2320e90-5e3b-4b50-8af9-56dee639d022@roeck-us.net>
In-Reply-To: <e2320e90-5e3b-4b50-8af9-56dee639d022@roeck-us.net>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 15:43:12 +0100
Message-ID: <CADrjBPoaG2XPx-hrxXAVj9xFQeCPJrJMX0sM-cOkv0gRV=zAOw@mail.gmail.com>
Subject: Re: [PATCH v2 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thanks for your review.

On Wed, 11 Oct 2023 at 00:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:23PM +0100, Peter Griffin wrote:
> > This patch adds the compatibles and drvdata for the Google
> > gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
> > to Exynos850 it has two watchdog instances, one for each cluster
> > and has some control bits in PMU registers.
> >
> > The watchdog IP found in gs101 SoCs also supports a few
> > additional bits/features in the WTCON register which we add
> > support for and an additional register detailed below.
> >
> > dbgack-mask - Enables masking WDT interrupt and reset request
> > according to asserted DBGACK input
> >
> > windowed-mode - Enabled Windowed watchdog mode
> >
> > Windowed watchdog mode also has an additional register WTMINCNT.
> > If windowed watchdog is enabled and you reload WTCNT when the
> > value is greater than WTMINCNT, it prompts interrupt or reset
> > request as if the watchdog time has expired.
>
> I am a bit lost with this one. The patch adds QUIRK_HAS_WTMINCNT_REG
> but doesn't use it. It also adds S3C2410_WTMINCNT but does not use it
> either.
>
> What is the point of doing that ? It is just confusing.

Good spot, it seems I lost a few hunks from this patch at some point, sorry
about that. I will update and send a v3.

regards,

Peter.

Return-Path: <SRS0=/kUF=HW=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7C0C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 10:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93BC6C433C7; Mon, 11 Dec 2023 10:26:53 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01839C433CA
	for <soc@kernel.org>; Mon, 11 Dec 2023 10:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01839C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-677fba00a49so34308266d6.1
        for <soc@kernel.org>; Mon, 11 Dec 2023 02:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702290411; x=1702895211; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBClK4lqtI01tZ9y+a3IQvx46bQqW6gXipVJViDNMLE=;
        b=EG7KZQ99lt+HJcu5wL3TTUEdwx4QxaZKdPG40XbnWvAjNqt2ctV6Ut0qYneO6DCtEi
         LTcIiCzqUXZVqYK6ijf+8UqeqZYgBzpTUSsw4MFnhizP/uTjwZ81N5ih9tCpKQxdMW2c
         51f7aB6hL+aWdMgQ3xEdSusXUtfHIUEjCmo4NuEJsGw6Spo++eQb98WOePRf2LOraYeR
         KsJG1LyaEHYS32owz/1NxbucACAIGWiOVmuP2pRg8dDXWmrnDHBKocrrrOL7rPm56F7d
         UzmkabfStX01UowiA63B5YLEwvUsDHlGHzW9AWzwGb8X47x3mSr63hixg/VhmgfnsUcj
         2ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290411; x=1702895211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBClK4lqtI01tZ9y+a3IQvx46bQqW6gXipVJViDNMLE=;
        b=g59LgOTP5AOXgNJtfhASX4Oi96NxAx23MF4cAQh0HAQO25OBRiLsab2uUX3ZXXHrs0
         efu9iqTJhaNcx4ZFeTubQ9WsR1/mk+aB0O3/2AfJO7Y/ijm2ShG0l2eUjlGu0R+RlKPX
         KnLSm534M9gBP3sQzom8yukrYa5qBUSQgOuY+K2AIi+mxkM5PmsSizft8cA9d+0K/NKh
         jgq4ZYhYqLglFuVNrQxrcurTAungveq/c6KNUbzchV2BeWNDdNRye/WAGwiVIBUKHjdw
         IJ3e2C9Ah0vQYh9GeozfCMRq9BYGqLRQso42kVfHDl62fmudnGJzMaTiF6TtrL4FIO+p
         wrHQ==
X-Gm-Message-State: AOJu0YxUpv27iDa2ryOOI0prRaFE6kYCrqlw1X6LehoFB8VzHphztTA4
	Hc+l72lNXgx0tsYovL3EoUpw5A6fhgVzzAkHv7PU3w==
X-Google-Smtp-Source: AGHT+IGXuSEmjxGIf3QPro+i3LI5BnTbhCqPp7O7UIiBh/LqSwNTV/bm9Ks6TLe0NeBnUASLNjJvb+hNli7R0WXRvsA=
X-Received: by 2002:a0c:fb04:0:b0:67a:ad44:2126 with SMTP id
 c4-20020a0cfb04000000b0067aad442126mr5413328qvp.60.1702290410972; Mon, 11 Dec
 2023 02:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-17-peter.griffin@linaro.org> <25533a7f-326f-48d1-a8a6-e5798bdca4b4@linaro.org>
In-Reply-To: <25533a7f-326f-48d1-a8a6-e5798bdca4b4@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 11 Dec 2023 10:26:39 +0000
Message-ID: <CADrjBPrg51Fkkme71yLeFc06ROgAjcchXGoX7Uxrmin-+yBayQ@mail.gmail.com>
Subject: Re: [PATCH v6 16/20] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review.

On Sun, 10 Dec 2023 at 14:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/12/2023 00:31, Peter Griffin wrote:
> > This patch adds the compatibles and drvdata for the Google
> > gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> >
> > Similar to Exynos850 it has two watchdog instances, one for
> > each cluster and has some control bits in PMU registers.
> >
>
>
> > +
> >  static const struct of_device_id s3c2410_wdt_match[] = {
> >       { .compatible = "samsung,s3c2410-wdt",
> >         .data = &drv_data_s3c2410 },
> > @@ -285,6 +318,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
> >         .data = &drv_data_exynos850_cl0 },
> >       { .compatible = "samsung,exynosautov9-wdt",
> >         .data = &drv_data_exynosautov9_cl0 },
> > +     { .compatible = "google,gs101-wdt",
> > +       .data = &drv_data_gs101_cl0 },
>
> Keep some alphabetical order by compatible, so this should be probably
> the first entry in the table.
>
> Same for s3c2410_wdt_variant structures.

Will fix in v7.

Thanks,

Peter

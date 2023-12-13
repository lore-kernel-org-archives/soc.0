Return-Path: <SRS0=q5FS=HY=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C257C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 633F4C433C7; Wed, 13 Dec 2023 19:13:44 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76C94C433C9
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76C94C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-58d956c8c38so4548285eaf.2
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494821; x=1703099621; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoasIn7ZWnWThH0PLf9u8EiK7T+LlQqn1Vvx2nlonP4=;
        b=JxyZtTb2scBazJ4ydcuWOlBLA9jcE6HmtKo3p3C/HzKxNSfk3ttZIf3BJZSwJP8VeS
         d2CF8Y5Ix+Hko+SK2LhNFKjwygJdHYhGTDRLn5X6GTKxfjX8Zmx4rNIKHzhl3tX4N2Pa
         lAE0ETT6dyC174zBKR6AmZu4BONLdN9QWSvdl+Zkne01hFgRaDzhgJQQplj1J8/OObfR
         u9YSXhhywYBDvTVbK+RUohahYrT2HFyakXDXF97DNpOrznZRSmIhOsYWtmK/iox7k1S2
         enwGp+0BJXVmKrUkbJSZ1zCPGylaTVq0onSIWZxZQ2L1bP4VZ6Zi5NP3xgHczJ+Ep49e
         azUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494821; x=1703099621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoasIn7ZWnWThH0PLf9u8EiK7T+LlQqn1Vvx2nlonP4=;
        b=XYdBloY4l6Ia6TdrtPGDgTMlsntBUyZOa5G7xTnzohUk1/9+Males1KMcMBX29iEer
         7HHZcz5mZ1bI72zw9v0RRj6J9+aPTAcwymjsxN+pj5Ig1FZVOzORh/eY2Y9gUAjfFZqo
         TOz/B6OaT7HIwCr/B2wG43ZnN338/zAs1U1f+w+JUloh2E1sGhO0HCFkLQcJbU27UeYt
         zhBVac4IzSZV/X5kYBGpH5Cy+mkTJlvwzYJ97a2RJQMPXM5ES9rYtGFjQwUkM+eFk09d
         60man3fZCHFNJbBlk7vdKN1eYTG6/XW9G2/eKfXUEI9DRpSlesHcwk/QMfsrhK7tZBox
         ALSA==
X-Gm-Message-State: AOJu0Yx9bgSPqJ/Hc/LmgoA35tfBCvGnL+szKIzJBw+e0mGWMPg8ufmg
	gZecoxLlq3/frctmW1Dz1HSCvPNaar3+0RN/rkw1Xw==
X-Google-Smtp-Source: AGHT+IH4+myfhe9Yt7eO0yu5pPXNu0R/7YLBoZZEMIElJzsamITcWtE6zUFIGooST9U4bGH3ubAkBPh6S/8Kq9R6VJ8=
X-Received: by 2002:a05:6358:cb25:b0:170:7dca:9798 with SMTP id
 gr37-20020a056358cb2500b001707dca9798mr6354481rwb.10.1702494821571; Wed, 13
 Dec 2023 11:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <CGME20231211162434epcas5p485e7b2edbb02a1b6ea04ff5cc758f5db@epcas5p4.samsung.com>
 <20231211162331.435900-12-peter.griffin@linaro.org> <017401da2de2$400ec6e0$c02c54a0$@samsung.com>
In-Reply-To: <017401da2de2$400ec6e0$c02c54a0$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Dec 2023 19:13:30 +0000
Message-ID: <CADrjBPoFu8azjZ65RGqae6HSCCoHQuhcBHNO_Fo0nVsE9pYGaA@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
 use BIT macro
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

Thanks for your reviews.

On Wed, 13 Dec 2023 at 16:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Monday, December 11, 2023 9:53 PM
> > To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> > tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> > wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> > will@kernel.org; arnd@arndb.de; olof@lixom.net;
> > gregkh@linuxfoundation.org; jirislaby@kernel.org;
> > cw00.choi@samsung.com; alim.akhtar@samsung.com
> > Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
> > andre.draszik@linaro.org; semen.protsenko@linaro.org;
> > saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> > gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> > team@android.com; linux-serial@vger.kernel.org
> > Subject: [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK macros to
> > use BIT macro
> >
> > Update the remaining QUIRK macros to use the BIT macro.
> >
> Ah! I see you have change use BIT here, so you can squash this patch to
> patch 10/16 or
> Move BIT change from patch 10/16 to this patch. Either way is fine.

I actually kept them separate deliberately to avoid conflating adding
of the DBGACK quirk with cleanup of the driver to use BIT macro.

As such one patch adds the QUIRK and only updates the macros that were
touched by that patch (to avoid the --strict warnings), and the second
patch cleans up the rest of the macros to use BIT macro for
consistency.

regards,

Peter

Return-Path: <SRS0=tRV6=F7=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B422ECDB474
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 21:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82F7BC433C9; Tue, 17 Oct 2023 21:27:08 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70B9DC433CC
	for <soc@kernel.org>; Tue, 17 Oct 2023 21:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70B9DC433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3b2e330033fso402153b6e.3
        for <soc@kernel.org>; Tue, 17 Oct 2023 14:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697578025; x=1698182825; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tRGfrHxWoOHPzxGnVVhSuuyyQDUo3sqJGVkRTYggdo=;
        b=b9G3UEkIttPBTa3Z7GPNb+7ZfYpYKzaL3FPxEodjqNP1bNU8uORJ5YUO6QQ0YdcCwM
         QKisTlSqIiU4pDcGywcFGzJIn++5ObBTdW0WsVa0ZKi0xuRPENAHm6SX2im6v8H4wlvV
         KE+0FPmmV5CM+xkN1r5nIvrhIQLTYnu0HCyggyZEkmXCVRHCeRGspyn3zyXXSu7AXD8i
         Q23SlmulFa6DiU0fe1I55nnEMQslK0Rd6OMcj0MyRb2lbdsuz0ncSkbw9sN3tCPfSJ9+
         ajj3l1QEka9nqL7X/pkf4iJts+I/j9q4rVOmay3GjNppq4VnYYLCRPUZEWWz82X5aWaT
         KbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697578025; x=1698182825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tRGfrHxWoOHPzxGnVVhSuuyyQDUo3sqJGVkRTYggdo=;
        b=rTXeGDJDfk4JvLOr8ZyPt0QiwGrssQ8IV6icRhwziil4ubfAFt9WAfJZ1PjuEdrAaa
         HvGA0XCfvL6kBkTlEF3xMKuznUuoFOXSyDnTBMZuWM8sUbLzJ9ZbrYLUxveWn/sWQJAD
         7Zd4avhvc5zQy74BNoT78T4NmQ38KCxTky0fIAYdTBNil5XQ1t66jC9t9Q7eRCEHf1OT
         36GjOsXwz4sRU3GZkUfYRuIau9Ax2uJdK/7uEDprQG/8gly8QETS7uhBzKRqxipyizJl
         l8n9mF3IuRwLdTGhtkx0fltbgpu6NHI+QSNCzE11nT6fMctWrezrNMSMpQFU0kZ8BQ2A
         MbiA==
X-Gm-Message-State: AOJu0YzLM6smw3ddX4l5Zb03CBTZYP2jymvdov+2exuUzHKSdaXY9zk2
	z07Qa0Nc8a8tzQD0wV3UWrVc9Vjw7uUjt+Y6ilxJEA==
X-Google-Smtp-Source: AGHT+IF5b9jDbFhnYpUDNL+02jp8ieInItk/oKQM4ieg1jU6ykyregNmT1dlW9hSGnvb/SCDrM3NdjGxvBqr1MN3PGs=
X-Received: by 2002:a54:4e85:0:b0:3ae:5e0e:1671 with SMTP id
 c5-20020a544e85000000b003ae5e0e1671mr3410123oiy.4.1697578025510; Tue, 17 Oct
 2023 14:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-16-peter.griffin@linaro.org> <36dd4a24-00a0-4901-b621-b50384b1020c@roeck-us.net>
In-Reply-To: <36dd4a24-00a0-4901-b621-b50384b1020c@roeck-us.net>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Oct 2023 22:26:53 +0100
Message-ID: <CADrjBPqFwu6qs=-Tx+AKOoUOFgJQUF7XjmzJu9unbeY1w_amwA@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thanks for your review.

On Wed, 11 Oct 2023 at 22:20, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Oct 11, 2023 at 07:48:18PM +0100, Peter Griffin wrote:
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
> Sorry, I don't understand what the code is doing here.

No need to be sorry, I appreciate the review feedback and questions :)

>
> It looks like it enables window mode unconditionally (?). If so,
> what is the impact ? Does it mean that any code requesting multiple
> keepalives in a row on the affected hardware will now cause an
> immediate reset ? If so, what is the rationale ?

Essentially yes, it stops continual keepalives being issued as a
keepalive is only considered valid at certain times in the windowed
cycle.

By way of example, if the watchdog interval is 30s and wtmincnt is set
to *half* of wtcnt, then we would have a "closed window" for the first
15s whereby issuing a keepalive will reset the system, and a "open
window" for the second half of the interval where issuing a keepalive
would reset wtcnt (and be considered a valid service of the watchdog).

The rationale is to stop the watchdog being re-armed "too much" and
it should enable detection of abnormally early as well as abnormally
late servicing of the watchdog.

> Alternatively, if it enables window mode and configures it such
> that WTMINCNT is always equal or larger than WTCNT, what is the
> point of enabling window mode in the first place ?

I looked again, and you are indeed correct that the code currently is
essentially turning windowed mode into a no-op. This appears to be a
bug in the downstream driver as well. Setting WTMINCNT to half of
WTCNT results in a 50% closed, 50% open window, and works on the
hardware as I would expect. I guess this is a good example of why
upstreaming your code, and public code review results in better quality
drivers.

Thanks,

Peter

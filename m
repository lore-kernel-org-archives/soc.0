Return-Path: <SRS0=kXw4=HB=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E79C197A0
	for <soc@archiver.kernel.org>; Mon, 20 Nov 2023 22:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66F49C433D9; Mon, 20 Nov 2023 22:46:11 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07814C433C8
	for <soc@kernel.org>; Mon, 20 Nov 2023 22:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07814C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-778940531dbso314276185a.0
        for <soc@kernel.org>; Mon, 20 Nov 2023 14:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520369; x=1701125169; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njoGUAO/aKU6y+B0kYXrWx9rr0gLschtaZIB6sJvVdU=;
        b=RUrejrLUIiCNIWt0kjFtUSBHX0wD/GAGAEwzvdVCVR0dTt6+ZC9mqjNJ857q5yPxSl
         nsGwThpoBhHezOXR1NrIarE+yX+DfMThmrO8kmk/H0D98ltgFsB/JvP92tq3QWFi8aki
         4gVBr1IeNj2AZqwoCjzRvku+AeFzk1h5h4mW8Jnd+kFir/PFS2HgwPsdgSHRG0JemDPs
         l6RwjEUv3z9BigpsgOaW418zGv/Ns9ZCfHFQojvv8X9JL2YWGqF0zYeGcIpqraIu7rK+
         1yCMMPjydFPPa7CLoyLojRF6pE04SAoZ/ybN83+cfMVpO3QxI1N2TJGXM3QBjdtJRbY3
         X07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520369; x=1701125169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njoGUAO/aKU6y+B0kYXrWx9rr0gLschtaZIB6sJvVdU=;
        b=wVFewRgm/1aHOdQU8lqFB4STjlo2KdnFkdi3NZ0GjEpFYi1ptznQI232j9lyBYWRDA
         zfpKCCKAitw3RrW4Qs84FCyYOejUy3CmJKrY9Cqm/h3tgZxLcAAVTVcH1UAMY8Xc3Aj3
         CExOcddqzI+nF/xTtYHY18CLUMHzvL6M5AOMv3VstBG81o4mgLYnNYF08H/tAdbYsaSi
         flr7iLqgHpEuY7ChVeLQXKNLEs8bxv0AMC6Ec+5lqxYiDI0CCW0C94j8Z0fAp++zV1qn
         HgTZ/cNaWWdRmsNvQ9vqylS+2Jv97D3vMqOX0MKexBDBFXrTQgDPwkTfiLp33oMs6dbc
         8d1g==
X-Gm-Message-State: AOJu0YwDlQj0emg0h8bayzBc4lmJPjDg1i1LHlNPRBDZZU4xx6HLsWA1
	7awsJcboQtrbWt9PtRdd9lI66Wu7rd0CvUZlXwBrIA==
X-Google-Smtp-Source: AGHT+IG/+m3xt7ccY8eDIleAiRsOAh79Ehhifx5D3WhBv4fQmrHh9AAauod19bUGyqw4eilwyZq13diIFEILCwXsTac=
X-Received: by 2002:ad4:4ea9:0:b0:679:e195:b071 with SMTP id
 ed9-20020ad44ea9000000b00679e195b071mr3321524qvb.9.1700520368792; Mon, 20 Nov
 2023 14:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-16-peter.griffin@linaro.org> <5ee955e4-4c22-4696-8001-1e4f24952eeb@roeck-us.net>
In-Reply-To: <5ee955e4-4c22-4696-8001-1e4f24952eeb@roeck-us.net>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Nov 2023 22:45:57 +0000
Message-ID: <CADrjBPoHYTZiMCFKBtdaT6hFp9QO=GMzn5yE2k3Dg_mcBhrvkA@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Thanks for the review.

On Mon, 20 Nov 2023 at 22:00, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/20/23 13:20, Peter Griffin wrote:
> > The WDT uses the CPU core signal DBGACK to determine whether the SoC
> > is running in debug mode or not. If the DBGACK signal is asserted and
> > DBGACK_MASK is enabled, then WDT output and interrupt is masked.
> >
> > Presence of the DBGACK_MASK bit is determined by adding a new
> > QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
> > the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
> > drv_data_gs101_cl1 quirks.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >   drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
> >   1 file changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index 08b8c57dd812..ed561deeeed9 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -34,9 +34,10 @@
> >
> >   #define S3C2410_WTCNT_MAXCNT        0xffff
> >
> > -#define S3C2410_WTCON_RSTEN  (1 << 0)
> > -#define S3C2410_WTCON_INTEN  (1 << 2)
> > -#define S3C2410_WTCON_ENABLE (1 << 5)
> > +#define S3C2410_WTCON_RSTEN          (1 << 0)
> > +#define S3C2410_WTCON_INTEN          (1 << 2)
> > +#define S3C2410_WTCON_ENABLE         (1 << 5)
> > +#define S3C2410_WTCON_DBGACK_MASK    (1 << 16)
> >
> >   #define S3C2410_WTCON_DIV16 (0 << 3)
> >   #define S3C2410_WTCON_DIV32 (1 << 3)
> > @@ -107,12 +108,16 @@
> >    * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
> >    * with "watchdog counter enable" bit. That bit should be set to make watchdog
> >    * counter running.
> > + *
> > + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
> > + * WDT interrupt and reset request according to CPU core DBGACK signal.
>
> This is a bit difficult to understand. I _think_ it means that the DBGACK_MASK bit
> has to be set to be able to trigger interrupt and reset requests.

Not quite, it is a bit that controls masking the watchdog outputs when the SoC
is in debug mode.

> "masking" normally refers to disabling something (at least in interrupt context).
> "Enables masking WDT interrupt" sounds like the bit has to be set in order to
> be able to disable interupts, and the code below suggests that the bit has to be
> set for the driver to work. Is that the case ? It might make sense to explain this
> a bit further.

Maybe I explained it more clearly in the commit message than the comment

"The WDT uses the CPU core signal DBGACK to determine whether the SoC
is running in debug mode or not. If the DBGACK signal is asserted and
DBGACK_MASK is enabled, then WDT output and interrupt is masked."

Is that any clearer? Or maybe simpler again

"Enabling DBGACK_MASK bit masks the watchdog outputs when the SoC is
in debug mode. Debug mode is determined by the DBGACK CPU signal."

Let me know what you think is the clearest and most succinct and I can
update the comment.

>
> >    */
> >   #define QUIRK_HAS_WTCLRINT_REG                      (1 << 0)
> >   #define QUIRK_HAS_PMU_MASK_RESET            (1 << 1)
> >   #define QUIRK_HAS_PMU_RST_STAT                      (1 << 2)
> >   #define QUIRK_HAS_PMU_AUTO_DISABLE          (1 << 3)
> >   #define QUIRK_HAS_PMU_CNT_EN                        (1 << 4)
> > +#define QUIRK_HAS_DBGACK_BIT                 (1 << 5)
> >
> >   /* These quirks require that we have a PMU register map */
> >   #define QUIRKS_HAVE_PMUREG \
> > @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> >       .cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> >       .cnt_en_bit = 8,
> >       .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> > -               QUIRK_HAS_WTCLRINT_REG,
> > +               QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> >   };
> >
> >   static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> > @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> >       .cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> >       .cnt_en_bit = 7,
> >       .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> > -               QUIRK_HAS_WTCLRINT_REG,
> > +               QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> >   };
> >
> >   static const struct of_device_id s3c2410_wdt_match[] = {
> > @@ -408,6 +413,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> >       return 0;
> >   }
> >
> > +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
>
> I think I must be missing something. This is only ever called with mask==true,
> meaning the bit, if present, is always set.
>
> Why not call the function s3c2410wdt_set_dbgack() and drop the unnecessary
> parameter ?

I can update like you suggest, it would simplify the logic a little bit.

regards,

Peter.

Return-Path: <SRS0=d/XQ=EJ=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B786EC3DA6F
	for <soc@archiver.kernel.org>; Thu, 24 Aug 2023 07:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C834C433CA; Thu, 24 Aug 2023 07:44:21 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AD85C433C7
	for <soc@kernel.org>; Thu, 24 Aug 2023 07:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AD85C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-44d3cdba3f6so2102248137.2
        for <soc@kernel.org>; Thu, 24 Aug 2023 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692863059; x=1693467859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vbnvrj8jD+jFxmIgPUBsLHTIdjYzkW13qtC1PHUVzMg=;
        b=2AtQmNlP4CjrQ7nLLUuHBL1+iBuxJeioF0wgb5a9oAa0e8E28lxZtsK8MjpJLeEr7v
         VISToIgd/eBP1Uu1YCDkVLYew4KLJNY4bHK53IIOZRMFEUMLSiaJSUdABxiuPvQObGCy
         cecF0IVVdyINhyKYis+bldc/fhIhcPIfSfpT8T0nWIOtVaw+yfqMucGm2zbrofhJBdu0
         hLa/CVaeF0FgCEk1XICpyM3F9kMAVW0Q/cGkrdkcsXXuVd+bBSIHEj23Em5Zs6lrbV+c
         gQ5eWCs2beCeA+IwHuArgBllx/nImQ2CwbyA44Bbe6r0Z6yy1+qHtM4W75HpRiQa85dP
         s7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692863059; x=1693467859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vbnvrj8jD+jFxmIgPUBsLHTIdjYzkW13qtC1PHUVzMg=;
        b=k2S8gk3z6gju6mms5zmYIOGO0uXyVZR1zbMxWx4hRTxQ1Pshoihz4a9jO/vIaod+By
         tpvDXEnAnSwD3hR+XFH2sfjFrFb4H8FGxKwYWlk1Qi6NJM/DmOT8H4LyWOFywmUko0+R
         C4Dv4YnkIG0XcT2Z6HNMK/q0AByaFyO1I/CThJ9pOqt/sufa3g7MwoYt5XXiR62Rzove
         khtOiMVdZrxQAiiTGnOGRzZaVmlBkC5U/xtSugJJLc7Pwh/UFc3DAgoIH0vz1ZGKUlm+
         /xJd4SMzOShGvEtcP+14ajQcUNfIL09HX9NHOl3Okaw2EygDnJHIZr+akvedLu/B4Xay
         tfwA==
X-Gm-Message-State: AOJu0YxSblzR5UpVXYGie8Y2xYwrXYRZ4LaleE+15I61Yif6yX+Dt288
	3KjtUOxM6ESZsyU/M5Gf2qO/x4tfHa0QXSGTr3bt8A==
X-Google-Smtp-Source: AGHT+IGpAXZI8kTnpgAkhlHjfliupu+y8oncXlWQ/jH2NUqV8pLRu+hFNCwO3b6YH6Gl0Xbqg6CM///rSyrVY4WAP6U=
X-Received: by 2002:a05:6102:1cf:b0:44d:50f0:f43e with SMTP id
 s15-20020a05610201cf00b0044d50f0f43emr9500732vsq.30.1692863059115; Thu, 24
 Aug 2023 00:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230823165637.2466480-1-robh@kernel.org>
In-Reply-To: <20230823165637.2466480-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Aug 2023 09:44:08 +0200
Message-ID: <CAMRc=Mc5RaCWBs1DKPLbbgHdZ+xr+9WaCu50j4OavtVeaq5fXw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: davinci: Drop unused includes
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 6:57=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> of_platform.h include is not needed, so drop it. It implicitly includes
> of.h (for now) which is needed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Arnd, Here's one more that slipped thru the cracks. Please take
> directly.
>
> v2: Fix subject to be 'davinci' not 'keystone'
> ---
>  arch/arm/mach-davinci/pdata-quirks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-davinci/pdata-quirks.c b/arch/arm/mach-davinci=
/pdata-quirks.c
> index b8b5f1a5e092..b5b5c7bda61e 100644
> --- a/arch/arm/mach-davinci/pdata-quirks.c
> +++ b/arch/arm/mach-davinci/pdata-quirks.c
> @@ -5,7 +5,7 @@
>   * Copyright (C) 2016 BayLibre, Inc
>   */
>  #include <linux/kernel.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>
>  #include <media/i2c/tvp514x.h>
>  #include <media/i2c/adv7343.h>
> --
> 2.40.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

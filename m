Return-Path: <SRS0=57W1=HV=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31722C4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 23:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1660FC433D9; Sun, 10 Dec 2023 23:37:38 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16F27C433C8
	for <soc@kernel.org>; Sun, 10 Dec 2023 23:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16F27C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-286b45c5a8dso4042569a91.1
        for <soc@kernel.org>; Sun, 10 Dec 2023 15:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702251456; x=1702856256; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktrngxJslvgVofvGRW3XnDoVArwbSMEwYrvNDYxqRMM=;
        b=iM8fa3RM0tx6VGrSK2UB8goP6Q3cOVGMgOS5dEKcA1z3czSYIxnjR9WDKEdNALDBJp
         5bhv7nE1NIXPTwsR/dM7l49vjAmwK1qF7qDEKWi9oMZBt4lPVhQt1JnlUhNL7WsGzAxn
         kQaoZWgf/rq/EXvJJA51qhWQ6T1Rc6FlgpXT/0dUBPVGhXsg4Oa+gbWGtLst7IRqzqT+
         DhEa0NWZtNzjD6e9FUPStfGZV10VZ1RnZkZqY4SFk+utFgj0984eBlF/2rMiwmooG+tc
         Ob0TjMoIkFMf/t9CZNrhTqPXqc6+HknSEDMc0HcEx0CkGcD986LxRGn4ShZMYBjoKncF
         nWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702251456; x=1702856256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktrngxJslvgVofvGRW3XnDoVArwbSMEwYrvNDYxqRMM=;
        b=p6WA1T4y3RIw+dGAAXALAqRJ8/6DEZOybn+0OpaxzBkNMWqFoTlqEkDoNKsPUU0GLF
         jkSdEnDBrFyPrIjEy8wBt2KUFQ4bLxNh3s1eC19xLOUqI/922fMrzSbGT/llw+z/hU4S
         tEK4vZnSRdC4xh3jCQtGvk682995HWCWBEjzdm3sD911++osrLF0HGvKfI3+b+WCqGBt
         ZQVL7MLCXTFuUDUxDx1BP2tPVErWq4McScVeYV0U2NccLWJs6l8SL+X5rzKpsOvbX8qD
         XiYFdKIffBMgbvDBogn7o+lLXZ/ZuEaWX6TINGpsS3lcDLQ7+yywYvyYU2j1mMUmJSkr
         VDMA==
X-Gm-Message-State: AOJu0YyYOed/ND/qapS7+OVie21zuvs2TpVvGGYjRemYTF9qguRH/Gt4
	1Rw16rzB1tWcEYY0RAPWeqz1J4TtuR6tzJRhh3shVA==
X-Google-Smtp-Source: AGHT+IGLsgr8i/Ys8RGtN0SYISZJUKEzU9RuUMU3J9K3efZNFIaGcYANt6ADR27OrFr246GC+h9HKAnCTaXxkKGU5BA=
X-Received: by 2002:a17:90a:db08:b0:286:6cc1:7803 with SMTP id
 g8-20020a17090adb0800b002866cc17803mr2455327pjv.70.1702251456635; Sun, 10 Dec
 2023 15:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20231209233106.147416-1-peter.griffin@linaro.org> <20231209233106.147416-16-peter.griffin@linaro.org>
In-Reply-To: <20231209233106.147416-16-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sun, 10 Dec 2023 17:37:25 -0600
Message-ID: <CAPLW+4nUT8Nf9zC6UrAMJ_OpLNqe7JWxKy7xp1+_+emNgG4qkA@mail.gmail.com>
Subject: Re: [PATCH v6 15/20] watchdog: s3c2410_wdt: Update QUIRK macros to
 use BIT macro
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 9, 2023 at 5:31=E2=80=AFPM Peter Griffin <peter.griffin@linaro.=
org> wrote:
>
> Update the remaining QUIRK macros to use the BIT macro.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/s3c2410_wdt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 7ecb762a371d..b7a03668f743 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -107,11 +107,11 @@
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debu=
g mode.
>   * Debug mode is determined by the DBGACK CPU signal.
>   */
> -#define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
> -#define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
> -#define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
> -#define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
> -#define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> +#define QUIRK_HAS_WTCLRINT_REG                 BIT(0)
> +#define QUIRK_HAS_PMU_MASK_RESET               BIT(1)
> +#define QUIRK_HAS_PMU_RST_STAT                 BIT(2)
> +#define QUIRK_HAS_PMU_AUTO_DISABLE             BIT(3)
> +#define QUIRK_HAS_PMU_CNT_EN                   BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT                   BIT(5)
>
>  /* These quirks require that we have a PMU register map */
> --
> 2.43.0.472.g3155946c3a-goog
>

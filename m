Return-Path: <SRS0=rYwF=NH=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6986AC25B76
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 18:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23D8CC32781; Wed,  5 Jun 2024 18:41:43 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B163C2BD11;
	Wed,  5 Jun 2024 18:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B163C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6269885572so225304266b.1;
        Wed, 05 Jun 2024 11:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717612900; x=1718217700; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6m6zvPNCONgOQ02t56icemdM8C22VgqfCNng4SRsow=;
        b=QY7JWu47bfC4WNR79ernAOMdVBTm/YREqQWOLykfntFwVfmkr/COfm1pESOzTZd61Z
         2sm5CJUqdPgvlNQEU4dZdO2UMPU1S8uk8+Dhvgqvg66VjSjwagEPrf2v11/ox5Cu8I7H
         02UV6NIT6rzIlyWp6tAgSO/BuT41xv46ypG9sfuMGVPHKhZPulCY6yc1Q9ur+1LP+Pgb
         3iZV3jSIzTKdWmHSPksSbrxONRj3mbAJhOElUfLb20mPpIMP6AslabSiiD1/7itpaCK5
         KQ4gAJSJyBYZvE0ammF5wWQTmM9CcJXdCzMnMhJybDEmWA/ud/C5VkD+klLnH9DXETQJ
         tZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717612900; x=1718217700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6m6zvPNCONgOQ02t56icemdM8C22VgqfCNng4SRsow=;
        b=cQBN/rjuhrmfTOxvB2IfsfLcwVOG89E/h+Wo0ukDD/dcFcrP8+VKy/QoRl6d8RCJ10
         eRCttims+rsByTW9KVyT6wNHp4cstlVxysIcb+Hjej1qATO4RFM9QywmoDDqu4Hdrk5c
         y6mHe914SsWUAoB0ovzLIpnoSh4w2MWPDnqzRUAR+BRidG6BDaslftv5vvINKKRkA1mH
         WBgE6OG8O09wyT4qEzW2qvjz1D0kq/AkjyG4vBrafe1GAZBhtEGM0uk6MUNFuQoyIElu
         7bWAsEXAW3/L8ldoAmTcB99WPYRMrJNZxfQstwKmRsVnuX7qGRkicPuLrqAwTy6mJYFa
         5L2w==
X-Forwarded-Encrypted: i=1; AJvYcCWt6ui7vzqEzkvdQ4wslZ1FgYWf8IIVAERl6khBiRY8W45NBI7pdQTXmyF/4yxmsfTHqx3fsuq7clS3Gjod07YjJbEpFEW5DQNlAR7QLqsMqM2k38BTvtu5e7WjQrK06A==
X-Gm-Message-State: AOJu0YyOlleZwID/pa22rYYlAqguOU9YOfT+RUBWr4NorXgb5f6uyiGQ
	HoruUdaIQ9WDiK7A5Ar89tPmtgGp6a/OsNB7PUhPUwR3UX+lajM/jQyeEaIKnagCPJEbnbgHV6d
	85hRjXUhLqZrZExSbP0ZSlLnQTjzQW2Rf
X-Google-Smtp-Source: AGHT+IGML0Cuh1nuv/mQ8qwMO6N4gEQXI+dqsnRoa+DNPnaGOGNLTi2rLSCqdTEc9SKpCcVojKqkjGR5jjRi4vR8Quc=
X-Received: by 2002:a17:906:f984:b0:a59:a85c:a5ca with SMTP id
 a640c23a62f3a-a6c75f941ebmr41888666b.7.1717612900050; Wed, 05 Jun 2024
 11:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-5-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-5-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:41:04 +0300
Message-ID: <CAHp75Vcdd2LCbiiQj=ejGbOWSun-EfodDKmhr-Y0XcTZ22a4KA@mail.gmail.com>
Subject: Re: [PATCH v11 4/8] platform: cznic: turris-omnia-mcu: Add support
 for poweroff and wakeup
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add support for true board poweroff (MCU can disable all unnecessary
> voltage regulators) and wakeup at a specified time, implemented via a
> RTC driver so that the rtcwake utility can be used to configure it.

...

> +#include <linux/crc32.h>
> +#include <linux/delay.h>

+ device.h
+ err.h

> +#include <linux/i2c.h>

+ kstrtox.h

> +#include <linux/reboot.h>
> +#include <linux/rtc.h>
> +#include <linux/sysfs.h>

> +#include <linux/turris-omnia-mcu-interface.h>

As per other patches.

> +#include <linux/types.h>
> +
> +#include "turris-omnia-mcu.h"

...

> +       struct device *dev =3D kobj_to_dev(kobj);

Is this declared in device.h or elsewhere?

...

> +#include <linux/rtc.h>

I don't see you need it.
Just

struct rtc_device;

should suffice.

>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <asm/byteorder.h>
> +#include <asm/unaligned.h>

...

With the above being addressed, LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

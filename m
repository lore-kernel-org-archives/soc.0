Return-Path: <SRS0=rYwF=NH=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE528C27C52
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 18:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4CEDC3277B; Wed,  5 Jun 2024 18:45:50 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2B40C2BD11;
	Wed,  5 Jun 2024 18:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2B40C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6c7ae658d0so7207966b.0;
        Wed, 05 Jun 2024 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717613148; x=1718217948; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO3YJpszn4i2dYWjd6GDXV+JNvlKtW6b8xd+9T4kcl0=;
        b=Yg8NSgfhYBB+bBN3Q1AZGNUoNkeMapVoy3RiwTm3N3qMkS7jTwktw2RFPVG6seUCen
         snkoK/kNk5ivPx09U4RUYVoYMFfrR3/P+Kjas3nJltFeG3IcX5qVLhSpmS0TFSqlHq5+
         yDWY2qq1pcPyyJ5swoobqPHQp7/m7VtEu+TKzYVsMbarwVUYz1NtSrCfaw8tcIeL39Hn
         oUl+S9C12EQJ9p3uYbU+tntOuLaHgwVHLLn2lmYYOJg+Z5QmFzRuyhvTMRJAGYiZoCHB
         qDkvqY+vJ6eRO1ayuCS27YAb659Lgs5q7gSDAbOc9jnqm7Q4AzB6jEO9VxvXi8YGVqzV
         iZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717613148; x=1718217948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KO3YJpszn4i2dYWjd6GDXV+JNvlKtW6b8xd+9T4kcl0=;
        b=Xqp0n2GzWiiGb8Lnlugw2DSBkD9FRLmnsfvgRjta+6o0FkuPcZODJfuMVuSDo5y/nO
         j33EdoTN39olT0Ds8FQNzZ1bismnJCgZhWvvawIq/BT6LT+oqEpXE+CDOlBrAzeqEu39
         f2cRMbB1cyzAutaRvXziGtLqO5lsry+v1TGaaW6Eqo7hM4/BtLzXrJFuwgQrVz6zsHDG
         X9GNxbssk+id1QFntboUpuaban6YeOTChRRhaTGl3PoemS33ByfCDCuebg2mxXB+anKc
         9QTGS08It/q8BjroC8BaSe0T5Vx3KLd7fgOiFonup2JpfPasI6hwB648I7rJsEwJfIAX
         Y69A==
X-Forwarded-Encrypted: i=1; AJvYcCW3UDIHm+MLvdH2DhqB2nUYvQRfScBZVN9b308waMbXYEZDyYuQYA2je1uoxFin+gxEJNtS1yM5Ix+wA3Rcs4hFKY1SdpFDTy6iplx85NPR90eyOdDtl1t1gD+Hql0yMg==
X-Gm-Message-State: AOJu0Yzjtiy8AZDEhlCUcs73q4sH6n41oiBtPgBTDChR3xx7jB5DwiXU
	ZObHqQMdq1R26cVs9GuztwPO/XVMpnGVNjLS5btIoY4hts92fzuWg95N5ef2rhBclw18RW9IKoV
	bnY2Rj/Nyqv8ctEmcrs8xBT2pjrOWh7U5
X-Google-Smtp-Source: AGHT+IHMAqLqsfwgU4jp0MKB/YVD1Gmi/UuOwjhc3pR/zh3OZZjcWDqxUdG7mpFATGq7swY87VEpnHuv+bckNYFhb/Q=
X-Received: by 2002:a17:906:ad9:b0:a68:b73d:30d0 with SMTP id
 a640c23a62f3a-a699f363821mr271306166b.6.1717613147772; Wed, 05 Jun 2024
 11:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-6-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-6-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:45:11 +0300
Message-ID: <CAHp75Vf6U1dSKoGkgQsk_u55H=zjhce=VBnnn07pqu+VnVBR+g@mail.gmail.com>
Subject: Re: [PATCH v11 5/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-watchdog@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add support for the watchdog mechanism provided by the MCU.

...

+ bitops.h
+ dev_printk.h

> +#include <linux/i2c.h>
> +#include <linux/moduleparam.h>

> +#include <linux/turris-omnia-mcu-interface.h>

As per other patches.

> +#include <linux/types.h>
> +#include <linux/units.h>
> +#include <linux/watchdog.h>
> +
> +#include "turris-omnia-mcu.h"

struct device;

Alternatively instead of dev_printk.h + struct device forward
declaration --> device.h.

...

With the above being addressed, LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

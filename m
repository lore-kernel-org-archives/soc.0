Return-Path: <SRS0=rYwF=NH=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E14C25B76
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 18:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48D47C4AF08; Wed,  5 Jun 2024 18:05:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CE09C2BD11;
	Wed,  5 Jun 2024 18:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CE09C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so13805566b.2;
        Wed, 05 Jun 2024 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717610704; x=1718215504; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=my3UZfUe7kM4u8AuhMa7F42Fri1dYIgy1VNRL62itHU=;
        b=fi77DQWkzJy93/PKhutlVXjQIz5SBlZEeHqHPPXSAvVWktKkP0Jbkx3yx121f/KjtP
         Fat4afnBKMhN9514zMmPgy2ooJlWNYHe5FbsQEtvYh+Rjc9GChNz3wmqmeFxJY/1p4/D
         FliqcG3za9Gevi4rJH9LpkE5AYgnQvkDTHFUPBT5AcxYbwCRqQ0CZo39c46/tqdo8Ij0
         3hKpgzjtFy/ocZUM8XUhtcPVZk4dX5Xq4eOcMrCntlHnTBPSuGKJLvy71zlHNi1bNNbz
         WT/g35y6eMSvsLSllv+GFTCE6HYzuaDkFYxoSe3iYV5NrSBa+Qo5rI0q8NOs3xEabIj0
         aCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610704; x=1718215504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my3UZfUe7kM4u8AuhMa7F42Fri1dYIgy1VNRL62itHU=;
        b=SugCYzu+Ps6kuVBr/uukhE0dAGwvvmU4VasbIS5OUyt3llKL/UL4yLQVGiM+0ltCwR
         7zYdimVkhWhV8nUj4WlhDWcFL5MKpJEfAGX4VbI57W/UKf/w6faJ9Ode1eaCnU8Yzoc6
         1FJsDfX7LNLMbsgyGE2fHohBViZrRu1gitTo1fIBbbevjNeVU335qdDHe96ImAMLFiXq
         iChDIT+lBlnd9kQag9N293QJfrddhn5CkhLwEe/liEN8sYTfLAlmBe2ccQknn/HsPCRO
         P0NJ3FTz0LhZNyCoh/xZutOqdZZt7+SXGYWugmE/7uw8eWESPvQlhyEW/lYLqx7S9Con
         9plg==
X-Forwarded-Encrypted: i=1; AJvYcCXoQ0KvPmOkYXvC58YAte+hpyh7KD3KKA6dBSOL9r+MYDjZoLLim8YelTiCzfhIZj72vSsb4yyeFO8onys6ID1zVscj8TDUVpVYRLWvW5u4BlXSoQxnaZOMejoxtuGCtg==
X-Gm-Message-State: AOJu0YyanyW0s+yfT+l16oQ0zWWuK/+/gDbxexJxZYBO+wo1sU93fFBb
	IpVmAlF47hfIjnV6O7u9sct8uTn9ICx/QiNkxB+QbQPIulUyylSbKbQWMk2KVSBdZPm1dwACqRi
	l2lib/SPzYFGRrso3flfePkD08N3DklxQ
X-Google-Smtp-Source: AGHT+IGhWTYwKt5+UnLZMLgA3WGENZ6y+3VeysAk+PsADmfk/ucAPuWrvI0YWMvgkFEa9EoLpDzWeoDtKMznAZZxEUo=
X-Received: by 2002:a17:906:ee89:b0:a68:379d:d623 with SMTP id
 a640c23a62f3a-a699fac0c4amr245842366b.36.1717610704188; Wed, 05 Jun 2024
 11:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-3-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-3-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:04:27 +0300
Message-ID: <CAHp75VccGwei9XE9vp04or7dbjOSvN7Hb0kvD06_H7=sFTKy_g@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] platform: cznic: Add preliminary support for
 Turris Omnia MCU
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

I paid attention to this block because of ETH_ALEN, see below.

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/hex.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

> +#include <linux/turris-omnia-mcu-interface.h>

This is part of the niche of the driver, I would move it

> +#include <linux/types.h>

t is followed by s :-)

> +#include <linux/string.h>
> +#include <linux/sysfs.h>

...here as a separate group.

> +#include "turris-omnia-mcu.h"

...

> +       /* we can't use ether_addr_copy() because reply is not u16-aligne=
d */
> +       memcpy(mcu->board_first_mac, &reply[9], ETH_ALEN);

The inclusion block misses the header for ETH_ALEN, but I realise that
instead it's better to use sizeof() as it makes this rely to the real
size of the buffer and header is not needed either.

...

Other than above LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

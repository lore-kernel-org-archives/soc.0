Return-Path: <SRS0=0S8+=NT=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F631C27C6E
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 08:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6216C4AF1D; Mon, 17 Jun 2024 08:38:46 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15CDEC3277B
	for <soc@kernel.org>; Mon, 17 Jun 2024 08:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15CDEC3277B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c819f6146so5697132e87.1
        for <soc@kernel.org>; Mon, 17 Jun 2024 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718613523; x=1719218323; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thWfJ5vNt6k/FERjkc7rTQHov2e1QQhet46euWcD5F0=;
        b=lTeASjl055bNtsDwoB56AvpS9YeDgM16WxbAeDGDMCMCixZtf2i0/qcKtBreoJ57kd
         oMnQvbfbrppzQHo0kDjljCAVVMiunViPQxc/qIIzVoW22jFUlLbfw7zirGwkcqQzrD55
         56HSBFtnkRPe0/WdBZ1YqqZT8AXSINDyFQQTQ2HxufHVRp4yPbG8mFDYDM0oyUsyCp8G
         Ut7BXrI65hm4djCAa0yxUzq3pWABtgq8Hm/3RBhlx5zbhj4TKXnlIACTt17Qifm7eP5v
         PhYNYL6UBuwk5nIvpGCqVMcDPgofcuCSSgZOZYQ/xuXvsVbdE7LmCkOKlTM2DHAruhQT
         m9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718613523; x=1719218323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thWfJ5vNt6k/FERjkc7rTQHov2e1QQhet46euWcD5F0=;
        b=a+6M3fjycWmOmzZzR1z3eOKFqFfbYzV9O3JDyLQvprxU8EtkBLBGrRt4AFkCGO4ZTH
         Ty5stJt6L4POvDPP3x1/zZZAjFJLiEse9Zj9Gy0BJxtN7/C2W+fPXWYFwxT5ajPMNUCI
         l0zqbVTQBDtKshKAzi/qlZw6Mcxq9RbgpAG18rK0diK5hU0GvgtzMLumTlsva7+IW1ib
         /yA40oHK8yXLHwrhXLjui82PQPVzxkstF9YGwdyNkEomyN+WWvAxIFQFgFJ+4XqBt+QA
         PN7dWUsl9nx8PzUeq/o+sCB349CHmroCaYQUp+QeU2oBHNrNmVijgyc0ycs5Q0JCPX+Y
         6lUA==
X-Forwarded-Encrypted: i=1; AJvYcCVSvQVZVgPvWPob00LameDvlidv06y/WCcZPYPyYQzRCq8xkR7MQdFsITtzayC657HpT6dT9ODXSzpPH5mg+A==
X-Gm-Message-State: AOJu0YwaDqloqYmJn4Davp7xjogJBCYN+u9l/cvZrENMU2tNQY+tWOv8
	8HN3J0s38IYBn2uh1tiBuZznZG3+r7Ku60AuP2+nvBhWfqfbWqIGXlKjlkaBCbmsMUx7U/w6xxs
	wlW4Sjd3j7i/cdOMtzBOxDICPJTW+ZtBTC7hgGg==
X-Google-Smtp-Source: AGHT+IGJlK0vVGGIsg6Q2X3INPPuJtHFwrlG6rzUW0S8GOjQaYt/T9rHb608AEKHM4d82TMbppTRKL6tXg7B/CaJKnc=
X-Received: by 2002:ac2:46e3:0:b0:52c:247d:2cfa with SMTP id
 2adb3069b0e04-52ca6e55075mr6615465e87.13.1718613523038; Mon, 17 Jun 2024
 01:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-7-kabel@kernel.org>
 <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
In-Reply-To: <CAHp75VfWZhmw00QP-ra4Zajn7LMvDW+NUT2fMx5kqeQ9eHLv5A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Jun 2024 10:38:31 +0200
Message-ID: <CAMRc=McmiZFwPneeCtYtqgLiapf9jP9=L8WBmCwQTsZdZVeaqg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU provided TRNG
To: Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 9:00=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
> >
> > Add support for true random number generator provided by the MCU.
> > New Omnia boards come without the Atmel SHA204-A chip. Instead the
> > crypto functionality is provided by new microcontroller, which has
> > a TRNG peripheral.
>
> +Cc: Bart for gpiochip_get_desc() usage.
>
> ...
>
> > +#include <linux/bitfield.h>
> > +#include <linux/completion.h>
>
> + errno.h
>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/hw_random.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/minmax.h>
> > +#include <linux/module.h>
> > +#include <linux/string.h>
>
> > +#include <linux/turris-omnia-mcu-interface.h>
>
> As per other patches.
>
> > +#include <linux/types.h>
> > +
> > +#include "turris-omnia-mcu.h"
>
> ...
>
> > +       irq_idx =3D omnia_int_to_gpio_idx[__bf_shf(OMNIA_INT_TRNG)];
> > +       irq =3D gpiod_to_irq(gpiochip_get_desc(&mcu->gc, irq_idx));
> > +       if (irq < 0)
> > +               return dev_err_probe(dev, irq, "Cannot get TRNG IRQ\n")=
;
>
> Okay, it's a bit more complicated than that. The gpiochip_get_desc()
> shouldn't be used. Bart, what can you suggest to do here? Opencoding
> it doesn't sound to me a (fully) correct approach in a long term.
>

Andy's worried about reference counting of the GPIO device. Maybe you
should just ref the GPIO device in irq_request_resources() and unref
it in irq_release_resources()? Then you could use gpiochip_get_desc()
just fine.

Bart

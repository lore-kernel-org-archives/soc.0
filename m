Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795774043;
	b=ljGre2/9AjVpmQAASdkrTvNNwAF61i0lcCEbl+3zJV7VuzcUjtqLvlW0Bb7cOEzqnerN
	 TS1pH0nXpdCxz87g7vkygLirOIz0Dxu0GbP1qU+NGcvkOARKSFgkH4dsuI/Mk3I9KN2uP
	 iyOO8V9S5Eu2MfYszVWRl1gmzFGfzRQcg//ID4fveMasqHjzUE5hjeTE4xD6pf4A5VbWm
	 BBFA9y4D6+fwhnkjBeOth0OPUdtYtDpXvQLvVDz0LYiONe326y6f0vn+OSjE3peDrX6a/
	 2+auK6arQ1Yo10t2b/hmWxvZeJzi/Ohp4+A8V7kocB9i6yKcoDk8pJtKBG2KHhBInWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
	b=QUymNwM9lkbAVy2eehiXd2FQLlRCUTxXgbZHITBNWy7SbQ5nCH0+Itw6o4anMPgtgft5
	 Wil+jiJbToStdKF1IMvI7XEBf3WK01rJsm0TJp6EzDYMWUcCpyZeREYklL8HnWzR62opS
	 hGMNEIV0Zs8I2sru+A9dir9k01eO8NsbchZJyfrx4bvwg6XW4m/7e8uhtVGdVpBeOpDOy
	 TNsNH04cm25r4OVVAvCsWrqI38Co44pRXo5T7btxZwwvpBOjpNu7Y/kMEe//EWI+XKGpA
	 LLMwRBDxQM738yXyJW2K/RVq/VEBHybRHEbxPD9WtJ3fIxRevzsZI99Gl+lTKgnNkQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W6w/yApS";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7612D606A324
	for <soc@lists.linux.dev>; Fri, 27 Nov 2026 10:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7612D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6w/yApS
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab4354db11so78634801fa.1
        for <soc@lists.linux.dev>; Fri, 27 Nov 2026 02:07:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774042; cv=none;
        d=google.com; s=arc-20260327;
        b=OtOiVtzP3xrKPoLFWQf3i3JQNe4qoJkb2eSFMjj1FQLiRIU8EJdWf44Y2Zjh4CCr6j
         lhCsNjvI5j1Ni6/LhLQ6gRfif9zNUuUJ+tPq4UbqHdaZCjrlldNYWWVvVxXSK6TcdCxc
         rtGYtQ7z7+9EVUusmHgykARveAYeGXHndyBD5doNde4Nno6ITlvRlhrRRlSPoA3V9F/h
         7URC0MfHsrdgxpJ/QyUMqLwFKWApEXtpuqw8jqKQnewT5agmdD7Dnv8R03NEAz+I8EqV
         yrsbrCC9Xc9L0h2P6D35b/KVG3y0BFco06+vTfLCiJWpH+fU8nBj69LHD+tiS6Oo85ZA
         ROHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        fh=jSm6YBKmMNhRcG352kVPGv0quLFp5YlsIMkaBBcMfds=;
        b=sn5RyokoXi8jhcww2xzWaDjGTyelJk3B9S7PH7bstFhKvAHDpsPkom697bJ/mvtR3v
         pH9GP7cL4aoLuWhL+uJ81oX6oWqnLYYmCpxPZ8Z3FzTU6nH7OQBFtbf6PFfWsSoARrkw
         gx7wu044m6Mb0etwxuuHDkpPBq/7hussbwhXzwFhB+KsflbTxCMKWyDSV8ppo4G0ISXD
         0TwWWFyqwTuerSWQ3qzsIWyLGGTN4bKVsH+7BNuU3ZECYpEuWJ3wt+a5yc33GWHtQ4eo
         yrACR42Kp15ylJEJoxEYETpSWcoaTSJfsHBr0aOodeepI2AcP0tOocK7BvKS9OSlHDOk
         45Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774042; x=1796378842; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=W6w/yApSN6ZFlLMXT1xsRs8+5KsESx2PjuZxEvGSb8C+lvtU/rywc6w/EjQWfwMgJf
         QLmoTm/nHdhP2eqmgh4jov7z0hNiCw3mXAgsKbu5oM/QGZrG8RYsa1t+eWXm03ROpy2V
         kAo0mfQrnqPU5n/YuB955j5C7486J2kd+5KMSyIKkY3hl+gnjDpzSlEkoW32eijysC9d
         u6w1nyVwVFvgcOVeL9C7ITppHdccS+77+CyuVoVPRc6DY9YfiutN3JuAygY2d6nhZSxa
         4yk8GAd9hmBxDfs/fQ8u2Bv69ccmseKCGlIPhiMGkMF+tWftVgyw59WCyToVY0mipagk
         WGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774042; x=1796378842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1iyI/0Mp18Cb7k2NsVPz111uBIRPwyZKwcAIivI8ro=;
        b=agPF7wYJiJ+XuXoMcoESHEK10hYK54+hJ72bGHaw3bcemwjrV22wT6F0iAxZGM3JMc
         hhAmvzC+uYWUlW+QkIVBvU75jDxLSlsVY0/Y8TPBfkuid8utDh9nrOnQzGvGmS+Jys7S
         XUjhkQihhjsbJiWVmDHQsCg1zXMzH7h53sr0FNSbsDV/SaafOj+v03Axcm6tYkSgCi1W
         X/F1aewwpRbWJyB821gn3Sj+9J495/zfY9x4PpzCshyc22lO/UiLEqt6K2VPM4CQL/5X
         lR73nYXfKlcDL0qNPOVXlfJsLSnF5XyFKpUKcINL0DPNoO3SzarBvPKhbzVwB5avgWK0
         kRAg==
X-Forwarded-Encrypted: i=1; AL+hErGXGhBq8T0QIGiU7VKyF71bfJrfc2ewgidm0AcsaFMIl8ucIfVj1NzsToVmAqUeFdLzb0Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z+i6XarB27XYsuLz8WV4kP85MKv5aAyIA8W0vaxl99Hl8FXFp2F
	aNzd/tJzAWCazTVpXTsDRpm4ij6+lak3YbXVKiLW12wkn0awApScybBW7U1AxlAKAWdx63PCuE0
	b0Px2/M3ooywiI7yvpHKpdFemQhB5/Y8=
X-Gm-Gg: AZFdTZeoJXDdrpqk6xtEUqQ8ikzMs2aiVKxQbkS7VjtRDoTt//Yobd9MoV75tIsgOsC
	lCRpXM4EjI2N9/Kf5/Wg7i5BrCOpY77/YrPOFyl1egzQvZiEVOOwDUri8lppdLeVTbKZq5keVB0
	jvnSdFZbT+7UOIHyknthBE4bRZ5YrHsI3dkclPvjfYUYyWbT97ersRcoY/BZXPB1Fe1LQfzKmty
	cjVDnkjHLGXOxv0kDg/7y/QmlCj9QRoZR3I6UkHziEU/B/wQgoUHa0KeOcYoQux0B2hkUFuRYYv
	NtUpg9r1fREZ5UtmQx3YM5toI8GYcJiyGJ1SvURLv4Oe0/MqOxu1kuGcloAcTrABAaMWegpBshk
	AjpftG+lkpPaDqTIPMNt7XN6ClAXiD6ULHlYe5VUXuSR9QlKKNcUXRPBCu40OB+GFIAcS1lcWjQ
	+UGhSn5vnE7k5h7EE+Y5ax9mzlpmxlaF0=
X-Received: by 2002:a05:651c:a344:b0:3ac:436e:4084 with SMTP id
 38308e7fff4ca-3ae7f9b2126mr75337521fa.4.1795774041405; Fri, 27 Nov 2026
 02:07:21 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com> <awQEjpz2572Y9wsB@monoceros>
In-Reply-To: <awQEjpz2572Y9wsB@monoceros>
From: =?UTF-8?B?57Gz55Sw5oKg56KB?= <yogo.0917.sabu@gmail.com>
Date: Fri, 27 Nov 2026 19:07:09 +0900
X-Gm-Features: Aa3M54qQEDKdWrHJxIfU9kb7QVNH017aRUBBckb6jwRibhb7ERXk9zIWhsR6uho
Message-ID: <CAJGK9zbBc94aMeXLuUZXrPOT+TbcD6HAejS1PgaCU-wO=ysY0Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:17:35AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote=
:
> > diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at=
550.c
> > new file mode 100644
> > index 000000000..11c9de0c9
> > --- /dev/null
> > +++ b/drivers/mmc/host/sdhci-at550.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivale=
nce. */
> > +#include <linux/mmc/host.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
>
> <linux/platform_device.h> already provides of_device_id without the
> implied dependencies you get by including <linux/mod_devicetable.h>. So
> please drop the latter.

Hi Uwe,

Thanks, I'll drop <linux/mod_devicetable.h> here as well in v3.

Best regards,
Yuugo

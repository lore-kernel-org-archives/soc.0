Return-Path: <SRS0=lwG7=QB=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034EACD3420
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 10:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE066C4CEC5; Tue,  3 Sep 2024 10:46:28 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB88FC4CEC4;
	Tue,  3 Sep 2024 10:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB88FC4CEC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a868831216cso593233366b.3;
        Tue, 03 Sep 2024 03:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725360386; x=1725965186; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwQxyK0ht6uxgVzN3BuGz8T+YN66iIRcYmjlriP9FTM=;
        b=DCFVMBxqdSieDh17pn4IeE3xxwAwoISSIPfwQGXzJ4SxBZrFlA0w13lgTUxeZC6N7f
         oH8+bv7xB2mW95IzXGRWaWVD7O0UJc7j0ojit3AnBgniQgx2MprtbU45SsPIbIddqSRd
         jIcy3o7QGQPWfPOtPjzYJgcyZSJDx9F4WQYr2F+/vAhvA8kKNqt7ZP4Pe+dEhDA07MpK
         uD7JmyGMGlJCI41P/gMql8h0Srw4aflc+J/4lBymIXHfTpkVgHLpCuFJH+5Kx2pQaIXT
         U8axdd7KZpSO2Ez7xvANMwzUzGjXnE+TKf4M8kB8ZBkeeT6TbwAa5wqckeKbzz/XsqvM
         bc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360386; x=1725965186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwQxyK0ht6uxgVzN3BuGz8T+YN66iIRcYmjlriP9FTM=;
        b=oo9Wmu1sXvpzH8bke3U9vN0fP+r4RrcNvoAULHjtDYThSKJZbePKkCGphjMawwfOPd
         Q3MtGapd00wntigkn9aAwErUajbBabS868jfGlZmhVFUSo7739uer3NCBfjQwnN+OfXN
         kM6XAoVEgzlJekFJ7BJeTrovokxR40ANPXbcXHvEHZnDitynMzAbZNgqOvVO/FgxuNEB
         f4JPfQ3fjUmxUltQfWNtKdq/Y9wcdpIlmoBhWE0lTydFGj9qGBWnRL/9rZItC4ohREG6
         bAzwe0voN4risCImLc+aCioTe+LY7lebuYe2wOCVeAZhW0f4xnzNx7oEOM+uYWCua0F1
         +4Kw==
X-Forwarded-Encrypted: i=1; AJvYcCV0z2ojBA8b1BZ/exbu6jMDPsesagr57YZAstuZU8UbONowsNud7LtfzkDJ2egZqsTVHaM1@kernel.org, AJvYcCX5MJBn/ns/tcXaAEcVSnjMddDRAvuyCx3HCxHKJwlIk3U1zX5xxArgRfFcCw5ghMWWEkW0@kernel.org, AJvYcCX7advSxRFUaA71cuEeYiACrNttIDZl5PYlON1nQnKKbcWdfpzepIPXQ/U/TG9wzLzn591H@kernel.org
X-Gm-Message-State: AOJu0YznIJmOxE2lPxcqWuYRCZ5mMZRyXVIMlHu7xQlMqqed8EOQXP/8
	K8y8GQsbB7vTv3Bx+PqBI43D1s+PNeT3F450Gf+IgT8WvTT87wCU3ZKUpXIl3Smf3PnALxFwnxR
	39HkQdE9So086L0Bs3kCVmLfCk5T40yPn
X-Google-Smtp-Source: AGHT+IE9NSYpni2EvkWTHxFmIVGuACZ10gRDVb8GLbO50DX7tFOE+e7dOu2U5anNiYtp1oAsZ3T1tkScx4dZID4OGyc=
X-Received: by 2002:a17:907:3f24:b0:a86:78fd:1df3 with SMTP id
 a640c23a62f3a-a89b972ba01mr652239866b.59.1725360385545; Tue, 03 Sep 2024
 03:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240903101930.16251-1-kabel@kernel.org> <20240903101930.16251-9-kabel@kernel.org>
In-Reply-To: <20240903101930.16251-9-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Sep 2024 13:45:49 +0300
Message-ID: <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:20=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Use dev_err_probe() instead of dev_err() + separate return where
> appropriate.

...

> +       if (ret)
> +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to so=
ftware mode\n", np);

Side note: Not sure how np is being used besides the messaging. If
it's only for the messaging, I would rather see %pfw and fwnode based
approach.

...

>         count =3D of_get_available_child_count(np);
> -       if (!count) {
> -               dev_err(dev, "LEDs are not defined in device tree!\n");
> -               return -ENODEV;
> -       } else if (count > OMNIA_BOARD_LEDS) {
> -               dev_err(dev, "Too many LEDs defined in device tree!\n");
> -               return -EINVAL;
> -       }
> +       if (!count)

Dunno if 'if (count =3D=3D 0)' would look better from the readability persp=
ective.

> +               return dev_err_probe(dev, -ENODEV, "LEDs are not defined =
in device tree!\n");
> +       else if (count > OMNIA_BOARD_LEDS)

Even in the original code the 'else' is redundant.

> +               return dev_err_probe(dev, -EINVAL, "Too many LEDs defined=
 in device tree!\n");

--=20
With Best Regards,
Andy Shevchenko

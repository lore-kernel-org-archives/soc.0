Return-Path: <SRS0=Ae9U=MN=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7678C25B5F
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 13:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AC84C32781; Fri, 10 May 2024 13:42:00 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B117FC113CC;
	Fri, 10 May 2024 13:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B117FC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a59ad344f7dso432341866b.0;
        Fri, 10 May 2024 06:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715348518; x=1715953318; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwdlNVwzS9nRsciNK1J/Ssg7pbcnDPO0oUNGNSAw7r4=;
        b=dgMc+710fDKGDvv9biBK88dGHz7LzIPY1ovycLO6oM5QRj1AiNP/i+03x5do3i2cIr
         simClER3+IA9GiNzyjeOrApYZSod95WSGLwT8f3iIZJAK4KgwUWCCmWbpw8zoJfJUDbh
         azv8iXx3jnTd1q9FvuEN3gW/n7HEOdu9JPIGtcSD1jdtYQasOt8hcz7uJhrLmUsf+Bh7
         VRODXn9gn07N6jQLDFCYL4ooc0/zP3qR5nUgQnSAoz1umOpdpy8gx74ksg9KwI0onAVM
         1aQbcZNoXw3gUQ+cjXq6Oq7ApBBRIHgof+BMMk7c2zXQh/tKdksJ/PMnbqQ8EwaHH572
         un8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348518; x=1715953318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwdlNVwzS9nRsciNK1J/Ssg7pbcnDPO0oUNGNSAw7r4=;
        b=ZTMCeGfDNHjFK55LzIUoM2hcyoecyqj/BKEhCQdpeUq0LCS5ZH3zG6PtfYkJ6tCEVH
         SjGccXSQ+7W/aGkpCH844qNKrQkBlQm8xLzdWkiwfeQVQ/vMhgJRhXOPOFW8sHV56gnq
         pCbSo5MqxKyci/pY3te+Z9gACE1xMGk8QBZEdqmcUAURZmJNEWcYDx80Ar82tE6HLqlg
         UTn2aJJ26iNA2BXcPNAiPfzqUDkJMKsSQFiCdspHIjvdl7zjcIJXn4f7lpaJfOIaqLzs
         pZ2TGlKtn5vHDok0rpluQVSfQ/Uo0e4Aq+BhjoC3ZqA3hv+OYqWEg5ziBeVQ3MTb/bYB
         Fvig==
X-Forwarded-Encrypted: i=1; AJvYcCWwpFp3OKtGvS1Aea3DzEGEKaT5Rd9f1l9wVzy076HkLr+Sfb90xpFXMiCbuxlkEZbecN5w4wATeY5pVZtLyTIQ4UNDeLoUXfChKBAQdWlTCRDh368kYQ47HATl6x0cuw==
X-Gm-Message-State: AOJu0YzpggaaPOV/JrQNDIytTA4AzikcWnj1wT84i7ZNCWjboTvHRwbd
	20ThWIU6RfQyo+BfkQkM6qrCKUcTy1eknJCgXraVz1vYJjo1QJNsZjkjvenFPT+/hxb7z3DZOuI
	kg7n6S97pTkstD13ES96gjUROMx7IbBhg
X-Google-Smtp-Source: AGHT+IG+GMq/0Zg0LuPNQxtUo2VyGH2fdQnK+X7ITrvdqHHsGXpWTJXWa8taALyVZQ5+t1G/H3kOiV9SITvuZtHcqf8=
X-Received: by 2002:a17:906:17c5:b0:a59:c9ad:bd26 with SMTP id
 a640c23a62f3a-a5a2d54c601mr168138466b.12.1715348517408; Fri, 10 May 2024
 06:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240510101819.13551-1-kabel@kernel.org> <20240510101819.13551-3-kabel@kernel.org>
In-Reply-To: <20240510101819.13551-3-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 16:41:20 +0300
Message-ID: <CAHp75VfdSqRbhek3eCPtdPtrv2FJyhpG0XvKFMfT9yrDsCjY2Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/9] platform: cznic: Add preliminary support for
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

On Fri, May 10, 2024 at 1:18=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

> +       err =3D omnia_cmd_read(client, cmd, &reply, sizeof(reply));
> +       if (!err)
> +               *dst =3D le32_to_cpu(reply);
> +
> +       return err;

Introduced here and "fixed" in the next patch. Something wrong with
rebasing / squashing?

You will need a v11 anyway. And you have now much more time for it,
don't forget to update the kernel version and date in the ABI
documentation.

--=20
With Best Regards,
Andy Shevchenko

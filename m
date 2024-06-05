Return-Path: <SRS0=rYwF=NH=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD3EC25B76
	for <soc@archiver.kernel.org>; Wed,  5 Jun 2024 19:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEFA9C4AF09; Wed,  5 Jun 2024 19:06:17 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0ADA7C2BD11;
	Wed,  5 Jun 2024 19:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0ADA7C2BD11
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a23997da3so151029a12.3;
        Wed, 05 Jun 2024 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717614375; x=1718219175; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq+M2c9YegqKnpKKBqVK3MQB5Dp/Y/BO95wVLDILlOU=;
        b=OOv13ufNomfyRyp79eh0BeNqDuacbzyjLVIm8c2+OEZhSO7bn0O+oy75Uf9UhKGlGR
         1a2kzeHOngwPpT1ixi7itCGNgMPy5pQVSw/s/FuxI7zT+EA3SS7lta11RyDpCEreqDS7
         kUQFNSfu14VV1zIqGum99Tezaw1/q1IHWRA3vtsyY3C8WY3qxJxfpdhlccGTmkTvZEla
         ezFwkpv03heRjVeaaFwvbKL8Vi4+jexYpBoDW6YDmTKoNm7pDFGsRWSSbEX+3cfIBUMb
         hJVEKLuBLROOFCsWgEFD8CX6Ca9DDlzgYou85ustrbptPNubOWOwsVxg+euGa7CxKAq5
         lHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717614375; x=1718219175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq+M2c9YegqKnpKKBqVK3MQB5Dp/Y/BO95wVLDILlOU=;
        b=fuVNCFtj3jnRhiTlykumigtU9+4zkYZ6a1NY9XZC+JaJhsSaVZ2kWYbimCM3CrnDKQ
         lhtXKWbJxWD9ilPG+zDnI3FTykPTp6wV0Qo0xerrL7h+8l3RsU9E6HArHirELofLkllJ
         plCkmwXmoosqVpYCyDByzOSuTe3+D4s3pKshJU0cqK6CwoN0iWjXYgyK66smyzcngx4D
         eRf8PhOgwAkrCcWsbQ176OnD7jhDwcYDhm/5wb010EQAfpLr7fFX+ULRU0qUsKy/l6Yg
         9gg0es3o5qNjxzfkyky+9LWBPwB7ocEE1Rk3v2GXtDRJmca0pfyZWDUkeBfoZRwTpEIe
         bXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIIKvYFqTsfJlMbf3zTuQqGW0kWlBLjQ0MnTi2drfSCslsTaAeg6Ssyoi6nPGRVu3XTocYPffQ600F84SNDEuyOM6lyeUX+PhVC7iJ4K+kyfkwvtxdx3jTa0MQz0GmFcXpp4+f4X24gv6CE4l0zXLM8ulpGO3BowwDObAg7rQqOMV/7sw+pMbgfpKpFZYUmuAFpL49tFSzKheTqtdVcPMLxT/KjWA5q5CrLyTSsA==
X-Gm-Message-State: AOJu0YwHtmn6v2LcjSTRqt2O3wNZLR9/JLd+e2YsPjzmd9/NRCGTaOH8
	vlaxS7xGvICZxV1cl5PkCmnRGzJ4EWvV86nl+0yjSl5W1AwEROYowKeZGr5U4OM5sZ5X68tBnP4
	Fnufb5k0KF0ASeoGDleib8d5GDP7Fj5hK
X-Google-Smtp-Source: AGHT+IF23/xRdP7P8N5y6TuoTb7yn/vvqWaiOXqdpB/ZldVT0IhlV6YfTjVPOUivLO9r24Qx7V84qrwKXUOA6fxB//M=
X-Received: by 2002:a17:906:4816:b0:a58:e3d9:e2d6 with SMTP id
 a640c23a62f3a-a69a024cf61mr221021566b.56.1717614374459; Wed, 05 Jun 2024
 12:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-1-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 22:05:37 +0300
Message-ID: <CAHp75VdGQUBnbZ2G4tLYBBCD+PeiY4G6HZ6U9ammSMg72TNX7Q@mail.gmail.com>
Subject: Re: [PATCH v11 0/8] Turris Omnia MCU driver
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, 
	Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Hello Andy, Hans, Ilpo, Arnd, Gregory, and others,
>
> this is v11 of the series adding Turris Omnia MCU driver.

Thank you!
There are a few small issues here and there, but overall LGTM. The
only one main question is what to do with gpiochip_get_desc(). I Cc'ed
Bart for this.

--=20
With Best Regards,
Andy Shevchenko

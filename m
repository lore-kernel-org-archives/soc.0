Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECC9C2BA1A
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 20:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 663E2C4AF53; Mon, 17 Jun 2024 20:30:29 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 097C6C4AF48;
	Mon, 17 Jun 2024 20:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 097C6C4AF48
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f177b78dcso607556166b.1;
        Mon, 17 Jun 2024 13:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718656226; x=1719261026; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MhmI6tBo3E0AIKzhvlpffRowK1r1gHa/WBinyjweRM=;
        b=h2vXhFwjWZ107T5f90TotrxdwVEZpHNFgrq7iVZIuVjI3GSYLA4729YO09vYQRPyLe
         //b0C7C7RVoc5x3PqKXZwuPPjDD40FBQoVR3yemYvJ78+YcS/nSK0ucz8CI9dIQl+Oc5
         7MX02/lWFzXazKhnhIyUCdFid01Pduxg/7yJr2zouCPC+oKFOWJmnxvXIshzeY2/CceN
         RSYV+xJYL/+J9y3KZ0SQPVDPH7mEmLdVO4i7g6bVhLS1YY+YM6oIWZr5bMl2MToJ1mO3
         m/E0AzvBGW8jD1dirDyoXA/aplcl/JqbKenKMd1RVNxCwOacjHD5VGJZ5dD1WuYD62I/
         as4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718656226; x=1719261026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MhmI6tBo3E0AIKzhvlpffRowK1r1gHa/WBinyjweRM=;
        b=lSz7sF218PsRlK9GdTcJ4PiRUAFAICVU/x3sqcw1n+Jyihs+YYtoUM91xecZq2KoD8
         yyI3n+E+R3dle+j7frDKC+3lg45GLBUbHDJvwYBq+eedp2JsYQVoKCCTJASTepgsOR0T
         d0xmR31YBlw7mPQVsbQnX9SuXj1dolxZOT9wyYlE6Zydx1S+fN/BsNR6HveEhU7Tgdf2
         xtZE9cBfAX3Vx4Z60/CNWQ6KWc0yGXz+GABkpQvzxW13ttU/vFNRKv5iPPyveSaWpd1P
         5vQh2Y2jrUGqXQ7Vzn4RtTPijM0ASkpkuOEnE8BFgPPt00fVb73KPm48o3J/mrApM8lh
         l8YA==
X-Forwarded-Encrypted: i=1; AJvYcCWqZkrUKZ6J5bBz8g59KTJKR4DxaN4Nq9IwfSWNashnB0nZDxZT7Q+sddLSOIlV3g0wl7FOy+OWw873SDDbTTOpi/QaOV7JccjU7mNR3lcIP7GHerEGwUcyNLb/fKzqPw==
X-Gm-Message-State: AOJu0YxXEM6cm6LqbZjVzN9Rg9LuTMlYO1eHajnphwNc8gZtlmmqRYMX
	u9UYOf7WmaEHctHHSaDJtL3YiBUylI2m7Q9WEp8KZetGhuawQWES8seIkRY94RGPbj+ntkivbKT
	SoOhRfXEuKduimK3/fxkOHHHMqV3CIWU1
X-Google-Smtp-Source: AGHT+IFe1OgX8lwxU/l7uWERx7nSAgPcVGOAMn3RBJESwSKasYXdjjZ0GHyFxVEoNRjntMwJ8u3kZk3Y+N6IAtHJ5Fs=
X-Received: by 2002:a17:906:6298:b0:a6f:98ff:99cc with SMTP id
 a640c23a62f3a-a6f98ff9cf0mr5807366b.5.1718656225955; Mon, 17 Jun 2024
 13:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-18-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-18-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 22:29:49 +0200
Message-ID: <CAHp75VeYg-5BxKaKQ0JaVnFWGxjS3sEB3Q8GtGTB4Mtt5M_15g@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] firmware: turris-mox-rwtm: Deduplicate command
 execution code
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 4:46=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Deduplicate rWTM command execution calls
>   mbox_send_message()
>   wait_for_completion()
>   mox_get_status()
> to one function
>   mox_rwtm_exec()

...

> +       struct armada_37xx_rwtm_tx_msg msg =3D {
> +               .args =3D { 1, rwtm->buf_phys, (max + 3) & ~3 },

I see that's in the original code, but perhaps later you want to
switch this to use ALIGN() macro.

> +       };

--=20
With Best Regards,
Andy Shevchenko

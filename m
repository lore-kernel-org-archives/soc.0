Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770F2C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 20:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CBC0C4AF1C; Mon, 17 Jun 2024 20:23:27 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46004C4AF1A;
	Mon, 17 Jun 2024 20:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46004C4AF1A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f09b457fdso440769066b.2;
        Mon, 17 Jun 2024 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718655804; x=1719260604; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZpL8bFgLmvveiNnNGCkQ4x6jqd8hPHneVJQ6rGkAMw=;
        b=FVUD8A0GdTKwzwI6RIditQENOQBRl/BgM11es+sAPW6IUiLQ+ZsGd2GnRGk+0wMDS2
         cZe6Zea3SwgHQ5XLftBfdjbuyEcDnZzs1ccW7VAIkpC9jrfILH/ALmIGyaKcxrxkFlh1
         ii2xNcER2WWaXyhxg6DqEJQBs2xHrse/Racm3DxWP3p/6azMBrUGms7rXSeDBoTvdLks
         jc5UD3OF3TyPIj2FIQpUGepWI43xoPEipUhaxpKFG7Q6Ove2zRaE1LVQG4IVLayWWTkP
         M3MeyRGLrCrKKa1lGu7PuMpvigaIlPNzt90dbtclvzmS7TYfBkUds71bO94whG3b69J6
         tI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718655804; x=1719260604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZpL8bFgLmvveiNnNGCkQ4x6jqd8hPHneVJQ6rGkAMw=;
        b=m1s3JY96UD/vaMj0ZK4o4ktKP1jrfWqzhC6lLHQwo+eEDPcjh4yI4O+NsiYhvlkGdm
         VNDm7cbqHrK4V5Uvqtkwz0I/s2t2QsFsq2VIWCImxqRhc0lvMLQqaCc2PpjrNWTXPvhX
         AGkggxiTEC/rcPVHBbiduJOqV9rlXJ0WVmGNxM3z/dkd2/sdv32ZcHZ4Y0ikryYHyZ5u
         9iCoDII3icv5vdfuwKOB5yW8Frc+qPNSzbKUZzx5W/2b6fYqCfWBxrw65R7wXHpLrxt4
         /3psh73ZYLYCXjqvAhBGAUU0keuWLUi1w9FbkmXR57wezIoNyDxKHvyg6nvdHw5hBsZN
         zKSA==
X-Forwarded-Encrypted: i=1; AJvYcCWBje15h6UUJ0KX81a4jnVO5yoFjxCaj69oPZ6seb2ve2NnguzRnVn/OuaWpW5I47JifDzSfs6mJkB7gqaiXEPNlNjKjoRTW3S6Ih3HJflU/JZvKN/CFR4LO8qKsmObCw==
X-Gm-Message-State: AOJu0Ywakzvf/m2fRXbfJb5Pn8ibH+/7hxMC3uaHqHwhwoAHeyKi1JY+
	xOkDgEsti4yM7KsnVMvUYlJGx4HUXG8upUX/SwHADYUq4ZIXNBAwHvbJuExy9Mmp6RqVtE7qWjy
	QUlsO3wGNZtKAVgk5mynlgKdh/zvCsL12
X-Google-Smtp-Source: AGHT+IFrLrQBuWXZobf4t7rzHuczUsD/7n/OLSy15TN6bfockQf20A9p9i+T8zXZ+4lvjwV46RjO0c871hWdiPkDqW0=
X-Received: by 2002:a17:906:1754:b0:a6f:4bf2:daa2 with SMTP id
 a640c23a62f3a-a6f60cefd80mr749187666b.15.1718655804128; Mon, 17 Jun 2024
 13:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-10-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-10-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 22:22:47 +0200
Message-ID: <CAHp75VfR8T+W6HWyvJ+xOP14GBeO+-2JFLUjiqV6tF_7qdr8Gw@mail.gmail.com>
Subject: Re: [PATCH v3 09/17] firmware: turris-mox-rwtm: Simplify debugfs code
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
> Simplify debugfs code: do not check for errors, as debugfs errors should
> be ignored, and use devm action for dropping the debugfs directory.

Actually you may do that without devm. There is a lookup method or so
in debugfs APIs that can be used. Can be amended later on, though.

--=20
With Best Regards,
Andy Shevchenko

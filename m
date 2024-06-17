Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3774CC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 19:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 241CDC4AF48; Mon, 17 Jun 2024 19:52:41 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25505C2BD10;
	Mon, 17 Jun 2024 19:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25505C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaea28868dso64862721fa.3;
        Mon, 17 Jun 2024 12:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718653958; x=1719258758; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAnOWYrLnN7oURbqKQYIsi/SP7/4lWgtqvJMMkuDW5I=;
        b=evo7oGIcNCAyaTV/scKOScnEA/axsr1UELqa2+hHpLc0dmZgvZXt2+q+J3cOn4Vw+q
         QXuo4/t0DKZ+ieCF9BvVQ22XY5iDZ4C61SM8CeJzNzGQWVPWsoULmeBCwb+dmsUL/wzp
         sCg4782J3Z9pJ8LK4Fl92guUeZcnUuLjJ+HNKcVcqsXb3xquN5MLAFOAyYdFoUsFaG71
         CiE48lZBF6P43ImmduyrWoznuQNca/HTCFFcenSp0ZhBGQqqZFVpCDVjDURArrNq4Dbv
         izWT9EtsGG49tJ3Gf5FpRLREs8FUKIxWpLLz6nBRajodWPYN3RKT80h7M/hRekiXnlzc
         rz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718653958; x=1719258758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAnOWYrLnN7oURbqKQYIsi/SP7/4lWgtqvJMMkuDW5I=;
        b=gKXbaNk6xxlj4TFte4X1LMi7Q4s6C94QYSiA3Fu7giJcosBz9qnoKXd02XFQy53Wjd
         7gndLxRBnP15bH6NeTrOAqCiqv3O1fKMZrWFOkYm3k+6LpTRhPI3IvESgmZLuP7TufU0
         1vGP3sciPF4xG32uW5/dVt92LHqhg3tsClMLAavfeg/ub9a/l/pSBxKe94ZZX3nGU/ne
         M3xHXKU97kNfFbS5+4py7QVE9HDub9V7oDqlrzLd2g8e8Fv6elKbNVAbAh9KeFsIk8Id
         DualJJoScXgLsOt3oPx0phMBTa03ZlENJD1w+UIYVn9CrO9x1wuaGRVzqqrNNNSjKs7f
         y+ow==
X-Forwarded-Encrypted: i=1; AJvYcCUGjqr86/U5SHKo+1HObCmX3g/SaNUF6MT4+2ceJh8KKGMCB4pkxyaZ2P55Frn7pAlTSsAdoeumnCSK5XTpn/uY2HTOS/0qmxYtyTUnb44gPvJ0Ka+bvm7JL7o6ly/CDw==
X-Gm-Message-State: AOJu0YyUyWKvLZ9GGhIDke7nPFV03qcGjW5VqrQWUeW3fS8l6SHwfKvn
	3/BGi2LZcjssqgGpFOp38Xd3DnKP0XGm8KVYbE7Gc040Lx8Ls0HSj8ZBR0FkjA7oT2g2lGiz8MA
	+jKba7JsE+qEh5I9wsck8fz8AauRS8BpW
X-Google-Smtp-Source: AGHT+IEuRcL6epFY5/iwx/x5DKTaBR1xzrQAbKOM9ZV7KxdA6zNgRklRHnJkK4IpuvW/Kr/GcgXihmH/KjbpzCfvKx4=
X-Received: by 2002:a2e:b8cb:0:b0:2ec:f68:51dd with SMTP id
 38308e7fff4ca-2ec0f68561bmr100891361fa.6.1718653957670; Mon, 17 Jun 2024
 12:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-7-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-7-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 21:52:01 +0200
Message-ID: <CAHp75VdC6y97keH5Ty=rgn1zY-zqGTtN0M3itxxCjeYHmALQQg@mail.gmail.com>
Subject: Re: [PATCH v3 06/17] firmware: turris-mox-rwtm: Hide signature
 related constants behind macros
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 4:45=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Hide signature generation related constants behind macros instead of
> hardcoding the values.
>
> Use SHA512_DIGEST_SIZE from crypto/sha2.h instead of hardcoded 64 as the
> message size.

...

>         /* 2 arrays of 17 32-bit words are 136 bytes */

Hmm... Comment now is a bit too precise. But okay :-)

> -       ret =3D simple_read_from_buffer(buf, len, ppos, rwtm->last_sig, 1=
36);
> +       ret =3D simple_read_from_buffer(buf, len, ppos, rwtm->last_sig,
> +                                     MOX_ECC_SIGNATURE_LEN);

I think sizeof() here is more robust.
No need to resend due to this.

--=20
With Best Regards,
Andy Shevchenko

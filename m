Return-Path: <SRS0=Afdu=NP=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3FFC27C6E
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 17:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89C2CC32789; Thu, 13 Jun 2024 17:52:35 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3756C32786;
	Thu, 13 Jun 2024 17:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3756C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso1487504a12.0;
        Thu, 13 Jun 2024 10:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718301153; x=1718905953; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKGtavcgahtFOZ6B+ztpvPTmQvfnRD029TYqU5IITMI=;
        b=P/OXyT33XOq2bub/hdJ0XQ169BslfOMLT/L0uZb0fS8n1B+UbZrUkiL5kdoAbTrIEG
         TzpyqVkzAStrnQ6i2wPxNqUt8yb0b/isoEWlZ9HW9Uq0u0dkFHUzIU4UVfoSy/sw19at
         eKPNGUk2grP/grf6diM3iq+6z0qXK6YLmvhicrrv5e5e7bfgoP1XNSWeKbTrIoj60ITe
         UQBYR442cCbBPu116X7XJBYdfY+iOp9TdtVyUJb0NG/IlMq/NHWenbOZy9GrrTWf2m1o
         druy6iWhqXjs5R6UNnL2U3wPNk7cHg6vriK4dhSBM0vTNZgIMTb7ZA7LwtsBEyLEafoa
         FQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301153; x=1718905953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKGtavcgahtFOZ6B+ztpvPTmQvfnRD029TYqU5IITMI=;
        b=ne8w/ZXSTpuu3mJi+aNd2LBq2l/lvWegGvUXNY7I/VhhVnurVklC73SUZsPOtEKUlh
         7HG1gOloO3age9BMDtyT/QYOM2pkgBG6qDwun5qcUOlpf9GVE60NE5tlJ2aPS/afPbE3
         cqahFE7D0Ta6lotoIZSxl2Bxcym4/MF/sGn2qJ7lPHcXfuhH8JVDkkSGVOp10033CO+S
         +/Wpi0doVhaCiJ1+IkKeV29WsrreYdW/0XSADKrKFFeWOiYJ35tNQtl6BoCBxY65Krax
         fnpeChvJcsGeUpwx61mM6qNSYwLD2hq9wAK6b5HLHZ6BzNEPdd8AoUtiYKS3obsEb19w
         dUcA==
X-Forwarded-Encrypted: i=1; AJvYcCWgR9V+6Rz1jpXDcOLx8MW71J38NcfzuSnIn11+l4GMzsqv6r/zglSWyLNoT35h2lNaC5y7g9vt5ZU4udZ8dXDyUKuqgi1a+FFjtx4DmAWFfIe0BKPp97FTzVIuc+oDIQ==
X-Gm-Message-State: AOJu0YyP5GIsGhcI/M/dwgwfnFSMIomo71evSPgI61zA5BfBAenh+oV3
	pFiE/mqSAjZrqoF5U+qll6Qd5Ud6JiDX47LL3XkAcgmKO3o/dqkSVq8gtMkupcg8M/ulqW9Onfj
	inkuIC/mvEcKiKhKmJynyK6Wq3WZ9SCc+VZ4QMQ==
X-Google-Smtp-Source: AGHT+IEhAP/MKvgnaJvNxcIVsiKmCR9dFEzXtKgb5hrhPVbsRIBzZuPsArrDgkq3q2rvs0Put/j/2tacMpMRe0PRpJk=
X-Received: by 2002:a17:906:cb99:b0:a6f:4827:7966 with SMTP id
 a640c23a62f3a-a6f60cef60emr31390566b.15.1718301152628; Thu, 13 Jun 2024
 10:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-4-kabel@kernel.org>
In-Reply-To: <20240613161045.29606-4-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 19:51:56 +0200
Message-ID: <CAHp75VeRjddGOG72dkH7pvrebA2-BkzrEH2ZBk0s8Xtk-bD1ew@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] firmware: turris-mox-rwtm: Use macro constant
 instead of hardcoded 4096
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:10=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
> allocated to one PAGE_SIZE bytes. Use new local macro constant
> RWTM_DMA_BUFFER_SIZE at allocation time and when used in mox_hwrng_read()=
.

...

> +#define RWTM_DMA_BUFFER_SIZE   PAGE_SIZE

Is it guaranteed to work on any possible PAGE_SIZE settings? We have
some architectures that may have it quite different to 4k. Even if
this driver will never be run in such an environment, strictly
speaking it might not be a good idea to replace 4096 with PAGE_SIZE.

...

> +       if (max > RWTM_DMA_BUFFER_SIZE)
> +               max =3D RWTM_DMA_BUFFER_SIZE;

You probably want max() from minmax.c.


--=20
With Best Regards,
Andy Shevchenko

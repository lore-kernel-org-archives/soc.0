Return-Path: <SRS0=Afdu=NP=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C0EC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 20:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40730C4AF1D; Thu, 13 Jun 2024 20:38:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48E4FC2BBFC;
	Thu, 13 Jun 2024 20:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48E4FC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so171439866b.1;
        Thu, 13 Jun 2024 13:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718311095; x=1718915895; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmk1vvKkViXH1BKYZCmSv6OzaNbP/ZmGqWAouKBj3f0=;
        b=lDpI7+hAMYP0vnECakik9z1UCRb8et8IcLu4Evt+n/c0rrna3XwLKA5iYa1EnzBMIk
         TocQdKs73PHqN7MnCH+erw/eXaEAnfF60uYafutTsSGLDvWTW4fs5WGL/m8FVOJjsqyR
         4OFPYZxK9RTAZFwHJRDGL2SWYqbYGPg5JARg1eVyDB6bqPTbtsq3EUakhff/c8emljKs
         IlVL8EN6CvFM8wSgXdMRSH/u/THSbeKYqmzHBlgiu94h/OJwCnupkv4tJCdA6dYxl2EK
         5BizxO261D4JuaykylYoEJmyWQrw3pZ33AQTUiXJ6bvsk6YwqUJ0xpUrOk7kKtlcT/ea
         P+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718311095; x=1718915895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mmk1vvKkViXH1BKYZCmSv6OzaNbP/ZmGqWAouKBj3f0=;
        b=sU3++D/s/NgbQDjSSev5lfyoiUDtyxW0D/Zg2FzSYkjNM00/MRFZ86pfPoMsLMLD0E
         SMa9WVujb82bTIiBJxBZq4Qbx3lHx4ymt1WjqU2//IlHHouN6IU8Pa61hEzzeJmFUV5y
         srZp1qH8dpp6SOy93SzJgX+Cy0zdR2HXNzq714pDUnEu7+hU/yrgwdd40xnpaFhTD0FS
         rpQespLvyXGrHAc9lOsjKrblk2rd7UFXZzroM8NOo6G6nXB5lNpWbgB/kf0MBkYo5z2K
         Ms3vpJ4K6TlJC99ideeYnyF+gzel9E3MgLkjtAm5aWlpdaPeKaoaUfnqnncC27sf3laf
         kcEg==
X-Forwarded-Encrypted: i=1; AJvYcCVnp1168nW/YPf2o9T9XJUIVuMHfogCFj4ES4+a1W0lZQ3ZNtHz3IFiwbPuVBmTFm/KvSWpcXRQ52ouT6907F5VYI8CdnJCtmOQd28o+REsMAJEsHClwbcB33P2gbQw2w==
X-Gm-Message-State: AOJu0YyXl05ujiuBItqiDCC48jWrBH238/ZXlFUxkQOaDWfqhi0X1q7h
	GRY2MA/kJ5PqHCTTB5cldH4Ndo1UhALBw2t9UqvljWKrzc9d0B7YcwAALKUb8swNPVW4hpHQ1Pv
	RksObog4lucrGNr/9Yhx/ldsCA92jq8WL/3fZgw==
X-Google-Smtp-Source: AGHT+IHD8VsclNElJrCWg1xq0snoIzRTvm+6R4I0MR0TeGsen5qC+6uvD1YyywacbTEEBh9ez2KaiELuOtsuWhKNsFY=
X-Received: by 2002:a17:906:b350:b0:a6e:f6b0:c49d with SMTP id
 a640c23a62f3a-a6f60d4294cmr54944766b.34.1718311095137; Thu, 13 Jun 2024
 13:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-10-kabel@kernel.org>
In-Reply-To: <20240613161045.29606-10-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 22:37:39 +0200
Message-ID: <CAHp75Vd8_57Jcx-QbHdjt0Ji6p=2Wt2SULnuHRRWz0cucM2H+w@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] firmware: turris-mox-rwtm: Simplify debugfs code
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Simplify debugfs code: do not check for errors, as debugfs errors should
> be ignored, and use devm action for dropping the debugfs directory.

...

> -static void rwtm_unregister_debugfs(struct mox_rwtm *rwtm)
> +static void rwtm_register_debugfs(struct mox_rwtm *rwtm)
>  {
> -       debugfs_remove_recursive(rwtm->debugfs_root);
> +       struct dentry *root;
> +
> +       root =3D debugfs_create_dir("turris-mox-rwtm", NULL);
> +
> +       devm_add_action_or_reset(rwtm->dev, rwtm_debugfs_release, root);

This is incorrect. If devm_add_action() fails, the root will be removed...

> +       debugfs_create_file_unsafe("do_sign", 0600, root, rwtm, &do_sign_=
fops);

...and this most likely will use the dangling pointer.

>  }


--=20
With Best Regards,
Andy Shevchenko

Return-Path: <SRS0=7EWm=QL=gmail.com=alexander.sverdlin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1121CEEEC21
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 06:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0160C4CEC5; Fri, 13 Sep 2024 06:16:07 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8FD1C4CEC0
	for <soc@kernel.org>; Fri, 13 Sep 2024 06:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8FD1C4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so60870166b.3
        for <soc@kernel.org>; Thu, 12 Sep 2024 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208165; x=1726812965; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K2XKfZDkgoL7BDyqjP/SOdS31KGHj4OCzliluT0C9aM=;
        b=XxkS/CsPRo4BrtTjrZKVSoP+y/ozv6mgyCJko739M/AGqZb1Yb/dRJ6+iqqGAEsHTt
         dumcX8RXZLgdpgCgDFPDUKso/8bpsKeRjhJuehq9dLfhYMZLvwT0gtIqraiezxgguPEI
         UdqncUqwgU/iLme8/D5X2tGfDvZ9D56hHyv91gCPgZ9BHV31M7GQj9fYEjOtxUO1TDYg
         QyMxb4DqtRiZwg23/vK9LyATSnToKqopGzs4PriwPUpfNjFWYY+MzKnXQBcWrGItGnJ4
         1CXwqhlWvNldsX3q6dRe7r44m2DMvk4Wtr4KBfCm/I1ESZqQqkXTUfLK54bCfjo1+j9p
         hXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208165; x=1726812965;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2XKfZDkgoL7BDyqjP/SOdS31KGHj4OCzliluT0C9aM=;
        b=sLImVzXARUQJ7CyRG+jbprwq/8JMJCuxTJHv3iPBWMvsVw1Jc/Ii8RWMpDmxasjfqh
         HamXu/ZZBNZuR23A9M38OIBSV+qUIa4tM7ZG+IZClQ8hiPTlC3RsaaWr1bEU08XSVwYf
         Q2801Icea3VWTvxmHSkDziEKEcEj0Oe1SI+ZDDgJ7evvad4ZdBBgVbLnOQD6qkEbhdtn
         BfmgWkaf+UwDx4sj/UGcFN6sHEmt3lYDz/aNV45h4+Vsa3pt/CQnIA1CWDmqowxDodfQ
         WMxuwO86JlQA9jgEBWQ3gK4bULLYD7m/Xj5tedsXh+2SDs5lVnaLWMj2kdWeMT4NuWoA
         qJzg==
X-Forwarded-Encrypted: i=1; AJvYcCVntQZAt65i5G3POH8UabyFuzTEOzdRfGTJyAiF/yOFtRs649UCK5fqV79vjJmDPyNE00w=@kernel.org
X-Gm-Message-State: AOJu0YzRM/abTTgjONUHRxPu/78dP4UELBmDdu3f4xSrvDbDxviMrZxU
	5jUud1tYfjqt6U2kNcw2TrQmaVQasBlAQ9OGZtqEdGJSCnwFpg+n
X-Google-Smtp-Source: AGHT+IGdMqgfJwm6plDLLOYKhuh6HaD4f0NuyIk7Tyb+sCdtBVwz+W2SnrCqq7LdsWGyUgfNOU7zzA==
X-Received: by 2002:a17:907:3fa7:b0:a86:812a:d2ca with SMTP id a640c23a62f3a-a9047ca9912mr118547166b.25.1726208164847;
        Thu, 12 Sep 2024 23:16:04 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72ef7sm833897966b.106.2024.09.12.23.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:16:04 -0700 (PDT)
Message-ID: <6bed11e8f75dd2566a47063014b53ee945aff41e.camel@gmail.com>
Subject: Re: [PATCH] pinctrl: ep93xx: Fix raster pins typo
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>, soc@kernel.org
Cc: kernel test robot <lkp@intel.com>
Date: Fri, 13 Sep 2024 08:16:50 +0200
In-Reply-To: <20240913045829.11904-1-nikita.shubin@maquefel.me>
References: <20240913045829.11904-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
MIME-Version: 1.0

Hi Nikita!

On Fri, 2024-09-13 at 07:58 +0300, Nikita Shubin wrote:
> Fix raster_on_sdram0_pins used in PMX_GROUP() instead of
> raster_on_sdram3_pins as it should be.
>=20
> Fixes: d1661439f5a3 ("pinctrl: add a Cirrus ep93xx SoC pin controller")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409130426.1OzNAC9M-lkp@i=
ntel.com/
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/pinctrl/pinctrl-ep93xx.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ep93xx.c b/drivers/pinctrl/pinctrl-e=
p93xx.c
> index 458cb0e99c65..abafbbb8fd6a 100644
> --- a/drivers/pinctrl/pinctrl-ep93xx.c
> +++ b/drivers/pinctrl/pinctrl-ep93xx.c
> @@ -714,7 +714,7 @@ static const struct ep93xx_pin_group ep9307_pin_group=
s[] =3D {
> =C2=A0	PMX_GROUP("i2s_on_ac97", ac97_ep9301_pins, EP93XX_SYSCON_DEVCFG_I2=
SONAC97,
> =C2=A0						EP93XX_SYSCON_DEVCFG_I2SONAC97),
> =C2=A0	PMX_GROUP("rasteronsdram0grp", raster_on_sdram0_pins, EP93XX_SYSCO=
N_DEVCFG_RASONP3, 0),
> -	PMX_GROUP("rasteronsdram3grp", raster_on_sdram0_pins, EP93XX_SYSCON_DEV=
CFG_RASONP3,
> +	PMX_GROUP("rasteronsdram3grp", raster_on_sdram3_pins, EP93XX_SYSCON_DEV=
CFG_RASONP3,
> =C2=A0							EP93XX_SYSCON_DEVCFG_RASONP3),
> =C2=A0	PMX_GROUP("gpio2agrp", gpio2a_9307_pins, EP93XX_SYSCON_DEVCFG_GONK=
,
> =C2=A0						EP93XX_SYSCON_DEVCFG_GONK),
> @@ -1159,7 +1159,7 @@ static const struct ep93xx_pin_group ep9312_pin_gro=
ups[] =3D {
> =C2=A0	PMX_GROUP("i2s_on_ac97", ac97_ep9312_pins, EP93XX_SYSCON_DEVCFG_I2=
SONAC97,
> =C2=A0						EP93XX_SYSCON_DEVCFG_I2SONAC97),
> =C2=A0	PMX_GROUP("rasteronsdram0grp", raster_on_sdram0_pins, EP93XX_SYSCO=
N_DEVCFG_RASONP3, 0),
> -	PMX_GROUP("rasteronsdram3grp", raster_on_sdram0_pins, EP93XX_SYSCON_DEV=
CFG_RASONP3,
> +	PMX_GROUP("rasteronsdram3grp", raster_on_sdram3_pins, EP93XX_SYSCON_DEV=
CFG_RASONP3,
> =C2=A0							EP93XX_SYSCON_DEVCFG_RASONP3),
> =C2=A0	PMX_GROUP("gpio2agrp", gpio2a_9312_pins, EP93XX_SYSCON_DEVCFG_GONK=
,
> =C2=A0						EP93XX_SYSCON_DEVCFG_GONK),

--=20
Alexander Sverdlin.


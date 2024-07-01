Return-Path: <SRS0=SQ6B=OB=bgdev.pl=brgl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF37AC2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 09:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94EFDC32786; Mon,  1 Jul 2024 09:37:58 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D1DFC4AF0C
	for <soc@kernel.org>; Mon,  1 Jul 2024 09:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D1DFC4AF0C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so31859811fa.3
        for <soc@kernel.org>; Mon, 01 Jul 2024 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719826675; x=1720431475; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4aHITYnWjEob+PIw1d85o31l+wtm6yxDVioQ0T5OqA=;
        b=vFG3TSBu/rp6tA2X1t1z8xEN2+WJYq6YpGqunxwjiwX/oEd468nere0L1plYFU0rmI
         xbDc3fqPp03Lw2pTkH0/KhNAyIF9WeZwTjTPeMl0SREtgRnbT8/RBLpQMev7BBTxOOJR
         2vBUUcAxzy9Xm9exSfetnETnQsOMRhARVlB5+oaCNEToy3/eficud460L8cl7nFQpXJd
         Z5S73Rhw6if3D1LwyX4rlp9FQGUpvdcTdM2kRGIXLb+AkyXdJCRke+v6lgOwTfv1H2Hw
         kNfLuZ2UqXvOm7S3zgveUCTnmkaxTX9DoA6BH7G2DSoM5VcCaZ0UK7NPPxns1y2Zwk+x
         k4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826675; x=1720431475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4aHITYnWjEob+PIw1d85o31l+wtm6yxDVioQ0T5OqA=;
        b=JiiXbG+CvLgwk7EOtPLvH8L9HUU5k2GgEYknWVxfST0dI85gEMkM6NgK6O8MVlC8im
         +P9/35tXDszvUdPIWS9rE+B941VjbXYAT/i+EWIAwVi38k+h+fCMgOlbUgGKvhUBdpgv
         pZ23p1jZYJTpiyBDg/XtSnmr1WMQoE9Atm5sj1sNXCJmB1LWHRz3WI765Uly+C8YtQ3S
         PQ39H5FbQHmNqSZJqNAMmWJpRj+srgrHjdz7h+54fp3uqlTbouawf+upHY/Bn7CbgLz3
         zQZ8eFFeYGoDwRADDDT8n8wokLtBhSvb+GEtHlo5buypUuaTgxI/ZDGdB4oRGifIcRqp
         bqHg==
X-Forwarded-Encrypted: i=1; AJvYcCXp9Nl+M2ROy0vkpJl2uxAR/U3O9/alDqIUHi3LyOpjNeaK9agAj/6PfgkW6Le8JGomNqM383CuqzKus6h9ww==
X-Gm-Message-State: AOJu0YzgRVQMmaVwI+1BopfXvHQsSjPhjRL7ruMJJnYJG9YbRqMBRyQk
	pTl3scx3CMFY4ecr97pWjXa2R00omEU/wA93GH38rn+JP5xsxZowgq/+RruT358/lsBlDoIjLc7
	D+1gwsghLFa7T5bd/ej8cxUWl54UT1jufu8DlNw==
X-Google-Smtp-Source: AGHT+IGWQc4j04RztvOmse4AZ4bShLtupsMufuAyVAsdQbExrN0Lj9/vRc0YERxQFIZn9VrJ9JEpW/4r9cPoyO0SUjA=
X-Received: by 2002:a05:651c:4cf:b0:2ec:4aac:8fd6 with SMTP id
 38308e7fff4ca-2ee5e3458e5mr38833761fa.10.1719826675288; Mon, 01 Jul 2024
 02:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240617152606.26191-1-kabel@kernel.org> <20240617152606.26191-4-kabel@kernel.org>
In-Reply-To: <20240617152606.26191-4-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Jul 2024 11:37:44 +0200
Message-ID: <CAMRc=MdpJUaJ3B64TTdt8B=PeJwR+BjiCx1SJj+SJGOT=LtT9A@mail.gmail.com>
Subject: Re: [PATCH v12 3/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 5:26=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
>
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin
>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

This is one heck of a complex GPIO driver!

> +
> +#define _DEF_GPIO(_cmd, _ctl_cmd, _bit, _ctl_bit, _int_bit, _feat, _feat=
_mask) \
> +       {                                                               \
> +               .cmd =3D _cmd,                                           =
 \
> +               .ctl_cmd =3D _ctl_cmd,                                   =
 \
> +               .bit =3D _bit,                                           =
 \
> +               .ctl_bit =3D _ctl_bit,                                   =
 \
> +               .int_bit =3D (_int_bit) < 0 ? OMNIA_GPIO_INVALID_INT_BIT =
 \
> +                                         : (_int_bit),                 \
> +               .feat =3D _feat,                                         =
 \
> +               .feat_mask =3D _feat_mask,                               =
 \
> +       }
> +#define _DEF_GPIO_STS(_name) \
> +       _DEF_GPIO(OMNIA_CMD_GET_STATUS_WORD, 0, __bf_shf(OMNIA_STS_ ## _n=
ame), \
> +                 0, __bf_shf(OMNIA_INT_ ## _name), 0, 0)
> +#define _DEF_GPIO_CTL(_name) \
> +       _DEF_GPIO(OMNIA_CMD_GET_STATUS_WORD, OMNIA_CMD_GENERAL_CONTROL, \
> +                 __bf_shf(OMNIA_STS_ ## _name), __bf_shf(OMNIA_CTL_ ## _=
name), \
> +                 -1, 0, 0)
> +#define _DEF_GPIO_EXT_STS(_name, _feat) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> +                 __bf_shf(OMNIA_INT_ ## _name), \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS, \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS)
> +#define _DEF_GPIO_EXT_STS_LED(_name, _ledext) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> +                 __bf_shf(OMNIA_INT_ ## _name), \
> +                 OMNIA_FEAT_LED_STATE_ ## _ledext, \
> +                 OMNIA_FEAT_LED_STATE_EXT_MASK)
> +#define _DEF_GPIO_EXT_STS_LEDALL(_name) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_STATUS_DWORD, 0, \
> +                 __bf_shf(OMNIA_EXT_STS_ ## _name), 0, \
> +                 __bf_shf(OMNIA_INT_ ## _name), \
> +                 OMNIA_FEAT_LED_STATE_EXT_MASK, 0)
> +#define _DEF_GPIO_EXT_CTL(_name, _feat) \
> +       _DEF_GPIO(OMNIA_CMD_GET_EXT_CONTROL_STATUS, OMNIA_CMD_EXT_CONTROL=
, \
> +                 __bf_shf(OMNIA_EXT_CTL_ ## _name), \
> +                 __bf_shf(OMNIA_EXT_CTL_ ## _name), -1, \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS, \
> +                 OMNIA_FEAT_ ## _feat | OMNIA_FEAT_EXT_CMDS)
> +#define _DEF_INT(_name) \
> +       _DEF_GPIO(0, 0, 0, 0, __bf_shf(OMNIA_INT_ ## _name), 0, 0)
> +

One coding-style nit: can you add newlines between these macros?

I'm having a hard-time understanding the entire architecture of this
MCU but the code overall looks good to me so I trust you know what
you're doing.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Return-Path: <SRS0=Afdu=NP=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB5C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 20:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29528C32789; Thu, 13 Jun 2024 20:49:57 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 461EFC2BBFC;
	Thu, 13 Jun 2024 20:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 461EFC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so181793766b.1;
        Thu, 13 Jun 2024 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718311794; x=1718916594; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtO8kHkNoxUTTJwoGlHq9nk0A1eCbykjTZq5eBkOpek=;
        b=RRfDsqykHWhKQ2xHDKAP2/4quOXRJR4CfihCfyTlQ3V/4QgCD1xFYWPbLOGIE/MBth
         5JXmpUhV+S/9yYMqdBze7dvDRd5dGBzvwp9VdpI+RpRTZhr1tOxmHwizYcoHrlFg2uB8
         bEXlRVW3AVo2SFbpnG8qK2yBMwid/lI8mXXxiROz46/fS4Ina1VRTv/ZAuDisV9D7l8W
         fmp08/BypXWmmS3YnBxg5+zpPLy83JAhceKBfcw40dQ2VYW2HeuIgoAOWOVsWcXzUmIw
         0kdvZq/wyJJJHAIJlt7ASZ7XJ93i03unzRhZaFQqfpd4VhIiyF+EHQl4yL8GlYAd/Rh0
         u/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718311794; x=1718916594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtO8kHkNoxUTTJwoGlHq9nk0A1eCbykjTZq5eBkOpek=;
        b=sUf3yLtLgwqgBL6C39b54gEPEpGZjr/+G4GaVQ1LWJdCuisJOi5I2nGLxG3D9aEIJ5
         aqG0fqwi+8M+xuxey3YH42ru1xaxkcI45L66uyIUXSr9IVCirDC1cHjOSSvUjQa8gDik
         CuSVmjDIeEasVyAeibxTMRp39rjii6kVrkVLxBtV+a/86MUuDeHpYc7tWCZ2QOXd9I+J
         MsbGDU4sqeQ/li6amXlpQ/nu3bWt4UNHN0urjWtqTpYgixrHjL6qVUSvVNoqWUugjsy6
         GEwqRf4WauqzkE/EAHZ9GiT2vUhWQ5+rPNeymF/tFObHMOpZBknI4L1tPpV19nKX0Ngc
         1aLA==
X-Forwarded-Encrypted: i=1; AJvYcCWgJGWt73rVHElzZQJ6sc8Uvurtfiw5p8YC5UfMZUOP1tYS+z7PVGN5fF6q+pbXCdA15xUsWpo9PnDuwbST/UyHdP3jn1WiRnzr0uddR3j8rnmqoiCkCgrL+djy5DjCBA==
X-Gm-Message-State: AOJu0YwvhxuUljJti6WU8bTTAecKtBfOZqiismKn8DVl+IQ5ZWzWzv0k
	OQqLz86hC7vQB5V9HbEWhdMZZhZduKPNcNOHFjjoO/W+o6UdNnJjObQIZ9lA6B963RRvYHCLDD/
	gZclkzJaU5b62a5TzWbFhMJOMwey+aUwV5Ssxqw==
X-Google-Smtp-Source: AGHT+IG+HorDIKzFKMi9cKl9vB+JB4HHszlwZNAG4MhdytCmGnwK6/KhScSrT5RDI2uuKvPrZqLoMfzad3MNwwDwywI=
X-Received: by 2002:a17:907:7f26:b0:a6f:6046:19ff with SMTP id
 a640c23a62f3a-a6f60cef6e7mr75043466b.5.1718311794169; Thu, 13 Jun 2024
 13:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-12-kabel@kernel.org>
In-Reply-To: <20240613161045.29606-12-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 22:49:18 +0200
Message-ID: <CAHp75VePTX3Ja61eyWjayHALKX14cSgK1QMqbFVrSRTEaJm9HA@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] firmware: turris-mox-rwtm: Use dev_err_probe()
 where possible
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
> Use dev_err_probe() where possible in the driver's .probe() method.

...

>         rwtm->mbox =3D mbox_request_channel(&rwtm->mbox_client, 0);
>         if (IS_ERR(rwtm->mbox)) {
>                 ret =3D PTR_ERR(rwtm->mbox);
> -               if (ret !=3D -EPROBE_DEFER)
> -                       dev_err(dev, "Cannot request mailbox channel: %i\=
n",
> -                               ret);
> -               return ret;

> +               if (ret =3D=3D -EPROBE_DEFER)
> +                       return ret;

What;s the point of this check, please?

> +               return dev_err_probe(dev, ret,
> +                                    "Cannot request mailbox channel!\n")=
;
>         }


--=20
With Best Regards,
Andy Shevchenko

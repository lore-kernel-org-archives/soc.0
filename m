Return-Path: <SRS0=Ae9U=MN=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B4FC25B10
	for <soc@archiver.kernel.org>; Fri, 10 May 2024 13:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8498C2BBFC; Fri, 10 May 2024 13:20:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18D33C2BD10;
	Fri, 10 May 2024 13:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18D33C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a59cdf7cd78so519132566b.0;
        Fri, 10 May 2024 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715347234; x=1715952034; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=939G0JcTnD3DY7PHHnmv9Ic3GSSK2KFfF0p412OVmNc=;
        b=QBTybqNHrV46HpKnldTJu+jMCm53SmlRiA+Be1Ykib818OiTdI42tqRXUdmJvFT68j
         aOr0emSr+leDfTx+koBUog5nOU5EIsvBljjaaYALh7hv5DcN0HYDOeC3HGjaNxflgGDH
         jweQAhwC0QdWHGjTXOECMqmWlosiWninXLSLJLML01GHf0Qb/zZJsuS8cXqNq7nsfKYW
         Gxag4TeG87VhRgLI+9NW+Fu6DejvN0eX6vraCnRooj506TMNywLmiQltcdYY+mBm+b3I
         gw9g0aAAWvgPynsyQIQa9vWFW+Yh9c/7E6R2IQ6/vNNmxWoK9+xBOL5Tqecpp+r86dCC
         LVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715347234; x=1715952034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=939G0JcTnD3DY7PHHnmv9Ic3GSSK2KFfF0p412OVmNc=;
        b=RTwVGGYS3ZjSu8/a5E6VX/Cr3pvS0VVMMAq9AOzMFW/v2Z/9iZykpcf6Lca6F1KVpu
         iFoBAZK52C4QdUWf/wPvFH1ph1gt+0NHPRJr7i0JEbW0UsmC497nDi3q9jNMYLJx6FGu
         oi4gg8vzzoP3N4hhuBSrSUGD2HmvnCRnkIzV7zl0V4xKsHlhVNO5htWDyF4FXqDBKBhO
         clCq9Tp2hyGsg9A333cnvX8bJ7nw0PqRTT3tbIjz8OYxtuL2kDPZLKJfXih1Kc3xlh2P
         iYPrfxFnz72vwit6ODiJOEjl5KXwlFUn6qXWvZ/ftrn34g2wLnRwZi08nNaeeljdrB2U
         vrUA==
X-Forwarded-Encrypted: i=1; AJvYcCU3h5B0fpEEID+xG5zMODzXm2r/l9AgjYcXACiZTO6HgJzNufjkLOHCqLEqeEQXYk8hJrylu8XmWi9uCOTQNXKnLMHcGeatQ75+4Z9+TKo=
X-Gm-Message-State: AOJu0YwpxJ3oeq65SnD1rqp3vnS8pKeTdZCR25/dDcDz2s628tLY7aiA
	LxBBFV8tocWO5prI1nDhSQlSIEr0oAt8PKTdxVBB9WOgAoRsmpquzWnXnTI9R04GbZgBF461moX
	il9yrEkfNHigXQIAqhMbXayb6KonvKW2f
X-Google-Smtp-Source: AGHT+IFtTuucGLUmn7DA7mVfavem1VVK3zkgnsxBIoHAT3QKsWAf9fIw7TfCdsbiMPUfVKbPRVZYXciS3Wvxb6ND3S4=
X-Received: by 2002:a17:906:d95:b0:a58:bdfe:95a with SMTP id
 a640c23a62f3a-a5a2d57a722mr161036666b.26.1715347233814; Fri, 10 May 2024
 06:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240508103118.23345-1-kabel@kernel.org> <20240508103118.23345-8-kabel@kernel.org>
 <Zjti-FkUCAQzMmrQ@smile.fi.intel.com> <20240509205729.09728cbb@thinkpad>
In-Reply-To: <20240509205729.09728cbb@thinkpad>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 16:19:57 +0300
Message-ID: <CAHp75VeW8P2S4i62NhcpwZ=tbpNfBtanz_1zXzBh2H2PCbHLUg@mail.gmail.com>
Subject: Re: [PATCH v9 7/9] platform: cznic: turris-omnia-mcu: Add support for
 digital message signing via debugfs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 9:57=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
> On Wed, 8 May 2024 14:33:12 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Wed, May 08, 2024 at 12:31:16PM +0200, Marek Beh=C3=BAn wrote:


...

> > > +#define OMNIA_MCU_CRYPTO_PUBLIC_KEY_LEN    33
> >
> > 33? Hmm... does it mean (32 + 1)?
>
> Rather (1 + 32), the first byte is 0x02 or 0x03, determining whether
> the y coordinate of the public key elliptic curve point is positive or
> negative, and the rest 32 bytes are the x coordinate.

I hope you used that in v10, i.e.  (1 + 32) with a summary of the
above in the comment.

--=20
With Best Regards,
Andy Shevchenko

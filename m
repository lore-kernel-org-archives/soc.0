Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3F8C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 12:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D3C3C4AF4D; Mon, 17 Jun 2024 12:26:39 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99728C2BD10;
	Mon, 17 Jun 2024 12:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99728C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6f04afcce1so548774366b.2;
        Mon, 17 Jun 2024 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718627197; x=1719231997; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njo6P1wFPdnHXWtr65x9UWKWbYoBCSrx4Zyngb4u1OM=;
        b=OWXmwMEuGW7RoCO1Cv/5ycwQtqppkTNN7mmvawdKQ2QeInwTzRhSkxVD5dsCC3xcIF
         +JMWNYvmqSl3A9KIcrQGkPJIjCN3HFygdZDEporW17Z0QigT1sEPSv+MjaMh3gRIyOZq
         5FrZ5b4S3jvfD2+fQrxg2pTW+J6xTKRrZcQ1RW3SJfCiaRlX2zyz2qb74adNS6Kpmw99
         cHMotjHKh+jLOmlLijYsMnCQaPwQOiS11EpL2n/llTgchuwA25aZDDY6btLNhyumPc5T
         DwN4gsQpqrqlCPdQkC6i0lg/VRki54sSBhrg09Ytb00C72MTT6mCKwOaSfd8G9pWC4tx
         y0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627197; x=1719231997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njo6P1wFPdnHXWtr65x9UWKWbYoBCSrx4Zyngb4u1OM=;
        b=iweutZRKi7jD+H/6KtHG25aFaUbTumGfLzgIjmDwqwZM98i3Z9qn7s3Z+rUEp5Y7sm
         9nFYuP9rLEZSl9IZQd2hBvsH7J5H5qs2husd2/qb0bfc/CMZf0OX25Ci6517dhO8eUzc
         0ZVFQO+TfrjfxnVvDCClZRv8CYuLJsztyu68Aa1Yr40gTI9NstNY95Peu7k9FN8NJ1Qd
         cofWTvhi/DASYkHFHLdGWWSJyFH2Hw6o+Gwq7H35ySO8yXlEeGXoX29+uEfcZorrDdQe
         zFoBUY1shlunXjP63sSiMWqh8zBWXwj1rWNg4PUa4ZIn8Q2eIlZl6RUEtjrqqPO/0by7
         KigQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNkjsxmcpLmubra9OkLaeXsp/nHJ/Jgq/y1OcOCB4EWNhc0LeORyrS6GtdOP/kBXcyfg4tHwPba85y6oimij+lw9wLBYNnC2ntdYf4+4AcfV+NdJfFjeUVJVBUs8PjpA==
X-Gm-Message-State: AOJu0Yx6b8mf74Yb5Ma37t8OyyxqX5L3nmhADZv5wCv7uClCMppRz7Z7
	jDL+F3ScYwoB/iEXSldW2TXHhifNaEWp04tSDEYbUXybraJy+fVLbmMX0kbd/qTiNkKTL5u3YFX
	bMmiusZV8J+lLz2WsYpJUGTMTH7XvZgAvpJs=
X-Google-Smtp-Source: AGHT+IGnPFyI6dAH6e+4bGrD2pW4/WkNCrmhOOD2TYSUnOauwKvTbH33ErsQ81WXrw4+imaj2JtB1BEo/+42yT6nwFs=
X-Received: by 2002:a17:906:f358:b0:a6f:5150:b809 with SMTP id
 a640c23a62f3a-a6f60dc4fc4mr786572366b.59.1718627196467; Mon, 17 Jun 2024
 05:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-12-kabel@kernel.org>
 <CAHp75VePTX3Ja61eyWjayHALKX14cSgK1QMqbFVrSRTEaJm9HA@mail.gmail.com> <20240617131404.592a4603@dellmb>
In-Reply-To: <20240617131404.592a4603@dellmb>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 14:26:00 +0200
Message-ID: <CAHp75VdCgugaEB+FErA5j5oGNfjpwhHpX-vnDXWT=4XGA50+8A@mail.gmail.com>
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

On Mon, Jun 17, 2024 at 1:14=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
> On Thu, 13 Jun 2024 22:49:18 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jun 13, 2024 at 6:11=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.=
org> wrote:

...

> > >         rwtm->mbox =3D mbox_request_channel(&rwtm->mbox_client, 0);
> > >         if (IS_ERR(rwtm->mbox)) {
> > >                 ret =3D PTR_ERR(rwtm->mbox);
> > > -               if (ret !=3D -EPROBE_DEFER)
> > > -                       dev_err(dev, "Cannot request mailbox channel:=
 %i\n",
> > > -                               ret);
> > > -               return ret;
> >
> > > +               if (ret =3D=3D -EPROBE_DEFER)
> > > +                       return ret;
> >
> > What;s the point of this check, please?
> >
> > > +               return dev_err_probe(dev, ret,
> > > +                                    "Cannot request mailbox channel!=
\n");
> > >         }
>
> The point is to not print the error message if we just need to wait for
> the mailbox driver.

Right, but that was the initial idea behind dev_err_probe(). Have you
checked its implementation (and I hope it's documented as well)?

--=20
With Best Regards,
Andy Shevchenko

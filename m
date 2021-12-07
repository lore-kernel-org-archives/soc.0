Return-Path: <SRS0=cB7G=QY=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3ACC433F5
	for <soc@archiver.kernel.org>; Tue,  7 Dec 2021 03:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 676BAC341C5; Tue,  7 Dec 2021 03:29:58 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D05EC004DD;
	Tue,  7 Dec 2021 03:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D05EC004DD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id g28so13355319qkk.9;
        Mon, 06 Dec 2021 19:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7roDkg3KrE7fLZXK82trfY03V59oVuH/SpXZx6lh9oQ=;
        b=azUrlGXnBPtCnMt/9o5J4bQPvIsW8BR0symPEnaaE4xgK/AuuiP1v8QBXxG8hH3TIS
         jOh9gIK+xKPgduYo/jzMVwMQSDFjPHb0bOogL3BL0ql+jzlT4pjf1ZAUkD3mjOBRSWNC
         qoZlnMdHb+wcOFSnWjjMr7YsHQTCjw7TOb3Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7roDkg3KrE7fLZXK82trfY03V59oVuH/SpXZx6lh9oQ=;
        b=ewAoNC11RRFhozoddFvpngDVQf/kTAzTsIKKafx5Wzc3NSvcwVEueE00g4QVMQTx7G
         u3jgvrdKyXBf+B0TbIqWXm0Y+bW/BGEc+utTbCCNezSt282wUIZqySnkXzQFx6cJ9exX
         I1QRxUNN8HaETDi9Nv5+rwLf3torVknsmpLA6axiKGtALpj/d+xIUCpozZLlfsThCSHh
         FVJkmC6xbj1+xjdJw6pXdOEr00JIHUbibRP+wsjYUsgUIFI6Y+xQeVnCMvWumC9VH7xG
         /og0VTK7nXXlR3VLonB3MGzUhBlqwX71cZsllTDHAZlZSE58b3euYliaHP2puIv2+hTF
         g5ZA==
X-Gm-Message-State: AOAM533sRJisCzJ6zLRnlA9hIrB5IwXqNLCxlE7FJpww9k6LUWQUKs1M
	iH7/5ufQb1yutWCWHqpSXe2ApRDfpCSFZ2677hc=
X-Google-Smtp-Source: ABdhPJzqqZnGA8mDLqBmrvcztTUSfOqGT68qRSrRQy+N3lGeHB2yc7Q/8VaVw3Nd7JAGTZvPx56kgOqtko7zdRJuoss=
X-Received: by 2002:a05:620a:1004:: with SMTP id z4mr36775157qkj.243.1638847796330;
 Mon, 06 Dec 2021 19:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211201033738.121846-1-howard.chiu@quantatw.com>
 <Ya5/v+VhOM9o9BtQ@heinlein> <CACPK8XdCjqB+HZ_g9O=gjnSne3=iV44i6jKP5M8yWcsjnttaog@mail.gmail.com>
 <HKAPR04MB40033D58E2C1F96DDF16C13C966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
In-Reply-To: <HKAPR04MB40033D58E2C1F96DDF16C13C966E9@HKAPR04MB4003.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Dec 2021 03:29:43 +0000
Message-ID: <CACPK8Xd93Kmvh7kT+4tbMO0+6LWa-2ORmt_KNB_hpqMYhso46A@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: =?UTF-8?B?SG93YXJkIENoaXUgKOmCseWGoOedvyk=?= <Howard.Chiu@quantatw.com>
List-Id: <soc.lore.kernel.org>
Cc: Patrick Williams <patrick@stwcx.xyz>, Howard Chiu <howard10703049@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Dec 2021 at 02:53, Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <How=
ard.Chiu@quantatw.com> wrote:
>
> Hi Joel
>
> Bletchley platform needs to support fan control.
> Since Billy's patch for upstream is still under review, I can't add pwm/t=
ach node into dts or the build would fail.
>
> As you know, I had committed the pwm/tach driver for ast26xx to OpenBMC l=
inux, could I commit the dts to OpenBMC linux instead of upstream for early=
 build?

I'd suggest no, omit those features for now, and you can add them in
once we have a driver. The device tree bindings for the tach/pwm need
some work before they can be approved.

When I asked you to fix the patch, I was referring to the usb-c
warnings that I posted about the other week.

>
> Howard
>
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Tuesday, December 7, 2021 6:52 AM
> > To: Patrick Williams <patrick@stwcx.xyz>
> > Cc: Howard Chiu <howard10703049@gmail.com>; Arnd Bergmann
> > <arnd@arndb.de>; Olof Johansson <olof@lixom.net>; SoC Team
> > <soc@kernel.org>; Rob Herring <robh+dt@kernel.org>; Andrew Jeffery
> > <andrew@aj.id.au>; Linux ARM <linux-arm-kernel@lists.infradead.org>;
> > devicetree <devicetree@vger.kernel.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; linux-aspeed <linux-aspeed@lists.ozlabs=
.org>;
> > Howard Chiu (=E9=82=B1=E5=86=A0=E7=9D=BF) <Howard.Chiu@quantatw.com>
> > Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
> >
> > On Mon, 6 Dec 2021 at 21:25, Patrick Williams <patrick@stwcx.xyz> wrote=
:
> > >
> > > On Wed, Dec 01, 2021 at 11:37:38AM +0800, Howard Chiu wrote:
> > > > Initial introduction of Facebook Bletchley equipped with
> > > > Aspeed 2600 BMC SoC.
> > > >
> > > > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> > > >
> > >
> > > ...
> > >
> > > > Change since v2:
> > > > - Remove uart5 workaround
> > > > - Remove gpio nodes of pca9552/pca9539
> > > > - Modify gpio-line-name of led/power/presence pins with openbmc
> > pattern
> > >
> > > A number of the GPIOs do not have defined openbmc patterns for them y=
et.
> > The
> > > names you have chosen are ok for now, but we will be changing them as=
 we
> > refine
> > > development of this machine further.
> > >
> > > > +             gpio-line-names =3D
> > > > +
> > "SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLE
> > D0_P12V_STBY_ALERT",
> > > > +
> > "SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB
> > 302_INT",
> > > > +
> > "SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","
> > SLED0_MD_DECAY",
> > > > +
> > "SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-ho
> > st0";
> > >
> > > Such as these...
> > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > Otherwise,
> > >
> > > Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
> >
> > Thanks for reviewing.
> >
> > Howard, I'm merging patches for v5.17 but I can't apply this until you
> > fix the warnings I mentioned.
> >
> > Cheers,
> >
> > Jeol
> > >
> > > --
> > > Patrick Williams

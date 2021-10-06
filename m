Return-Path: <SRS0=v5LI=O2=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F442C433F5
	for <soc@archiver.kernel.org>; Wed,  6 Oct 2021 08:29:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 423B761181; Wed,  6 Oct 2021 08:29:16 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269E0610FB
	for <soc@kernel.org>; Wed,  6 Oct 2021 08:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 269E0610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f49.google.com with SMTP id m3so7196874lfu.2
        for <soc@kernel.org>; Wed, 06 Oct 2021 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Cs32oKjPY880HhRcpboK0pON5dPQmpZCrv3AmYoudi4=;
        b=Y7jduTBLBpq47YNLGK+8Fs1peBjDqtnqaIvJ71rnYHl2LKlBGz14YVXsbSX59h/7Y1
         Mpy86aVzDlMC7vyhQDY0ggy1MsBXlPo/Ri//HkNUdIFfOGLV40yK1Trpb03j940CkDcv
         aAi/bqPh8x4BcyfK9LhFAKp78v/GNsJe/AjNjzTLXl5ez3JblOovjZ2YaxpfDaASzd7K
         kimrxEauFPfupzQ6Nknzw562FDT0tk6D8TVLUU5SA23Moj0PXlw0yo3uP2eWMEzUUkHm
         GFjDlEiJHZj48oW2v7cLjvTKto/78fzY5Td0AE8ohTmVRtoxxTZux0z8S0solecVTL/f
         UYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Cs32oKjPY880HhRcpboK0pON5dPQmpZCrv3AmYoudi4=;
        b=HXBWtxzFqhJ9BX1qQ1nMZ555/BRawMlV0aZWEiSJKjs8zRabgtN4EC5ms4uzE7Hh7E
         YzrD4+0/RvE9OGk8NU4C2aDKShtI0i6oVhofL+Gt+w+UIdDVRRcwn2nx68kd4hLuaKi0
         9ho2JcM8ii9gproFlyNpTOu4L7AKw01GwbAi26DD0YRHLPy/pDGfc/zJ+NvMioWRiOkK
         0RUKKzDU3/cOSWht1jrBEJVNib1c3S4Tnqt6NUzzEvOrOao/MUy2KOtiFBqyh/IRJ5mH
         ZV8M+XuIOwb034HetZbRdHQcA+IrGFA5CTeT6TZ993m0g5MC0y+WKEYQyo7tT5dFkwJZ
         MS/Q==
X-Gm-Message-State: AOAM530hzA9GgcGSLnFThvTDYHKgFwTDqKBu2eFcFEkeVw6+VugAzQrW
	jpOYk0/lR1cBYf4tlL0xS0ZnMDP3geLJaE2DXIeutw==
X-Google-Smtp-Source: ABdhPJwgbKRqUWndz/R/ob0yYOvX+zmWUkoW3ELAssaKrTJCToZ4rmrps0L8dLDx2abTjB7pRmhWDo7HUxDlivZuBuU=
X-Received: by 2002:a05:6512:21cb:: with SMTP id d11mr8276307lft.579.1633508954553;
 Wed, 06 Oct 2021 01:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com> <YVx9IMk7cJSCK79/@piout.net>
In-Reply-To: <YVx9IMk7cJSCK79/@piout.net>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Wed, 6 Oct 2021 11:29:03 +0200
Message-ID: <CAF9_jYT7_9Oz-HFSy5z7uiieoHtujUD_En9MTi68PxGb7gxphw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, jarkko.nikula@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, 
	Tudor Ambarus <Tudor.Ambarus@microchip.com>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Konrad Adamczyk <ka@semihalf.com>, 
	Tomasz Nowicki <tn@semihalf.com>, Jacek Majkowski <jam@semihalf.com>, Alexandru Stan <amstan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 6:28 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 05/10/2021 18:22:12+0200, Arnd Bergmann wrote:
> > On Tue, Oct 5, 2021 at 4:37 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wr=
ote:
> > >
> > > On SoCFPGA systems, it's desireable to have fixed numbering for
> > > i2c busses, while being able to enable/disable them (e.g. have i2c1
> > > be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> > > be achieved using devicetree aliases (see i2c_add_adapter). However,
> > > having the driver be self-contained without relying on aliases is mor=
e
> > > robust.
> > >
> > > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> >
> > I don't see how adding a nonstandard property in one of the i2c bus
> > drivers helps at all. How do you expect this to work when there are
> > multiple i2c controllers in the system using different drivers? What
> > should happen if both an alias and the busno property are set?
> >
>
> What happens when two nodes have the same busno property because e.g.
> one is in a dtsi and the other one is in a dts?
>

If busno is set, the alias is ignored (the code that checks aliases
is never reached). If two nodes have the same busno property, we get
a WARN in drivers/i2c/i2c-core-base.c:1637, and only on of them
gets attached.

What is a better way of doing this then? Is adding aliases to the
devicetree like this okay?

aliases {
...
i2c0 =3D &i2c0;
i2c1 =3D &i2c1;
};

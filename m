Return-Path: <SRS0=2m49=O2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0680CC433F5
	for <soc@archiver.kernel.org>; Wed,  6 Oct 2021 09:41:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D8C04610A3; Wed,  6 Oct 2021 09:41:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 193B361042;
	Wed,  6 Oct 2021 09:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 193B361042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9cDF-1msizL2EJp-015aWz; Wed, 06 Oct 2021 11:41:34 +0200
Received: by mail-wr1-f47.google.com with SMTP id e12so6926803wra.4;
        Wed, 06 Oct 2021 02:41:34 -0700 (PDT)
X-Gm-Message-State: AOAM533//ovHCW9lee8yXEvURbybsEFrLEcnRADU6L3fwLXRH9AT1wfS
	YPXGIeSc4WmARxp0Azgi9IubOUS72Xk2vLNypFQ=
X-Google-Smtp-Source: ABdhPJzuUsHOXGfVTMW+P7qssYpQP5oaRsPeV3BXJdI5XYLdC7KWD9rwYpR6EFP3ZXNbb0wReeC/Muz0a9i/u3qzDE0=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr4566458wrc.71.1633513294130;
 Wed, 06 Oct 2021 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
 <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
 <YVx9IMk7cJSCK79/@piout.net> <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
In-Reply-To: <CAF9_jYT6mbk6dr8=ZYZ8B=gxnuHas7QBfDfuoTJnMzSKZt=WGw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Oct 2021 11:41:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0f=fahxax1jOz32uLzitV_PRPoHAfrQLx_qccmh_gcXg@mail.gmail.com>
Message-ID: <CAK8P3a0f=fahxax1jOz32uLzitV_PRPoHAfrQLx_qccmh_gcXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	jarkko.nikula@linux.intel.com, 
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
X-Provags-ID: V03:K1:CiAyugX5ATgCsZ3P3EPYe1KJZP+Ringeh//xIkN/67jZKeZmt7c
 M5CMrv+x4xEHzptRCGYVLzjUMndnQhEm0d4TUOOCZ8SdIT/9ahmTz5au4K8TLlXkmzsvSQd
 OuZ3151YXAIoXr9RPcflyNPkUUuBhghOD5G6hd/Pp5mLmVLwrBXNhtFo5tQWgB0b3m/xs8L
 BVr1k4dVjXz41fcTKR7pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w5uT/upH+7o=:5ThFTpQ+FiuzNmec+CWh/H
 0o2BqAarvxpghYCR57Z0ObXDe+qoIySJhHFqp/xFEQYcBDi/1knhGDaid49ihdZ+caz4xhvbB
 8Akd+BHQ0V2GkAQ4jwFVhc9ZwGCLhwgsNb/Fg7MyTLMoC5TMxtI6UanM8aPcY56qX8xAZRzMl
 k6vl2VsHSsfqo3qMtPk+F0RVcDjMf1oMX7BN3zs0jZ1DX0Bv/1o3yATWw3QZ251+93bT2nSiJ
 IsZZRlkRlCnEBTkiD3us7yWBygLCSQIzPrKJD+tlm7Lxk6X0alOsAinPY+AGUsto3xWXTxzLw
 D+X09cpORGhpVsMl5C7/CLS9xHPa1ji8X1AHr6VfSlYbFgXXlmouWttYbCQN6lv8UEQ8/q/0u
 1Yr19ZPLmb2Fe+Jnjvs1OH2uufjbgCnsFP7KMEciAv28RXJNQef47DWsck8pEyFTfRbSHVfe+
 W02WJtdUQq203FEmKAJraeCJYsZdlsKezDk2JvWalcmfSEI5ehn2FpR/xrMih6ueg2MfNcgqL
 Z38m+bbVZab5DWkMCrOd/NpLyfKdMi0HjN3pB/OBU4V0a8LuoZSO0his4ru0hr/koe8LbJmUQ
 KzpvLDmiL61iqfOOkd1gTQb6RzBZd+W4/mgSNnRdsOR2St7peFaLxWtprOJiTgmB1DkyK9GNd
 KA+2afYJgDBbZo9UPOCcPrg55GsM3Lh4iUeGAOlm2oeOG+43yUfTXSoIerKqIvgfndGA38Bf5
 bZue8Hc75sR/5K3XftjiURRfIftl/mAPzkbA4q3kmBebHAhKTJE0odeRp5OHKCpMkkBgYCLjy
 ESmSi1obWkezETngHHi+HWL0ZgUXYjMuCzJPkSWpwERG7JLryWTY2pwBnjnzj0k0JZ1ZYTufO
 FAd0U89cjz+hFKWSNfwA==

On Wed, Oct 6, 2021 at 11:21 AM Pawe=C5=82 Anikiel <pan@semihalf.com> wrote=
:
> On Tue, Oct 5, 2021 at 6:28 PM Alexandre Belloni <alexandre.belloni@bootl=
in.com> wrote:
>>
>> What happens when two nodes have the same busno property because e.g.
>> one is in a dtsi and the other one is in a dts?
>
>
> If busno is set, the alias is ignored (the code that checks aliases
> is never reached). If two nodes have the same busno property, we get
> a WARN in drivers/i2c/i2c-core-base.c:1637, and only on of them
> gets attached.
>
> What is a better way of doing this then? Is adding aliases to the
> devicetree like this okay?
>
> aliases {
> ...
> i2c0 =3D &i2c0;
> i2c1 =3D &i2c1;
> };

Yes, this is the normal way to do it.

The way I tend to think of it is that the soc.dtsi file contains a descript=
ion
of hardware that exists inside of the chip and is as much as possible
detached from how an OS uses it or what is connected to it on the
outside. You then have the board.dts file that contains everything specific
to the board.

The /chosen and /aliases nodes in turn are specific to the individual
machine, based on local configuration, installed OS and boot loader,
and how the devices on the board are used.

We tend to have the /aliases node populated with a sensible configuration
of how we expect them to be used for a given board. So if your machine
connects two of the internal i2c buses on the SoC, it makes sense to assign
them the aliases i2c0 and i2c1. On the other hand, if one of them is
not connected anywhere, you may skip that, or if there is an additional
i2c controller in programmable logic or behind some gpio lines, you can
make that your i2c0 alias.

      Arnd

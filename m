Return-Path: <SRS0=y3QB=VR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C2C433F5
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 07:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7429CC385B0; Mon,  9 May 2022 07:21:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC3BEC385AB;
	Mon,  9 May 2022 07:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC3BEC385AB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f175.google.com ([209.85.219.175]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6bPS-1nrffp2TJ0-01810t; Mon, 09 May 2022 09:21:23 +0200
Received: by mail-yb1-f175.google.com with SMTP id y2so23259825ybi.7;
        Mon, 09 May 2022 00:21:23 -0700 (PDT)
X-Gm-Message-State: AOAM533f1Z6l+UbqBJzt4r8niIlCYJW+xMRaJimf7Eb/AyH1j/njH3eH
	amHWJS3nKWqNHOZj9SJMV2eHbmcX7RpxUEibM2E=
X-Google-Smtp-Source: ABdhPJwvjfmW3GgAEYucjWilsiTVRxV9KEk9VA/Dchxs5csGbKWTID7oJ1ta/6hj1CCB5EwTLtq6wr0NNUzpVpQcQow=
X-Received: by 2002:a25:c604:0:b0:645:d969:97a7 with SMTP id
 k4-20020a25c604000000b00645d96997a7mr11469239ybf.134.1652080882146; Mon, 09
 May 2022 00:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220427162123.110458-1-maukka@ext.kapsi.fi> <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi> <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
 <b09847c4-90f8-509d-835b-85613712344d@ext.kapsi.fi> <CAK8P3a1miLk8YU+T5ozyf-X8qUB3sJq6cyTovBs9XWb9MrJxMw@mail.gmail.com>
 <20220508152237.3hw657gcba2fvheq@pali> <20220508154126.3wubyyunpuxetswm@pali>
In-Reply-To: <20220508154126.3wubyyunpuxetswm@pali>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 9 May 2022 09:21:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3WZBOPDH8CxnK3H7bqTbytU_+KJg7SHhAS-PN3KQoxnQ@mail.gmail.com>
Message-ID: <CAK8P3a3WZBOPDH8CxnK3H7bqTbytU_+KJg7SHhAS-PN3KQoxnQ@mail.gmail.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mauri Sandberg <maukka@ext.kapsi.fi>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3kedGZmoXRxdDQoNaUX4qe1GUOXfJKX3ckxTGxLV9RZv8BoLXk2
 ZVEdxi3aHlSSQDapQLro14WifftcAttcHesXFxgahbWSKf8qg7o78CLnc/DMpZN7GaxzTM2
 x1x35DcmQojCcy3nReA9cER0EOU9ofk38Vz1ny+rkbjEaK77j7/qMmjv9me08TmqB0Fr3WD
 TtiooeC5rmffdgdFqtjAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bpYZH3IZdl8=:irlDdChKcQgx0DXRUTTPZK
 73dj6ryto6mmFe9gm5J32c9g0aSNYzDGGyKOHQ+BjGyigIjFn0hT6EYrRF572W6GswcnoVztF
 Ce1h5bkvGiDp+y9L2Vx0hoeOBCgAhFJCUDmWwXNSzgu6OswaSuI15zBcM8NdzCaiYH46nBUab
 sk6WkQtGHdZ7pDVL8U1Or/1iVnWmxkE3pfUdZopBKW63U6hu+jC6srCeuZycr0agcvHpPgLOA
 3u4EuNbbT1I1WGW+jNHNyHsG7xXwpGvNwCu/aDsAGUNC65JQNHK5wgLp3bjCA++nljtBsn2jy
 Xo2IN7hHMSbpY1zegnlbYJNle/iyclXL9s1FBG9GhGuV6m/OxChrpuCnbQ5/rhUQINGVH7VWp
 SPsCcCkcVX2HXSvLoP/CeT+BQtyrtAGtJbJpCBzjTS3xuPfYYCNiRp2aeBYcL3ALrecOGc3YR
 kowRo/Kof+a2ZH9h43jZVsMofGZPQrZEIcNv4jIhhtrAwsclF6O61xVERG495+hP+Y77q3MsZ
 087syWM8xhFHT54WkDusl2/LPhY90CuPX42KT/7Z8RoPCoImo+1aOntX2fhisCjBA+utDxr9C
 rVC9ijhzGPsdcEElKaI+g4ds9hMmdWybbR1DodvMdjxTPYYm9PWmY3+MQvLnf61nJ8j34AGCn
 7T/RFPEzZWFxdgw1WW1oQA3VD7pSOyHShenDUodkqsCAXt8gN29a/3yYZsHpvVKbtsHt0d+pA
 VRnLDGj8lBvbadsPM7upzIxV+uVfuwRoyTymXLOcVvOU709rQREwFt3epCwQXZ9O4Jynlub+W
 lvmVDTATyKtAs4RlBTz/7IEShsuuIiHkloclYDHSNvlx18CabU=

On Sun, May 8, 2022 at 5:41 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Sunday 08 May 2022 17:22:37 Pali Roh=C3=A1r wrote:
> > On Sunday 08 May 2022 17:02:17 Arnd Bergmann wrote:
> > > >
> > > > Can the existing pci code still be used to init the PCI bus and des=
cribe
> > > > the rest in the DT or is it a futile attempt?
> >
> > Hello! Orion uses arch/arm/mach-orion5x/pci.c driver for both PCI and
> > PCIe buses. This is not device tree driver.
>
> Correction, Orion PCIe driver is arch/arm/plat-orion/pcie.c and it calls
> common functions from mach-orion5x/pci.c driver.

FWIW, I have an older patch series that turns the plat-orion/pcie.c and
mach-orion5x/pci.c into standalone host bridge drivers that no longer
use the arm/kernel/bios32.c helpers. If anyone wants to work on DT
support for the legacy-pci side (not for this machine but maybe another
orion5x one), I can try to rebase those patches to make it easier to
add the missing DT support.

          Arnd

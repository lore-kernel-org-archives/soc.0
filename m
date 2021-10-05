Return-Path: <SRS0=v9WN=OZ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43035C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 16:22:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2729161381; Tue,  5 Oct 2021 16:22:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6F261372;
	Tue,  5 Oct 2021 16:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B6F261372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M2ON6-1mV2K22LiY-003v1I; Tue, 05 Oct 2021 18:22:28 +0200
Received: by mail-wr1-f42.google.com with SMTP id r18so11059132wrg.6;
        Tue, 05 Oct 2021 09:22:28 -0700 (PDT)
X-Gm-Message-State: AOAM532f4XXb0RcE5NwswVh1ozLzKG065WMEyMHHSRfz797fWQ9OrXHF
	i5L42j1IlhvxdXaPpDKGNx7xIW57RBNvJp4hhE8=
X-Google-Smtp-Source: ABdhPJyKDaaY9N196wCOwS/aWHGILrM0TAfc16cprPxSzk6zz0pLue1dKsba6g/4ViVzYX6me24gdE9gUYPGJrVBfqA=
X-Received: by 2002:adf:f481:: with SMTP id l1mr22496230wro.411.1633450948179;
 Tue, 05 Oct 2021 09:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211005143748.2471647-1-pan@semihalf.com> <20211005143748.2471647-3-pan@semihalf.com>
In-Reply-To: <20211005143748.2471647-3-pan@semihalf.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Oct 2021 18:22:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Message-ID: <CAK8P3a1kj1G3TkM7bK3ckXoG8_PTLURAcpDRmDxdnjutEPMsug@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: jarkko.nikula@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Pratyush Yadav <p.yadav@ti.com>, 
	Tudor Ambarus <Tudor.Ambarus@microchip.com>, Linux I2C <linux-i2c@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Sebastian Reichel <sre@kernel.org>, 
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	DTML <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, ka@semihalf.com, 
	Tomasz Nowicki <tn@semihalf.com>, jam@semihalf.com, amstan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rKv6FhlZCW6YpUg3/M2gMGIKcfUDzz2Xmw3Fz/G1NwezpBQn3GM
 InjgG1tfeRL9mEt5u5WMTtg4wHPNHTwdQ4nI288ynEhTXg1b3AacwQWfGTnFyZi4LsWzARb
 jyFVGr/PD1brSekmdpJ6tBWyB+PQpFnPVEVasy1RMBEFrOZwswsUHtsmW2S5nweQGobX9sB
 MgpUS0OJuvHMOrYAvqWGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gfP107sITRg=:mP55qnsbHYjBH8yj8PVwaA
 MRbNaTHJKhI9aNLyPyUy8OcOI/Oe6mxbi4aUZ6qx9fOtvjCogid+Ntcfp0Sb0WkliCuO6VWsi
 ykC2XNHaf87Y8FTZ+WoXUmaMt5k8L38CLDq7ijZF53PkL7X7e25YMWxmSLiE09kD007mrthWc
 5nfxDdJ0T90k5tjhyC/pTx2lvxqhV1lR2xbtdaCHziY08VfgBn8vkefYZOO8tixxqLXaiRniw
 /amRE3J10n2KcluBJZOPhIajgY7N7oPmQzPHPEHihREezSA3jwO1ppb6i8r9+qN9IR9D3ZHBR
 8erSo1LWqQ5+Yf78BfWysNo6wrjKyIf7QjAwCWpyAmHWnMHnZB1fQp9OyuauAl7yvAxVGorfR
 ILqjTstoyjVWzKqXmGvcuSzcwQZOP9/UdLsHv26PIa3go1TFChBVMaRElkppXCF4XLWUr2sbQ
 wYbpVCnX4YwrQnGdRAZL/O9s9LQXwnpY2Ja/CcCU9f+YLYsKFuMK6AHf7Do6M68pBY1EhUk/6
 ozd2FX/WGvsjdwub/r0vM8/lV6V6y4RZEXC5/FchlUzw80XyoIw2PHx/ypeAbBuBepLzJtfPa
 6fJNGfi+gPVQVv7wye71RcmSmimJO54oG9RCvco+7wTwwd8mxvZPvv+4Oy2RH1dB1zTx1yAA5
 4C3emHA8KrcaOO58OQhoAG17q7BhF2nYhm1vkxELAGmBzFjjOkQ0hyLiEWEpoihlM0iwZyZjI
 XMxXg3bKAnR73p9yD3PaJB31R980vvycQ8i9TY7gefzy7KERY/h8mAZ8p2cUfcYA89pClhIA8
 b7U3i/BIQAu1x45x40if0qpCiVZOIPrv76dh8mUhrLn3+aCNl4pUh2U9wG45nBwmko1hGwvO9
 gtgG8AIf6il1t1VrOBZg==

On Tue, Oct 5, 2021 at 4:37 PM Pawe=C5=82 Anikiel <pan@semihalf.com> wrote:
>
> On SoCFPGA systems, it's desireable to have fixed numbering for
> i2c busses, while being able to enable/disable them (e.g. have i2c1
> be mapped to /dev/i2c-1, even though i2c0 is disabled). This can also
> be achieved using devicetree aliases (see i2c_add_adapter). However,
> having the driver be self-contained without relying on aliases is more
> robust.
>
> Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>

I don't see how adding a nonstandard property in one of the i2c bus
drivers helps at all. How do you expect this to work when there are
multiple i2c controllers in the system using different drivers? What
should happen if both an alias and the busno property are set?

      Arnd

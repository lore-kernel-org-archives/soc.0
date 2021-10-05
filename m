Return-Path: <SRS0=5Yy3=OZ=pengutronix.de=p.zabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A64C433F5
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 10:22:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2D5BC61371; Tue,  5 Oct 2021 10:22:31 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47A861251
	for <soc@kernel.org>; Tue,  5 Oct 2021 10:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B47A861251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mXhac-00027b-W0; Tue, 05 Oct 2021 12:22:26 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mXhab-0006B5-TG; Tue, 05 Oct 2021 12:22:25 +0200
Message-ID: <6993ccdaf8f3f248f4ff1c739445e0f798ee0efa.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers
 to probe
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=C5=82?= Anikiel <pan@semihalf.com>, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org,  arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tomasz
 Nowicki <tn@semihalf.com>, Konrad Adamczyk <ka@semihalf.com>, Jacek
 Majkowski <jam@semihalf.com>
Date: Tue, 05 Oct 2021 12:22:25 +0200
In-Reply-To: <CAF9_jYQVpG8imn3zjAGKeZqZqDPtWRYWLQjNSXi2SXjjzAKvfA@mail.gmail.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
	 <20210920124141.1166544-4-pan@semihalf.com>
	 <ce254cc123f2809976c2f2404941a9074c458309.camel@pengutronix.de>
	 <CAF9_jYQVpG8imn3zjAGKeZqZqDPtWRYWLQjNSXi2SXjjzAKvfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

On Tue, 2021-10-05 at 13:12 +0200, Pawe=C5=82 Anikiel wrote:
> On Tue, Oct 5, 2021 at 11:34 AM Philipp Zabel <p.zabel@pengutronix.de> wr=
ote:
> > Hi Pawe=C5=82,
> >=20
> > On Mon, 2021-09-20 at 14:41 +0200, Pawe=C5=82 Anikiel wrote:
> > > The early reset driver doesn't ever probe, which causes consuming
> > > devices to be unable to probe. Add an empty driver to set this device
> > > as available, allowing consumers to probe.
> > >=20
> > > Signed-off-by: Pawe=C5=82 Anikiel <pan@semihalf.com>
> > > ---
> > >  drivers/reset/reset-socfpga.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >=20
> > > diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socf=
pga.c
> > > index 2a72f861f798..8c6492e5693c 100644
> > > --- a/drivers/reset/reset-socfpga.c
> > > +++ b/drivers/reset/reset-socfpga.c
> > > @@ -92,3 +92,29 @@ void __init socfpga_reset_init(void)
> > >       for_each_matching_node(np, socfpga_early_reset_dt_ids)
> > >               a10_reset_init(np);
> > >  }
> > > +
> > > +/*
> > > + * The early driver is problematic, because it doesn't register
> > > + * itself as a driver. This causes certain device links to prevent
> > > + * consumer devices from probing. The hacky solution is to register
> > > + * an empty driver, whose only job is to attach itself to the reset
> > > + * manager and call probe.
> > > + */
> > > +static const struct of_device_id socfpga_reset_dt_ids[] =3D {
> > > +     { .compatible =3D "altr,rst-mgr", },
> > > +     { /* sentinel */ },
> > > +};
> > > +
> > > +static int reset_simple_probe(struct platform_device *pdev)
> > > +{
> > > +     return 0;
> > > +}
> > > +
> > > +static struct platform_driver reset_socfpga_driver =3D {
> > > +     .probe  =3D reset_simple_probe,
> > > +     .driver =3D {
> > > +             .name           =3D "socfpga-reset",
> > > +             .of_match_table =3D socfpga_reset_dt_ids,
> > > +     },
> > > +};
> > > +builtin_platform_driver(reset_socfpga_driver);
> >=20
> > If we can just let devlink delay all consumers until the empty driver i=
s
> > probed, does the reset controller have to be registered early at all?
> >=20
> > regards
> > Philipp
>=20
> I asked Dinh if the reset controller code needs to be called early:
>=20
> > That's correct. It's for one of the SP timers.

Ah, right, those call of_reset_control_get() from TIMER_OF_DECLARE().
Thank you, I'll apply this to reset/fixes.

regards
Philipp

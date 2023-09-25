Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04DECE7A94
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 10:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88940C433CB; Mon, 25 Sep 2023 10:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85FCC433C9;
	Mon, 25 Sep 2023 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695636241;
	bh=pMlsWxZ5fP3XWaQChC2GU/7Nwmgz0TSVALACEgH5SD4=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=O4X+1OzjYEQOGWjGz7lJxo8KQticbWTt7LhRisi8537WulLHkyujwSnhJdE69U/7Z
	 CegXWnZtoFlrZvPz8/WMiJdL/aN7oy4qqhMUOdS635DFpPXLBZydvF20kIDgsz/olc
	 XNSsqNxOargcC6Sc/CAiiJcOLa8Z7VLbNVWWjAv1k3SWqUGap0728Qt3c2xlx8tolb
	 Uq7n22ajpZzkkUAr0OoixfXbV5Iej7wTEBOOeqnVcz7Bg3a+6G1+SLH+hCfnR4smI/
	 WVWU/rIdKnV8J8YiM5cZ/eA86qArk+GIFIuoICHY6KA5l0nhP0w+LjWuH/RXPJ8Ru4
	 j1e1J6la5nZXQ==
Date: Mon, 25 Sep 2023 12:03:56 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20230925120356.52bcd639@dellmb>
In-Reply-To: <ZQ2iULDcH6kdk7cJ@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-4-kabel@kernel.org>
	<ZQmbd211FzPjA97r@smile.fi.intel.com>
	<20230920190818.50b2018b@dellmb>
	<ZQwS/DXBt/kyyU5r@smile.fi.intel.com>
	<20230921222453.4b3bdb4c@thinkpad>
	<ZQ2iULDcH6kdk7cJ@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Sep 2023 17:18:56 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Thu, Sep 21, 2023 at 10:25:01PM +0200, Marek Beh=C3=BAn wrote:
> > On Thu, 21 Sep 2023 12:55:08 +0300
> > Andy Shevchenko <andy@kernel.org> wrote: =20
>=20
> ...
>=20
> > > > > > +	rising =3D reply[0] | (reply[2] << 8) | (reply[4] << 16) |
> > > > > > +		 (reply[6] << 24);
> > > > > > +	falling =3D reply[1] | (reply[3] << 8) | (reply[5] << 16) |
> > > > > > +		  (reply[7] << 24);     =20
> > > > >=20
> > > > > With a help of two masks, you can access to the both edges as to
> > > > >   64-bit value and simplify the code.   =20
> > > >=20
> > > > Huh? As in
> > > >   rising =3D reply & 0x00ff00ff00ff00ff;
> > > >   falling =3D reply & 0xff00ff00ff00ff00;
> > > > ?
> > > > But then I can't or the rising bit with the corresponding falling b=
it
> > > > to get pending...
> > > > Or I guess i can with:
> > > >   pending =3D rising & (pending >> 8);
> > > >=20
> > > > Am I understanding you correctly?
> > > >=20
> > > > But then I would need to store the mask in driver data as a 64-bit
> > > > value with half the data not used. Also the CPU is 32-bit.   =20
> > >=20
> > > If you use proper bitmaps, perhaps this will be easier. You can use o=
ne for
> > > each and merge them whenever you want (with bitmap_or() call) or spli=
t (with
> > > bitmap_and() respectively):
> > >=20
> > > 	bitmap_or(full, raising, failing); // merge
> > > 	bitmap_and(raising, full, rasing_mask); // split =20
> >=20
> > Hmm. But then what? I or the result and use it as pending interrupt
> > bitmap, to be iterated over. The indexes of the bits correspond to the
> > constants in the MCU API.
> >=20
> > So after your suggestion I have rising and falling containgin
> >   rising =3D 00rr00rr00rr00rr; /* r means rising bits */
> >   falling =3D 00ff00ff00ff00ff; /* f means falling bits */
> >   pending =3D rising | falling;
> > which means:
> >   pending =3D pp00pp00pp00pp; /* p means pending bits */
> > But these bit positions do not correspond to the interrupt number
> > anymore.
> >=20
> > I still think the de-interleaving of the buffer from
> >   rr ff rr ff rr ff rr ff
> > into two words:
> >   rising =3D rrrrrrrr;
> >   falling =3D ffffffff;
> > is simpler... =20
>=20
> There are two sides of this: OS and hardware. See Xilinx GPIO driver how =
it's
> made there. But before going that way, check on
> https://lore.kernel.org/all/ZOMmuZuhdjA6mdIG@smile.fi.intel.com/
> That APIs you would need I am pretty sure.

Andy, thank you for patience in reviewing this.

Hmm. I like the names, scatter and gather. In the firmware, I used
interleave and deinterleave, see
  https://gitlab.nic.cz/turris/hw/omnia_hw_ctrl/-/blob/master/src/drivers/i=
2c_iface.c#L360

But those functions work bit-wise. I realize that the I2C transfers in
the driver are so slow that such bit-wise cycling over a bitmap won't
matter much, but I still find my original proposal more simple and
straight-forward. But I will cave if you insist. Please let me know
(and can I then send your local patch in the series?)

> > > > > > +	if (!(mcu->features & FEAT_NEW_INT_API))
> > > > > > +
> > > > > >   cancel_delayed_work_sync(&mcu->button_release_emul_work); +
> > > > > > +	mutex_destroy(&mcu->lock);     =20
> > > > >=20
> > > > > Wrong order?   =20
> > > >=20
> > > > No, the mutex may be used in the work. Can't destroy it first. Or a=
m I
> > > > misunderstanding something?   =20
> > >=20
> > > I mean you are using a lot of devm(), can mutex be used in IRQ or wha=
tever
> > > that can be triggered after this call? =20
> >=20
> > OK, I think I need to free the irq before canceling the work. Thank you=
! =20
>=20
> Can you rather switch everything to be devm managed?

There are no devm_ calls for mutex and work initialization. Are you
suggesting that I should write a release function for the gpio
sub-driver? Something like

static void omnia_gpiochip_release(dev, res)
{
  cancel_work();
  mutex_destroy();
}

int omnia_mcu_register_gpiochip(mcu)
{
  ...
  x =3D devres_alloc(omnia_gpiochip_release);
  devres_add(dev, x);
  ...
}

Marek

Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C2CC04AAF
	for <soc@archiver.kernel.org>; Wed, 20 Sep 2023 17:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96CB1C433C9; Wed, 20 Sep 2023 17:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D793BC433C8;
	Wed, 20 Sep 2023 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695229703;
	bh=8b/ZUw047gnfc1wP817cudin9xoY2s1SOSFeNtD98s4=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=vL6wIc7nKwuLthF3tM2G8ZydPofg+XchjyKSt7pJhMPl4tvq+1LuGFaIdCvzw8lpa
	 DhU+W2NUNFS9KDp1iuGXdsX1BJqpJ7HDkDPKnJcKmQk7qZOCpGwUT+HoCfpbn5cN/3
	 mgJF4vw0e4Rta91VkuaxWpHpdPERSo7M3fKxZ7CApN9TkAIQh/EiqqkhnSDoIz0Ar3
	 OyrhRiFt8mCph37mq3QYddwafo8x/HJ2+yzwMHR8DoDoJt0v5r5T6ibG5O71lSHSJh
	 BEPmNJ2mshMnBOECnYTUqfvdEGldCLHDJII40n43pe79fIn+JVBxJccBn72pFGmDEP
	 eiK50jQbsLM9Q==
Date: Wed, 20 Sep 2023 19:08:18 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20230920190818.50b2018b@dellmb>
In-Reply-To: <ZQmbd211FzPjA97r@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-4-kabel@kernel.org>
	<ZQmbd211FzPjA97r@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andy,

I'm sending reply to some of your comments. For those to which I do not
reply I will simply incorporate your suggestions.

On Tue, 19 Sep 2023 16:00:39 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Tue, Sep 19, 2023 at 12:38:11PM +0200, Marek Beh=C3=BAn wrote:
> > - front button pin
> > - enable pins for USB regulators
> > - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> > - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> > - on board revisions 32+ also various peripheral resets and another
> >   voltage regulator enable pin =20
>=20
> Can the main driver provide a regmap and all other use it?

It can't. These are not registers accessible via I2C at specific
addresses, but commands with different-length arguments. This was
already discussed 4 years ago with Jacek, see
  https://www.spinics.net/lists/linux-leds/msg11587.html
There, Jacek suggested writing regmap API for the leds-turris-omnia
driver (the MCU is also a LED controller and has same command
interface, only at different I2C address).

> > +	if (gpio->ctl_cmd)
> > +		return -EOPNOTSUPP; =20
>=20
> I believe internally we use ENOTSUPP.
> Ditto for all cases like this.

checkpatch warns:=20
  ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

> > +	mutex_lock(&mcu->lock);
> > +
> > +	if (ctl_mask)
> > +		err =3D omnia_ctl_cmd_unlocked(mcu,
> >   CMD_GENERAL_CONTROL, ctl,
> > +					     ctl_mask); =20
>=20
> > +	if (!err && ext_ctl_mask)
> > +		err =3D omnia_ctl_cmd_unlocked(mcu, CMD_EXT_CONTROL,
> >   ext_ctl,
> > +					     ext_ctl_mask); =20
>=20
> Can it be
>=20
> 	if (err)
> 		goto out_unlock;
>=20
> 	if (_mask)
> 		...

Linus suggested using guards, so I will refactor this away.

> > +	mutex_unlock(&mcu->lock); =20
>=20
> > +	if (err)
> > +		dev_err(&mcu->client->dev, "Cannot set GPIOs:
> >   %d\n", err); =20
>=20
> How is useful this one?

The function does not return, this way we will know something has gone
wrong. I am used to do this from the networking subsystem, where people
at least from mv88e6xxx wanted such behavior. Do you want me to drop
this?

> > +static int omnia_gpio_init_valid_mask(struct gpio_chip *gc,
> > +				      unsigned long *valid_mask,
> > +				      unsigned int ngpios)
> > +{
> > +	struct omnia_mcu *mcu =3D gpiochip_get_data(gc); =20
>=20
> > +	bitmap_zero(valid_mask, ngpios); =20
>=20
> No need.
>=20
> Also do you have bitops.h included?

bitmap.h actually for this

> > +	rising =3D reply[0] | (reply[2] << 8) | (reply[4] << 16) |
> > +		 (reply[6] << 24);
> > +	falling =3D reply[1] | (reply[3] << 8) | (reply[5] << 16) |
> > +		  (reply[7] << 24); =20
>=20
> With a help of two masks, you can access to the both edges as to
>   64-bit value and simplify the code.

Huh? As in
  rising =3D reply & 0x00ff00ff00ff00ff;
  falling =3D reply & 0xff00ff00ff00ff00;
?
But then I can't or the rising bit with the corresponding falling bit
to get pending...
Or I guess i can with:
  pending =3D rising & (pending >> 8);

Am I understanding you correctly?

But then I would need to store the mask in driver data as a 64-bit
value with half the data not used. Also the CPU is 32-bit.

> > +static struct attribute *omnia_mcu_gpio_attrs[] =3D {
> > +	&dev_attr_front_button_mode.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group omnia_mcu_gpio_group =3D {
> > +	.attrs =3D omnia_mcu_gpio_attrs,
> > +}; =20
>=20
> ATTRIBUTE_GROUPS() ?

I only want to create ane attribute_group. (I am using
devm_device_add_group(), not devm_device_add_groups()).

> > +	err =3D devm_device_add_group(dev, &omnia_mcu_gpio_group); =20
>=20
> No way, no-one should use the API scheduled for removal.
> What's wrong with .dev_groups ?

Can I add them conditionally? GPIO chip is always created, but the
patch 4/7 only adds the attributes conditionally. Is it possible via
.dev_groups?

>=20
> ...
>=20
> > +void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu)
> > +{
> > +	if (!(mcu->features & FEAT_NEW_INT_API))
> > +
> >   cancel_delayed_work_sync(&mcu->button_release_emul_work); +
> > +	mutex_destroy(&mcu->lock); =20
>=20
> Wrong order?

No, the mutex may be used in the work. Can't destroy it first. Or am I
misunderstanding something?


> >  struct omnia_mcu {
> >  	struct i2c_client *client;
> >  	const char *type;
> >  	u16 features;
> > +
> > +	/* GPIO chip */
> > +	struct gpio_chip gc; =20
>=20
> Making this a first member may lead to the better code. Check with
>   bloat-o-meter.

kabel@dellmb ~/linux $ ./scripts/bloat-o-meter \
  turris-omnia-mcu.o turris-omnia-mcu-gpiochip-first.o
add/remove: 0/0 grow/shrink: 9/0 up/down: 52/0 (52)
Function                                     old     new   delta
omnia_mcu_register_gpiochip                  840     852     +12
omnia_mcu_probe                              696     708     +12
omnia_mcu_unregister_gpiochip                 20      24      +4
omnia_irq_bus_sync_unlock                    256     260      +4
omnia_irq_bus_lock                            36      40      +4
omnia_gpio_get_multiple                      872     876      +4
omnia_gpio_get                               372     376      +4
fw_features_show                              28      32      +4
front_button_mode_show                       260     264      +4
Total: Before=3D10468, After=3D10520, chg +0.50%

Seems the code grew when I swapped it.


Marek

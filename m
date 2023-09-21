Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952B2E7D0A2
	for <soc@archiver.kernel.org>; Thu, 21 Sep 2023 19:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57271C433C9; Thu, 21 Sep 2023 19:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35974C433BA;
	Thu, 21 Sep 2023 19:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695325570;
	bh=Qoya1iJ5uObYvLwvP7Y7d7BwBLYs+T4m6LDYCm7c7ns=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=dIuRsYmoFPIsUBTRT3BjhRtX4hD8VNUarXxj4xAYRhAqR9MMeHiTe8lnJqAvaqolC
	 B2ADdiJecygKy2xaQGu/+x/2Alu7GcfKSvzgvwngeZoZUG42dU/SnjNG/ikS7zkM0s
	 Ymg1NQaS30wKA9FCPPazRbe43udxB9VppRFkND8HT5kgKotrrEfHYXfsa1hIosq2NH
	 i5RuTjjNoY16lp7iJ8IBwNtX8XvK/yUyY8IoP7yjMifggS5KcunQx2MnZVSwVaxcjy
	 x4hWUJbg5JUKh3j3sKPPZQD+3O3t5oc3b/78tOowrdO2L/t6/FYdRchAiaACgBDnaR
	 02Bg8kJTSakpQ==
Date: Thu, 21 Sep 2023 21:45:57 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20230921214541.0dae4d62@thinkpad>
In-Reply-To: <CACRpkdY8GcDYEDg=w4_ggY7O7kj-_X4ejpXni-t8M3yMivU88Q@mail.gmail.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-4-kabel@kernel.org>
	<CACRpkdY8GcDYEDg=w4_ggY7O7kj-_X4ejpXni-t8M3yMivU88Q@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Linus,

I am sending some comments/questions to your review. To those of
your comments that I do not reply, I will incorporate your suggestion.

On Wed, 20 Sep 2023 13:58:37 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> > --- a/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> > +++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu
> > @@ -1,3 +1,19 @@
> > +What:          /sys/bus/i2c/devices/<mcu_device>/front_button_mode
> > +Date:          August 2023
> > +KernelVersion: 6.6
> > +Contact:       Marek Beh=C3=BAn <kabel@kernel.org>
> > +Description:   (RW) The front button on the Turris Omnia router can be
> > +               configured either to change the intensity of all the LE=
Ds on the
> > +               front panel, or to send the press event to the CPU as an
> > +               interrupt.
> > +
> > +               This file switches between these two modes:
> > +               - "mcu" makes the button press event be handled by the =
MCU to
> > +                 change the LEDs panel intensity.
> > +               - "cpu" makes the button press event be handled by the =
CPU.
> > +
> > +               Format: %s. =20
>=20
> I understand what this does, but why does this have to be configured
> at runtime from userspace sysfs? Why can't this just be a property in
> device tree or ACPI (etc)? I don't imagine a user is going to change
> this back and forth are they? They likely want one or another.

Yes, we really do expect this, we even want to have some applications
on the router to do this.

> > +static const struct omnia_gpio {
> > +       u8 cmd, ctl_cmd;
> > +       u32 bit, ctl_bit;
> > +       u32 int_bit; =20
>=20
> If they are really just ONE bit I would actually use an int, encode
> the bit number rather than the mask, and then use BIT( ..->int_bit)
> from <linux/bits.h> everywhere I need a mask. No strong preference
> though.

See below.

> > +/* mapping from interrupts to indexes of GPIOs in the omnia_gpios arra=
y */
> > +static const unsigned int omnia_int_to_gpio_idx[32] =3D {
> > +       [ilog2(INT_CARD_DET)]           =3D 4,
> > +       [ilog2(INT_MSATA_IND)]          =3D 5,
> > +       [ilog2(INT_USB30_OVC)]          =3D 6, =20
>=20
> ilog2 is a bit unituitive for a programmer, are you a schooled mathematic=
ian
> Marek? ;)
>=20
> It is also a consequence of using a bitmask rather than a bit number in
> the struct, all ilog2 does is fls-1. So what about just putting the bit n=
umber
> in the struct and then all of these assignments will look natural as well.

Not really, altough I studied advanced analysis :) I guess ilog2 might
confuse some people. Would bf_shf() (as in bitfield shift) from
linux/bitfield.h be better?

So, the reasoning behind why the bits are defined as such in
linux/turris-omnia-mcu-interface.h (from patch 2/7):

- if you look for example at enum sts_word_e, the entries correspond
  to fields withing the word. And not all fields are 1-bit wide. For
  example the STS_MCU_TYPE field is 2 bits wide.
  Similarly the FEAT_LED_STATE_EXT_MASK field in enum features_e

- I have seen similar code within many parts of the kernel and have
  adopted it. I think many developers are accustomed to it. Look for
  example into how register fields are defined in the mv88e6xxx driver
  header files

In order to make maintaining smoother, I would like to have the
turris-omnia-mcu-interface.h file be one-to-one copy of the
corresponding file within the MCU firmware repository
(https://gitlab.nic.cz/turris/hw/omnia_hw_ctrl/-/blob/master/src/drivers/i2=
c_iface.h)
wherein the constants are defined this way and used throughout the
codebase.
Since I am the author and maintainer of the (current versions of) MCU
firmware, I could take your suggestion and change the constants, and
rewrite the firmware.
But taking into consideration the above two points, I am reluctant to
do so.

So... do you insist on this change? I would rather keep it as it is,
but I can change the ilog2() to bf_shf() to make it easier for
non-mathematicians.

> > +static bool omnia_irq_read_pending_new(struct omnia_mcu *mcu,
> > +                                      unsigned long *pending)
> > +{
> > +       u32 rising, falling;
> > +       u8 reply[8] =3D {};
> > +       size_t len;
> > +       int err;
> > +
> > +       /*
> > +        * Determine how many bytes we need to read from the reply to t=
he
> > +        * CMD_GET_INT_AND_CLEAR command in order to retrieve all unmas=
ked
> > +        * interrupts.
> > +        */
> > +       len =3D max(((ilog2(mcu->rising & mcu->mask) >> 3) << 1) + 1,
> > +                 ((ilog2(mcu->falling & mcu->mask) >> 3) << 1) + 2); =
=20
>=20
> Really hard to read, and again easier if we store the bit number
> rather than the bitmask.

No. Even if I take your suggestion and rewrite this to store bit offsets
instead of bit masks, here I really need to compute this, since there
might be multiple bits set. For example there might be bits 4, 5, and
14 set in mcu->rising (mcu->rising =3D 0x4030).
I need to determine how many bytes of the I2C reply I will need, and
for that I need to know the position of the first set bit.
(I could keep a track of the maximum set bit, but honestly this seems
to me much easier).

I could use ffs(x) instead of ilog2(x) + 1.

> > +static void button_release_emul_fn(struct work_struct *work)
> > +{
> > +       struct omnia_mcu *mcu =3D container_of(to_delayed_work(work),
> > +                                            struct omnia_mcu,
> > +                                            button_release_emul_work);
> > +
> > +       mcu->button_pressed_emul =3D false;
> > +       generic_handle_irq_safe(mcu->client->irq);
> > +} =20
> (...)
> > +       /*
> > +        * The old firmware triggers an interrupt whenever status word =
changes,
> > +        * but does not inform about which bits rose or fell. We need t=
o compute
> > +        * this here by comparing with the last status word value.
> > +        *
> > +        * The STS_BUTTON_PRESSED bit needs special handling, because t=
he old
> > +        * firmware clears the STS_BUTTON_PRESSED bit on successful com=
pletion
> > +        * of the CMD_GET_STATUS_WORD command, resulting in another int=
errupt:
> > +        * - first we get an interrupt, we read the status word where
> > +        *   STS_BUTTON_PRESSED is present,
> > +        * - MCU clears the STS_BUTTON_PRESSED bit because we read the =
status
> > +        *   word,
> > +        * - we get another interrupt because the status word changed a=
gain
> > +        *   (STS_BUTTON_PRESSED was cleared).
> > +        *
> > +        * The gpiolib-cdev, gpiolib-sysfs and gpio-keys input driver a=
ll call
> > +        * the gpiochip's .get() method after an edge event on a reques=
ted GPIO
> > +        * occurs.
> > +        *
> > +        * We ensure that the .get() method reads 1 for the button GPIO=
 for some
> > +        * time.
> > +        */
> > +
> > +       if (status & STS_BUTTON_PRESSED) {
> > +               mcu->button_pressed_emul =3D true;
> > +               mod_delayed_work(system_wq, &mcu->button_release_emul_w=
ork,
> > +                                msecs_to_jiffies(50));
> > +       } else if (mcu->button_pressed_emul) {
> > +               status |=3D STS_BUTTON_PRESSED;
> > +       } =20
>=20
> I feel a bit icky about this, would be best if Dmitry Torokhov review
> such input subsystem-related things.
>=20
> It looks like a reimplementation of drivers/input/keyboard/gpio_keys.c
> so why not just connect a gpio-keys device using either device tree
> or a software node? (Dmitry knows all about how to create proper
> software nodes for stuff like this, DT is self-evident.)

You have it the other way around :-) This is done in order so that the
gpio-keys driver can use it. Let me explain:

The new versions of the MCU firmware support rising and falling edges
for GPIO events. So when button is pressed, we get an event, and when
it is released, we get an event. gpio-keys works perfectly.

The problem with old MCU firmware is that the interrupt API was
tragically designed, which resulted in that on button press event, we
get an interrupt, and when we read the status word via I2C, the bit gets
cleared immediately (and we get another interrupt because the bit is
cleared). There is no interrupt when the button is truly released.
This fake "button release interrupt" comes so fast that the gpio_keys
driver ignores it even if we set debounce_interval to smallest possible
value of 1ms (if I understand the gpio_keys driver correctly).

So this workaround is there so that we generate a GPIO release event
for the button only after 50ms, if the MCU is running old firmware.

A similar thing is implemented in the gpio-keys driver when there is no
release event: if the event source is an interrupt descriptor instead
of a gpio descriptor, the gpio-keys will emulate button release.
I could use this, but then we would need to change the device-tree
based on whether the MCU is running old firmware vs new, which I want
to avoid. I also want to avoid software nodes, since I want the button
to be properly described in device-tree.

Honestly, because of this whole debacle I was also considering writing
my own small input driver within this turris-omnia-mcu driver...

> > +       mcu->gc.names =3D omnia_mcu_gpio_names; =20
>=20
> Do we really support format strings in these names? I don't
> think so, or I'm wrong about my own code... (Which wouldn't
> be the first time.)

Yes we do, but only one :) The number of the GPIO.

> >  #include <asm/byteorder.h>
> > +#include <linux/gpio/driver.h>
> >  #include <linux/i2c.h>
> > +#include <linux/log2.h> =20
>=20
> I think we want to get rid of log2.h from this driver.

See above, even if I take your suggestion, I will still need the
position of the first set bit within word in
omnia_irq_read_pending_new().

Marek

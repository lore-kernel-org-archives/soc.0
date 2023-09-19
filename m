Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2CFCD5BD3
	for <soc@archiver.kernel.org>; Tue, 19 Sep 2023 15:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81962C433C9; Tue, 19 Sep 2023 15:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB40DC433C8;
	Tue, 19 Sep 2023 15:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695136604;
	bh=G7QYxXyfw2SO+KlXBJCxqau9yIsTqMMVo6al2TbeZIs=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=P2N8IVxyVptgqQoCcy690AqZosd1qbPtXM4+CnaXAY9JGDZULtOQN6ihtNmJwa02c
	 0Ki+58GVTRRil/B2Js5B/DmdHe7vHHgJoV72EAo0coLiBnrtY6Z5IpEQVRYs1/KSFX
	 eM4NaEepA2RrzVzROs6n+ZOip/4c4q+6XiiecXKboTAIctoOTtD6+NrQDGiR+EEhPW
	 eO1xCBbim0cQTD/ggMSO1Xenq9Es2jbanJLBfURIkhQqns3Gois6uVM3GByu8N8NRK
	 qMJKhdp+Mwyk2XHEJWdzdFOjmbkh9XdezxF6WFckNweSJaNv1Oy9oGTqY/LyWj5uv7
	 XiblGWuC6ImQQ==
Date: Tue, 19 Sep 2023 17:16:38 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-gpio@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <20230919171638.19bc1619@dellmb>
In-Reply-To: <ZQmUFPvIx91+ps6k@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
	<20230919103815.16818-3-kabel@kernel.org>
	<ZQmUFPvIx91+ps6k@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Andy,

thank you for your review. I have some questions regarding your
comments.

On Tue, 19 Sep 2023 15:29:08 +0300
Andy Shevchenko <andy@kernel.org> wrote:

> On Tue, Sep 19, 2023 at 12:38:10PM +0200, Marek Beh=C3=BAn wrote:
> > Add a new platform driver that exposes the features provided by the
> > microcontroller on the Turris Omnia board. =20
>=20
> > This commit adds the basic skeleton for the driver. =20
>=20
> Read "Submitting Patches" documentation (find "This patch" in it) and ame=
nd
> your commit message accordingly.

OK.

> > +Date:		August 2023
> > +KernelVersion:	6.6 =20
>=20
> Wrong and outdated. Use phb-crystall-ball to find the closest possible va=
lues
> for both parameters here.
>=20
> Ditto for all others with the same issue.
>=20
> Note, it likely might be part of v6.7, not earlier.

OK

> >  obj-$(CONFIG_GOLDFISH)		+=3D goldfish/
> >  obj-$(CONFIG_CHROME_PLATFORMS)	+=3D chrome/
> >  obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/
> > +obj-$(CONFIG_CZNIC_PLATFORMS)	+=3D cznic/ =20
>=20
> Why not ordered (to some extent) here (as you did in the other file)?

Where should I put it? The other entries are not ordered, see
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/platform/Makefile?h=3Dv6.6-rc2

> > +turris-omnia-mcu-objs		:=3D turris-omnia-mcu-base.o =20
>=20
> objs is for user space tools. Kernel code should use m,y.

I don't understand. There are plenty driver using -objs. The driver
consists of multiple C source files. I thought this should be done as
  obj-$(CONFIG_XXX) +=3D xxx.o
  xxx-objs :=3D xxx-a.o xxx-b.o xxx-c.o

If you choose CONFIG_XXX =3D y, then the driver will be compiled into
kernel, if you choose CONFIG_XXX =3D m, then the driver will be a module
xxx.ko.

> > +#include <linux/hex.h>
> > +#include <linux/module.h> =20
>=20
> Missing types.h, sysfs.h, mod_devicetable.h, i2c.h, ...

i2c.h comes from turris-omnia-mcu.h. The others I will fix. Does the
the .c file also include all those headers if it includes a local
header already?

> > +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool
> > bootloader,
> > +				  u8 *version)
> > +{
> > +	u8 reply[20];
> > +	int ret;
> > +
> > +	ret =3D omnia_cmd_read(mcu->client, bootloader ?
> > CMD_GET_FW_VERSION_BOOT :
> > +n average development ti
> > CMD_GET_FW_VERSION_APP,
> > +			     reply, sizeof(reply)); =20
>=20
> > +	if (ret < 0) =20
>=20
> Can it return positive value? What would be the meaning of it?

Originally I had it return 0 on success, but recently I've had a
discussion about this same thing with LED subsystem maintainer about
some LED patches, Lee Jones, who requested the _read function to return
number of bytes read on success. See at
  https://lore.kernel.org/linux-leds/20230821122644.GJ1380343@google.com/
where he says:
  Read and write APIs, even abstracted ones such as these generally
  return the number of bytes successfully read and written respectively.
  If you are going to normalise, then please do so against this
  standard.
I do not agree with him, since this is a local command accessor which
only succeeds if all the bytes are read/written as requested. But I
adjusted my code as per his request since he is the maintainer.

I will change the code back so that it returns 0 on success instead of
the number of bytes written.


> > +		return ret; =20
>=20
> > +	version[40] =3D '\0'; =20
>=20
> How do you know the version has enough space?

The function is only use within the file, and both users know how much
space it needs. But ok, I shall enforce it with the static keyword as
  static int
  omnia_get_version_hash(...,
			 u8 version[static 2*OMNIA_FW_VERSION_LEN + 1]);
Would that be okay?

> > +	bin2hex(version, reply, 20);
> > +
> > +	return 0;
> > +}
> > +
> > +static ssize_t fw_version_hash_show(struct device *dev, char *buf,
> > +				    bool bootloader)
> > +{
> > +	struct omnia_mcu *mcu =3D
> > i2c_get_clientdata(to_i2c_client(dev));
> > +	u8 version[41]; =20
>=20
> > +	int err; =20
>=20
> In two near functions you already inconsistent in the naming of the
> return code variable. Be consistent across all your code, i.e. choose
> one name and use it everywhere.

I use
  ret - when the return value can also be positive and mean something
  err - when the return value is either 0 (no error) or negative errno
Is this inconsistent?

> > +	err =3D omnia_get_version_hash(mcu, bootloader, version);
> > +	if (err)
> > +		return err;
> > +
> > +	return sysfs_emit(buf, "%s\n", version);
> > +} =20
>=20
> ...
>=20
> > +	return sysfs_emit(buf, "%#x\n", mcu->features); =20
>=20
> "0" will be printed differently, is this on purpose?

No, I wanted it to print 0x0, didn't know '#' would print just 0.
Thanks.

> > +	int ret =3D omnia_cmd_read_u8(to_i2c_client(dev),
> > CMD_GET_RESET); +
> > +	if (ret < 0)
> > +		return ret; =20
>=20
> Better from maintenance perspective to have
>=20
> 	int ret;
>=20
> 	ret =3D omnia_cmd_read_u8(to_i2c_client(dev), CMD_GET_RESET);
> 	if (ret < 0)
> 		return ret;

OK

> > +static struct attribute *omnia_mcu_attrs[] =3D {
> > +	&dev_attr_fw_version_hash_application.attr,
> > +	&dev_attr_fw_version_hash_bootloader.attr,
> > +	&dev_attr_fw_features.attr,
> > +	&dev_attr_mcu_type.attr,
> > +	&dev_attr_reset_selector.attr, =20
>=20
> > +	NULL, =20
>=20
> No comma for the terminator line. It will make your code robust at
> compile time against some misplaced entries.

OK

> > +}; =20
>=20
> > + =20
>=20
> Unneeded blank line.

OK

> > +ATTRIBUTE_GROUPS(omnia_mcu); =20
>=20
> ...
>=20
> > +	u8 version[41]; =20
>=20
> This magic sizes should go away. Use predefined constant, or allocate
> on the heap, depending on the case(s) you have.

OK

> > +	int status; =20
>=20
> My gosh, it's a _third_ name for the same!

The variable holds value of the status register, which is needed at
another point in this function. I thought naming it just "ret" would
cause confusions... Do you really propose to rename it such?

> > +	status =3D omnia_cmd_read_u16(mcu->client,
> > CMD_GET_STATUS_WORD);
> > +	if (status < 0)
> > +		return status; =20
>=20
> ...
>=20
> > +	for (int i =3D 0; i < ARRAY_SIZE(features); ++i) { =20
>=20
> Why signed?

Because it is shorter and makes no difference and there are tons of
  for (int i =3D 0; i < ARRAY_SIZE(x); i++)
in the kernel already. But if you really want, I can change it. Please
let me know.

> Why pre-increment?

Again, it makes no difference, is widely used in the kernel and I
personally prefer it. But I will change it if you want.


>=20
> > +		if (!(mcu->features & features[i].mask)) { =20
>=20
> Wouldn't be better
>=20
> 		if (mcu->features & features[i].mask)
> 			continue;
>=20
> ?

OK

> > +			omnia_info_missing_feature(dev,
> > features[i].name);
> > +			suggest_fw_upgrade =3D true;
> > +		}
> > +	} =20
>=20
> ...
>=20
> > +		dev_info(dev,
> > +			 "Consider upgrading MCU firmware with the
> > omnia-mcutool utility.\n"); =20
>=20
> You have so-o many dev_info() calls, are you sure you not abusing use
> of that?

I want the users to upgrade the MCU firmware. These infos are only
printed during probe time, and won't be printed at all if the firmware
is upgraded. Is this a problem?

>=20
> ...
>=20
> > +	if (ret) {
> > +		dev_err(dev, "Cannot determine MCU supported
> > features: %d\n",
> > +			ret);
> > +		return ret; =20
>=20
> 		return dev_err_probe(...);

Thx. Didn't know this one.

> > +	} =20
>=20
> ...
>=20
> > +	if (!client->irq) {
> > +		dev_err(dev, "IRQ resource not found\n");
> > +		return -ENODATA;
> > +	} =20
>=20
> Why you need to allocate memory, go through the initial checks, etc
> and then fail? What's wrong with checking this first?
>=20
> Why -ENODATA?!

OK

> > +static const struct of_device_id of_omnia_mcu_match[] =3D {
> > +	{ .compatible =3D "cznic,turris-omnia-mcu", }, =20
>=20
> Inner comma is not needed.

OK

> > +	{}, =20
>=20
> No comma for the terminator entry.

OK

> > +}; =20
>=20
> ...
>=20
> > +static const struct i2c_device_id omnia_mcu_id[] =3D {
> > +	{ "turris-omnia-mcu", 0 }, =20
>=20
> ', 0' part is redundant.

OK

> > +	{ }
> > +}; =20
>=20
> ...
>=20
> > +static struct i2c_driver omnia_mcu_driver =3D {
> > +	.probe		=3D omnia_mcu_probe,
> > +	.id_table	=3D omnia_mcu_id,
> > +	.driver		=3D {
> > +		.name	=3D "turris-omnia-mcu",
> > +		.of_match_table =3D of_omnia_mcu_match,
> > +		.dev_groups =3D omnia_mcu_groups,
> > +	},
> > +}; =20
>=20
> > + =20
>=20
> Redundant blank line.

OK

> > +module_i2c_driver(omnia_mcu_driver); =20
>=20
> ...
>=20
> > +#ifndef __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H
> > +#define __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H =20
>=20
> WE_LIKE_VERY_LONG_AND_OVERFLOWED_DEFINITIONS_H!

Sigh... OK, I will change it :)

> > +#include <asm/byteorder.h> =20
>=20
> This usually goes after linux/*.h.

OK
>=20
> > +#include <linux/i2c.h> =20
>=20
> Missing types.h, errno.h, ...
>=20
> + blank line?

Will change.

> > +#include <linux/turris-omnia-mcu-interface.h> =20
>=20
> ...
>=20
> > +	ret =3D i2c_transfer(client->adapter, msgs,
> > ARRAY_SIZE(msgs));
> > +	if (likely(ret =3D=3D ARRAY_SIZE(msgs))) =20
>=20
> Why likely()? Please, justify.

Becuase it is unlikely the I2C transaction will fail. In most cases, it
does not.

> > +		return len; =20
>=20
> > +	else if (ret < 0)
> > +		return ret;
> > +	else
> > +		return -EIO; =20
>=20
> In both cases the 'else' is redundant. Moreover, the usual pattern is
> to check for the errors first.
>=20
> > +} =20
>=20
> ...
>=20
> > +#ifndef __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H
> > +#define __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H =20
>=20
> My gosh!

:)

> > +#include <linux/bits.h> =20
>=20
> > +enum commands_e { =20
>=20
> Are you sure the name is unique enough / properly namespaced?
> Same Q to all enums.

I can change it. I wanted it to be compatible with the header in the
firmware repository.
>=20
> ...
>=20
> > +	/*CTL_RESERVED		=3D BIT(2),*/ =20
>=20
> Missing spaces?
> Also, needs a comment why this is commented out.

OK

> > +	CTL_BOOTLOADER		=3D BIT(7) =20
>=20
> Add trailing comma.

OK

Marek

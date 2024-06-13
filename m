Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2830C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0438C4AF1C; Thu, 13 Jun 2024 16:28:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FDC7C2BBFC;
	Thu, 13 Jun 2024 16:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FDC7C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718296138; x=1749832138;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Eh3zJZSxjfe9kQidruEAKPTpivS+yKfQsIOYn4uGBt4=;
  b=Wmv0LHUD4BFOQSvZeFOtcvKzNXUF6HT/Owwaw1cZTzuaJ+w5JzrdZuWT
   JXe7PoQvkqdVDIYsHY0nYScVO9lHURuAb4tFsZibS+diV++OVo+7xranj
   EkzhqOhwx9w1G67i7ypx4kyg6wLHP1t2nLEenV5K9wtfw8eqVfkfWzz1t
   IzdtKS1Hpz347MI82S0gJ8JnFoom9ax0oe/hsXb/oMub2uVOi6jpVtMbQ
   tVMgod7L/c50jB0pcqdG6lf5WUJhvREMlQw6kI0/5ygB9JctBrOGp7UAT
   CiS+KHc2yCnP+7P75/kdY4EyzG1l9KtJWNA15tA62RVovzuL3VCC4L9fY
   A==;
X-CSE-ConnectionGUID: +xB56lj+RaCdazNjKjHw9g==
X-CSE-MsgGUID: uhZaTHtKROSU3IY1LWnwGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18918407"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="18918407"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 09:28:57 -0700
X-CSE-ConnectionGUID: ubeqtWo7RC+8y/E6D10QSQ==
X-CSE-MsgGUID: 14kinTJ8S6maw1SLd3pV6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="44634697"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 09:28:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 19:28:49 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 08/17] firmware: turris-mox-rwtm: Don't create own
 kobject type
In-Reply-To: <20240613161045.29606-9-kabel@kernel.org>
Message-ID: <f29374d9-f6ae-4c1b-df13-14e30b6a6166@linux.intel.com>
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-9-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-84385502-1718296129=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-84385502-1718296129=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:

> In order to create attribute files in /sys/firmware/turris-mox-rwtm,
> this driver creates it's own kobject type.
>=20
> Simplify this by dropping this own kobject creation, and instead
> creating standard device attribute files.
>=20
> For backwards compatibility with sysfs ABI, create a symlink
> /sys/firmware/turris-mox-rwtm, pointing to this device's sysfs
> directory.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Much better, thanks.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/firmware/turris-mox-rwtm.c | 107 ++++++++---------------------
>  1 file changed, 29 insertions(+), 78 deletions(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index 75a98386a2b0..d17dc0679439 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -21,7 +21,6 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> =20
> @@ -60,13 +59,10 @@ enum mbox_cmd {
>  =09MBOX_CMD_OTP_WRITE=09=3D 8,
>  };
> =20
> -struct mox_kobject;
> -
>  struct mox_rwtm {
>  =09struct device *dev;
>  =09struct mbox_client mbox_client;
>  =09struct mbox_chan *mbox;
> -=09struct mox_kobject *kobj;
>  =09struct hwrng hwrng;
> =20
>  =09struct armada_37xx_rwtm_rx_msg reply;
> @@ -100,59 +96,17 @@ struct mox_rwtm {
>  #endif
>  };
> =20
> -struct mox_kobject {
> -=09struct kobject kobj;
> -=09struct mox_rwtm *rwtm;
> -};
> -
> -static inline struct kobject *rwtm_to_kobj(struct mox_rwtm *rwtm)
> -{
> -=09return &rwtm->kobj->kobj;
> -}
> -
> -static inline struct mox_rwtm *to_rwtm(struct kobject *kobj)
> -{
> -=09return container_of(kobj, struct mox_kobject, kobj)->rwtm;
> -}
> -
> -static void mox_kobj_release(struct kobject *kobj)
> -{
> -=09kfree(to_rwtm(kobj)->kobj);
> -}
> -
> -static const struct kobj_type mox_kobj_ktype =3D {
> -=09.release=09=3D mox_kobj_release,
> -=09.sysfs_ops=09=3D &kobj_sysfs_ops,
> -};
> -
> -static int mox_kobj_create(struct mox_rwtm *rwtm)
> -{
> -=09rwtm->kobj =3D kzalloc(sizeof(*rwtm->kobj), GFP_KERNEL);
> -=09if (!rwtm->kobj)
> -=09=09return -ENOMEM;
> -
> -=09kobject_init(rwtm_to_kobj(rwtm), &mox_kobj_ktype);
> -=09if (kobject_add(rwtm_to_kobj(rwtm), firmware_kobj, "turris-mox-rwtm")=
) {
> -=09=09kobject_put(rwtm_to_kobj(rwtm));
> -=09=09return -ENXIO;
> -=09}
> -
> -=09rwtm->kobj->rwtm =3D rwtm;
> -
> -=09return 0;
> -}
> -
>  #define MOX_ATTR_RO(name, format, cat)=09=09=09=09\
>  static ssize_t=09=09=09=09=09=09=09\
> -name##_show(struct kobject *kobj, struct kobj_attribute *a,=09\
> +name##_show(struct device *dev, struct device_attribute *a,=09\
>  =09    char *buf)=09=09=09=09=09=09\
>  {=09=09=09=09=09=09=09=09\
> -=09struct mox_rwtm *rwtm =3D to_rwtm(kobj);=09\
> +=09struct mox_rwtm *rwtm =3D dev_get_drvdata(dev);=09=09\
>  =09if (!rwtm->has_##cat)=09=09=09=09=09\
>  =09=09return -ENODATA;=09=09=09=09\
>  =09return sprintf(buf, format, rwtm->name);=09=09\
>  }=09=09=09=09=09=09=09=09\
> -static struct kobj_attribute mox_attr_##name =3D __ATTR_RO(name)
> +static DEVICE_ATTR_RO(name)
> =20
>  MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
>  MOX_ATTR_RO(board_version, "%i\n", board_info);
> @@ -161,6 +115,17 @@ MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
>  MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
>  MOX_ATTR_RO(pubkey, "%s\n", pubkey);
> =20
> +static struct attribute *turris_mox_rwtm_attrs[] =3D {
> +=09&dev_attr_serial_number.attr,
> +=09&dev_attr_board_version.attr,
> +=09&dev_attr_ram_size.attr,
> +=09&dev_attr_mac_address1.attr,
> +=09&dev_attr_mac_address2.attr,
> +=09&dev_attr_pubkey.attr,
> +=09NULL
> +};
> +ATTRIBUTE_GROUPS(turris_mox_rwtm);
> +
>  static int mox_get_status(enum mbox_cmd cmd, u32 retval)
>  {
>  =09if (MBOX_STS_CMD(retval) !=3D cmd)
> @@ -175,16 +140,6 @@ static int mox_get_status(enum mbox_cmd cmd, u32 ret=
val)
>  =09=09return MBOX_STS_VALUE(retval);
>  }
> =20
> -static const struct attribute *mox_rwtm_attrs[] =3D {
> -=09&mox_attr_serial_number.attr,
> -=09&mox_attr_board_version.attr,
> -=09&mox_attr_ram_size.attr,
> -=09&mox_attr_mac_address1.attr,
> -=09&mox_attr_mac_address2.attr,
> -=09&mox_attr_pubkey.attr,
> -=09NULL
> -};
> -
>  static void mox_rwtm_rx_callback(struct mbox_client *cl, void *data)
>  {
>  =09struct mox_rwtm *rwtm =3D dev_get_drvdata(cl->dev);
> @@ -487,6 +442,11 @@ static inline void rwtm_unregister_debugfs(struct mo=
x_rwtm *rwtm)
>  }
>  #endif
> =20
> +static void rwtm_firmware_symlink_drop(void *)
> +{
> +=09sysfs_remove_link(firmware_kobj, DRIVER_NAME);
> +}
> +
>  static int turris_mox_rwtm_probe(struct platform_device *pdev)
>  {
>  =09struct mox_rwtm *rwtm;
> @@ -503,18 +463,6 @@ static int turris_mox_rwtm_probe(struct platform_dev=
ice *pdev)
>  =09if (!rwtm->buf)
>  =09=09return -ENOMEM;
> =20
> -=09ret =3D mox_kobj_create(rwtm);
> -=09if (ret < 0) {
> -=09=09dev_err(dev, "Cannot create turris-mox-rwtm kobject!\n");
> -=09=09return ret;
> -=09}
> -
> -=09ret =3D sysfs_create_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
> -=09if (ret < 0) {
> -=09=09dev_err(dev, "Cannot create sysfs files!\n");
> -=09=09goto put_kobj;
> -=09}
> -
>  =09platform_set_drvdata(pdev, rwtm);
> =20
>  =09mutex_init(&rwtm->busy);
> @@ -528,7 +476,7 @@ static int turris_mox_rwtm_probe(struct platform_devi=
ce *pdev)
>  =09=09if (ret !=3D -EPROBE_DEFER)
>  =09=09=09dev_err(dev, "Cannot request mailbox channel: %i\n",
>  =09=09=09=09ret);
> -=09=09goto remove_files;
> +=09=09return ret;
>  =09}
> =20
>  =09init_completion(&rwtm->cmd_done);
> @@ -562,14 +510,18 @@ static int turris_mox_rwtm_probe(struct platform_de=
vice *pdev)
> =20
>  =09dev_info(dev, "HWRNG successfully registered\n");
> =20
> +=09/*
> +=09 * For sysfs ABI compatibility, create symlink
> +=09 * /sys/firmware/turris-mox-rwtm to this device's sysfs directory.
> +=09 */
> +=09ret =3D sysfs_create_link(firmware_kobj, &dev->kobj, DRIVER_NAME);
> +=09if (!ret)
> +=09=09devm_add_action_or_reset(dev, rwtm_firmware_symlink_drop, NULL);
> +
>  =09return 0;
> =20
>  free_channel:
>  =09mbox_free_channel(rwtm->mbox);
> -remove_files:
> -=09sysfs_remove_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
> -put_kobj:
> -=09kobject_put(rwtm_to_kobj(rwtm));
>  =09return ret;
>  }
> =20
> @@ -578,8 +530,6 @@ static void turris_mox_rwtm_remove(struct platform_de=
vice *pdev)
>  =09struct mox_rwtm *rwtm =3D platform_get_drvdata(pdev);
> =20
>  =09rwtm_unregister_debugfs(rwtm);
> -=09sysfs_remove_files(rwtm_to_kobj(rwtm), mox_rwtm_attrs);
> -=09kobject_put(rwtm_to_kobj(rwtm));
>  =09mbox_free_channel(rwtm->mbox);
>  }
> =20
> @@ -597,6 +547,7 @@ static struct platform_driver turris_mox_rwtm_driver =
=3D {
>  =09.driver=09=3D {
>  =09=09.name=09=09=3D DRIVER_NAME,
>  =09=09.of_match_table=09=3D turris_mox_rwtm_match,
> +=09=09.dev_groups=09=3D turris_mox_rwtm_groups,
>  =09},
--8323328-84385502-1718296129=:8853--

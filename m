Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D191C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 08:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3893BC4AF1D; Thu, 13 Jun 2024 08:31:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8AABC3277B;
	Thu, 13 Jun 2024 08:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8AABC3277B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267510; x=1749803510;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=aMsmP3MK3R1R9LWlBP2DddIwS5RiaKM5LobHxleqWUE=;
  b=XosUwQllKcTjQLhU84HJeEvs9TZSpgF8Xs4izlZLu1SylZLUvsY9DhRr
   PadGyqEj6p663zcbbwuX5Bkmn+4boj8k4aOUS00GoCsjwOHvvMowGYhG/
   o98gy1UM0z4j1E2yL8A/Jry2kJNDem27lB3UQFCTQCTpVUUEMhKKsTcCC
   /sOhz+ZKZR3oUTb8qlb4Ha/P8JtmQz/LcvTFY53nm/GApsHo/SYMPl775
   xlpIyoOxlW6lWoMK9etJxV2v1QPP1rVQ0+RdBFTVonQbKXimRnKbhtQEU
   zipXKmu8awlUc4o+ExPrlmbSE/JA5aa3K8Ym7BPLsKWpBG6dR9KiKMV+R
   A==;
X-CSE-ConnectionGUID: vpiOGKL5RZO1itA5Q7Y0AQ==
X-CSE-MsgGUID: 7EDvsMQaR8+/ejqt2Yrang==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="12050983"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="12050983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:31:49 -0700
X-CSE-ConnectionGUID: WWa3dROSSA+jBYdGBmQM3g==
X-CSE-MsgGUID: Jq8yZeM8SYCgK7xDBGz0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="70854945"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:31:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver kobject
 code
In-Reply-To: <20240612135443.30239-11-kabel@kernel.org>
Message-ID: <7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-11-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-243227545-1718267503=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-243227545-1718267503=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Jun 2024, Marek Beh=C3=BAn wrote:

> Drop the mox_kobject wrapper that needs to be allocated, instead put the
> kobject directly into the driver private structure. This allows us to
> drop one kzalloc() call.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 36 ++++++++----------------------
>  1 file changed, 9 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index 6d1e0b1dd2b4..84ec72575c4d 100644
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
> @@ -58,13 +57,11 @@ enum mbox_cmd {
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
> +=09struct kobject kobj;
>  =09struct hwrng hwrng;
> =20
>  =09struct armada_37xx_rwtm_rx_msg reply;
> @@ -97,19 +94,9 @@ struct mox_rwtm {
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
>  static inline struct mox_rwtm *to_rwtm(struct kobject *kobj)
>  {
> -=09return container_of(kobj, struct mox_kobject, kobj)->rwtm;
> +=09return container_of(kobj, struct mox_rwtm, kobj);
>  }
> =20
>  #define MOX_ATTR_RO(name, format, cat)=09=09=09=09\
> @@ -142,9 +129,8 @@ static struct attribute *mox_rwtm_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(mox_rwtm);
> =20
> -static void mox_kobj_release(struct kobject *kobj)
> +static void mox_kobj_release(struct kobject *)
>  {
> -=09kfree(to_rwtm(kobj)->kobj);
>  }

Is empty .release necessary at all? I found some kobj_type structs without=
=20
=2Erelease so I'd expect it to be unnecessary.

--=20
 i.

>  static const struct kobj_type mox_kobj_ktype =3D {
> @@ -155,18 +141,14 @@ static const struct kobj_type mox_kobj_ktype =3D {
> =20
>  static int mox_kobj_create(struct mox_rwtm *rwtm)
>  {
> -=09rwtm->kobj =3D kzalloc(sizeof(*rwtm->kobj), GFP_KERNEL);
> -=09if (!rwtm->kobj)
> -=09=09return -ENOMEM;
> +=09struct kobject *kobj =3D &rwtm->kobj;
> =20
> -=09kobject_init(rwtm_to_kobj(rwtm), &mox_kobj_ktype);
> -=09if (kobject_add(rwtm_to_kobj(rwtm), firmware_kobj, "turris-mox-rwtm")=
) {
> -=09=09kobject_put(rwtm_to_kobj(rwtm));
> +=09kobject_init(kobj, &mox_kobj_ktype);
> +=09if (kobject_add(kobj, firmware_kobj, "turris-mox-rwtm")) {
> +=09=09kobject_put(kobj);
>  =09=09return -ENXIO;
>  =09}
> =20
> -=09rwtm->kobj->rwtm =3D rwtm;
> -
>  =09return 0;
>  }
> =20
> @@ -540,7 +522,7 @@ static int turris_mox_rwtm_probe(struct platform_devi=
ce *pdev)
>  free_channel:
>  =09mbox_free_channel(rwtm->mbox);
>  put_kobj:
> -=09kobject_put(rwtm_to_kobj(rwtm));
> +=09kobject_put(&rwtm->kobj);
>  =09return ret;
>  }
> =20
> @@ -548,7 +530,7 @@ static void turris_mox_rwtm_remove(struct platform_de=
vice *pdev)
>  {
>  =09struct mox_rwtm *rwtm =3D platform_get_drvdata(pdev);
> =20
> -=09kobject_put(rwtm_to_kobj(rwtm));
> +=09kobject_put(&rwtm->kobj);
>  =09mbox_free_channel(rwtm->mbox);
>  }
> =20
>=20

--8323328-243227545-1718267503=:8853--

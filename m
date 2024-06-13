Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35853C27C75
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 08:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0573FC4AF49; Thu, 13 Jun 2024 08:14:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED7C4C2BBFC;
	Thu, 13 Jun 2024 08:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED7C4C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718266467; x=1749802467;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/MrCYG3+pufXxZdLa6xQS5LWey0gk2NLfKtVYSv+AWE=;
  b=Ss4WkPw3utYOrAVcXblZif5R+lJLE4yxb57BgtR2D17fwN8kMm8EUlcP
   6ee+U6fdEmJG2ZFKf9Tfal3dUFLvFD6k1BuTESXfLkyy7/cA4e3u9pXiz
   CRFgmrz4FjOWvzJHvg9s8F/Zn6DeI72PBWcwKMmqDA0u9IIu89nS6HsPp
   pcxJt8rJDGQnhIdShfbm8B2I29H3DtDxJKKs40qTpONAg9RyXapg2odmI
   cAVFUGnKDeycUhpGI7v7i07d4eUTdgBJDsfqH9ZX46wKnJ0RgO9qGStct
   bgC+RNAprnrE8RJOzaRVnezVJ0U2x5gVLtKFAQBgcy+Hbx5mC1plrJ09o
   g==;
X-CSE-ConnectionGUID: JGn66ziqSFGnIuoX71EZxQ==
X-CSE-MsgGUID: t/f2gcXeQA+BLJAPVSZIWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15197489"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15197489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:14:26 -0700
X-CSE-ConnectionGUID: Hb8q3bWATEqgnb9BTugEcA==
X-CSE-MsgGUID: 0hCV2TllS1amWKbfydsZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40697296"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:14:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 11:14:20 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 08/19] firmware: turris-mox-rwtm: Use kobj_type's
 default_groups member for automatic sysfs files creation
In-Reply-To: <20240612135443.30239-9-kabel@kernel.org>
Message-ID: <515dff02-79d7-5443-b59d-effeed5f226d@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-9-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-808108380-1718266460=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-808108380-1718266460=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Jun 2024, Marek Beh=C3=BAn wrote:

> Put the turris-mox-rwtm attribute group into the .default_groups
> member of the underlying kobject type and drop the manual
> sysfs_create_files() / sysfs_remove_files(). The kobject library will
> take care of this in it's internal code.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 71 ++++++++++++++----------------
>  1 file changed, 32 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index 5675f94a3ff2..441409fefc59 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -113,6 +113,36 @@ static inline struct mox_rwtm *to_rwtm(struct kobjec=
t *kobj)
>  =09return container_of(kobj, struct mox_kobject, kobj)->rwtm;
>  }
> =20
> +#define MOX_ATTR_RO(name, format, cat)=09=09=09=09\
> +static ssize_t=09=09=09=09=09=09=09\
> +name##_show(struct kobject *kobj, struct kobj_attribute *a,=09\
> +=09    char *buf)=09=09=09=09=09=09\
> +{=09=09=09=09=09=09=09=09\
> +=09struct mox_rwtm *rwtm =3D to_rwtm(kobj);=09\

Fix \ alignment to match the others while you move the code around.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> +=09if (!rwtm->has_##cat)=09=09=09=09=09\
> +=09=09return -ENODATA;=09=09=09=09\
> +=09return sprintf(buf, format, rwtm->name);=09=09\
> +}=09=09=09=09=09=09=09=09\
> +static struct kobj_attribute mox_attr_##name =3D __ATTR_RO(name)
> +
> +MOX_ATTR_RO(serial_number, "%016llX\n", board_info);
> +MOX_ATTR_RO(board_version, "%i\n", board_info);
> +MOX_ATTR_RO(ram_size, "%i\n", board_info);
> +MOX_ATTR_RO(mac_address1, "%pM\n", board_info);
> +MOX_ATTR_RO(mac_address2, "%pM\n", board_info);
> +MOX_ATTR_RO(pubkey, "%s\n", pubkey);
> +
> +static struct attribute *mox_rwtm_attrs[] =3D {
> +=09&mox_attr_serial_number.attr,
> +=09&mox_attr_board_version.attr,
> +=09&mox_attr_ram_size.attr,
> +=09&mox_attr_mac_address1.attr,
> +=09&mox_attr_mac_address2.attr,
> +=09&mox_attr_pubkey.attr,
> +=09NULL
> +};
> +ATTRIBUTE_GROUPS(mox_rwtm);
> +
>  static void mox_kobj_release(struct kobject *kobj)
>  {
>  =09kfree(to_rwtm(kobj)->kobj);
> @@ -121,6 +151,7 @@ static void mox_kobj_release(struct kobject *kobj)
>  static const struct kobj_type mox_kobj_ktype =3D {
>  =09.release=09=3D mox_kobj_release,
>  =09.sysfs_ops=09=3D &kobj_sysfs_ops,
> +=09.default_groups=09=3D mox_rwtm_groups,
>  };
> =20
>  static int mox_kobj_create(struct mox_rwtm *rwtm)

--8323328-808108380-1718266460=:8853--

Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C35EC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 16:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0B4CC32789; Thu, 13 Jun 2024 16:22:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F35DFC2BBFC;
	Thu, 13 Jun 2024 16:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F35DFC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718295727; x=1749831727;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9nLOarLdJSSvOJ95zTGeUv+UBMc0FB+0KU5iC5yISeE=;
  b=L+lkNDeQGewowlRXyw+LAmD/ZbRxpakkD/oRNI/qEs1WZ6Qofe3NFFP1
   BiRiekKJISke1iC2ieqwDiVFa2ap5N46a/deU2pvT8Rwr2H8MI+Ew4sHE
   EqDpmrq9dtiZyduzdo4X9ZG5p+CEtdodETe2v24D5zSaIfiMF4J2LQFzy
   2MeNfl37cUiMBvHIX727+zxu2LJkBUxWb0vsOpUAm5JfpzNyUY5Df6d6t
   4TM6UPT/wq13cSg3tpqMTcmEzbTlRosLEtySsjzj7cMZeBVRSoLwxl774
   V/wfwtg4uDw+jGzfBsEDpXgqle9X3F67FAHnMdoR54nOCd9MRoGtybSvk
   Q==;
X-CSE-ConnectionGUID: 2LcyGquDQ7+1MsBzdzPVlA==
X-CSE-MsgGUID: YWEjoqHWS86NYzMyrhAu2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25715569"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="25715569"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 09:16:05 -0700
X-CSE-ConnectionGUID: +B1sylF+R6K2GGrUT1qrdQ==
X-CSE-MsgGUID: bwk1NBvvQRazXtrF/ce85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="45116209"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 09:16:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 19:15:58 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 03/17] firmware: turris-mox-rwtm: Use macro constant
 instead of hardcoded 4096
In-Reply-To: <20240613161045.29606-4-kabel@kernel.org>
Message-ID: <c536e32c-d39f-e6e2-ace4-83388cc2f854@linux.intel.com>
References: <20240613161045.29606-1-kabel@kernel.org> <20240613161045.29606-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-582275633-1718295358=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-582275633-1718295358=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:

> The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
> allocated to one PAGE_SIZE bytes. Use new local macro constant
> RWTM_DMA_BUFFER_SIZE at allocation time and when used in mox_hwrng_read()=
=2E
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index 3f4758e03c81..b8deb13aed98 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -19,6 +19,8 @@
> =20
>  #define DRIVER_NAME=09=09"turris-mox-rwtm"
> =20
> +#define RWTM_DMA_BUFFER_SIZE=09PAGE_SIZE
> +
>  /*
>   * The macros and constants below come from Turris Mox's rWTM firmware c=
ode.
>   * This firmware is open source and it's sources can be found at
> @@ -287,8 +289,8 @@ static int mox_hwrng_read(struct hwrng *rng, void *da=
ta, size_t max, bool wait)
>  =09struct armada_37xx_rwtm_tx_msg msg;
>  =09int ret;
> =20
> -=09if (max > 4096)
> -=09=09max =3D 4096;
> +=09if (max > RWTM_DMA_BUFFER_SIZE)
> +=09=09max =3D RWTM_DMA_BUFFER_SIZE;
> =20
>  =09msg.command =3D MBOX_CMD_GET_RANDOM;
>  =09msg.args[0] =3D 1;
> @@ -479,8 +481,8 @@ static int turris_mox_rwtm_probe(struct platform_devi=
ce *pdev)
>  =09=09return -ENOMEM;
> =20
>  =09rwtm->dev =3D dev;
> -=09rwtm->buf =3D dmam_alloc_coherent(dev, PAGE_SIZE, &rwtm->buf_phys,
> -=09=09=09=09=09GFP_KERNEL);
> +=09rwtm->buf =3D dmam_alloc_coherent(dev, RWTM_DMA_BUFFER_SIZE,
> +=09=09=09=09=09&rwtm->buf_phys, GFP_KERNEL);
>  =09if (!rwtm->buf)
>  =09=09return -ENOMEM;

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-582275633-1718295358=:8853--

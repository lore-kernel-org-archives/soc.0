Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5617C27C75
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 08:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E1B7C4AF1C; Thu, 13 Jun 2024 08:01:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 252BBC3277B;
	Thu, 13 Jun 2024 08:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 252BBC3277B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718265710; x=1749801710;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RjIaO9AIHQrf64eA5rksGCQQgwLoyrM4ih4uQG5ju/0=;
  b=OOpOUx6gtw2D+JzEnt1yCUb8/2VuMeyqBA6+7lAc1xR94UoLqG+LYoZh
   2P8zM2FlA4Yj/VXVPhChQZxmM8YpQQXYWiBNGRs2RyaRn/DyLpfNs6bcl
   /RY5ZxiX1UbjgpIvmp2y4kd66FnIvSw41AEM4tj23nAKhjuZCLkYSRgZo
   ayLVVWgR+K6nDuMmawj43eMMRO2wX8bdg4qd0i4YoDowK6JAQIDZaeqd/
   X4BsGXnLnfKcW7oAM94U31TksHzm845wcY29niIVv85Dg9h/ggpmGwoRX
   Tzbkwot8fzrT8vrhvOooDlZzSGt5k3YzmoUkIWnCPwLBu+OyICU0pt+6r
   A==;
X-CSE-ConnectionGUID: gjb0MfclRdebB7ncqQ4+3Q==
X-CSE-MsgGUID: 9X5iBXfXQCWAQ3Kdjgdorg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14791487"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14791487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:01:48 -0700
X-CSE-ConnectionGUID: E+4Gx+ERQ5aradVBOIFO8A==
X-CSE-MsgGUID: 5u7FbQ1jTrOvXjkq28sAqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40125841"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:01:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 11:01:42 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 03/19] firmware: turris-mox-rwtm: Use PAGE_SIZE instead
 of hardcoded 4096
In-Reply-To: <20240612135443.30239-4-kabel@kernel.org>
Message-ID: <30b3fba8-117e-a21f-c6d3-2e987792ec90@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-698858159-1718265702=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-698858159-1718265702=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Jun 2024, Marek Beh=C3=BAn wrote:

> The 4096 bytes limit in mox_hwrng_read() is due to the DMA buffer being
> allocated to one PAGE_SIZE bytes. The PAGE_SIZE macro is used when
> allocating the buffer, use it in mox_hwrng_read() as well.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index 3f4758e03c81..5acdde1bb6d9 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -287,8 +287,8 @@ static int mox_hwrng_read(struct hwrng *rng, void *da=
ta, size_t max, bool wait)
>  =09struct armada_37xx_rwtm_tx_msg msg;
>  =09int ret;
> =20
> -=09if (max > 4096)
> -=09=09max =3D 4096;
> +=09if (max > PAGE_SIZE)
> +=09=09max =3D PAGE_SIZE;

Wouldn't it be better to bind these to the alloc side with a local define=
=20
that is set to PAGE_SIZE?

--=20
 i.

--8323328-698858159-1718265702=:8853--

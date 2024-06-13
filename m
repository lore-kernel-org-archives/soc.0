Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EDBC27C75
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 08:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FA47C4AF1C; Thu, 13 Jun 2024 08:06:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 647C6C2BBFC;
	Thu, 13 Jun 2024 08:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 647C6C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718265999; x=1749801999;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EaEM8hnNZNxUVF/KcYyzd8MR4hr0FnOpVaa9BKrdL+M=;
  b=RzudPMFcvBCtIINpR40NJyTd73nlx7pUxnQLKq1Z4iTvX/QUn8KHyzwf
   kkQp8u+ssFHTfz1tDWt6c4wE61wufrloTDk6JHGN8FqkhkLvfeTVB6sZ8
   ibfPjKVk6tscTsA3ZuEmm/OS/ot4uE9eR9Tv82rolNUAbYRf6bjjvMZgU
   MoqCM1pX/K/TAo3Qx33vkIKyXCg9gU+u7lynTDfM450ijsfNQsHkFvzRl
   W6DkZxWGFktewaptY9voDH4BPynnB+ovBLw8/WjyVwfW+FZuHeOYkedEI
   otN8bODDEGzlFgEKkmPwObg3Wo/wlSmKduoHN1yPhrKHnfFlmWokxbJtN
   A==;
X-CSE-ConnectionGUID: sY9pWqXfTTyXue438MtYxA==
X-CSE-MsgGUID: yGR4W+59TNeguXIDBAXNYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25648681"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="25648681"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:06:38 -0700
X-CSE-ConnectionGUID: 6fdpfVuUTXW4f+qGDM66pQ==
X-CSE-MsgGUID: Z48+mHgaT22C4xgGW+oHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="45012204"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:06:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 11:06:32 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/19] firmware: turris-mox-rwtm: Fix checking return
 value of wait_for_completion_timeout()
In-Reply-To: <20240612135443.30239-3-kabel@kernel.org>
Message-ID: <70283904-3fd2-4e85-0df2-9701ec34ed6a@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2029036822-1718265992=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2029036822-1718265992=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Jun 2024, Marek Beh=C3=BAn wrote:

> The wait_for_completion_timeout() function returns 0 if timed out, and a
> positive value if completed. Fix the usage of this function.
>=20
> Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
> Fixes: 2eab59cf0d20 ("firmware: turris-mox-rwtm: fail probing when firmwa=
re does not support hwrng")
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index f1f9160c4195..3f4758e03c81 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -202,9 +202,8 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09ret =3D wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
> -=09if (ret < 0)
> -=09=09return ret;
> +=09if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
> +=09=09return -ETIMEDOUT;
> =20
>  =09ret =3D mox_get_status(MBOX_CMD_BOARD_INFO, reply->retval);
>  =09if (ret =3D=3D -ENODATA) {
> @@ -238,9 +237,8 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09ret =3D wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
> -=09if (ret < 0)
> -=09=09return ret;
> +=09if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
> +=09=09return -ETIMEDOUT;
> =20
>  =09ret =3D mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
>  =09if (ret =3D=3D -ENODATA) {
> @@ -277,9 +275,8 @@ static int check_get_random_support(struct mox_rwtm *=
rwtm)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> -=09ret =3D wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
> -=09if (ret < 0)
> -=09=09return ret;
> +=09if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
> +=09=09return -ETIMEDOUT;

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2029036822-1718265992=:8853--

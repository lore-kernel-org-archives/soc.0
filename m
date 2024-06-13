Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44762C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 08:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15F9AC4AF1C; Thu, 13 Jun 2024 08:02:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B059C2BBFC;
	Thu, 13 Jun 2024 08:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B059C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718265738; x=1749801738;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HyLjFjczdr9WU/9LZNLV2tg1WxDxZZ8D0TJAys254aE=;
  b=NLMWm0OEH3wsh3J0IRpZCq6VjNtzVCkhBHt5wgwY3x1Hc42bUAD60fkq
   5ACjr8KkZQJeDMPtcJ4q4KvxOBdSgSjYMwIQmolaF9NEOm0HbYy73+xF+
   zRg3teQYwKaan+Li5hpbNrTNvmFEeLXPYgObngkP1tzEBy/ja+4ze/Ygm
   VEDWLVtEqxc4M45EbiNRc7POEkfiClXEUW433gAy9tXJkoW1N297ss+eV
   eNDxZoo7MRcvQnB/ZwWGxKmifCb80Z7iALNKskQ/Xd0NCrbaM0RdnErbr
   qhdD7MQhSOe4bRBMrVR2fTJlLCCqG9llAGYFGPd6lFL4UiXVBAGSLJe7a
   Q==;
X-CSE-ConnectionGUID: u7qhm9aaRtmULcqUUocPlA==
X-CSE-MsgGUID: 5WZn3swYTfaAV/HwyMlQ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40475521"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40475521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:02:17 -0700
X-CSE-ConnectionGUID: 338H982pRvCpf50q1GqwiQ==
X-CSE-MsgGUID: VHaXtd4SQH6FUfSODFHxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="63242242"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:02:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 11:02:12 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 04/19] firmware: turris-mox-rwtm: Use ETH_ALEN instead
 of hardcoded 6
In-Reply-To: <20240612135443.30239-5-kabel@kernel.org>
Message-ID: <37a29ccf-192f-bbaa-0c17-599317994a46@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-5-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-734174994-1718265732=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-734174994-1718265732=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 12 Jun 2024, Marek Beh=C3=BAn wrote:

> Use the ETH_ALEN macro instead of hardcoded 6 for MAC address length.
>=20
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris=
-mox-rwtm.c
> index 5acdde1bb6d9..1b708a0760e6 100644
> --- a/drivers/firmware/turris-mox-rwtm.c
> +++ b/drivers/firmware/turris-mox-rwtm.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/hw_random.h>
> +#include <linux/if_ether.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -65,7 +66,7 @@ struct mox_rwtm {
>  =09int has_board_info;
>  =09u64 serial_number;
>  =09int board_version, ram_size;
> -=09u8 mac_address1[6], mac_address2[6];
> +=09u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-734174994-1718265732=:8853--

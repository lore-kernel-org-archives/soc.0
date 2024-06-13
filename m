Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1998C27C75
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 10:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B639AC4AF49; Thu, 13 Jun 2024 10:19:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E76AC3277B;
	Thu, 13 Jun 2024 10:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E76AC3277B
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718273994; x=1749809994;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=pnBDgfABw0zfcI040BeV8R4xFwaUDNxkSrHRwhoFMzc=;
  b=MUQVhakodGvntor9BXCf/UgViZZvptrdDHTP6AveRbGOOuxPDU1RAfTd
   3Z5Su/4lwTicpFPSSmtlIbtAqH2vXPs1VP8yFzDXE6Dh0vv3yxyFeff1B
   zyt1lIUI0nHuFL8YtyqRFa3JQIfsZ7rnIX9Fxqece7+kMt2LWpjIvom36
   vwwSiDC9sm4YoshyzuccD5qnQd7MY/LY9oeqzUa8PTr/Ik4j/kyFlJ171
   cyBxWuZQJIRZpytpIGtwP6ihFktIzwl/IIBQMJ9wlQmQwZzthTptEPOmt
   Q0yCRpzf5ajF63o4tQMKTH4ov7g4550PbvsLSp/3kQornWJlg+hiBUhlh
   w==;
X-CSE-ConnectionGUID: DZRdKqjoQj+1qXTk8nHMRA==
X-CSE-MsgGUID: 8riFXmFkTL+IgqvMmf/xkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18940250"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="18940250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 03:19:53 -0700
X-CSE-ConnectionGUID: 9t2x6A3dTLCsX6YrDMPQnw==
X-CSE-MsgGUID: lR3nFzBcT7y1KXldpYZ/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40201205"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 03:19:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 13:19:47 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver kobject
 code
In-Reply-To: <20240613115552.1d7c6162@dellmb>
Message-ID: <6a617e8c-9d11-47f5-ca43-0c166a3c0297@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-11-kabel@kernel.org> <7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com> <20240613115552.1d7c6162@dellmb>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-2010572291-1718272817=:8853"
Content-ID: <a71a5608-cfca-ff39-2c7d-c5c98f0cbe59@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2010572291-1718272817=:8853
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <4fca6fba-0672-51e3-f954-4d0305ce53ac@linux.intel.com>

On Thu, 13 Jun 2024, Marek Beh=FAn wrote:

> On Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
> Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
>=20
> > Is empty .release necessary at all? I found some kobj_type structs with=
out=20
> > .release so I'd expect it to be unnecessary.
>=20
> lib/kobject.c function kobject_cleanup() has the following:
>=20
>   if (t && !t->release)
>     pr_debug("'%s' (%p): does not have a release() function, it is broken=
 and must be fixed. See Documentation/core-api/kobject.rst.\n",

Hmm, the plot thickens... that documentation file says:

'Do not try to get rid of this warning by providing an "empty" release=20
function.'

?

--=20
 i.
--8323328-2010572291-1718272817=:8853--

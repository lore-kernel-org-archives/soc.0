Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C715DC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 13:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94226C4AF49; Thu, 13 Jun 2024 13:37:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E287C2BBFC;
	Thu, 13 Jun 2024 13:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E287C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718285851; x=1749821851;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GYN1wMsa79pIocQGaN7ic2RnYVb4dudtQytKuAQlkE4=;
  b=f6+GvTduKqbnjuiuHOmAfC7nPaqGmpkMOwDoBvYy/OUkHviQM+L+W4Mm
   F1bS2wWFV++462l3wHH0aV4tuc9I5P8CKlbmWdO3A6l1/1mGueUNoIOr5
   qVMp0rn1CTh5ARZAl3lP3vSOEBKqKjWOs6ZipxO5H2hSZdnzvPiBOMznA
   e+O3hB2YzvyAOnnTqittBIl1U7P4rrCDMOFLf8Eyoi8LL8lILdSd7uCyz
   4RxJKW9FCFFrJq79XEiDmtS6cfKWSz7rfZxjKDR+pXa0CwP6rvNDmf1tG
   K1akKHJ/6igPvK/bv4lZPSrKAqeA9NLwA6S1kGTUGeLEyaK+8szb/zKRj
   g==;
X-CSE-ConnectionGUID: xiqqveS1TUedExSVh0O5rg==
X-CSE-MsgGUID: 1CQTZzQ5RxCDF1r3e18Nvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26526162"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="26526162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 06:37:30 -0700
X-CSE-ConnectionGUID: XVGlMhS9TcSp/GNg2lnXbg==
X-CSE-MsgGUID: 7CN1kuE7QaCip0ivS8WH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="45052966"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 06:37:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 16:37:23 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver kobject
 code
In-Reply-To: <20240613153124.6d5928ec@dellmb>
Message-ID: <36e3991f-f61c-d400-d783-5ddd8605a390@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-11-kabel@kernel.org> <7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com> <20240613115552.1d7c6162@dellmb> <6a617e8c-9d11-47f5-ca43-0c166a3c0297@linux.intel.com>
 <20240613153124.6d5928ec@dellmb>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-348349624-1718285843=:8853"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-348349624-1718285843=:8853
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:

> On Thu, 13 Jun 2024 13:19:47 +0300 (EEST)
> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
>=20
> > On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:
> >=20
> > > On Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
> > > Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > >  =20
> > > > Is empty .release necessary at all? I found some kobj_type structs =
without=20
> > > > .release so I'd expect it to be unnecessary. =20
> > >=20
> > > lib/kobject.c function kobject_cleanup() has the following:
> > >=20
> > >   if (t && !t->release)
> > >     pr_debug("'%s' (%p): does not have a release() function, it is br=
oken and must be fixed. See Documentation/core-api/kobject.rst.\n", =20
> >=20
> > Hmm, the plot thickens... that documentation file says:
> >=20
> > 'Do not try to get rid of this warning by providing an "empty" release=
=20
> > function.'
> >=20
> > ?
>=20
> This whole thing stinks. I will rewrite it so that the attributes will
> be under the device's kobject, as they should be. This way I can get
> rid of the whole own kobject type.

Yeah, I didn't really understand why they weren't there in the first=20
place.

> Then I will add a symlink from /sys/firmware/turris-mox-rwtm to the
> device, for sysfs ABI compatibility.


BTW (unrelated to any of your patches unless I missed something)...
You might want to check one unlock_mutex: label that seemed to be 100%=20
duplicate the tail of the return path.


--=20
 i.

--8323328-348349624-1718285843=:8853--

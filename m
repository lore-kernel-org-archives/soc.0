Return-Path: <SRS0=f8eM=NP=linux.intel.com=ilpo.jarvinen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36610C27C6E
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 15:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0784CC32789; Thu, 13 Jun 2024 15:45:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B88D8C2BBFC;
	Thu, 13 Jun 2024 15:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B88D8C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718293536; x=1749829536;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=LDrhnklocd48BBqQDbKw1heE/IDsT1datWTp57vzGUc=;
  b=ShLPyptKcQ0EQcXqNxTMM/8KKPJ7Nrs9UbPWcirbI09h8MViMfFpckmm
   2ugjto0tZwtOlAfJ33Ik24OY1SbaMF8gbMiE1+zEnTERwZCwAL7tRHeW3
   AMYwk/mXhOPjkwCzJ9g2N06ONhnxhyPYGLMnxfd4clt1zy2qlUYGMZJ4a
   coJ+Wi9+qIwXx6Ri2e7HY/FMfAO/holKR+6ZHjoadn+7Lf0WOlvKLcro4
   2YS2L6JSgunZBp5lxTxfx038yTzOdVJXnM/+nTPj+pVYl0YgdoFVfGg0R
   Vou+FmNlNqUxwJVEUidT5TXEtBidkDjNc5NgA3sry7EwMw5e/MfSjk/GH
   A==;
X-CSE-ConnectionGUID: 5GgZzmTaSzSHqp+7qYQu/w==
X-CSE-MsgGUID: xV3bGXC5Q5KkuQ5hxjF/6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15256719"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="15256719"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:44:50 -0700
X-CSE-ConnectionGUID: q3jXcQLHQSuFf23iiaCl3g==
X-CSE-MsgGUID: RSyI/2/LTK+nfoHzXoxoJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="71398019"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 08:44:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 13 Jun 2024 18:44:43 +0300 (EEST)
To: =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
    Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, 
    soc@kernel.org, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver kobject
 code
In-Reply-To: <20240613173901.0f56573e@dellmb>
Message-ID: <5cf8948d-fada-49f7-f5ed-59829ff66820@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org> <20240612135443.30239-11-kabel@kernel.org> <7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com> <20240613115552.1d7c6162@dellmb> <6a617e8c-9d11-47f5-ca43-0c166a3c0297@linux.intel.com> <20240613153124.6d5928ec@dellmb>
 <36e3991f-f61c-d400-d783-5ddd8605a390@linux.intel.com> <20240613173901.0f56573e@dellmb>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1212164524-1718293387=:8853"
Content-ID: <ed860e2a-327f-6ecd-4b79-eff09ab996da@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1212164524-1718293387=:8853
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5898128b-2844-9801-6d9a-c8ef1f2e670c@linux.intel.com>

On Thu, 13 Jun 2024, Marek Beh=FAn wrote:

> On Thu, 13 Jun 2024 16:37:23 +0300 (EEST)
> Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
>=20
> > On Thu, 13 Jun 2024, Marek Beh=FAn wrote:
> >=20
> > > On Thu, 13 Jun 2024 13:19:47 +0300 (EEST)
> > > Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > >  =20
> > > > On Thu, 13 Jun 2024, Marek Beh=FAn wrote:
> > > >  =20
> > > > > On Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
> > > > > Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > > > >    =20
> > > > > > Is empty .release necessary at all? I found some kobj_type stru=
cts without=20
> > > > > > .release so I'd expect it to be unnecessary.   =20
> > > > >=20
> > > > > lib/kobject.c function kobject_cleanup() has the following:
> > > > >=20
> > > > >   if (t && !t->release)
> > > > >     pr_debug("'%s' (%p): does not have a release() function, it i=
s broken and must be fixed. See Documentation/core-api/kobject.rst.\n",   =
=20
> > > >=20
> > > > Hmm, the plot thickens... that documentation file says:
> > > >=20
> > > > 'Do not try to get rid of this warning by providing an "empty" rele=
ase=20
> > > > function.'
> > > >=20
> > > > ? =20
> > >=20
> > > This whole thing stinks. I will rewrite it so that the attributes wil=
l
> > > be under the device's kobject, as they should be. This way I can get
> > > rid of the whole own kobject type. =20
> >=20
> > Yeah, I didn't really understand why they weren't there in the first=20
> > place.
> >=20
> > > Then I will add a symlink from /sys/firmware/turris-mox-rwtm to the
> > > device, for sysfs ABI compatibility. =20
> >=20
> >=20
> > BTW (unrelated to any of your patches unless I missed something)...
> > You might want to check one unlock_mutex: label that seemed to be 100%=
=20
> > duplicate the tail of the return path.
>=20
> Do you mean this?
>=20
>           mutex_unlock(&rwtm->busy);
>           return len;
>   unlock_mutex:
>           mutex_unlock(&rwtm->busy);
>           return ret;
>=20
> It's not 100% duplicate, but yes, I could do ret =3D len.

Ah sorry, I didn't realize the variable name was different.

> The thing is that this whole debugfs code is going away. I wanted to
> clean the driver up a little before converting this debugfs code to
> keyctl (which is the correct API for the thing that is now exposed to
> userspace via debugfs).


--=20
 i.
--8323328-1212164524-1718293387=:8853--

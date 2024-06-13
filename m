Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F02DC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 13:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55948C4AF50; Thu, 13 Jun 2024 13:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCB4C4AF1A;
	Thu, 13 Jun 2024 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718285490;
	bh=CJnNi+UhoVDDfFmeAOnvgv+vVcwVEkOgmigE7HP04/Q=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=ROH0In1XC9wa8n8h+o6OEyau1OKgNyJMSh3CE11YPx4sd0ifte4+QQmCFnv2uHitt
	 NjtVBBSG5jAn7NygVpfGW0rPmZdpDP4yu9AqOSsTu4dNTylBSnEkFNr1NayyZSx3mN
	 nJWu/vU1hNhYxQ9ND/yFuCorITAzasmlytBTTCewD0KOIAa9kAGSAPVyqnWTGk48PL
	 T05pOaEH8+QZJ9lWfWch1wfKsHosrUj4uRDW/SSqOC83R9ILUtlaBgp5CpfdqhAIdm
	 1RjNcFyXmWHm8GftoseBt8BkbqjnRQ6JY4J61RM5vjwIHvE0//TK/gbrHSAe7MR3dv
	 8xXPc1PpKcxZg==
Date: Thu, 13 Jun 2024 15:31:24 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver
 kobject code
Message-ID: <20240613153124.6d5928ec@dellmb>
In-Reply-To: <6a617e8c-9d11-47f5-ca43-0c166a3c0297@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org>
	<20240612135443.30239-11-kabel@kernel.org>
	<7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com>
	<20240613115552.1d7c6162@dellmb>
	<6a617e8c-9d11-47f5-ca43-0c166a3c0297@linux.intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 13:19:47 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:
>=20
> > On Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
> > Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> >  =20
> > > Is empty .release necessary at all? I found some kobj_type structs wi=
thout=20
> > > .release so I'd expect it to be unnecessary. =20
> >=20
> > lib/kobject.c function kobject_cleanup() has the following:
> >=20
> >   if (t && !t->release)
> >     pr_debug("'%s' (%p): does not have a release() function, it is brok=
en and must be fixed. See Documentation/core-api/kobject.rst.\n", =20
>=20
> Hmm, the plot thickens... that documentation file says:
>=20
> 'Do not try to get rid of this warning by providing an "empty" release=20
> function.'
>=20
> ?

This whole thing stinks. I will rewrite it so that the attributes will
be under the device's kobject, as they should be. This way I can get
rid of the whole own kobject type.

Then I will add a symlink from /sys/firmware/turris-mox-rwtm to the
device, for sysfs ABI compatibility.

Marek

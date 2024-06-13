Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF92BC27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 15:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF0B3C32786; Thu, 13 Jun 2024 15:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6CBC2BBFC;
	Thu, 13 Jun 2024 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718293147;
	bh=K/mWm7jFwqQ37KNO+IxZ7hW0cj5j9BdYbbdBiXYDF4Q=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=koWxFE/wRW/VkOFC9eK/AgnmQvCBghoGlBbVM1VRs79uCw/Dd4byh7euYy4YGl8eK
	 ezE0lVkAgKh4U3XTm3blGeRgVggIyeWFIVAKiMtoa+jcvfnWkfnDGvnlIj0dw1G6zl
	 y8NWtnz+mnf6+yLIkhUiHO2X/qLfuumbjAIVAxYkP7loEYzsWX2S3N3rpD4RzZ6GSG
	 hjni4QTZP6pMFi2bff10jTBlXe5w3vns1OwVA8DaDAbZ+aqQZXNjbH1c2d4+jIFaaT
	 yE8OkOxV++x73yWXSmUpwYpbmjMpsjCCfhkqZ54t/T93NMetV0j02Rk308DhywsI2A
	 ZdXiBCRAedI/A==
Date: Thu, 13 Jun 2024 17:39:01 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver
 kobject code
Message-ID: <20240613173901.0f56573e@dellmb>
In-Reply-To: <36e3991f-f61c-d400-d783-5ddd8605a390@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org>
	<20240612135443.30239-11-kabel@kernel.org>
	<7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com>
	<20240613115552.1d7c6162@dellmb>
	<6a617e8c-9d11-47f5-ca43-0c166a3c0297@linux.intel.com>
	<20240613153124.6d5928ec@dellmb>
	<36e3991f-f61c-d400-d783-5ddd8605a390@linux.intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 16:37:23 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:
>=20
> > On Thu, 13 Jun 2024 13:19:47 +0300 (EEST)
> > Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> >  =20
> > > On Thu, 13 Jun 2024, Marek Beh=C3=BAn wrote:
> > >  =20
> > > > On Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
> > > > Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:
> > > >    =20
> > > > > Is empty .release necessary at all? I found some kobj_type struct=
s without=20
> > > > > .release so I'd expect it to be unnecessary.   =20
> > > >=20
> > > > lib/kobject.c function kobject_cleanup() has the following:
> > > >=20
> > > >   if (t && !t->release)
> > > >     pr_debug("'%s' (%p): does not have a release() function, it is =
broken and must be fixed. See Documentation/core-api/kobject.rst.\n",   =20
> > >=20
> > > Hmm, the plot thickens... that documentation file says:
> > >=20
> > > 'Do not try to get rid of this warning by providing an "empty" releas=
e=20
> > > function.'
> > >=20
> > > ? =20
> >=20
> > This whole thing stinks. I will rewrite it so that the attributes will
> > be under the device's kobject, as they should be. This way I can get
> > rid of the whole own kobject type. =20
>=20
> Yeah, I didn't really understand why they weren't there in the first=20
> place.
>=20
> > Then I will add a symlink from /sys/firmware/turris-mox-rwtm to the
> > device, for sysfs ABI compatibility. =20
>=20
>=20
> BTW (unrelated to any of your patches unless I missed something)...
> You might want to check one unlock_mutex: label that seemed to be 100%=20
> duplicate the tail of the return path.

Do you mean this?

          mutex_unlock(&rwtm->busy);
          return len;
  unlock_mutex:
          mutex_unlock(&rwtm->busy);
          return ret;

It's not 100% duplicate, but yes, I could do ret =3D len.

The thing is that this whole debugfs code is going away. I wanted to
clean the driver up a little before converting this debugfs code to
keyctl (which is the correct API for the thing that is now exposed to
userspace via debugfs).

Marek

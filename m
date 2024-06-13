Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CC2C27C4F
	for <soc@archiver.kernel.org>; Thu, 13 Jun 2024 09:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67C32C4AF52; Thu, 13 Jun 2024 09:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F387C3277B;
	Thu, 13 Jun 2024 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718272557;
	bh=/9+rc87DjVTtG7CqlPN/xdBR3NyYYiB/2PFgIJpOrMg=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=C1xXJDKEniJy4U7zGUajP4AuVxc8q0i2Qz0Ar/X2+aq1O1jLSeYuP8bQGs++WuF/+
	 O21ipedP+b1w2Y7L9UHDcwUd+Cd3DUMVjFTRhvURX4w+8SWngjKOqbvV01IMlyEeey
	 VcU4+d6PZI/a+N1MOuWiVpfDb/6wSPb7L3mutEgyErCHzvgP4GnBTDBSz/bBknYa8O
	 G5VBioMo+gT+XAuNSeQpa1mzoEW8Zh0jAtE8SQf4aXKrMfsbBo0pOeZfxdtkuQkn5X
	 F4kVDar9k5nbpG/hCMR/Mg4+M53icSS9uFFYq0uyLUwuI2ZetQ0wuvcxEiPumOGa2l
	 KGBIFpovhd5VA==
Date: Thu, 13 Jun 2024 11:55:52 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: [PATCH 10/19] firmware: turris-mox-rwtm: Simplify driver
 kobject code
Message-ID: <20240613115552.1d7c6162@dellmb>
In-Reply-To: <7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com>
References: <20240612135443.30239-1-kabel@kernel.org>
	<20240612135443.30239-11-kabel@kernel.org>
	<7a6603a0-c207-f500-209a-ab2b9a80f26b@linux.intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 11:31:43 +0300 (EEST)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> Is empty .release necessary at all? I found some kobj_type structs withou=
t=20
> .release so I'd expect it to be unnecessary.

lib/kobject.c function kobject_cleanup() has the following:

  if (t && !t->release)
    pr_debug("'%s' (%p): does not have a release() function, it is broken a=
nd must be fixed. See Documentation/core-api/kobject.rst.\n",

Marek

Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2AAC4345F
	for <soc@archiver.kernel.org>; Tue, 23 Apr 2024 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B39BEC4AF07; Tue, 23 Apr 2024 15:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD62DC32781;
	Tue, 23 Apr 2024 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713885312;
	bh=Bw76NvNgYB4FgpQEI3ntgDUGfPwfCHIOsl8YUk0n7Y4=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=NTatpze3AbHN+QdL689P+RpHMYGQ7F7MJXy2SlvWQRis4k61oMpHncjT3gA1Gzi91
	 xE2EhIoq9RVGSyz8oaZcQgnwf8l8KCXInJQtHXD9Di0EHZwGdOLoZF5uXpEzekwzz9
	 r6MF/Um9rUlMcumFL8voRQAKnwXjTWqP7REhjnBPbamPh1GePEoAKXrwaVkS3k2kr4
	 m83GTQvj+nBKgv5NCQRPwZhqetvcGOK9Ff9wdbiBbbSmB9O+0PNCu2T1QIv3d4q+yr
	 wavwZ7mb2DranU6nI5YBOIEbyE98f4gh9gw+0b/y843rNfySldZ9cSwCAg1i6zJvon
	 T2phiwe/xRlrA==
Date: Tue, 23 Apr 2024 17:14:58 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>, soc@kernel.org, Hans de Goede <hdegoede@redhat.com>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, arm@kernel.org
Subject: Re: [PATCH v6 06/11] devm-helpers: Add resource managed version of
 irq_create_mapping()
Message-ID: <20240423171458.5e68b7ce@thinkpad>
In-Reply-To: <Zietl9AhJ_2VB5YQ@smile.fi.intel.com>
References: <20240418121116.22184-1-kabel@kernel.org>
	<20240418121116.22184-7-kabel@kernel.org>
	<Zietl9AhJ_2VB5YQ@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Apr 2024 15:46:15 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Apr 18, 2024 at 02:11:11PM +0200, Marek Beh=C3=BAn wrote:
> > Add resource managed version of irq_create_mapping(), to help drivers
> > automatically dispose a linux irq mapping when driver is detached. =20
>=20
> AFAICS this is a dead code.
> Please, drop it from the next version.

Do you mean that it is not used when this patch is applied? Because it
is used in the very next patch. Should I merge these two patches into
one?

Marek

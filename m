Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E94C2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 17:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D05CC4AF16; Mon,  1 Jul 2024 17:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C8CC4AF10;
	Mon,  1 Jul 2024 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719853246;
	bh=RPa/vjSg3uSpjy6H7yxFua7H/Ic3dtmOuyCqVe6b34k=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=Lt6KcZXg0M+yE9PUdZNYnPiiXgmG1lSelL0oXdPGIUVz89fu7gjWdNYt6kad7bf+j
	 C1o5JFjkIHo86bbADSGqkKjgHNIyVidDOniQbezvWppO4UuU/6L5AvuHze9JXEaGeo
	 pOICafeKCSZfC6ywsDpaDALcnJppGXZBhRGmxriWhE3vKQQIBwyVUQmQuXjuegxTlw
	 Is2cjymDX807Tk5L/zwC4rJ60z9CTYtRDFP5BHnnWdjiB5f08vRzzvwFuiRj6liBAB
	 pivmepzIhGSpasxAa36OkXs5oyE/IaJTr+MDKRsnwLRz1xD4I0JNSTRFJi3kQWDK9n
	 AlBQ7jT6z7u+w==
Date: Mon, 1 Jul 2024 19:00:41 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 soc@kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, Andy
 Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 0/5] armada-370-xp irqchip updates
Message-ID: <20240701190041.286241ec@dellmb>
In-Reply-To: <20240621093832.23319-1-kabel@kernel.org>
References: <20240621093832.23319-1-kabel@kernel.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Jun 2024 11:38:27 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> Hi Arnd, Andrew, et al.
>=20
> this is v3 of updates for armada-370-xp irqchip. There is one small fix,
> and another patch added which was previosly sent separately.
>=20
> Also I realized that I did not send to the SoC mailing list, nor to
> Arnd.
>=20
> As written in previous cover letter: this driver is in need of a major
> refactor in order to bring it to modern standards, but that is
> unfortunately currently infeasible with my time constraints.
>=20
> v1 and v2 at:
>   https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D86=
3473
>   https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D86=
3707
>=20
> Changes since v2:
> - dropped redundant assignment during declaration in patch 4
>   (bool src0 =3D false, src1 =3D false)
> - added patch 5 to this series, previously sent separately
>=20
> Marek Beh=C3=BAn (1):
>   irqchip/armada-370-xp: Use atomic_io_modify() instead of another
>     spinlock
>=20
> Pali Roh=C3=A1r (4):
>   irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
>   irqchip/armada-370-xp: Only call ipi_resume() if IPI is available
>   irqchip/armada-370-xp: Do not touch IPI registers on platforms without
>     IPI
>   irqchip/armada-370-xp: Add support for 32 MSI interrupts on non-IPI
>     platforms
>=20
>  drivers/irqchip/irq-armada-370-xp.c | 121 ++++++++++++++++++++++------
>  1 file changed, 95 insertions(+), 26 deletions(-)
>=20

Hi Arnd,

just noting that these changes were also accepted, by Thomas Glexiner.
No need to apply to soc. (I marked them as Awainting Upstream on
patchwork).

Marek

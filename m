Return-Path: <SRS0=PF7I=AT=maquefel.me=nikita.shubin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3A0C77B61
	for <soc@archiver.kernel.org>; Fri, 28 Apr 2023 12:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 583D3C4339B; Fri, 28 Apr 2023 12:13:45 +0000 (UTC)
Received: from forward500b.mail.yandex.net (forward500b.mail.yandex.net [178.154.239.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0C76C433EF;
	Fri, 28 Apr 2023 12:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0C76C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a85:0:640:8fc9:0])
	by forward500b.mail.yandex.net (Yandex) with ESMTP id 7B71D5EB59;
	Fri, 28 Apr 2023 15:13:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id UDIqPQ1DRSw0-oizJTPZv;
	Fri, 28 Apr 2023 15:13:31 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1682684011;
	bh=8/DsglW6bXdL6cKM+snErWK1zkh/4xaDsTI58/cmNVI=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=TJwmrTCcVjrFrr3pAzJ629AteXtzNuVp9rAvtkWbI8aOWxvUiGt62HaU1oBYn/IUz
	 IPICn1gnZTN/TY61XhL2BLxp7IWtwIFXOr3iX+z/upMRANUUGYm8C8d24THa1YgWMp
	 ht8TU9U/75ncMus/ytq78TOG1VrJT6W/0gbTg+pE=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <90ad7d369ec3cae132245aa75daf460b90ec7b4e.camel@maquefel.me>
Subject: Re: [PATCH 34/43] ARM: dts: add device tree for ep93xx Soc
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Olof Johansson
 <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>, 
 support@embeddedTS.com
Date: Fri, 28 Apr 2023 18:13:31 +0300
In-Reply-To: <e429c0e0-7044-492c-a4e2-ed0c1185bb39@app.fastmail.com>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
	 <20230424123522.18302-35-nikita.shubin@maquefel.me>
	 <e429c0e0-7044-492c-a4e2-ed0c1185bb39@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0

Hello Arnd!

On Mon, 2023-04-24 at 13:28 +0200, Arnd Bergmann wrote:
> On Mon, Apr 24, 2023, at 14:34, Nikita Shubin wrote:
> > This adds a divice for Cirrus ep93xx SoC amd ts7250 board that has
> > been
> > my testing target for ep93xx device support.
> >=20
> > Also inluded device tree for Liebherr BK3.1 board through it's not
> > a
> > complete support.
> >=20
> > Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
>=20
> Can you describe which parts are missing for BK3.1 in the
> changelog? I'm fairly sure that Liebherr is still supporting
> this board, but I don't have a contact to add to Cc here.

The current dt implementation is missing:

- I2S
- MMC on SPI

I will add those nodes so it will be a complete dt, however i have no
possibility to test it.


>=20
> I've added Lukasz Majewski to Cc here, as he originally worked
> on BK3.1 and likely either has the hardware or knows someone
> who does.=C2=A0 Technologic Systems also lists the ts7250 as supported
> on their website, but the only contact I found for them is the
> generic support@embeddedTS.com. In case someone from Technologic
> is available for giving the series a spin, see [1] for the
> full set of patches.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Arnd
>=20
> [1]
> https://lore.kernel.org/all/20230424123522.18302-1-nikita.shubin@maquefel=
.me/


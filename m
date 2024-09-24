Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42057155743
	for <soc@lists.linux.dev>; Tue, 24 Sep 2024 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727170220; cv=none; b=h2HZ4vgFE+K4j8+8RbWKslZ/2D675xf3vF2GmQqPOO5l/nhjmyFLG5sQX/2FySaqigFtGcljuGCWjbOA7PeLbzdl006tt2/9ltO+Tsg7+JrJjMbr7sy8dh6kF1BPjKi1/D5CkbSThoFsMXUvnBcIsyPl3V+fXasHSWfRbMrumdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727170220; c=relaxed/simple;
	bh=Lb2KsVVVaTMN3KohSpkn8V7UrH3zKzLtjp8hlZHmE9k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/Bk/fJWJK9NY63b6V8M97T7TjlBLU/7dlKpdjVyRS7KiM4LKMOJRMSq0xRz1IhHgfyiz2VixKK/0gzVmbAo2fhYvF4+JkwuhwlDUYWesKEn4z5R+BJXrGdx3SZe2hmSt/Ck4vHjF9ciBbNi1rslnEsm/7rs6ABKM262XAqsZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b=P3vFb5rY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b="P3vFb5rY"
Received: by smtp.kernel.org (Postfix)
	id DA3ABC4CEC6; Tue, 24 Sep 2024 09:30:17 +0000 (UTC)
Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43E05C4CEC4
	for <soc@kernel.org>; Tue, 24 Sep 2024 09:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43E05C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-47.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-47.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:8f4f:0:640:c72e:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 4126D612E0;
	Tue, 24 Sep 2024 12:30:02 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-47.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 0UP8338Z0qM0-hynlEMjE;
	Tue, 24 Sep 2024 12:30:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1727170201; bh=Lb2KsVVVaTMN3KohSpkn8V7UrH3zKzLtjp8hlZHmE9k=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=P3vFb5rYQj4PNXwXDXwqol7bsbhX0wHv+Y9/ve/DM2xmC0C9Hc94xeDM49P0PRvke
	 dX0qdgH7c1IyGzJjvPm450GFC2n2IfomKNvc+tPa1mxXpOeNO7xPjPRu0XAkUtEKJD
	 Y8Q330wZKfQFwTtiH2Qce5sahpMZP76+jgndavE0=
Authentication-Results: mail-nwsmtp-smtp-production-main-47.klg.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <be5d4d09e9e4a6adffd934878697679797c9ce33.camel@maquefel.me>
Subject: Re: [PATCH] soc: ep93xx: drop reference to removed
 EP93XX_SOC_COMMON config
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Alexander Sverdlin
	 <alexander.sverdlin@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann
	 <arnd@arndb.de>, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
	Bulwahn <lukas.bulwahn@redhat.com>
Date: Tue, 24 Sep 2024 12:30:01 +0300
In-Reply-To: <20240924092423.50734-1-lukas.bulwahn@redhat.com>
References: <20240924092423.50734-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Lukas!

Thank you for catching this!

Reviewed-by: Nikita Shubin <nikita.shubin@maquefel.me>

On Tue, 2024-09-24 at 11:24 +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>=20
> Commit 6eab0ce6e1c6 ("soc: Add SoC driver for Cirrus ep93xx") adds
> the
> config EP93XX_SOC referring to the config EP93XX_SOC_COMMON.
>=20
> Within the same patch series of the commit above, the commit
> 046322f1e1d9
> ("ARM: ep93xx: DT for the Cirrus ep93xx SoC platforms") then removes
> the
> config EP93XX_SOC_COMMON. With that the reference to this config is
> obsolete.
>=20
> Simplify the expression in the EP93XX_SOC config definition.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
> =C2=A0drivers/soc/cirrus/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/cirrus/Kconfig b/drivers/soc/cirrus/Kconfig
> index f2fd0e16a196..d8b3b1e68998 100644
> --- a/drivers/soc/cirrus/Kconfig
> +++ b/drivers/soc/cirrus/Kconfig
> @@ -6,7 +6,7 @@ config EP93XX_SOC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Cirrus EP93xx chips=
 SoC"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select SOC_BUS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select AUXILIARY_BUS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y if !EP93XX_SOC_COMMO=
N
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable support SoC=
 for Cirrus EP93xx chips.
> =C2=A0


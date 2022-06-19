Return-Path: <SRS0=U+DU=W2=ucw.cz=pavel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1D7C43334
	for <soc@archiver.kernel.org>; Sun, 19 Jun 2022 14:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B420DC341C4; Sun, 19 Jun 2022 14:12:18 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 449E5C34114;
	Sun, 19 Jun 2022 14:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 449E5C34114
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3BCE71C0B8F; Sun, 19 Jun 2022 16:12:07 +0200 (CEST)
Date: Sun, 19 Jun 2022 16:12:02 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Qin Jian <qinjian@cqplus1.com>
List-Id: <soc.lore.kernel.org>
Cc: sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	mturquette@baylibre.com, linux@armlinux.org.uk, arnd@arndb.de,
	olof@lixom.net, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v18 10/10] ARM: dts: Add Sunplus SP7021-Demo-V3 board
 device tree
Message-ID: <20220619141202.GA1197@bug>
References: <cover.1655194858.git.qinjian@cqplus1.com>
 <0574ed0ad1e9ec4c12645fe2d2dde8f701d285e5.1655194858.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0574ed0ad1e9ec4c12645fe2d2dde8f701d285e5.1655194858.git.qinjian@cqplus1.com>
User-Agent: Mutt/1.5.23 (2014-03-12)

Hi!

> +	led {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&leds_pins>;
> +		system-led {
> +			label =3D "system-led";
> +			gpios =3D <&pctl 0 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};

Can we get label more in line with other systems?

Thanks,
								Pavel

-- (english) http://www.livejournal.com/~pavelmachek (cesky, pictures)=20
http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

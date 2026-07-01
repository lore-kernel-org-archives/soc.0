Received: from mail-qv2-f0.google.com (mail-qv2-f0.google.com [74.125.230.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052BB3612E2
	for <soc@lists.linux.dev>; Wed,  1 Jul 2026 22:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946119; cv=pass; b=XLMH09NdSe2hH3ey1Bo0kHZ/9GEut0nFBxrg4gCmJFQjFfepOWXBboFSjOFyKroziZhk/njsVjNiRYxky043JvNE4z/LUPSjRZVm/yteEQd76OYqpsVCCod3NKoq339pUe7KT79oAB4RhVUFGQ/a7iom3IpsimYD78SPaPgIq40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946119; c=relaxed/simple;
	bh=jkCRklCQuAsBvwsoZlQdi2TEoYlQ2dZsK+Lt9OHCya8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwBMpKF25xwJn4lU5874U82OJjLB9kJmqU4PHk+vF5u/zCwixY+NcIvgbJIV0Y6IMFtq8BbgBU3tDrN1rKkOy0BXA8WC85exODDGgJ297Xxba6IIQ/zDVqh4aiD4C2eohgCuyE2jVhcanxvqQ8TSbT2qpA8FadJn55v2cEJpsmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvxX0dSc; arc=pass smtp.client-ip=74.125.230.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvxX0dSc"
Received: by mail-qv2-f0.google.com with SMTP id 6a1803df08f44-8ef118ead8eso6705196d6.0
        for <soc@lists.linux.dev>; Wed, 01 Jul 2026 15:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782946117; cv=none;
        d=google.com; s=arc-20260327;
        b=Chi2RMtNj+Eh9InX06DpZhaU47kYL8RsiVLpX9tWW3372LnC44dFQceqXrjj6FjwRw
         6GNdg/Pvh7uLPWtsj5n8CUl/jqbr7X/040UL5kM9YIJdFysWnH/EPrEahfCLhalBoP8s
         XDBh4Ezp9CqzorNSL6MGjxFkFD5rE8ZMFfgRjwxY29UJmd7n5TlGaPwbKX7siXAxJmtV
         C9dywFw5WKj0mvtN9ahdGmGcHa4dT5Dcg31q3uR4HZz5rNCJP9lkKuDgAbQtciiziTjN
         PN2Cjq7YPXONhdxhRDAW/KGfd4jRSiRrN/lOy9TPTReGX31F0Z2K4HVmvOSE2pcKc0eL
         Hh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=;
        fh=NfAvbleYTff44mXklaNcj8qXdWkiOAsoR3N5gmRnUHA=;
        b=V0fLuUmUVqNecrubK9Lx8Brgd/MdMkeNx0TCZunBdRBJBsh7iLFaEUVUfur+TC0U8X
         R6shtm4X2pfVr2hU5K3EOMAsZS2gKCA7ACFFr3oRTwfumLzeHTcbkqF8xjbxmcLljs46
         CfhR4SosxWfj5F/ik3JjfVXHAKBkcikxL/5FzI2bZEwj2PMLiJtytqA/bSw6GrR0abeg
         txX134JveYObL4bcx6pq7VeRM4Tvz0OdV9shxTWRahd4EdlMxptMWdBIdk9w7lw/6lXq
         4u6Fn8ABEAgx3STn7GlpdgwXmo8QvgNZ44em4gQDAfj4GzDd2TUnqBCbBYIyJgGyDufW
         gZ7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946117; x=1783550917; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=;
        b=DvxX0dSc/JYvccNUVR8RUknL01UtYg0glRWeX06oVL+94pwiBwMHFYV8MhlJ40Ft0O
         w5yiNYBSlY/K4UcsJb12Fiq7tPRLGx6hb/HKkEM2yvY1UvtkaH42Ti5mrgwhWolQuft1
         gh80Stv9hngFdcrBbo7BihPknXGqgwlM/6rUpd8vQ/MWzgNTtb9ZHGfv6uZfcXXrMJqo
         6mSSXWYqG/8P8plPby7/6hZ2tQWuX7QYmGb9MKY77wQoofZ7fnOjaGGjdSOnht2DMOMr
         bLTslUCR63c1uqukToWLplKjoouZi0ckTiJx66qbp1xjkfGVUIXa4dC9zLkt8wl1R87H
         KTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946117; x=1783550917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYFlxrwBFYPoq90kn+JK7G1o1/XM41yRTcPx7DGMUZM=;
        b=W/VFisQRXZ0/0vSq/U2OZkYCgnyCqYL4mSqiddKEnnN6OCole2Cq7h3nOROFyVSCqE
         Pp2Z8QBlUOZAMpROYI/ruJMg7NczkY/FU1iKhW7JwJDRloHuwXFwMeWCtj7RAPsFxLgZ
         QPOw1ZkgwyVSh+hxXGskymZ227s2XaWq8Ptc1TaHED5Royfbw4A/s4rhFjVcX7sjncWe
         fbBn2NB1245ajzYwbYRkPfPfV+HyHbRDaM72Kp49lVf/UQeDasIoLqjKwOTcyFjIxeQt
         hDtiLWVDN620VPDb1wwyPLmeuLZYK8TNvOiNOcAOip/rGG2p1S/D8qTQOHEd5wnpRv/P
         18Ng==
X-Forwarded-Encrypted: i=1; AHgh+RrTPh/u+Hl0Be4mzhEvFrXSLNhIew1tiLTuEEPQgEOmmeP3f1k6FF3RkeuElTraQO66RQI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxACyy9RFL+ZK4Kh3MtbndnOTrFywuRR2zRdwkC2J0a28Q+IP+X
	WVAsq8djJYjcfMMWJs00OVi7Iq2YLIBpN5Mcze/lPW+TBFtvGksXRrSRpvn82Tm3vUEfOy5Gstm
	VVhhpmEL0tatvR/vBiX28WXltE0OspNtFq78Oh7Q=
X-Gm-Gg: AfdE7cmLJQfYF5SkntNgK+bt2jTeMCv1E3A9yTwFWj6FyDimK2FJQy7QD0Z6L8AR/BF
	62i1oWDPZX+1hfauih5uKwkyF6MJAJSUitZaUf4fblSz3hb7mecndOT3f4h4CkKSdaQD5EZCcMO
	hfXldPPfW1IuM6G5FHLxM8UyshgQqKglf54uXqqANynlXQRphcpkyafq3v6KCNQKUGemHZtAMQV
	VBOQJmVL8YRbwTi323QAKTHLHl8j/xi3SE7VdCbjGzxXuqT/BsKx9LdxoNkOsAGwY3bqu4Qed2i
	e5s0DgYpN/aGQCi79uBYV/xBxz7H9Br/3ysqYaGnltSEOSIPDFYsTB6qfA==
X-Received: by 2002:a05:6214:3d0f:b0:8dd:d13a:8c84 with SMTP id
 6a1803df08f44-8f4214a1f72mr39935196d6.8.1782946117029; Wed, 01 Jul 2026
 15:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-12-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-12-arnd@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Wed, 1 Jul 2026 15:48:26 -0700
X-Gm-Features: AVVi8Cepw8-jeERBXP5uzrp7v2GBj31ta-VoNMboVTSNdDufrAM_yNfN295JHb0
Message-ID: <CADkSEUgm4Bse0x0K355iuLVJJM-mgeZAxg4xywgH1nYxnU-d4A@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] ARM: mark ARCH_DOVE as deprecated
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 2:25=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The Marvell Armada 510 (Dove) platform is supported both as devicetree
> and atags/boardfile variants, with varying degrees of hardware support.
>
> Russell was the last known user of the board file version, and there
> are very few users overall. Unless Russell still needs this variant,
> let's remove after the next LTS kernel, leaving the CONFIG_MACH_DOVE
> variant with devicetree.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-dove/Kconfig | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
> index 996888ffcfe7..f547120e223e 100644
> --- a/arch/arm/mach-dove/Kconfig
> +++ b/arch/arm/mach-dove/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  menuconfig ARCH_DOVE
> -       bool "Marvell Dove" if ARCH_MULTI_V7
> +       bool "Marvell Dove (DEPRECATED)" if ARCH_MULTI_V7
>         depends on ATAGS
>         select CPU_PJ4
>         select GPIOLIB
> @@ -11,7 +11,11 @@ menuconfig ARCH_DOVE
>         select PM_GENERIC_DOMAINS if PM
>         select PCI_QUIRKS if PCI
>         help
> -         Support for the Marvell Dove SoC 88AP510
> +         Support for the Marvell Dove SoC 88AP510 using board files.
> +
> +         Support for this machine will be removed in early 2027, unless
> +         there is a strong reason to keep it. Users should migrate to
> +         the devicetree-enabled version (CONFIG_MACH_DOVE) instead.
>
>  if ARCH_DOVE
>
> --
> 2.39.5
>

Reviewed-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

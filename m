Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51BF344D8B
	for <soc@lists.linux.dev>; Mon, 13 Apr 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108516; cv=pass; b=CTomBH/sXWkpUrpxPCnsvBDdeGP1HKmL5Xxw6UNfKVusqzJMJs7OMCEs3jOxtwe4CYHs9ot5Jb/WmNpUArHxZkueA+mXGqFRtNp9MEBC7+KB8/j2DcWwtEh0/gYTz7twl8dT/zMnTVwNTy5ImbjRxQtHvT3/gq9GnHtvQHPc8ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108516; c=relaxed/simple;
	bh=at1sLsxz7zG/NI4eVz+XUTJj1sDPXHu9VBu5AMReNzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/Bs2Vizu9ugMVRkemqun+RMWZwUQ4lSkdoPGBZFAdOoloD8F/uuwhAx7r3tGcZ4sdbRy0hxsA3JDNfNRNNd+DNVdqmjs5CLcPHsimWznuNwWTqWH7yYnaeOy5prlHIqz4eB9EDUmDXG+Va3iL7biUsqwULZWz5RHfLJkvrYoic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmfIvu85; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmfIvu85"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so556914366b.0
        for <soc@lists.linux.dev>; Mon, 13 Apr 2026 12:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776108512; cv=none;
        d=google.com; s=arc-20240605;
        b=RZ8ZAYaErzQ2IoH0Bo89YMDJx/yN0zIKHYPBIqr9NXq88gAp7S6hQ/7VUcCxRQ6Tle
         Wv2Oeh4GfJwuTql1SBdh8rEKMnlr2IjK8Kl/PSwhiZkNG7W0QsMwmtA33fFA4HCQM8jn
         FmIgHEpwQWQbUbnE3Dh5Wtr8uIxtA2dfon6zAqU2LkB3+ssBUMBBdQuDxylnoEASJeqT
         Sanj1zTEfbED+WwuLwvYwIHeZdP6OHP7B1g+BawGRbtkiHb2sb13rTcUeLVXgT6KHO6l
         gcpkr4O28BFPKBWBtSa5fd2QT0ZQ2MmfGVR9crPMaGXCwR9VVIaO+J0hw6K302vD/J/4
         Jklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        fh=fl66IpQ8jOo7hvqnDdfnx4R0WmMfuaOWt3ZHbdv1UC4=;
        b=WLf2tLMXt1PdGYQekeENbgfwy4sSEIW2+4BUguw/iQl+mvl6/uoV83h6iNt32lq3cD
         2PpsM3Bz/2vDUyHz6jYMfjtvmJmcntySPrrIuis+1doBmh3OhwvHrtAuDV7Q57ejLJdF
         h0TvZJclZYBlJzT2HmkroSSmLozqYhprJhqeNFK7Sl5vh3oeRGjrhjvVSUxeElIEo145
         DtUoWliKLGOZCi2o0mYZsyXy8A6vq3RzytJtimVdschfFzy+OXfmgbynsdkjQwoYUSa5
         67ohAPkMVdxJp4GdOEGdH6hNJRVvWHxJroh5Fx8ql2+mIQCkCmzaTb25tpvzWSA0Kcwu
         GK1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776108512; x=1776713312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        b=EmfIvu85YuQOTDxMdR49MBXm9To7HSvYJ5kD6vz70j+T4vPkJSh6ewKIf2+kjX55vW
         meMpxsIvFc3KvUEKSj5rcAeJ3MBTMBEhtqKlihzmlK84gMT+nZ0jMsFucaOuBTigLqYg
         DHhrzHjx6fsBXkqy/xWSJKRUC7su0C/yU2HUxxIEUiloyAxHkWBKvdWbVlbAX0aegKCD
         OTQbiUnq3YrTPkGzCxs1yeN/clPf37lY4FS/9icIGaRCKJRAwjCLfKyXCfU0Qz0qOng+
         6ZNzlCnefzl2heJZis75XK8z0Q9FPtbC05LtKVBPE4KpRpzIlCt85G+NxCdnKwXaXGKK
         x8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776108512; x=1776713312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bF/zvI2KpjlnALCVbm2BiZRYcKLJLbXhP543C6RUbg=;
        b=UatzsufcJ85LYYZwCnA4WjYVHd/B58hPUHARIHv1FHd7n/oJm4dORXwZ2nVewWL/RF
         n5k1MBNczWzOuEjNofmXTNO+dTIzlyIl+iAk3MuhUA1uUVPfxD0FAWxbPx4sfztZGXy7
         +t4JjYcltxaqKidAkHLGbQbYeBAmHxluW497oz484rdenxmisbi3T5dW3qCtg1WWmS1L
         vpF8loXJ1jWrIBv7oNYOmtkdIbCnW5ggV/F010WkEDJO0V/ZQHu+/4WoyHv3eZrKZCTu
         866MhdvnfYA3pIDQaQitLXSSprzeuOxTPqCXPRAAqlE1SEfcHjIMlHCfe3HqeojbrdhN
         WSpA==
X-Forwarded-Encrypted: i=1; AFNElJ9RAEySSrUL1x2O4+3oVYKvtKdJvHwwgbHSZFkHCkCtLaL6Qy3ZlsvXU7I2KuCEKXqZy5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ/zAlPwWDSRy7iEt+HXXS+wwwXo23xbeLx6teYLsjwLlpESV4
	g/Et1auXgZy7PCi1BVLjpbsySA2iMRbHcYcqMYJpeHXhTwUZxroPiWEv9uexrMCgpZFcB4BJqct
	n0JvAs5uUCDzTC+NxGhA/Fq54CortT9U=
X-Gm-Gg: AeBDieumK8QADWqYLR0u73wbLsgj+CXay+txL0NZJ1EGS0AN/gQkTOn9fMP1U3661vp
	WHXJKqjWjbWy2muFo+iyQTYvIB+qVZQ0ItTbZveInbm01+1p13DJCf3FMi/uMG1pR2q+zkU5J/D
	/Pv7G1aOoqbJVmPOWOShVYDftV61u7S5Xr8XAwnDxxkVGJyJmLBwFSGsbsr7rb7avoOkkgSn2zu
	BgnqGBZqdq0ZuKRGJdvDr80yYH2s6Ub0q/mY5jjo4qlnuIPoOS8htQIMRJUYnoT9sHrXQS+fp6Z
	nhDAcCJiwX2dnTurUde2aCGTSa1tUDiZEIUwa+6ZJ2dcnSfnCxg2+CM6oLUFs2GOvJ1s+APXMD8
	CYvz0PA==
X-Received: by 2002:a17:907:6c0f:b0:b97:e32f:7ee8 with SMTP id
 a640c23a62f3a-b9d7298ffe1mr758494466b.37.1776108511829; Mon, 13 Apr 2026
 12:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260413092148.3870746-1-arnd@kernel.org>
In-Reply-To: <20260413092148.3870746-1-arnd@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 13 Apr 2026 12:28:19 -0700
X-Gm-Features: AQROBzDRhEA53Q6D19izUguGZUF4CJzwH_A7MqptLtlQ6pim0lENIBLGjdUpTss
Message-ID: <CAKxU2N9iBwbt2frA5v3=BgAdUgQm6zSdVU01ZVV2AqOJb-ntRw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm4709: fix bus range assignment
To: Arnd Bergmann <arnd@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 2:21=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The netgear r8000 dts file limits the bus range for the first host
> bridge to exclude bus 0, but the two devices on the first bus are
> explicitly assigned to bus 0, causing a build time warning:
>
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:1=
42.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie=
@0,0/pcie@1,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
> /home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:1=
42.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie=
@0,0/pcie@2,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
>
> I could not find any reason why this is done in the first place, but
> this can be easily addressed by reassigning the two devices to
> bus 1, or by dropping the bus-range property in order to allow
> secondary bus 0 to be assigned.
>
> Assuming the bus-range is intentional, fix this by moving the
> devices to the first valid secondary bus number.
No, bus-range is not intentional. It should be removed instead.
>
> Fixes: 893faf67438c ("ARM: dts: BCM5301X: add root pcie bridges")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/=
arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> index d170c71cbd76..355be5014943 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
> @@ -147,7 +147,7 @@ pcie@0,0 {
>
>                 pcie@1,0 {
>                         device_type =3D "pci";
> -                       reg =3D <0x800 0 0 0 0>;
> +                       reg =3D <0x10800 0 0 0 0>;
>
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
> @@ -162,7 +162,7 @@ wifi@0,0 {
>
>                 pcie@2,0 {
>                         device_type =3D "pci";
> -                       reg =3D <0x1000 0 0 0 0>;
> +                       reg =3D <0x11000 0 0 0 0>;
>
>                         #address-cells =3D <3>;
>                         #size-cells =3D <2>;
> --
> 2.39.5
>

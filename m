Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC521A43C
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741369760; cv=none; b=QTflD+eFyk4sNyZT4m1h0WnZrrQqO3hx+jTzsxv0H6qbQT9RMFekJpSUGUNG9MWgDW3bFEZiqZejTmM5ZHB77vPmHL/urJW0iR5vlDfrpk3Yu3QDTcJU1qSDdBv2Z8bCGlhpnMoL997npwNG+huPb/CG9zDqxr9M8tlkNS3kVx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741369760; c=relaxed/simple;
	bh=lydFLWj67WtyjXuomBRVH2WkhbZf44SVom2Q3MnbuTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdvbu3BwlGJGdfbaLrIe75pJyGysLWp57KTOE7KjbHvkMN7lsTs553/l7F6NPFZk/TvTOwslrWSfB33GYGIsA/hvtfp8N6YBITxstlA7FYyfBXYP91qjbcj3gELnmY/6qzWEEORdswdV/8pNhK6LtIK1seiS1TAeATAtPhMvcgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7MlkJgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7MlkJgq"
Received: by smtp.kernel.org (Postfix)
	id 48A11C4CED1; Fri,  7 Mar 2025 17:49:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18CBFC4CEEB;
	Fri,  7 Mar 2025 17:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18CBFC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1047305f8f.3;
        Fri, 07 Mar 2025 09:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741369756; x=1741974556; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=;
        b=R7MlkJgqsTmyRbMoIBv+NWl0h2fIxz0jOxOs16GtHh2h97bsS1I0RCsnptyeCQqpJL
         PfHLF22oPRNPWna9daWPo0pgY3JUT9QKds0xLuEMQgtgCUJ39x2DFw5pxtDBVKHD1sd6
         sjq4mUf6U1WybkTZ4v8m3encBEgQ9dEuGrO4elWxuOaECce1fYG9ohap4VvjEJiW3wRf
         A5NlpE1Y8T3yBpzGan76eRkCxeIuQd7xshxunYGnl3BVe4H1eP93csx1uQuX+tIH8e1a
         T0b3RGxNbUau7jiLF6cU9rJUJSZ1BqZq1s36ode/QGwRGeKPcEQvwZu72hT8jbwylrhn
         5YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369756; x=1741974556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QF34UIm/mDVHphQGWjdR/1AzekgNrOu9yMsFMVisYs=;
        b=bRHpQtTeQGu9DrONZTg2Ja9BAIquwdmIoXPYyWEQkLSRZ6ceINj6Ea9O7mbXpZiB/2
         I9Sf7u0ckOldWYaKR0H9hALK0F3GF+WAvEmqgDBZvIlLNErLknV1XDUkHAUtcOrwnzbg
         JkqaQNPWohseU9yAIEjzB44VhiZMRh1lLJxAUHSQKbdXWtTDni3hfL3rUcH6utmDWdaw
         aR8ciHH5uTzvyK7DWMhdpOHwjSejTEQQCybJy38nKyfnSBw3h7ySlyjrbpZ3p45sKptt
         svxn3eYJjuTg9ndxVEcEKIfSnVKLsxhDYDRF016z3lTKp/6KsyRba/STCSmLvmjeaOT/
         edTA==
X-Forwarded-Encrypted: i=1; AJvYcCWbjYH6uvc4KKsv54Eqkx4EKMbAmJO5D+091Y5Rr8k1S0ZYTJoH1Geg9G8+XCSHwZojBmA=@kernel.org
X-Gm-Message-State: AOJu0YwUQ5sZ95YZUjb4NCM4YjkF6k7QCfq1ziyRlwGabjkXxqQRlcDf
	0X7jjLu02TOYOtJQdjUfbTfdr+LhAu285zXVcRQ6mcUxPFPeq/LpEhb6wg==
X-Gm-Gg: ASbGncuH0hRQ61TG65chg/F3eXihGNgh1qjsKYPTAiDW2TTZ72rMd5pofW9FsP7cIYT
	JDZ5FJuGgUYWUbXIKgLw70C8OQE2pzZjb08DVBhR6Zsu7imkAT5fbV7IEumVlF/0Fp6a3PfnFHM
	a4ItYbBXrbTyWilyxF3QxNX/b1MEjQ6aS4wpATat4Z6HWbU7WYLkwlAnCEdEj2e+SIidmW0NV0I
	byGCCTFX3FsTqpLF0jpWlTMkCHsovLh3/atuXbwXhxcGxouo7/O34/TNjSPVMnOslRxQZzNnWxQ
	xoyHtflJAgmsOj5lrfT/jJ8VtOI9RXgpqaU4MEusUmZ0mAA4NokG9h8gttnWiET4Jv0JSMAH6uM
	tFnthfy/Aggkc/50RcGTcpZPds+92tiA=
X-Google-Smtp-Source: AGHT+IHX4k9h2dUIfbIghSN4dswH6DxltJKXaksN3tcy+Fhl/9UKW5pGEUDWt7ze0avENn0h6Vn5sw==
X-Received: by 2002:a05:6000:18ae:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39132da96b3mr3169491f8f.43.1741369756267;
        Fri, 07 Mar 2025 09:49:16 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm6174821f8f.13.2025.03.07.09.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:49:14 -0800 (PST)
Date: Fri, 7 Mar 2025 18:49:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
Message-ID: <ei5lzgdpckb23la7xdsyyaeru32whrgyb6zdzzp6srawfi7obc@4mb35lgik26a>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
 <20250307162332.3451523-5-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bhwaqg7unpd2doim"
Content-Disposition: inline
In-Reply-To: <20250307162332.3451523-5-thierry.reding@gmail.com>


--bhwaqg7unpd2doim
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v6.15-rc1
MIME-Version: 1.0

On Fri, Mar 07, 2025 at 05:23:31PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.15-arm64-dt
>=20
> for you to fetch changes up to c33a71fd0e3644520af7b5926926c06597d6d355:
>=20
>   arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-06 20:=
35:53 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v6.15-rc1
>=20
> This contains some cleanup patches that remove unused properties and an
> unusable key that was erroneously exposed. A fix to support GPUs with a
> large amount of video memory on IGX Orin is also included.
>=20
> Finally, some additional devices, such as a temperature sensor, are
> enabled on Jetson TX1, and the output voltage of some pins is adjusted.
> A fix for the VDD_LCD_1V8_DIS power supply is also included.
>=20
> ----------------------------------------------------------------
> Diogo Ivo (4):
>       arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
>       arm64: tegra: Define pinmuxing for gpio pads on Tegra210
>       arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
>       arm64: tegra: p2180: Add TMP451 temperature sensor node
>=20
> Jon Hunter (1):
>       arm64: tegra: Resize aperture for the IGX PCIe C5 slot
>=20
> Ninad Malwade (1):
>       arm64: tegra: Remove the Orin NX/Nano suspend key
>=20
> Rob Herring (Arm) (1):
>       arm64: tegra: Remove unused and undocumented "regulator-ramp-delay-=
scale" property

Sorry, I missed that you already pulled this into the ARM SoC tree. I've
dropped it from the Tegra tree and I've sent out an updated pull
request.

Thierry

--bhwaqg7unpd2doim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfLMZgACgkQ3SOs138+
s6HJDhAAvkmWYhwK6ieB05CXS9ujeUbGdmfhD/JFL/eZy53b99HyVWdulPnnFHMQ
SWpEGGKPAHAWVijcJTlWY1flPd8vRcuzI+lDo+3rUIOpTkcZcCNvlNxi4sTY3ee1
uUN+YMlDPYKVMOsAoyTHt0k4l7GvbTaGpCx0dHuIi/qhaEWkn9t4ny0Sq56hVpAF
C3fk9rr3mAY5uZQcCpqAn2uyzMVPt/KTkiz+qDgm/3UW+zRiIHomihf3ijQVmY/a
yUoqpKzFzT+Q1aJUvn2qumkgvfgqYtvm8bL+ML6eDGvIHUQVXDbjDlbY3FKKRh/0
zWZZBYBPSi8iq6nYBUpB4JHNpALUue0lh65VvXFeIPDtMLk7gRbG7hmS/Lt1kOPl
ILz73L54sdZo0HcWMD6C0WlQlCu6HrEFLchpDx8t5fHN+bBrtuNY/XiPZAMZFmM1
xL3HqLX2cxRAlavE7aiCgXiRtmQ+Jbxk7YbD79UQSA3DtOwa3rYfOMu1gCISweGX
TcrcM0wp6g1DbFtiZloKJC7ZEUDhk41nf+wKikDtl4nPq/w3KWgy1fURfvN1+/6a
rhrPwKVStMp2yunrmY1/UeMIUekgI+bTs/M3rhx93Z8L0wyk3dh+zbPwWawc+WaT
wdX5DSqXPKQ4tX4wWCmcGU6gwbXRnEv9tSJDbNP1ameR23QH4Yc=
=v5V6
-----END PGP SIGNATURE-----

--bhwaqg7unpd2doim--

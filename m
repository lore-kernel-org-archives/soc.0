Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BB231771B
	for <soc@lists.linux.dev>; Thu, 18 Dec 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766058980; cv=none; b=fjErCE1iYxiCkeEObQtCI230DJYD1bDrsGoZjygJOeZpYNfmEaGeuhpL87FTuHWubOHYEKaTPiAOZxJc4+v9IzJM5echrfOWrJO4ecLvoT49/Jti+W5poar6/wq34FAPkQSCw8TwsLIY3R67qG5hZzkAgK0ZiqeuhlKo8p0yoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766058980; c=relaxed/simple;
	bh=o/f5qG0fB8BBMiDPrl1dIu9DCRfziVECUeUUdt0apcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9vHJaXbBDMzIE8U+iKm/K68kytBNw5yOhJrEQ0ZFjcm3MAERKs/1nFV1oAcTO9DVAiSI7NMnw0mlDTY+AX84Lm/JRDAMxacqnhWnYjdpPEOg7PRAipV7VMFqkBnqimIphv8wWd7/MQYlbetTiduNga9hMIkar4o1m8aSedcqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWlq6ddX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWlq6ddX"
Received: by smtp.kernel.org (Postfix)
	id 0D896C116B1; Thu, 18 Dec 2025 11:56:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DEF3C19422
	for <soc@kernel.org>; Thu, 18 Dec 2025 11:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8DEF3C19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso4877075e9.3
        for <soc@kernel.org>; Thu, 18 Dec 2025 03:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766058977; x=1766663777; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sirw8Y7pkirUUd1z1lvj9vBpxM3O2QyNtSUkQSCiIMY=;
        b=nWlq6ddXMH0AOf+wT86AYnixD7xsF9kRFSkTyekw38WAJ192OK+FfPGANV0KW4BIGo
         q9vQl4MI55KumICAwgJ1cnOyDaGkjy1LEMw+sSNIQdAewaKzGav1D1gSONTdAc1muGKN
         rnmGrGazldJNS1tBSvQmGq+txM1HrF4U+LpRP9J/NfNCO5BeDunIOGgWlK3SgBWTR4iE
         jELKbeC2/ravwwmS8DZQ60Tqe/FlwQKBWKHjhu+uUijVzn/5aCk6r3CJVpwJ4A9Ealdk
         lJDu8qAmHbEDy1Sk0+ZiswdRfTNk2cNVWrvAbTNfivU+FXUCtNZl75/Wj3Uk1Eu6iwTq
         nqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766058977; x=1766663777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sirw8Y7pkirUUd1z1lvj9vBpxM3O2QyNtSUkQSCiIMY=;
        b=FdINafzxxcIhOSMnL5tatWzZqfnPr6OFrBXf/end4DhkCB9lQEhd0SscGgm338p82V
         XHtfBawLdv3LvospJPEQGUgO7j2UGhtMnPw/gLI2/ACm2q41SWDxK3WTGLaEgBW3sc1I
         qYcOeQMkr6VmCr3KNCu/17sDPJgZMKQIq0PtwqVwYsep8a7W94PKJCCVMxN1qaW9+VXy
         iEC5+4Dl9KsYkoRaDxfqAjbq4GdQ+H155YH+ziW6dplFNpM05kceXuzCCsfQ9reZRsxR
         eNVzwCv9/yZbEAcqASkFnvbB0Aq6wcaDz2VXu3rUfIx4HJ3qwTO0v7C+5SDKREUcWoT2
         5stg==
X-Forwarded-Encrypted: i=1; AJvYcCWnwRFchL11pqPFUTLaTDuEzXDYVYxGywVCVLFV8V/ObNbSxA2eHCDq/d8g5CK2WldY5uQ=@kernel.org
X-Gm-Message-State: AOJu0YzkArtlMNT9P0idIecy3A9Z9qK+O+DD9fc7jtuvHGe+xKqxwnrX
	VH/EelP6JstBPUAPwjVvsK5lHrnQ9OXFmoUsSrof+3NlJFTKJki3UbRu
X-Gm-Gg: AY/fxX6p9AcvIAU94ZgZz7cSNBSt2uUImV7F6shb16wXXNYsYZMcsoxIc0He3HaWCmR
	XF5I1kpNFntIfZeurGviSTfuDwC//GGEOnY2BIHT3hJpptMyJYfTsKJSIoT/5ybyLkzUoEHXMEf
	2swGJJlqoKhXEpswnBl5XPxXcN+WF+a7x+VuQw42tN0dOTqZiL+oclYB9tKiwB9Sr8wE6pqECSo
	Jk05ju+emWtQkKZtr7N9KAgqwpkldVM7tJznJfkNk+H7xKr99f0QjIiUfPqbiSQvDsvybUamrJU
	H9fxjcLfBuAE4p9KDWAfl/7gzD3Duvuk2YbrmWjd11ljfs/ZpWCYhyP83S2ce7A5o1PYAZeuYhY
	/HrQ3EvrNFgKvsjzbQSDLtp/PSXZDfZEBCXrViY28+78ofuWHkASwvYCAFVnXQfX+odAAvJqVDC
	BUr1gABHWn0nx6fT4sRPiE21R8zcv5kuFQjmHlWqEdSf7SMLDimvPXMJL4xt31K5GQwhROV+K8T
	g==
X-Google-Smtp-Source: AGHT+IHRcSZ29A+PddLskNnFZhBchA0KUCvXevXJCVDr0syq4PFng4cIKjNObk2K4UBPbK++koXBXA==
X-Received: by 2002:a05:600c:6994:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-47a8f904080mr201336975e9.17.1766058976598;
        Thu, 18 Dec 2025 03:56:16 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3029f37sm38329635e9.7.2025.12.18.03.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 03:56:14 -0800 (PST)
Date: Thu, 18 Dec 2025 12:56:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaron Kling <webgeek1234@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
Message-ID: <aUPrVFWKfFYmuwhB@orome>
References: <20251217104744.184153-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wl6sai33pii6l6ws"
Content-Disposition: inline
In-Reply-To: <20251217104744.184153-1-jonathanh@nvidia.com>


--wl6sai33pii6l6ws
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
MIME-Version: 1.0

On Wed, Dec 17, 2025 at 10:47:44AM +0000, Jon Hunter wrote:
> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> Tegra210") populated interconnect properties for Tegra210 and this is
> preventing the Tegra DRM driver from probing successfully. The following
> error is observed on boot ...
>=20
>  drm drm: failed to initialize 54240000.dc: -517
>=20
> For now revert this change, until a fix is available.
>=20
> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra=
210")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
>  1 file changed, 24 deletions(-)

Hi Arnd,

this is the only patch that I think we need in v6.19 for now, so do you
want me to send a PR or would you rather pick this up directly?

Here's a link to the patchwork for this, for convenience:

	https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217104744.1841=
53-1-jonathanh@nvidia.com/

Acked-by: Thierry Reding <treding@nvidia.com>

--wl6sai33pii6l6ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlD69wACgkQ3SOs138+
s6GOsg/8CjcraGpbQ/5+n8XTP/H5o3bObJEbJDalfjw48fO1XUKkjmY2KDYNk3tH
jP8JMNYSIhkntLFTr+0Z9JjK8IUZYbvg2QjOgjS5NQt2WEcoVY5ZjZH11a+pBA4h
IyPYbq3dXxYZvj2AMMYRAQvsKB0/ltokxbfaXvqNzluXV6oOsCwVle0k6TV8jUWH
v3i1b3U+Iyu8MoTvH88RIMPspYmmzNMN1nfJ5+XX9mvNvS5NrvujTe4zsYmtoSVa
HyKe8l8NvtCNW8HNBLPP95FgV1wxHhLHUbuaYLadpIS0yaHRiDgbn+EQXNLM/OBl
qwK5Go8ji7Id5FVtno1JQvsnDKYcTId5IBBcKPAdL9PUk818h3IeLnJBQXELPAvT
HV2FnMfB5LFZt7t5f+BdCmxf9TxptRocLaVsAF6VJCHgWerUNnnEx6OuDKk7Uvyy
RdzP6ttDMk4hnDKGzVNjmaIXjBy7qW2/j1QLOPFZxMepAWVgJHehyR5yYl2ekeOZ
P9vsebHQeabpXVQFJFO0UI9Cgh788xQb1boXgfuric9IXQrG1OJb+R4NsfznsvJ6
vc1WUfxGAepFo8cH/K3vCPpbyujO5+n5jRDvn3IuT9W0HNTHJ82p35ciVJ+araQN
8Xstha0OfmhcMPM/Rg8/nmT0mex/y6IvE+MSULZY3eSLX9EcA8k=
=w6w4
-----END PGP SIGNATURE-----

--wl6sai33pii6l6ws--

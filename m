Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63676376BE8
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565578; cv=none; b=N8U+OnSX/KpJtxb5RyUmLkF3HZGj5uf/2/rK+px5LVeGispPRjRmbCxlJwetkI/SCQ5U4mb6cWEYaPxZJhjoI20T8tCRCG3OZ0BA2ngafKellMZZZNOsQO17xlf+RDWeOoTx0A0QMWxrttYc3v+l0XTv7ClTqYTSrht+Vej0ZEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565578; c=relaxed/simple;
	bh=BQ0cbHfLN9zZur9JCPSr7twpHESSCdMVyeN2+noDSwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVtoI2/UZucxKJDOCLfcxuXPm9L0dri6FqZuS4EI/t1ow60Hs2s5mZxlVMy/fM20jQvzjfQElIRUTmvbtcpXKO+JMzr64UJljdOJMbepEoTAf7paD/DDkLFTIqCEymCvWVAgich+UicEhwnZmXMZ4ecHf7Mht3CfVJchlDMpl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVDGh885; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVDGh885"
Received: by smtp.kernel.org (Postfix)
	id 172BEC19425; Fri, 16 Jan 2026 12:12:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F9EDC116C6
	for <soc@kernel.org>; Fri, 16 Jan 2026 12:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F9EDC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so14489545e9.2
        for <soc@kernel.org>; Fri, 16 Jan 2026 04:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768565576; x=1769170376; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nezfiu/jRSCcprxtmv1XkgrIIZagcw7MeNBjserFnRM=;
        b=RVDGh885Q0T8hVnH3Cn+bcTye+/n1mu2CTHyQTOkckfTMrq+CWUhEhp+iWDhRgne3t
         OIdq4YPvn3jw5+/pgnIkCrxed4Ayh+47D1Wwu9VOV3rbBBh+CIrQybLQCTuQ1yoZ2Ctd
         vVWS8UoLJiLhVFIn7jmev9t94N2qarNSyAkHRCjEkDdb2X8LbCtvJyuVNhFGNnauE5De
         PFkmd+NslxPUjqvNPvd7sHYtB5DGN9ATmWZjzlzZCX3lXC0QMQq7uQbkqhxByXOtnNWZ
         sZdn7aXB0Ynt1fEkR//b61GItTYcT8iForLx0ta1v6G3DfLyNjRv49D7Cyxiekij0Ezv
         QZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565576; x=1769170376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nezfiu/jRSCcprxtmv1XkgrIIZagcw7MeNBjserFnRM=;
        b=BS3TVbUR96UDFesMWDWFGDqeU2469rRaa1JNLebIspvumcrBSkFgEltxo2Ocq7+Z7K
         4ITmQ/QUzHpo0ntY0T6SbcLjZMDaXj0W6ZKa6Q8tOO0cAi/PPnN4ob294GOg786jxJ0J
         HuH/mS5UC9ICQbdAfzcW21DrybWII7h5TXlIhGYe8ZkCFYtS2/yCJta6qYKU17kJRiQ7
         EEAN2EriesP4IM304hGPDT/viT1m5s3EnAo+df0Q2vAzc3fbOJoMjTY0JLyXcblpWzeZ
         zKrYfkDcnecow67eRJYcmnCZjqE9W3hl0WqQhy86MWVf+UIcSm+KMAQyZTRbaUaXEqAu
         ofZw==
X-Forwarded-Encrypted: i=1; AJvYcCUHFkC8cP7Jd1L8xm4ky7kNiSq1DLj7uaud4+WCShcNY4Ro4jCYRb2COj5BpXq56AonFHc=@kernel.org
X-Gm-Message-State: AOJu0Ywz34YpqjYizkTpDMm2FFYc+jqVsrlTh9ez7VXEaSU51RMDytsH
	8YpeBHaz4hGrwfkkLqC0EZsJe65Z0GtML84sXXEfmefdSn6Ofit0xdCo
X-Gm-Gg: AY/fxX4aU1IJLLMHW+12tkDg3wK+CoPlsP29pPLTKSxI8qeKgqxzMZkkbTB5rY+bejf
	snbBl3AsQDe4zvnskQBXUpyjQT3FC9Uw41oCXQPDYTj9FffmoB2bs13h2hxWVhOqRZ42UWAtRta
	MivOjRvP6J8UPszH4md25Ho0vGJRNMwFLY9SnKbNXxHuJ8LyabJa1uMzqA4cemCqYFcn0JMcm23
	fwZ9RKNjcoqEkYP8E2ZwVAOcajpN09VPPEApjsDpk7JV15HULAO6Dn1/J1Y9AXn+h6WAnOHgoQE
	M9ElYZG3sIt6FoVsrvZrSH8SZ39X4UlRLzMI1L3Z10AoMMA/p03k/pQOOzrSWSJ9+w25d4K/xge
	Gp1Kk9PHrfmXZW3EO38R8ofIcwrGcfrpem45g+CVdNlUk9w7Pffw2L4pa/t862BeGVXQTCLutSx
	Ob9iyC2EBHXusa8WJWGBF+OG01Gh1Spr6iWZKHYQyDbks6StDDvi3u1kSkcN3eic4gg1cwsy+k1
	g==
X-Received: by 2002:a05:600c:870e:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801eabf1eamr25748685e9.13.1768565575516;
        Fri, 16 Jan 2026 04:12:55 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm4882497f8f.20.2026.01.16.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:12:54 -0800 (PST)
Date: Fri, 16 Jan 2026 13:12:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jon Hunter <jonathanh@nvidia.com>, arm <arm@kernel.org>, 
	soc@kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaron Kling <webgeek1234@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
Message-ID: <aWorI-Guec_BgpKc@orome>
References: <20251217104744.184153-1-jonathanh@nvidia.com>
 <aUPrVFWKfFYmuwhB@orome>
 <fced85f4-07b0-453b-9969-19abbef3f840@nvidia.com>
 <c41a9d20-2221-4429-91e6-74835f89c9aa@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bag7egz7mgswbrx3"
Content-Disposition: inline
In-Reply-To: <c41a9d20-2221-4429-91e6-74835f89c9aa@app.fastmail.com>


--bag7egz7mgswbrx3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
MIME-Version: 1.0

On Thu, Jan 15, 2026 at 05:41:51PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 15, 2026, at 10:50, Jon Hunter wrote:
> > Hi Arnd,
> >
> > On 18/12/2025 11:56, Thierry Reding wrote:
> >> On Wed, Dec 17, 2025 at 10:47:44AM +0000, Jon Hunter wrote:
> >>> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> >>> Tegra210") populated interconnect properties for Tegra210 and this is
> >>> preventing the Tegra DRM driver from probing successfully. The follow=
ing
> >>> error is observed on boot ...
> >>>
> >>>   drm drm: failed to initialize 54240000.dc: -517
> >>>
> >>> For now revert this change, until a fix is available.
> >>>
> >>> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for T=
egra210")
> >>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>> ---
> >>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ---------------------=
---
> >>>   1 file changed, 24 deletions(-)
> >>=20
> >> Hi Arnd,
> >>=20
> >> this is the only patch that I think we need in v6.19 for now, so do you
> >> want me to send a PR or would you rather pick this up directly?
> >>=20
> >> Here's a link to the patchwork for this, for convenience:
> >>=20
> >> 	https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217104744=
=2E184153-1-jonathanh@nvidia.com/
> >>=20
> >> Acked-by: Thierry Reding <treding@nvidia.com>
> >
> >
> > Please can you let us know if you can pick this up as a fix for v6.19?=
=20
> > This is still the only fix we have outstanding that needs to be merged.
>=20
> Sorry I missed the earlier message. I've applied it now, but in
> the future please forward patches to soc@lists.linux.dev if you
> want make sure they don't get lost. A pull request or a separate
> patch works just as well, but sending it to the list means it
> shows up in patchwork[1].
>=20
>      Arnd
>=20
> [1] https://patchwork.kernel.org/project/linux-soc/list/

Thanks Arnd. I'll keep that list in mind for the future.

Thierry

--bag7egz7mgswbrx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqK0QACgkQ3SOs138+
s6H9Zw/6AgU5obKTuEfM7NpdrMLmcESlxKcLgpUsvp0zaEso9kqAMtdAyr4I0VRJ
JJ4D+WiKchf7G39Y8+z0WsPlGNuUyu5yDOeMEJkIFnQ23CDf3g3TIkylE/0K/Vn1
Xg4rN77pA/yCswpJdaCET4qsTwgu8LI9/cpKxe2CnA6WLRE4V1yvdZoTCM0LOERq
MRyM+JV84Lke0wUKrSOdtJbf6aPHZcC+93fx8BwQ3p6mdnbT3az4NsnlM3FFED2b
qcN0Ooh576knA8gjGVhAY+3s/GVi1F1+0LlNrtmfu8s2/NKvTCWZE96nL/oABHu+
9Zz3yMYZvE1t9Gzu3a37JUf9AXYrwr8uxMygEuJcUyQfubbvsktGpM0Stndunbja
JEj/fKyUJrp6e3O8K5pPy4l2yVpxom8I8OgLfRVQiG8Xou9DZ8BhjZm84RGXb64g
aLbgYQqDOyZZkcrhwcl+TUpd9XX0AqbU4ChCcEGq3irWm6dV+9neNxHe0wml0Wpj
9n6Ziyx/+zZ7XlZlha7KKRRV/bWcfT2a4gmPJT9EwbpFvhp9t5WMJCqprQqH95zm
sTDxCWTPpz3YLk/zGbxaK3gmSsN8pZyItuM4+WV6no3sOUDz4PzR8lIAev+Icn36
Bd0kHPLNep83NnGQM3pufT6BIKX8KnJK32uWX8XOQXtliW6tFpU=
=lTy9
-----END PGP SIGNATURE-----

--bag7egz7mgswbrx3--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF93176AC5
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 16:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979584; cv=none; b=L+HowNQhMBH3M9Rr7G+vhLGuJ3DJcZCyBrAr8jLBY/vn1edTygNhIVlTSqnPzgLcJNp2wf6PAm9elQZcuXAA3yjyvqZAjoj5SLoHgMIRS48RD3zj7wjJoRGA83FM+XJdT+q0MCrvmmGeeQb+1AxPxo3FERarFMXbuBBuPY20XDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979584; c=relaxed/simple;
	bh=mXciF9Fm6pC7kh3B8YP5xVXVt7rIWeqAyWcLPQYDdPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNVqlgZH/fr48lRodAK09ruthzTfxDX2y+b64E71D82J07r2PvvEZd44uX9fW7QWBbNjMGXk3GywvSsSbXbJTxZHJ/YRmYBDvchKWGIpvYNIscKlw7ApcuMOiP7/crWQDBTj1XqUOb9EItq/1usbil3sl43u5uVC/PYCR4tCmVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibh1NljE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibh1NljE"
Received: by smtp.kernel.org (Postfix)
	id 86494C4CEF6; Thu, 31 Jul 2025 16:33:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B12CBC4CEEF;
	Thu, 31 Jul 2025 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B12CBC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4589968e001so7035995e9.0;
        Thu, 31 Jul 2025 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753979582; x=1754584382; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=;
        b=Ibh1NljEB0Zo5fKLdYY+ZAMB8b7g9Mg8xSr8mJ7C5wa8euaB2dhUqfyYjj+LnrqvY8
         zAweR0/9n9UnCbHP1TqFhrMZVGkvEKaQVDMr3SzaibTFEQ///VnkaIOYfv/bDNpUDnl+
         DtJhpyJjeg8LHgJFEMy/e9PhQX2Vfpg0Enh90UowdP5wpcWDQA/ccqms3P/HeMcMNNzn
         4+s4+ZrAu482cuNAOL2yfplBOnsWAB0Ni7zCvF0OznqPac5HV4IrUmDC55N2a1O900sx
         ZDxqAa9VsUlBYtKBv7S7bHOuvJRg9qLwaSOFlu6HHBW0qbaS7+UnpAHLssZKv80PiwI5
         wMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979582; x=1754584382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li7AzagmW0ymU43WIzpnsFPtOLa6z8qQMj5NFGuDEvk=;
        b=D6x1BQ6Y4Sei3ajPiNb2bQ0FW3aGkF689G21abJVXgFv97Wa+NXYkv8Q41WmknWAwe
         07qpv/kOKck7DOf0wlBGCeQImcDxgYSy1oC9mZ3eQYVCQAuXd+85Eu6GphikK8lgi+1W
         WwalqJj3Et+5vrfU51t8qpR3I51SoCGgriS6GrYWRsf4Gp0TMvD62Ada8UUXFcCz5A26
         ZH4j/xQk1dJL7zYUbt3iG+qC/64BjWyM0gqzF4ej0Km+UnWPJdt9ystrRr8u+kpxlmtq
         svfkZyYe9uhG6kOri2FTlX7JrY30x1ggsVJI+TUuBctPBM/d4QyX3RlRTu/z00IZne37
         tAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnErKfywwXxyw1mj+wV+4Cx+QmD3xzWTOIjTuyjy8deuagMfTjRbqWG9cr3SZ5S5vHS5Q=@kernel.org
X-Gm-Message-State: AOJu0Yz5nLp6MZeEn0l41+loJDt+7uDxQFN6gy1joeYMthNiJEGGu5NY
	QIcijTIbjm0SLBMAupfUEsgDueXHleWgY2rXMlhVoExBv5/7Nzj93qfg
X-Gm-Gg: ASbGncvDrW4sPRneAYZwGwijVyhOZZMeSkqgv1TKJo/R+YX22FsKZVDLAs9CIlkRZBt
	YZs25CL3GwtDy3ydhObVOHvNze7d29EhbB2OJHg962PBJrhJNJ40UXJG29W5Um2dZv1yN7exCmm
	bvOWOorUVGEQfz9/XqfsmzcCfChC8zl0xN2ytlgErSd6vWFv08WhLYHQLiS1aEgMdLoFzAgiWhE
	ZTM+3ZwxBX6dwALM8P+n2uYs9qxHkd+GHN68UPWIhulfj9EPXZbVNgEWlX3haQmMXfmDC66yLZr
	yFy0dXFfF6TbCLhZvtQ8tjPHdqfJdZl0ES6WJtbkgmAojtt2FOewGuPXCByDAVsm1B7/bEGW3Q4
	4sJfC3SnGsZbenOxtVFvI+kXmqkwo+DwTKvPbCEaD+ofHnzR7ZQJE3g+h5sSgqwrEnZ2h6YWVv3
	a/u4SpRxT0
X-Google-Smtp-Source: AGHT+IE42z7i7CovswTO03kEARLVTHTFnCJDTexv2D207gRXY26yhBPPOm+9zcqlKYN2OgVEMQVr4A==
X-Received: by 2002:a05:600c:4fd3:b0:453:697:6f08 with SMTP id 5b1f17b1804b1-45892bd1a95mr70310155e9.26.1753979581888;
        Thu, 31 Jul 2025 09:33:01 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536abb1sm77810615e9.4.2025.07.31.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:33:00 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:32:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Message-ID: <llqwla5x22fmhktolfyfmfkeur5z46v7j54mr6bkxm3i7avwqu@57kwpnif3zjv>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
 <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
 <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dyb25h5bm2euygmp"
Content-Disposition: inline
In-Reply-To: <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>


--dyb25h5bm2euygmp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
MIME-Version: 1.0

On Thu, Jul 24, 2025 at 02:17:08PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 22, 2025, at 14:21, Thierry Reding wrote:
> > On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
> >> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269=
b:
> >>=20
> >>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47=
 +0200)
> >
> > Hi Arnd,
> >
> > it looks like you haven't pulled this yet, in which case, please hold
> > off for a little. There's a missing dependency on another branch, so I
> > need to redo this. I'll send an updated pull request ASAP.
> >
>=20
> Sorry I missed your message here and ended up pulling v1, which now
> conflicted with v2. Can you change v2 into an incremental series instead?

Sorry for the delay on this, things got a bit complicated as I was
trying to untangle everything. I've now sent v3 of the DT changes which
is effectively v2 without the dependency and with a patch on top to get
it incrementally towards what v2 was.

I've also sent v2 of the DT bindings changes which are needed to resolve
a DT validation issue for the new Tegra264 files.

Thanks,
Thierry

--dyb25h5bm2euygmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiLmroACgkQ3SOs138+
s6HtAQ//eSz+Bw+2b0FTb/6yzmbLV8BKO4lC7yIl+7FhjfmORCS05Fp7e1QRjuPS
bbAl5I9ubAxMtCG65Av112IIsC1jzy7wGiIKHZlyJ1mCyD6tng//b4TjWoaMZrv9
iIZ6VMuAnd2eBZyIByNOc+y6uTHhT4NQndUpDYuGgAyoZj1KxSaaEFggFJWv02Ej
roINesBhWn0vUJ2tPIq3a3KyyW7ewqV3sdKDJBQRwv1cCTm7MInGFAWZvNI38gPq
D4OPgKin7he9Ys3ksv/oTsRBsJ1U18vqoXIT2pVoc/vFyKc2kxQo6idHzztEdsyS
BzETIFoOG8LCMESiRRPF5ihJYA4hub9L7dVn8qFy9G4gvgyTRvO3ClN8XR4yf+91
NKy1ciKRRd78CAwGvRvyl8Dc7VBSBnTZRvRC6Asp+X9hqiDS3v38zf2ZMfUjRCt2
GrOrq5I/hq6MfTySyFxV6EJaqJqgTshD0NCC1sG7X2DPO10N2A3wfOZNDFFX8Voo
i3y5yAyGHsq+hbzzBOonRDKUFqzp1w4r/A9pjRpxl0fmb4IrlyCqbw/Q0AfxvPdj
ZS/iiiKv4UMrWKmqX9QzlrQqo1uT+1vj7wrMjs19gu5D2jURT7D49XPu6NjLquVD
XFD5ZsecCiFnDnqzkjJl0c1yhdwqjAsbFZIzjJf1IM3cPPvrFn0=
=Us0s
-----END PGP SIGNATURE-----

--dyb25h5bm2euygmp--

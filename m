Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA727602F
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384178; cv=none; b=DgZ+Xti32jYVqpbehT9hxOimwrJFc+2UPewH8VGSV+JFB1nAanj9tZe9TfYJ9Zy4kQYSvAi1yBCUQESEN6grCYN7c4fTTHbjZ4uh2dJXR5XLtKWdFCJfvY33H5Wwd1lPHLp4w+BwbHV3Az524fZ29L+0sr+sqUEFEgQT5/MwWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384178; c=relaxed/simple;
	bh=D8JKevJhdf2pIaGBDhah2ObNrwU9TQx5FS+7oH7yFQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJYD1to+X8qNWmFc9o534yyoxQJJ1UaTjCEkEf/IMylUorO/CYEpQ9PGhP31yN3iU1w8Lean4EqUYlEXcvDo3PA3+InEg0dG4jMsgpgPPKBdR+N3HEA/UL9ijjv6ydjBFVbd5rgFQLrQ1UMr2WdW8FKY8b2K0YPXT080ZCbr7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq81HJx2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq81HJx2"
Received: by smtp.kernel.org (Postfix)
	id B6B94C19422; Mon, 17 Nov 2025 12:56:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEC06C19421
	for <soc@kernel.org>; Mon, 17 Nov 2025 12:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEC06C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a1c28778so13058505e9.3
        for <soc@kernel.org>; Mon, 17 Nov 2025 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384175; x=1763988975; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=;
        b=iq81HJx2pzIuT8OdjdYWP/OzMUEWaQmu6rPRD1vhLxxijzTbbCRJ+P+o1RwT8hFo4m
         0sD6SPNPYHVUuR0Ndl8F1eOoCe6JQLkYHlxhs4jMPAeFNvQ7+bV+zMKysabSqlQ1V2BS
         RIQJvB70UwrpMMLZPIUy9Nggkw56DCYw9O6AnaVSfDLL2rqqSQk2JjUjVVKhqgUbd3rr
         126yoL1iDx+lQzAq6hZajDi9yoIO0Lmh6BN1/l2TCrId4HpPEGDEMr8+WT/Dk/R8c74x
         vu9AYY6mXOAq3tFreHTr4XThxM7FCFeh+rE8TqDJgEYjBwRSBdMxZanTyXtfREyzgFc6
         1tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384175; x=1763988975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtQClQj27s6zv9IA4AhMxU7/PHrcAy8OI38mRHxa9s8=;
        b=gY3cHSit9vOOlhy2wXBEQY1WCB1COm2kmRs7IUDqq/Ure0LO4SH8W14rQtXWj6AWqa
         HHUixpWpPGDvempe/EoKZO7ek/L+BBfbph6MTYPiBZVXwQE0nAqGNUf8AV3dUkszfRTI
         J3O8YZVJ+zEm1/EtQnOJ6tv0V1gfMQE7UN2z1En2031c4E0tSHSxG2L6PA2DKibkg+hH
         mp9epHv+ShrkcyysfFBXVbvyTKqAApqbrPgjyvWqtTyWep/H1OJIxnC9z5c8/2rWYeEO
         8vuXEQvI0rI2DYdovTzsSEvAoaQ/ibnkfakOaMJK4cZWoXfA4xEORZb0POxVxfipOyl3
         NScg==
X-Forwarded-Encrypted: i=1; AJvYcCV115ocReOFSPkPHspcdOvqEujvSOGrb/OWWuCJfGDJ5vs5aghUxo4QMt8rxanmZGrvMBo=@kernel.org
X-Gm-Message-State: AOJu0Yxomkkpnb6tN8PjacYBRTo45R+KN4FSBBfSjLWt9L27EruA67mZ
	9cf3N/73FeCHw7rEh4M2Zq+TX0PTlGB9QytZYaRlHOtAtnxh1OpczdGM
X-Gm-Gg: ASbGncuOde4GS2qYNpSTGMn2diydZTSc5aWmyflt6zq/0tUJbQmfmmTgrsFH34rvte+
	mS4CqDQ062TPOfqB3PwsSRUDjvcchG/ysxmfUjvKJhR181z/x+n7p2aDRgkuYb8xfyC9h54vkkB
	/y4NF+PnpdeMbDnFgRGDIZv4BpPHy4iJBb9rVlMYGtbEteXS9F67pdYAsxeGtcn/k8k+3ynhZz/
	XUv6qMukzkbyHzU4i91lm+zVPp6eZOtK7quyVYvRoDC22x82Mp2WZ6ii1hE/sQGOUAMc6IaK04n
	GmMT4w14BBvA0UR/f7RleVLIHL6T5L9lP82L+vYsAWHyQnnsCwM1Ngp3r+XoFzwO0FbkX5wteEt
	/ClLTruG5d7uSkSUFSKmfHromHaTa2kZXE/DD1QVk7U6umDSWLlznm5gpxT5ZiVeiLFWERppbHP
	EVJzPtJZGWKN6+ULU79fno7fOVnbz9lWK9iiGGIfHWokS8PpefKvSo/EQHfnvmfzuEUQWecun7K
	A==
X-Google-Smtp-Source: AGHT+IH57ecXdIuEBtdHqbof8FxE77BlxQn90vBWkhWWPRNuN2jxvquiJGk+VRf0FNachim8KEymaA==
X-Received: by 2002:a05:600c:6052:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47799866420mr47099985e9.28.1763384174937;
        Mon, 17 Nov 2025 04:56:14 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm141496285e9.13.2025.11.17.04.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:56:13 -0800 (PST)
Date: Mon, 17 Nov 2025 13:56:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/8] ARM: tegra: Default configuration changes for
 v6.19-rc1
Message-ID: <la6n4yiqekpykfkt2d5kdt2px6vnz5djge7hstjs5mu7jnved6@6tdr4yggfkmx>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
 <20251115090044.3140331-6-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sberisgpriyevh74"
Content-Disposition: inline
In-Reply-To: <20251115090044.3140331-6-thierry.reding@gmail.com>


--sberisgpriyevh74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/8] ARM: tegra: Default configuration changes for
 v6.19-rc1
MIME-Version: 1.0

On Sat, Nov 15, 2025 at 10:00:41AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.19-arm-defconfig
>=20
> for you to fetch changes up to 23a29a81b44e3a7a139fee4d3eada5f299d8985e:
>=20
>   ARM: tegra: Enable EXT4 for Tegra (2025-11-14 18:05:14 +0100)

Looks like a fix for this is already in Linus' tree, so you can ignore
this pull request.

Thierry

--sberisgpriyevh74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkbG2sACgkQ3SOs138+
s6FuihAAws7+fjys36vJMOzOHFLEBas9dF7S+5AuTIaZGhZtxTmjaILVyWTycZJ5
PeWB56yTkpRPkHFw5aIuF6nvy8rOp6vYRCmMRZPdVADBCkclFdnDyKjb628QAPz/
pda88AkbCre4nHZWPXvOy4cuw10c9aERK+8C2RD9BFft03kX/hqMuzdo9NbCCq2j
puNPW620/Xd/lu4tEHqNeaEejbV06J5yrbvxRU7Yw3Im1KsVmKrzSlLm9eE4tfFp
eRV2T/aUqXEVKUJNEXaTYWyCg7GIrsW41ZgLLRNOVj6acFZb5VPHfD9dB+QB4oSg
JdeYssNwytIh8lS0cLBcIQVUAPuSUR/mTsa4XVzo5dh0/HqZIXTg4g23/5yoLkxs
tGjWtY6iWDBenFSTbis8yDkNhX/4b8XD8G6adfAGU9u9qxYHucc8fLD2GSDWA2en
gN1gYCD4hTj9g2rrZpF+oaNoFmHl3kaojZ+n1C8kj4M/WMxy2ngMlxA6eGM4ysHA
ywehnhP7c3iRQV9Zfn54cUyjpU6sx/gekSzZC2qvBYq0N+Koss0VvgES6ENaUNi6
k4LgS9RGWL7BGCmBF7dmXCVexn0CkppspJl2Lzz254COJYUxbxEhddjb3RHmfYbY
esCZlyqtLcg76ccZxmAHwSMEIPNyN4jSqSQWIAYUkP3Fjj0cIM4=
=k0z1
-----END PGP SIGNATURE-----

--sberisgpriyevh74--

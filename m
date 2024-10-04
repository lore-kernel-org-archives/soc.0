Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2799154BE2
	for <soc@lists.linux.dev>; Fri,  4 Oct 2024 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728085486; cv=none; b=eNOuFn/g+F8BssZ18G560NgU2uaiElNnVg3AoiqoiY07a39hCP0NSIaBrGiiMVVlYrFfs6m/snJJcFrii0me9FUUK6myd8Yy/I8IwxsQfbe4YXIu74/NziJ5ku6wDHVmMdldgcL7yvGT8IDDOOq+c0+EN7sziUuv3mJqNDvHoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728085486; c=relaxed/simple;
	bh=SpO/zZwBSjf3Q5q55AHmxIk5M1/0FtKYET1fT+0cAb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcF/OGWp/nV2aX8cixVEUg/Sf3QrGp4GCR9rAyyiyHCbizpYphFkuRVn18eYjQ7YrfJD8fsYrUXzW90qz+9wAHDuCW65JPcVdxvgaznyEcvf7w8ZuLeRv7Gg1Ea4HHPl2DsStNLTFKf9knwB/PWF3P99oMSeJxotaAD8IF5oHxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxGB/Nwg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxGB/Nwg"
Received: by smtp.kernel.org (Postfix)
	id A5417C4CECD; Fri,  4 Oct 2024 23:44:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF609C4CEC7;
	Fri,  4 Oct 2024 23:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF609C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20ba8d92af9so20733955ad.3;
        Fri, 04 Oct 2024 16:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728085483; x=1728690283; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SpO/zZwBSjf3Q5q55AHmxIk5M1/0FtKYET1fT+0cAb0=;
        b=VxGB/Nwgj5zqFcWq9qG5h5mdqhnomLoNKo4IT+q9WLIdM8tJYRMvs41eECpNNUYZ+4
         iatHWhmCSKvaNjdk/16bX3kOofHwiaziU5BrgLhYRGs+oNxcOE2IDlDtodE+n5lb0USI
         odoBDEraN33KhOd7CUt9NSaeSoChxif2xyQQd3kBlp16Y66NZmCcm6VOr3pxBbQXJ3cp
         S1EKvEyA7VsV6e0aiXg8jFC1ylL5/aPd3GELE87GbmXC1N/1uOvkY7bx99mNPw3EXD5X
         /F50P8eLfSBFF9I6CGHy1nm9DHAANsB1T0fWqCwrhcpYwyOI6fJgN+lZWWhJyLS3lIf1
         ru4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728085483; x=1728690283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpO/zZwBSjf3Q5q55AHmxIk5M1/0FtKYET1fT+0cAb0=;
        b=O7HN8lbaVgFCsVWJarH2Lms/KZ4K46+6Jo3MV4v/HqaYxtEgjkbqHkY16Oem+uBTwk
         Kyf7iCtF8lxvCGhRWyaojoJsngYKrpFeo0L5O/Ci2sKM1GujXdXD1frVChghkQlaG2Xp
         QJJ4hEoGDO1yt2IJ49+oIvZRT1z2pMuH8qTQkQRBXTsxcxyJJ6Hh1e7Wr5uyxcM1tncx
         R/CQL/lQMQBsqXSqSCm03lj9I7m5RBmdpuFrfH4ghtLgUH4jMf3zkFvfMkbU6nKmP4li
         jywXFNR9mDEiyzEMUsX7LIAYzW34nVc3BTrTKzl/uA8MxE+3vmwP0VE69c7xk+8FqA0X
         yNxA==
X-Forwarded-Encrypted: i=1; AJvYcCU78tCt1YyWq3mwXe42/0uU1nOQqpYCofB29oJEocid7PjP4L4NmwXZotFCNTeLRyTPsanD@kernel.org, AJvYcCWlVJ6HDOKr5ZDfdWtRXZx8UJb6QQ+da6Ixopghjf4SItTAVZGRuR05ORaB0ZrNCyomOfikNw==@kernel.org, AJvYcCXJ4lDxDivinPhcVsBotGVByxCq+DwH/PCjvKwpx5ukuYPmGLOZSLTEX2yNAeSWUn5Cz6pV/g==@kernel.org
X-Gm-Message-State: AOJu0Yxp1cR32lKHCnx8meetHkUGXIE8lOwZc2H1UIKGunSgECxYsdr6
	hPud6c4Jg70zRUp9kFWczdsobn2pFDDi9olAHwoZDubpxpsh6Eql
X-Google-Smtp-Source: AGHT+IFM15MphvgGrAhx7X2A+C1nlm/ncINA+fx+b2vwyY8aSwIN+yvAHcvyDhUHMl6Pw78hK0ed7Q==
X-Received: by 2002:a17:903:208b:b0:20b:8ef2:c84a with SMTP id d9443c01a7336-20bff0663bdmr50277645ad.53.1728085482962;
        Fri, 04 Oct 2024 16:44:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138b1ab5sm3851645ad.48.2024.10.04.16.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 16:44:42 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 298C341406D9; Sat, 05 Oct 2024 06:44:37 +0700 (WIB)
Date: Sat, 5 Oct 2024 06:44:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Will Deacon <will@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor@kernel.org>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify
 submitting patches
Message-ID: <ZwB95FxdgqAtuc7z@archie.me>
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1a1trQhGb4xvmPcH"
Content-Disposition: inline
In-Reply-To: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>


--1a1trQhGb4xvmPcH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:56:35AM +0200, Krzysztof Kozlowski wrote:
> Patches for SoCs are expected to be picked up by SoC submaintainers.
> The main SoC maintainers should be addressed only in few cases.
>=20
> Rewrite the section about maintainer handling to document above
> expectation.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--1a1trQhGb4xvmPcH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZwB92wAKCRD2uYlJVVFO
owDjAQCAqBT6xfOfmpsFrV0KReTF4lm++5Z5wjWziDPTEBNcNwEAuYNYhah94RXs
xTDgYUpDlGAy2q1t24sck949Q6PTFQU=
=UuTB
-----END PGP SIGNATURE-----

--1a1trQhGb4xvmPcH--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8A224890
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612811; cv=none; b=rWWESdZf1urHPuey5gvlYygY/lvoNuwx4AqLCFHkEnYlLm/Hwt4le9wrtMtmlTSo/0AcQn6rXNlE2v3cQgUgQvx8xItVcpSKjPZDwfKNpkgB14BUsDsGbVWoiKFqM8thNSBvvuKp9xLzqx4036nHK9y3U8/QQiqHD/gDPOrAtjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612811; c=relaxed/simple;
	bh=EMmSa0bLbyWI6LR+Lux/stoEw7UMyg9hY3+iFQ+o5oU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/tDJ5U1AQqNaaepUJtF6PbjJrFElnvKfLCupJFbrKRIaifIroRDm74TI2ziqFX2j3QS/J0OcUyMfYHQLO4yf594F92nzNamlLP7X/RXffyXlXWkbLUx+F2HXtPdxkDuDD/9gNVgMMYJuw+HbBoCm1V0hMFFMAOJgCxbejv8E2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CNHu0Dtg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CNHu0Dtg"
Received: by smtp.kernel.org (Postfix)
	id 5A396C4AF09; Thu, 19 Dec 2024 12:53:30 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AE33C4CECE;
	Thu, 19 Dec 2024 12:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AE33C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734612809; x=1766148809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EMmSa0bLbyWI6LR+Lux/stoEw7UMyg9hY3+iFQ+o5oU=;
  b=CNHu0DtgDBgA5JHrVygoGwKpGLSSdFDNz3kcqkSEC7K/lkBfwpeYB7gE
   x+KR9/CmtnTcTxG5b+25AITg020Ognbx/aU/bjW67DbX6PEomi41hmqpv
   FHtRCQqp00DIKbYCw01CWJPxpDXyDV1Dr5dtDq/UR6N/GTzoR+V4HCdtD
   th3ehmOScxdRVzLh16qbAEcPmlz+OiQS3ifOeyubdDeOQFw9cKT4WakFx
   VDtJ35KP5JRIEd/xah56BVx4GnCBxnOV8N6HaCiuk9Rciej6zFgqF3ELX
   Mew4b9yurPNh9T0dv1cifBQpDkkRkvMPmVEvJdIxyT/h/mncUx9jg0MBW
   Q==;
X-CSE-ConnectionGUID: +BM50oZTTYWcajrV5RIUfA==
X-CSE-MsgGUID: i/AdQr76SxCB+vE4RvMJUA==
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="asc'?scan'208";a="39488510"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Dec 2024 05:53:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 19 Dec 2024 05:53:06 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 19 Dec 2024 05:53:03 -0700
Date: Thu, 19 Dec 2024 12:52:31 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yixun Lan <dlan@gentoo.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang
	<jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, Inochi Amaoto
	<inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, Meng Zhang
	<zhangmeng.kevin@spacemit.com>, Meng Zhang <kevin.z.m@hotmail.com>,
	<soc@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241219-lumpish-reach-00c29cf962fa@wendy>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
 <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUQBJ3RlsIXzsKC7"
Content-Disposition: inline
In-Reply-To: <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>

--SUQBJ3RlsIXzsKC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 08:50:41PM +0800, Yixun Lan wrote:
>=20
> On Mon, 28 Oct 2024 07:04:00 +0800, Yixun Lan wrote:
> > Add myself as maintainer of SpacemiT's SoC tree, which
> > suggested by Conor [1].
> >=20
> >=20
>=20
> Thanks, Applied to SpacemiT's SoC tree:
>  https://github.com/spacemit-com/linux/ (for-next)
>=20
> [1/1] MAINTAINERS: setup support for SpacemiT SoC tree
>       commit: f187e72262c3245bc032a1a0f106784fb8562a0b
>=20
> The for-next branch will be sent via a formal Pull Request to
> the Linux SoC maintainers for inclusion in next merge window.

BTW, did you get your branches into linux-next yet? I forget if we
talked about this before (sorry).

Conor.

--SUQBJ3RlsIXzsKC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2QXDwAKCRB4tDGHoIJi
0nQgAP9JsKTLeh+9UUsC/uO4H1HkHqdYMZSbxDWyUcB5gyIkvAD/c54edEHIgD+N
cCIV9KcwHlTdQ8jKz+avpjsj2Fhh9wk=
=qq3L
-----END PGP SIGNATURE-----

--SUQBJ3RlsIXzsKC7--

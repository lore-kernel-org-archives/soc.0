Return-Path: <SRS0=Fkhw=C6=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14AFC0015E
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 12:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 658C8C433C9; Wed, 12 Jul 2023 12:35:41 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60A8DC433C7
	for <soc@kernel.org>; Wed, 12 Jul 2023 12:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60A8DC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689165339; x=1720701339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XAbpANE/Fng5ECm20P1cz/dS/we/2gWEgl+TdS/1S6M=;
  b=vLcFR4AwRliir+ZbiMJjkVYbjN4ka+wbl2l71TVunwSCTBslnimUCO4a
   wSBXk/dQ9/o7q4ReyWZ4xG5HmhAxkLFYsr6x1TU5XuzMF/bqB3w0hJbKX
   84Q+WSOnjmQ315nwBM1GP0FBpppMQaEnX1Sd5XawbLB49p6wPqDk9YJCk
   dATOzueQZNergW6OksBqNhFf7LVP3KyvgCbuJzZtSzUaKRF8BGxvfqVE8
   FyXG9VRZClU/ahMpfHB+ECuSmS3OE9fpwkNbJe/tRxLQm31oBJjlIlg32
   gzPH2PGblsIEviXzssb9NiCnPX/8kGFZ+j9IVMrCV9jAgVJh4C6J0VgxB
   w==;
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="asc'?scan'208";a="220004003"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2023 05:35:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 05:35:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 05:35:34 -0700
Date: Wed, 12 Jul 2023 13:34:57 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<soc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <workflows@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/process: maintainer-soc: document
 dtbs_check requirement for Samsung
Message-ID: <20230712-unfasten-trespass-d57b3ff1f134@wendy>
References: <20230712084131.127982-1-krzysztof.kozlowski@linaro.org>
 <20230712-skier-ribcage-0d82be7e16fd@wendy>
 <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oZupxwsk8vse9QyQ"
Content-Disposition: inline
In-Reply-To: <da79ac87-f112-be43-52b2-2293e1a99d9b@linaro.org>

--oZupxwsk8vse9QyQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 01:46:20PM +0200, Krzysztof Kozlowski wrote:
> On 12/07/2023 11:48, Conor Dooley wrote:
> > On Wed, Jul 12, 2023 at 10:41:31AM +0200, Krzysztof Kozlowski wrote:
> >> Samsung ARM/ARM64 SoCs (except legacy S5PV210) are also expected not to
> >> bring any new dtbs_check warnings.  In fact this have been already
> >> enforced and tested since few release.
> >>
> >> Cc: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >=20
> >> Not sure where to document this. Creating new maintainer profile for
> >> Samsung SoC would be an overkill. OTOH, more SoCs might want to grow
> >> this list, so this also scales poor.
> >=20
> > To me, this portion of the document was "information to the
> > submaintainer", which would be you, not information to the contributors
> > to the platform. Adding the comment about Samsung SoC seems aimed at
> > contributors?
>=20
> Yes, I want to document it for contributors, so they won't be surprised.
> Any hints where to store it? I could put it in the "About" tab of my
> kernel.org repo, but no one checks this for contribution guidelines.

I've not got a better suggestion for where to put this, but under
something labelled as "Information for (new) Submaintainers" isn't
where I would be looking as a contributor.
Is adding to the generic DT documentation that dtbs_check should not add
any new warnings at W=3D1 too extreme?
writing-schema.rst has the instructions about how to run dtbs_check while
writing dt-binding patches, but we don't seem to have any docs about
running dtbs_check for dts/dtsi changes.

--oZupxwsk8vse9QyQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK6d8QAKCRB4tDGHoIJi
0lwSAQDBl5SejPpAFmt5bv2VhK+0qeUjxPKk2oF8smIN4o1SmAEA0svDs8omMe+R
WsZHkfgbSn5tEDE4rofWHvQ8e/QKrgM=
=b8RU
-----END PGP SIGNATURE-----

--oZupxwsk8vse9QyQ--

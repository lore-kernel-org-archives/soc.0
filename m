Return-Path: <SRS0=3O4a=BT=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967ACC7EE2E
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 08:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 61B78C433EF; Tue, 30 May 2023 08:56:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F1B6C4339B;
	Tue, 30 May 2023 08:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F1B6C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685436998; x=1716972998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TwJucBXBGUN+OLdeFJgi+mcuaAx9YZFO5Ndm7y/BYEo=;
  b=uWsVOIRIBHDbtr2XMJKjpLzn43HQus028zwydTURPeddqo8OjJ22LeKW
   X8AWQG1WY6pZDQ0zf7KF2su5DkYeVhH1dPwK2PWySYGA0FAD6i4h/hLAI
   4pDCg/zfJX1C7HCNh8xnH8vvGqpFCo6wWJRBvk6YKVH9CneeLuaDeoCsl
   B9iXhpcSPPmnHjfZiK8ic6atuBckE94KOOmElq8I4TdbFtvv7vVKYlfL7
   WAZfOZdhoIkvOrB22Tbt2zDQo64d9S4pNCdeJm/dJNx8B2Yg0wso5YMfy
   m538BUBC9yMf5Xf5FELC9f7ZSea1jqGxtZwc8QqvuC/bI/3qBG1Aj1dFn
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="asc'?scan'208";a="216001309"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 01:56:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 01:56:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 01:56:33 -0700
Date: Tue, 30 May 2023 09:56:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Olof Johansson <olof@lixom.net>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 02/11] pinctrl: stm32: add stm32mp257 pinctrl support
Message-ID: <20230530-payday-gravity-45a26bd7f2dc@wendy>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-3-alexandre.torgue@foss.st.com>
 <20230529-enrich-clammy-14b498baf09f@spud>
 <879b7689-5663-28b5-9431-2fdd243ffff2@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nUFaAWKbUup9Ifzb"
Content-Disposition: inline
In-Reply-To: <879b7689-5663-28b5-9431-2fdd243ffff2@foss.st.com>

--nUFaAWKbUup9Ifzb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 10:38:30AM +0200, Alexandre TORGUE wrote:
> Hi Conor
>=20
> On 5/29/23 20:04, Conor Dooley wrote:
> > On Mon, May 29, 2023 at 06:20:25PM +0200, Alexandre Torgue wrote:
> > > Add stm32mp257 pinctrl support.
> > > diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/=
stm32/pinctrl-stm32.h
> > > index e0c31c4c8bca..5e5de92ddd58 100644
> > > --- a/drivers/pinctrl/stm32/pinctrl-stm32.h
> > > +++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
> > > @@ -24,6 +24,9 @@
> > >   #define STM32MP_PKG_AB		BIT(1)
> > >   #define STM32MP_PKG_AC		BIT(2)
> > >   #define STM32MP_PKG_AD		BIT(3)
> > > +#define STM32MP_PKG_AI		BIT(8)
> > > +#define STM32MP_PKG_AK		BIT(10)
> > > +#define STM32MP_PKG_AL		BIT(11)
> >=20
> > Mainly out of curiosity, why have you go duplicate defines for these?
>=20
> Mainly to fit with available packages for various STM32 MPU. Currently MP1
> SoCs are available with packages AB/AC/AD and MP2 series with AI/AK/AL but
> in the future we could have package AB/AC/AD/AI available for a particular
> SoC and then I need to anticipate this case.

Sorry, what I meant was "why have you got defines for these in this
header, when there is an existing set in
include/dt-bindings/pinctrl/stm32-pinfunc.h?".

Cheers,
Conor.


--nUFaAWKbUup9Ifzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHW6KgAKCRB4tDGHoIJi
0kFZAQDNwlhOAKYKGvOi/CDjWW2Mt/BRKIp/vzjgcMjS9EwGVQD9F29KDtdq+WOs
LS3PsjPYYdNc61FM+WOSgjb+Z3y1bAc=
=gjoB
-----END PGP SIGNATURE-----

--nUFaAWKbUup9Ifzb--

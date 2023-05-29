Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE87FC77B7A
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 18:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96ED2C4339B; Mon, 29 May 2023 18:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8BFC433EF;
	Mon, 29 May 2023 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685383495;
	bh=kKXl/E6gk/dFtNN1CB6T+UUUTzz3mIITm1Zk1GG7tus=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=JCQgSoo18UhGLXd+xiwAkYtVwqA5NX24O+I56aRUT5icZAE5vL5S/4z00fLLFRESd
	 xmtuIEJUP9PBZwTuI+0IsPSpVoeCFbmYxsSqpYoivPprpeq17qBZhZKeoDsCKXvx6q
	 vrj86t4tv50hcneL/qFbXMo1sBwqFaaMbvxLew+f5mFewlqU00He2X2s0NIkIkhEvp
	 3SWgdCV2BCk8KzTf2KSoj9z0cjHx9bIAHhvtqHua6hDm6AwaaczsLdhVXz1DuFVVlO
	 0CYy7Jx5yXRQScPNqHScGXKUPGkuVi2+2MK7Skx+uV9vWUlZN5necuhifV5TLgjf8o
	 wNL20SZiI6Y7A==
Date: Mon, 29 May 2023 19:04:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 02/11] pinctrl: stm32: add stm32mp257 pinctrl support
Message-ID: <20230529-enrich-clammy-14b498baf09f@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-3-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t41OrSZBzQnUEuSq"
Content-Disposition: inline
In-Reply-To: <20230529162034.20481-3-alexandre.torgue@foss.st.com>


--t41OrSZBzQnUEuSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 29, 2023 at 06:20:25PM +0200, Alexandre Torgue wrote:
> Add stm32mp257 pinctrl support.
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.h b/drivers/pinctrl/stm32/pinctrl-stm32.h
> index e0c31c4c8bca..5e5de92ddd58 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.h
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.h
> @@ -24,6 +24,9 @@
>  #define STM32MP_PKG_AB		BIT(1)
>  #define STM32MP_PKG_AC		BIT(2)
>  #define STM32MP_PKG_AD		BIT(3)
> +#define STM32MP_PKG_AI		BIT(8)
> +#define STM32MP_PKG_AK		BIT(10)
> +#define STM32MP_PKG_AL		BIT(11)

Mainly out of curiosity, why have you go duplicate defines for these?

Cheers,
Conor.

--t41OrSZBzQnUEuSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHTpQQAKCRB4tDGHoIJi
0prAAP4kVP4W0utKn8JZzGkGIrQ25LkCdWPdC3VDNVom01MAdQEA5+piPAcHUvh6
DL7szeSe5AxTep3AtCjEfp4OSJa+PQQ=
=2SPj
-----END PGP SIGNATURE-----

--t41OrSZBzQnUEuSq--

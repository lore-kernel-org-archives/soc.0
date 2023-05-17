Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55336C77B75
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 16:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F051C4339B; Wed, 17 May 2023 16:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C96C433EF;
	Wed, 17 May 2023 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684339788;
	bh=cHMUsYgSJVLjJfB7z23F/JCkZT/qkSJ/BXZElpYV3l4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=NZY+MnBc3xCLXwFyuoRjssSlFlyGDNRS/De0GOgKkfwJgQOdCGLc5YLpvoi0yqdBO
	 l/wFYJYGqpbrWn14cNNPhK2X+/vxK1+sDBgtarCRlfMx9b/IKUQRLv4Kn/X/qwFvT4
	 vYL8Z+fIu4lrY536yf2c6ArZpu/zbzNAe/92YLS4G4rHO+lWFqF+ZYYiy+Kv4DbSAt
	 fq7lEqeMKqe2lS78q7TeuLXAV9tAS0EVQ/yF+HseEPrxEVC7mV8hesT7CS1RbKGflV
	 zE9ZAzxvV65QPmn33ulGe7MPJtv122KPFifCOEG0QG21GSF1g2jIts0AlCIwAHRvfL
	 tMqOimLEFQh8g==
Date: Wed, 17 May 2023 17:09:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org, afaerber@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, lars.povlsen@microchip.com,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable ARCH_SPARX5 and ARCH_REALTEK
Message-ID: <20230517-resume-gave-13eacf634351@spud>
References: <20230517143011.549319-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LS+5EWt1oxHnBrHf"
Content-Disposition: inline
In-Reply-To: <20230517143011.549319-1-krzysztof.kozlowski@linaro.org>


--LS+5EWt1oxHnBrHf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 04:30:11PM +0200, Krzysztof Kozlowski wrote:
> Enable Microchip SparX-5 (ARCH_SPARX5) with its MMC controller and
> Realtek (ARCH_REALTEK) so their DTS will get built with defconfig and
> maybe platforms could be booted from it.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Krzysztof.

--LS+5EWt1oxHnBrHf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGT8RgAKCRB4tDGHoIJi
0vueAPwInI+/y2SPLR5BisZHvbsmKQ/vr98zKXxfIWZ+YOJdyQEAwdrORmJ1eu7i
a5U3dJc7OfdnhBNGQ0O55w9Gcbh+7wU=
=3MX3
-----END PGP SIGNATURE-----

--LS+5EWt1oxHnBrHf--

Return-Path: <wsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C6FC433DB
	for <soc@archiver.kernel.org>; Thu, 11 Mar 2021 15:35:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E9EEB64FAD; Thu, 11 Mar 2021 15:35:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F214964F46;
	Thu, 11 Mar 2021 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615476929;
	bh=zAgboUjHHYtSTApDhEwGuBzEumVnZm12d8hI44Sy55c=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=Ke6tN8VnwcrLmL2Q2jUfC9ZA9s7EyGy3T54ZcGRmWIGRpDgIwLttVr6Ehce8IONoe
	 xFb1SF7rEYR+atDV344GT0OHFUTDY35SXRhp7RczqKREG5yS2OzC+ZGFvjUJSbtHFv
	 kOS2EJ7aJJdtCnT4cPC4/RTEEtOSoBUFxdepUD2Kv5SUmKZ6rPY3P412xnr7Btgc2Z
	 vjE993D2QXRIBGCygPLXYpqXi7d8ABSoIyRyIlK+J9TZMHeJmqbOjk9V5VU8JvBRbt
	 BTpzQJl8s4MyyjVjchocujVQYU/niPELw49UEURznPD8vVbFDtDG4M/7e4MWqurAHm
	 EPHL/5qFywnWg==
Date: Thu, 11 Mar 2021 16:35:25 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
	Lee Jones <lee.jones@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 13/15] i2c: altera: use ARCH_INTEL_SOCFPGA also for
 32-bit ARM SoCs
Message-ID: <20210311153525.GI3566@ninjato>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152738.1318541-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline
In-Reply-To: <20210311152738.1318541-1-krzysztof.kozlowski@canonical.com>


--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 04:27:38PM +0100, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
>=20
> The side effect is that the I2C_ALTERA will now be available for both
> 32-bit and 64-bit Intel SoCFPGA, even though it is used only for 32-bit.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--5uO961YFyoDlzFnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBKOLkACgkQFA3kzBSg
KbbZ/w/9GRR5AjuL/bna/Vk8wI5mY1iTWUuqDmvXapF1EgH2dIRC1PQbIpNEndNW
xqCH2kRbwlPINKD0E+N99R+T/wsk2qMu5hSkl+IQHHRzuF9ZeThFUnJCDzUF0UMS
WoMTLrYyl1/ei2jJHzvbC5mmsOg3ckJA3c/wI9oATNu8yHQ5ptkYGBYPzh8IcPQS
Z3WMvWz6Ir4NBpy68lJ0EPW5/mgLdBGI+6/JRNh+8CABa9IU/eZsHxWVj4fOE92W
Eao/3P9oVGI+fcNxIp0oMrWFkw0emhGlcS+XyiKtvHhBlvmlkeenrOYU3ARDllNj
Lv+Lrp0fT7H6kTUcJEAzLAza8h6v94J9KOdRR0Ll1sBALSv7OA5HHNgmfutZpWSs
grYmZqs34BbSr8NGOdU90f02peBMLDYt4kiV7OtbjhSnV71xI1F6dyQCLaFEXAz7
J/AAKzgBbFTtO1wtE3jwSeBGSSc7QeuKyPAERwFWjN2f2J37/bC/R6c/AxAmCNXi
+jcMDrOwQWlbaYFYQLo75tdowmM1LrEmptykTH0dWpDx2RXdmsSz6VGamqHdfTM3
FJ/VRIuqVu20LB55FSNLCxmwxnTVvv/OcnDwMAYDlQIYMsFigLTBWFNtRVmvGNPK
WHUoXN5NBygSwkUPKGDji5EAKyZBa/QMW3C9Nn1aU4MXlAFKZFk=
=53ZM
-----END PGP SIGNATURE-----

--5uO961YFyoDlzFnP--

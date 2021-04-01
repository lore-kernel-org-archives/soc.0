Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D90CC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 01:34:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D7CB161077; Thu,  1 Apr 2021 01:34:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A977660FEE;
	Thu,  1 Apr 2021 01:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617240884;
	bh=y68C6IcS4m9PdNpuDWn6Qfoy8NqdkF9RgAyAEM3FH7I=;
	h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
	b=Ix2FykBgr2c3lT6X7vOJbbeRHaCnO4Al8p1iBMXYa38InTFl1x+QJY3Gi3ECAKnDx
	 Ae6xhoOLYyS//Gu6nvCp5MmNGPOFoah/fmL6cCeltP1zvoza0p1ybnjIwEJhdO3Raw
	 Q+5+5WFCVKBq3pkHVoZKeAgAs/qeGS875YMewOFupQxSYHZgX3T9XIzAsflYtHXGeK
	 ElsmH/q+KavxtTwjU8hKR4RMpcfrNguCyt2lQRiOosXb7hRlhpQ0QMb8YWZasDmRF2
	 9AMmtrY62i9V2ww2aNiTNu4G+E60bfwRxsHBiDw+LKTAxtmak432N4oyMhbTgOkXrU
	 Mfy5oBtmYYfeA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com> <20210311152715.1317848-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 10/15] clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs (and compile test)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, David S. Miller <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Moritz Fischer <mdf@kernel.org>, Olof Johansson <olof@lixom.net>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>, Tom Rix <trix@redhat.com>, Tony Luck <tony.luck@intel.com>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-edac@vger.kernel.org, lin
 ux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, soc@kernel.org
Date: Wed, 31 Mar 2021 18:34:43 -0700
Message-ID: <161724088358.2260335.5735095120413931039@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1

Quoting Krzysztof Kozlowski (2021-03-11 07:27:15)
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.
>=20
> There is little point to share clock controller drivers between 32-bit
> and 64-bit platforms because there will not be a generic image for both
> of them.  Therefore add a new Kconfig entry for building 32-bit clock
> driverss, similar to one for 64-bit.  This allows enabling compile
> testing.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

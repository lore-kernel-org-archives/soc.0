Return-Path: <vkoul@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA08C433E0
	for <soc@archiver.kernel.org>; Sun, 14 Mar 2021 11:52:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8DEEC64ECD; Sun, 14 Mar 2021 11:52:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79D0F64E21;
	Sun, 14 Mar 2021 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615722763;
	bh=zz0j1vSP+mihmyWSjFGBpWwyLWTagQ1U8k3YP/B+t50=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=S5QRD6XZIPv87arcP1TrVHk8Q1o4GY5GzRH1CaAa4f5vf0gZc18rfVYZ6eCrVn/Ic
	 9bVR/0oriW1L/JPIfFW5Ir9aYUkQtxKVXeFPD3Y5HIGso77iy2HXIDcxT4WcumhiOw
	 rJgEQbr8n7uxu+FsRYy3RH0BFRVoyCE8lHiHdgVVhYKiS8QJtjJwwx1nawBk6yZ5Nn
	 hDTcUTWjhoAM9aiqnPqPs9P1iZ0BXUzv3xb4FxGKxSmIFxFj9odphZTVPkmRiHAKOf
	 rpdghBhgafT1BYWFkM9YPfvyv1Iny5ONg7V5vj7dNdIxd3afUVzAE7tJKDvhl3jNQA
	 nmgzDrVk8jsdw==
Date: Sun, 14 Mar 2021 17:22:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>, Moritz Fischer <mdf@kernel.org>,
	Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
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
Subject: Re: [PATCH v3 11/15] dmaengine: socfpga: use ARCH_INTEL_SOCFPGA also
 for 32-bit ARM SoCs
Message-ID: <YE35Bw/DHRz63RBT@vkoul-mobl>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
 <20210311152731.1318428-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311152731.1318428-1-krzysztof.kozlowski@canonical.com>

On 11-03-21, 16:27, Krzysztof Kozlowski wrote:
> ARCH_SOCFPGA is being renamed to ARCH_INTEL_SOCFPGA so adjust the
> 32-bit ARM drivers to rely on new symbol.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

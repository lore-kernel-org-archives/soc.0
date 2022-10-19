Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B3C4332F
	for <soc@archiver.kernel.org>; Wed, 19 Oct 2022 19:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D6DFC433C1; Wed, 19 Oct 2022 19:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089A6C433D6;
	Wed, 19 Oct 2022 19:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666209463;
	bh=K1Uoj3YzZfs/Ftg9PeyHIXDrwSa4k93XIbTWq2MoYcM=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=TD+QAE6Pju/Bfz2UdEEvcyeKX4bhv7n0WNCUSdBl5iFFxYUs7IG0Ll7o2DBGpo4ZO
	 lUkGPgo2yIaX5ljNZKWcdDFc1AVXmDeNzG+Nqhx3L2DV8EaBcDuu1LPjpnLbrhRKTT
	 L8Nd5NVt7J91D5C4re8qsJntKvv2qrdrqe6ILHGbEzrInKKFIl66XAjr5q3yah0tvS
	 gYkPs1mhED37teF+cVKNqPtKpVKIXwK6XSH07wzN0BS6/BFJCxs5pOljeBiI+kIXdU
	 1DbcNiWPtNjjZBlg/Pv1UnHW+9D8CnT6fI6NfF65Ax3VTnkNLihkrDi3eDJFEDNPRZ
	 jfw8t/TRt/QCw==
Date: Wed, 19 Oct 2022 20:57:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC RESEND PATCH 0/2] RZ/G2UL separate out SoC specific parts
Message-ID: <Y1BWsKtv0QS4jVIw@spud>
References: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017091201.199457-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Oct 17, 2022 at 10:11:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> so that this can be shared with the RZ/Five SoC.
> 
> Implementation is based on the discussion [0] where I have used option#2.
> 
> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> (r9a07g043F.dtsi)
> 
> Sending this as an RFC to get some feedback.
> 
> r9a07g043f.dtsi will look something like below:
> 
> #include <dt-bindings/interrupt-controller/irq.h>
> 
> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)	(nr + 32)
> #define SOC_PERIPHERAL_IRQ(nr, na)	SOC_PERIPHERAL_IRQ_NUMBER(nr) na

It appears there's little interest in this conversation from a DT or an
arch/soc maintainer PoV so far. I for one think this stuff is grand &
better than duplicating the dts between archs. I know Geert likes the
macros in theory, but I wonder what he thinks of the implemenation?

Arnd, do you perhaps have an opinion?

Thanks,
Conor.

> 
> #include <arm64/renesas/r9a07g043.dtsi>
> 
> / {
>    ...
>    ...   
> };
> 
> Although patch#2 can be merged into patch#1 just wanted to keep them separated
> for easier review.
> 
> RFC-> RESEND RFC
> * Patches rebased on [1]
> 
> RFC: [2]
> 
> [0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221009230044.10961-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [2] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (2):
>   arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
>     to specify interrupt property
>   arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts
> 
>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 347 ++++++++----------
>  arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  72 ++++
>  .../boot/dts/renesas/r9a07g043u11-smarc.dts   |   2 +-
>  3 files changed, 220 insertions(+), 201 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
> 
> -- 
> 2.25.1
> 
> 

Return-Path: <SRS0=BbOH=GY=mansr.com=mans@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127AFC433DB
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 13:54:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CC0A8239D4; Thu, 21 Jan 2021 13:54:31 +0000 (UTC)
X-Greylist: delayed 447 seconds by postgrey-1.34 at mail.kernel.org; Thu, 21 Jan 2021 13:54:31 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE3E233F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mans@mansr.com
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE3E233F8
	for <soc@kernel.org>; Thu, 21 Jan 2021 13:54:31 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id 9118E15360;
	Thu, 21 Jan 2021 13:47:01 +0000 (GMT)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 2B0A221A3D9; Thu, 21 Jan 2021 13:47:01 +0000 (GMT)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, Marc Gonzalez
 <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH 4/5] ARM: remove tango platform
References: <20210120124812.2800027-1-arnd@kernel.org>
	<20210120124812.2800027-5-arnd@kernel.org>
Date: Thu, 21 Jan 2021 13:47:01 +0000
In-Reply-To: <20210120124812.2800027-5-arnd@kernel.org> (Arnd Bergmann's
	message of "Wed, 20 Jan 2021 13:48:11 +0100")
Message-ID: <yw1xwnw6z9ka.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <20210121134701.8O7JR0QMyvqsHRaqb27pv9hZn9fpkFkv73bJPZLmTG4@z>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The smp8758 (tango4) SoC was the last generation of set-top-box chips
> to come out of Sigma Designs, and support was added by Marc Gonzalez
> and M=E5ns Rullg=E5rd between 2015 and 2017, before the company went out =
of
> business and the products were abandoned.
>
> The chip is used in some set-top-boxes such as the Popcorn Hour A-500,
> which could have seen some adoption by hobbyists. This has not happened
> in the past four years, and support for the more widely used MIPS based
> SoCs was never merged at all.
>
> Thanks to Marc and M=E5ns for maintaining for the past years even after t=
he
> death of the platform.
>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Mans Rullgard <mans@mansr.com>
> Link: https://lore.kernel.org/lkml/2d643ebc-09af-a809-eb3f-2aec8ecee501@f=
ree.fr/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Mans Rullgard <mans@mansr.com>

> ---
>  MAINTAINERS                               |   7 -
>  arch/arm/Kconfig                          |   2 -
>  arch/arm/Makefile                         |   1 -
>  arch/arm/boot/dts/Makefile                |   2 -
>  arch/arm/boot/dts/tango4-common.dtsi      | 184 ----------------------
>  arch/arm/boot/dts/tango4-smp8758.dtsi     |  57 -------
>  arch/arm/boot/dts/tango4-vantage-1172.dts |  42 -----
>  arch/arm/configs/tango4_defconfig         |  93 -----------
>  arch/arm/mach-tango/Kconfig               |  13 --
>  arch/arm/mach-tango/Makefile              |   4 -
>  arch/arm/mach-tango/platsmp.c             |  52 ------
>  arch/arm/mach-tango/pm.c                  |  31 ----
>  arch/arm/mach-tango/pm.h                  |   7 -
>  arch/arm/mach-tango/setup.c               |  20 ---
>  arch/arm/mach-tango/smc.S                 |  12 --
>  arch/arm/mach-tango/smc.h                 |   9 --
>  drivers/i2c/busses/Kconfig                |   4 +-
>  17 files changed, 2 insertions(+), 538 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/tango4-common.dtsi
>  delete mode 100644 arch/arm/boot/dts/tango4-smp8758.dtsi
>  delete mode 100644 arch/arm/boot/dts/tango4-vantage-1172.dts
>  delete mode 100644 arch/arm/configs/tango4_defconfig
>  delete mode 100644 arch/arm/mach-tango/Kconfig
>  delete mode 100644 arch/arm/mach-tango/Makefile
>  delete mode 100644 arch/arm/mach-tango/platsmp.c
>  delete mode 100644 arch/arm/mach-tango/pm.c
>  delete mode 100644 arch/arm/mach-tango/pm.h
>  delete mode 100644 arch/arm/mach-tango/setup.c
>  delete mode 100644 arch/arm/mach-tango/smc.S
>  delete mode 100644 arch/arm/mach-tango/smc.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 54b5e6dee017..bb2a153f76d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2538,13 +2538,6 @@ F:	arch/arm/boot/dts/berlin*
>  F:	arch/arm/mach-berlin/
>  F:	arch/arm64/boot/dts/synaptics/
>
> -ARM/TANGO ARCHITECTURE
> -M:	Marc Gonzalez <marc.w.gonzalez@free.fr>
> -M:	Mans Rullgard <mans@mansr.com>
> -L:	linux-arm-kernel@lists.infradead.org
> -S:	Odd Fixes
> -N:	tango
> -
>  ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
>  M:	Lennert Buytenhek <kernel@wantstofly.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9f605ab54570..70d6bfbcd164 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -702,8 +702,6 @@ source "arch/arm/mach-stm32/Kconfig"
>
>  source "arch/arm/mach-sunxi/Kconfig"
>
> -source "arch/arm/mach-tango/Kconfig"
> -
>  source "arch/arm/mach-tegra/Kconfig"
>
>  source "arch/arm/mach-u300/Kconfig"
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 7b8eed93f1fa..1291fdc869f2 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -213,7 +213,6 @@ machine-$(CONFIG_ARCH_SOCFPGA)		+=3D socfpga
>  machine-$(CONFIG_ARCH_STI)		+=3D sti
>  machine-$(CONFIG_ARCH_STM32)		+=3D stm32
>  machine-$(CONFIG_ARCH_SUNXI)		+=3D sunxi
> -machine-$(CONFIG_ARCH_TANGO)		+=3D tango
>  machine-$(CONFIG_ARCH_TEGRA)		+=3D tegra
>  machine-$(CONFIG_ARCH_U300)		+=3D u300
>  machine-$(CONFIG_ARCH_U8500)		+=3D ux500
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5fcae846aa00..a13112f8730c 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1221,8 +1221,6 @@ dtb-$(CONFIG_MACH_SUN9I) +=3D \
>  	sun9i-a80-cubieboard4.dtb
>  dtb-$(CONFIG_MACH_SUNIV) +=3D \
>  	suniv-f1c100s-licheepi-nano.dtb
> -dtb-$(CONFIG_ARCH_TANGO) +=3D \
> -	tango4-vantage-1172.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D \
>  	tegra20-acer-a500-picasso.dtb \
>  	tegra20-harmony.dtb \
> diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tan=
go4-common.dtsi
> deleted file mode 100644
> index d584da314500..000000000000
> diff --git a/arch/arm/boot/dts/tango4-smp8758.dtsi b/arch/arm/boot/dts/ta=
ngo4-smp8758.dtsi
> deleted file mode 100644
> index 1c6a5bf1a86b..000000000000
> diff --git a/arch/arm/boot/dts/tango4-vantage-1172.dts b/arch/arm/boot/dt=
s/tango4-vantage-1172.dts
> deleted file mode 100644
> index d237d7f02c51..000000000000
> diff --git a/arch/arm/configs/tango4_defconfig b/arch/arm/configs/tango4_=
defconfig
> deleted file mode 100644
> index cbc9ade78f14..000000000000
> diff --git a/arch/arm/mach-tango/Kconfig b/arch/arm/mach-tango/Kconfig
> deleted file mode 100644
> index a9eeda36aeb1..000000000000
> diff --git a/arch/arm/mach-tango/Makefile b/arch/arm/mach-tango/Makefile
> deleted file mode 100644
> index 97cd04508fa1..000000000000
> diff --git a/arch/arm/mach-tango/platsmp.c b/arch/arm/mach-tango/platsmp.c
> deleted file mode 100644
> index 65012afbc1a3..000000000000
> diff --git a/arch/arm/mach-tango/pm.c b/arch/arm/mach-tango/pm.c
> deleted file mode 100644
> index a32c3b631484..000000000000
> diff --git a/arch/arm/mach-tango/pm.h b/arch/arm/mach-tango/pm.h
> deleted file mode 100644
> index 35ea705a0ee2..000000000000
> diff --git a/arch/arm/mach-tango/setup.c b/arch/arm/mach-tango/setup.c
> deleted file mode 100644
> index 824f90737b04..000000000000
> diff --git a/arch/arm/mach-tango/smc.S b/arch/arm/mach-tango/smc.S
> deleted file mode 100644
> index b1752aaa72bc..000000000000
> diff --git a/arch/arm/mach-tango/smc.h b/arch/arm/mach-tango/smc.h
> deleted file mode 100644
> index 455ce3e06daf..000000000000
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d4d60ad0eda0..0e284fb750e5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1174,8 +1174,8 @@ config I2C_XILINX
>  	  will be called xilinx_i2c.
>
>  config I2C_XLR
> -	tristate "Netlogic XLR and Sigma Designs I2C support"
> -	depends on CPU_XLR || ARCH_TANGO || COMPILE_TEST
> +	tristate "Netlogic XLR I2C support"
> +	depends on CPU_XLR || COMPILE_TEST
>  	help
>  	  This driver enables support for the on-chip I2C interface of
>  	  the Netlogic XLR/XLS MIPS processors and Sigma Designs SOCs.

As an aside, the naming and description of that I2C driver is poor.  The
same silicon shows up also in some Rockchip devices and probably others
yet to be identified.  It's too bad we don't know which library they're
all using.

--=20
M=E5ns Rullg=E5rd

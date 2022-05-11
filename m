Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71763C433EF
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 06:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BFC4C2BBE4; Wed, 11 May 2022 06:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C33C385DE;
	Wed, 11 May 2022 06:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652251810;
	bh=oabWsuyWgJhDY5KMYDv/hOs79hVOh8hDpnf427Xsi/8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=eX8ZyCdm3ekZWZ7y6GzsIWhajRP5spKidB+tKIEeOvAPh+Imr7Fasx+jAFC7k/2+V
	 nsWE5Ag4PWBe4oSQGvsr4CUzWlXuYftWQTr/0nCO5+8PA83OMw1qHJyZz/XEA2JoO0
	 BXtktUgd2a0a9ViZ0NR3XMPi2aBIOG5AjsT+Y1Ck=
Date: Wed, 11 May 2022 08:50:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@kernel.org,
	linux-serial@vger.kernel.org, sumit.garg@linaro.org, arnd@arndb.de,
	olof@lixom.net, catalin.marinas@arm.com, will@kernel.org,
	jirislaby@kernel.org, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	peterz@infradead.org
Subject: Re: [PATCH v4 1/1] soc: fujitsu: Add A64FX diagnostic interrupt
 driver
Message-ID: <Yntcn4esjJRS50Am@kroah.com>
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com>

On Wed, May 11, 2022 at 03:21:13PM +0900, Hitomi Hasegawa wrote:
> Enable diagnostic interrupts for the Fujitsu A64FX.
> 
> Register the NMI/IRQ corresponding to the A64FX's device definition
> dedicated to diagnostic interrupts, so that when this interrupt is
> sent using the BMC, it causes a panic. This can be used to obtain
> a kernel dump.
> 
> Signed-off-by: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> ---
>  MAINTAINERS                      |   5 +
>  drivers/soc/Kconfig              |   1 +
>  drivers/soc/Makefile             |   1 +
>  drivers/soc/fujitsu/Kconfig      |  13 +++
>  drivers/soc/fujitsu/Makefile     |   3 +
>  drivers/soc/fujitsu/a64fx-diag.c | 155 +++++++++++++++++++++++++++++++
>  6 files changed, 178 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/Kconfig
>  create mode 100644 drivers/soc/fujitsu/Makefile
>  create mode 100644 drivers/soc/fujitsu/a64fx-diag.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd0f68d4a34a..dc35c81ba917 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -241,6 +241,11 @@ F:	include/trace/events/9p.h
>  F:	include/uapi/linux/virtio_9p.h
>  F:	net/9p/
>  
> +A64FX DIAG DRIVER
> +M:	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> +S:	Supported
> +F:	drivers/soc/fujitsu/a64fx-diag.c
> +
>  A8293 MEDIA DRIVER
>  M:	Antti Palosaari <crope@iki.fi>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a8562678c437..e10eb27e1e7e 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -9,6 +9,7 @@ source "drivers/soc/atmel/Kconfig"
>  source "drivers/soc/bcm/Kconfig"
>  source "drivers/soc/canaan/Kconfig"
>  source "drivers/soc/fsl/Kconfig"
> +source "drivers/soc/fujitsu/Kconfig"
>  source "drivers/soc/imx/Kconfig"
>  source "drivers/soc/ixp4xx/Kconfig"
>  source "drivers/soc/litex/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index adb30c2d4fea..b12b0b03ad47 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)	+= canaan/
>  obj-$(CONFIG_ARCH_DOVE)		+= dove/
>  obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
> +obj-y				+= fujitsu/

Why a sub directory for just one .c file?

>  obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
>  obj-y				+= imx/
>  obj-y				+= ixp4xx/
> diff --git a/drivers/soc/fujitsu/Kconfig b/drivers/soc/fujitsu/Kconfig
> new file mode 100644
> index 000000000000..e05c40725922
> --- /dev/null
> +++ b/drivers/soc/fujitsu/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "fujitsu SoC drivers"
> +
> +config A64FX_DIAG
> +	tristate "A64FX diag driver"
> +	depends on ARM64
> +	depends on ACPI
> +	help
> +	  Say Y here if you want to enable diag interrupt on Fujitsu A64FX.
> +
> +	  If unsure, say N.

You need to provide more information about what this driver does and
what it is here.

thanks,

greg k-h

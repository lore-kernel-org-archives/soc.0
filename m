Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835C92765EA
	for <soc@lists.linux.dev>; Mon, 18 Aug 2025 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514158; cv=none; b=Ne5VfqYO73TfWMroO04nD0sX7uc6PBW7XXs9XPIFKcke34Mn/Q7kFoafJxZ66tJFGb7APtJjZUsZeLFyFVLicz/VWfiSBItGwYpTxn52sxpZEkw3Xv88lLYFtUt5BuJrHnlhKTzp0dQZjHcFKtu9bo21DZ6sHMqrbHmO6DR97/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514158; c=relaxed/simple;
	bh=IAEOM6wFG+JjnMSUmO9V1dy6UtYDEU6ikDrtJGuCMNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Un86jQ/ZNUpjMJU2zSAFujnMoccpi7WRTYgYS1E36ZDcbUPd/49zXMsveJv0LGEvZWJt3iwifHdNNxkNAWQycw1dIFdAsITmDHze7j6D4M7F2FTzwc0VLatRSY/chLmq3PsJCqniSV7yWc7/R75sf4oivEBLw478MGNBtmu86cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFYU/y2H; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFYU/y2H"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d6083cc69so32395447b3.2
        for <soc@lists.linux.dev>; Mon, 18 Aug 2025 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755514155; x=1756118955; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsgBw0jCb6w00Tew/2kEPPc7DZ1CJpSeSzBPZVy1z1c=;
        b=vFYU/y2HZQRH/EbbQIMhWHxmYNMYXV5F9fjIordG+W9j/20JHqZinTDs4teqN+DcxS
         PkoA74umSllYNlq9rxgQ57YH+fys1KvNW+RRGoJOan2YdowtIQLqlSwXyan/SwcsF1Ax
         VwAvWiv6liMPzBh5CZ1gn6ujbHP8C0mxBJ0wNTI5B/0kf0hoVewRdmS8ZWOiYtVthIfD
         3jz1jqvOt/B6mKSZe3oWa6WnVInk+THopT2VYLqtIJm6L4h8HydEJ/gFdxGaxbjLHh1n
         6mAyDvSHeZ7tYxDv/6SMdD0bvxkPshQFmVsM9jW/enb3Pg6RXoEvTkqSXFqRhQ8OefCD
         WTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514155; x=1756118955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsgBw0jCb6w00Tew/2kEPPc7DZ1CJpSeSzBPZVy1z1c=;
        b=TY01+XI0gz5rsisQD2V1ZKMp1MOy6Cehr9IucBsnj5JveQCI14iKjIKuG0jcjz8/s/
         HY5ZMeWqZ8nqlb+IM+5ynwEoJ/MQiJka1afTXIDDo29xItwOANA2mWpW/ifoOkfvF6K3
         BvRE2uX/64Fl41y+xK/Pa2dectP3L/0ZdeWrn7cxzXSvsvNW9CeKDZXvocNWA91LOvFh
         hiVlxCgrkvXGmjMCnhFRMPiPAg3WldsljV4UrOyz28/V94w8tIex3AikxRkocm8NCLkO
         mPSl9dLllhnEeD/G2CiOO6Mi+FynCvacdmKF04dVxP9rivFBFbMjFFsieRDPfsQ79XG7
         Cmqg==
X-Forwarded-Encrypted: i=1; AJvYcCWK4cVuqjazJcU8satMzq1E1YVsP6UWmxiReR7Snn8RHpxWL/CaacNRReSPoIYp0hLwZ5c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhg5LFGBd32uUSBinjClZJ71cFgLNeRL/2jasznEu3/fF+pdFa
	17Mx5cGTpHbBUw242mANpYkwNBsh+hxwrN8arE02/PVdap1SD7YlzHgn0UZ5n8FzC0Tq+YtD4pZ
	QNgxXEbsrEYLvj13zrfsFEX32Ll6aqjekHzQP3liTzw==
X-Gm-Gg: ASbGnctUpdcK2A/6/a9VPuwlunB6R+ir/g2Eys0KldLcui45stvk9DjCbZfDlQFSDog
	RSQbjlTGs0WMC8uhHovyrvsWP3ylJYKRYv7a+zk5d618CYG21/vXSf0eEkZfWzAlcAH5s/7cqbC
	dbp5RgH4irfb+iha0fV1qrMW/wn/LZMNkopaG80RnRHCug4BAAyffeI5KwjvHdE7O32DOEPLUTd
	SZOm3eY
X-Google-Smtp-Source: AGHT+IEQ5PAJ4E2MJ+RFp/vP7SFnTECMSFB5weGhPlm12BRaWfgE5t1lY9Zr2miit8j/tOc4AIdQ75NrG+fq+kHyFjI=
X-Received: by 2002:a05:690c:f82:b0:71c:1754:269b with SMTP id
 00721157ae682-71e6ddeae92mr122547007b3.27.1755514155297; Mon, 18 Aug 2025
 03:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com> <20250812123110.2090460-6-yangzh0906@thundersoft.com>
In-Reply-To: <20250812123110.2090460-6-yangzh0906@thundersoft.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Aug 2025 12:48:39 +0200
X-Gm-Features: Ac12FXxjKi3b8yfDU1lEnhhcDgUF2rL-OaQszzKJu25a5rk-Ae9QC1wQeMPNpMc
Message-ID: <CAPDyKFon7Q2UHOJbbVtPTHvqxYeOJr8HK5BOk6TAJaph8FcwvQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] mmc: sdhci: add Black Sesame Technologies BST
 C1200 controller driver
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	adrian.hunter@intel.com, robin.murphy@arm.com, ding.wang@bst.ai, 
	gordon.ge@bst.ai, bst-upstream@bstai.top, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, soc@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 14:31, Albert Yang <yangzh0906@thundersoft.com> wrote:
>
> Add SDHCI controller driver for Black Sesame Technologies C1200 SoC.
>
> This driver supports the DWCMSHC SDHCI controller with BST-specific
> enhancements including:
> - Custom clock management and tuning
> - Power management support
> - BST-specific register configurations
> - Support for eMMC and SD card interfaces
> - Hardware limitation workaround for 32-bit DMA addressing
>
> The driver addresses specific hardware constraints where:
> - System memory uses 64-bit bus, eMMC controller uses 32-bit bus
> - eMMC controller cannot access memory through SMMU due to hardware bug
> - All system DRAM is configured outside 4GB boundary (ZONE_DMA32)
> - Uses SRAM-based bounce buffer within 32-bit address space
>
> Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>



> ---
> Change for v3:
> Code improvements based on review feedback:
> - Simplified dwcmshc_priv structure by removing unused fields
> - Improved helper functions with better encapsulation
> - Used devm_platform_ioremap_resource() for resource management
> - Updated Kconfig description and alphabetical ordering
> - clarify documentation on hardware limitations and bounce buffer
> approach
> - remove duplicate sdhci_writew SDHCI_CLOCK_CONTROL
>
> Changes for v2:
> 1.  Dependency Simplification :
>    - Removed COMMON_CLK dependency from Kconfig (MMC_SDHCI_BST)
>    - Add ARCH_BST || COMPILE_TEST dependency from Kconfig (MMC_SDHCI_BST)
>
> 2.  Resource Management Improvements :
>    - Replaced temporary ioremap with persistent mapping
>      * Mapped CRM registers once during probe instead of per-access
>      * Added proper cleanup in remove callback
>    - Refactored bounce buffer allocation:
>      * Simplified error handling and memory management
>      * Removed unnecessary DMA configuration layers
>
> 3.  Code Cleanup & Optimization :
>    - Pruned unused headers and legacy vendor debug code
>    - Removed deprecated sdhci_bst_print_vendor() export
>    - Converted internal functions to static scope
>    - Standardized naming conventions:
>      * Renamed DRIVER_NAME to match kernel standards
>      * Changed default_max_freq to DEFAULT_MAX_FREQ
>    - Optimized clock configuration routines
>
> 4.  Hardware Integration Fixes :
>    - Fixed register access macros for EMMC_CTRL
>      * Added proper offset calculation via SDHCI_VENDOR_PTR_R
>    - Corrected device tree compatibility string to:
>      "bst,c1200-dwcmshc-sdhci"
>
> 5.  Error Handling Enhancements :
>    - Added robust ioremap error checking
>    - Improved bounce buffer allocation failure handling
>    - Streamlined probe/remove flow
>
> 6.  Maintainability :
>    - Updated MODULE_DESCRIPTION and AUTHOR fields
>    - Added explanatory comments for hardware limitations
>    - Removed redundant multi-host setup infrastructure
>
> 7. fix build warnings from lkp
>   | Reported-by: kernel test robot <lkp@intel.com>
>   | Closes:
>   https://lore.kernel.org/oe-kbuild-all/202505290615.GZzN5rNL-lkp@intel.com/
> ---
>  drivers/mmc/host/Kconfig              |  14 +
>  drivers/mmc/host/Makefile             |   1 +
>  drivers/mmc/host/sdhci-of-bst-c1200.c | 510 ++++++++++++++++++++++++++
>  3 files changed, 525 insertions(+)
>  create mode 100644 drivers/mmc/host/sdhci-of-bst-c1200.c
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index c3f0f41a426d..fb057c46949b 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -429,6 +429,20 @@ config MMC_SDHCI_BCM_KONA
>
>           If you have a controller with this interface, say Y or M here.
>
> +config MMC_SDHCI_BST
> +       tristate "SDHCI support for Black Sesame Technologies BST C1200 controller"
> +       depends on ARCH_BST || COMPILE_TEST
> +       depends on MMC_SDHCI_PLTFM
> +       depends on OF
> +       help
> +         This selects the Secure Digital Host Controller Interface (SDHCI)
> +         for Black Sesame Technologies BST C1200 SoC. The controller is
> +         based on Synopsys DesignWare Cores Mobile Storage Controller but
> +         requires platform-specific workarounds for hardware limitations.
> +
> +         If you have a controller with this interface, say Y or M here.
> +         If unsure, say N.
> +
>  config MMC_SDHCI_F_SDH30
>         tristate "SDHCI support for Fujitsu Semiconductor F_SDH30"
>         depends on MMC_SDHCI_PLTFM
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 75bafc7b162b..bb5df05c3174 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_MMC_MXS)         += mxs-mmc.o
>  obj-$(CONFIG_MMC_SDHCI)                += sdhci.o
>  obj-$(CONFIG_MMC_SDHCI_UHS2)   += sdhci-uhs2.o
>  obj-$(CONFIG_MMC_SDHCI_PCI)    += sdhci-pci.o
> +obj-$(CONFIG_MMC_SDHCI_BST)            += sdhci-of-bst-c1200.o
>  sdhci-pci-y                    += sdhci-pci-core.o sdhci-pci-o2micro.o sdhci-pci-arasan.o \
>                                    sdhci-pci-dwc-mshc.o sdhci-pci-gli.o
>  obj-$(CONFIG_MMC_SDHCI_ACPI)   += sdhci-acpi.o
> diff --git a/drivers/mmc/host/sdhci-of-bst-c1200.c b/drivers/mmc/host/sdhci-of-bst-c1200.c
> new file mode 100644
> index 000000000000..6d2ba4232306
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-bst-c1200.c

[...]

> +/**
> + * sdhci_bst_timeout - Set timeout value for commands
> + * @host: SDHCI host controller
> + * @cmd: MMC command
> + *
> + * Sets the timeout control register to maximum value (0xE).
> + */
> +static void sdhci_bst_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> +{
> +       sdhci_writeb(host, 0xE, SDHCI_TIMEOUT_CONTROL);
> +}
> +
> +/**
> + * sdhci_bst_set_power - Set power mode and voltage
> + * @host: SDHCI host controller
> + * @mode: Power mode to set
> + * @vdd: Voltage to set
> + *
> + * Sets power mode and voltage, also configures MBIU control register.
> + */
> +static void sdhci_bst_set_power(struct sdhci_host *host, unsigned char mode,
> +                               unsigned short vdd)
> +{
> +       sdhci_set_power(host, mode, vdd);
> +       sdhci_writeb(host, 0xF, SDHCI_POWER_CONTROL);
> +       sdhci_writew(host,
> +                    (sdhci_readw(host, MBIU_CTRL) & (~0xf)) | BURST_EN,
> +                    MBIU_CTRL);
> +}
> +
> +/**
> + * bst_sdhci_execute_tuning - Execute tuning procedure
> + * @host: SDHCI host controller
> + * @opcode: Opcode to use for tuning
> + *
> + * Performs tuning procedure by trying different values and selecting the best one.
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +static int bst_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       unsigned int clk = 0, timeout;
> +       int ret = 0, error;
> +       int start0 = -1, end0 = -1, best = 0;
> +       int start1 = -1, end1 = -1, flag = 0;
> +       int i;
> +
> +       pltfm_host = sdhci_priv(host);
> +
> +       for (i = 0; i < SDHCI_TUNING_COUNT; i++) {
> +               /* Protected write */
> +               bst_crm_write(pltfm_host, REG_WR_PROTECT, REG_WR_PROTECT_KEY);
> +               /* Write tuning value */
> +               bst_crm_write(pltfm_host, DELAY_CHAIN_SEL, (1ul << i) - 1);
> +
> +               timeout = 20;
> +               while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL)) &
> +                       SDHCI_CLOCK_INT_STABLE)) {
> +                       if (timeout == 0) {
> +                               dev_err(mmc_dev(host->mmc), "Internal clock never stabilised\n");
> +                               return -EBUSY;
> +                       }
> +                       timeout--;
> +                       usleep_range(1000, 1100);
> +               }

Please convert into using some of the readx_poll_timeout functions
instead of the loop above. Moreover, please add defines to specify the
period/timeout.

> +
> +               ret = mmc_send_tuning(host->mmc, opcode, &error);
> +               if (ret != 0) {
> +                       flag = 1;
> +               } else {
> +                       if (flag == 0) {
> +                               if (start0 == -1)
> +                                       start0 = i;
> +                               end0 = i;
> +                       } else {
> +                               if (start1 == -1)
> +                                       start1 = i;
> +                               end1 = i;
> +                       }
> +               }
> +       }
> +
> +       /* Calculate best tuning value */
> +       if (end0 - start0 >= end1 - start1)
> +               best = ((end0 - start0) >> 1) + start0;
> +       else
> +               best = ((end1 - start1) >> 1) + start1;
> +
> +       if (best < 0)
> +               best = 0;
> +
> +       bst_crm_write(pltfm_host, DELAY_CHAIN_SEL, (1ul << best) - 1);
> +       timeout = 20;
> +
> +       while (!((clk = sdhci_readw(host, SDHCI_CLOCK_CONTROL)) &
> +               SDHCI_CLOCK_INT_STABLE)) {
> +               if (timeout == 0) {
> +                       dev_err(mmc_dev(host->mmc), "Internal clock never stabilised\n");
> +                       return -EBUSY;
> +               }
> +               timeout--;
> +               usleep_range(1000, 1100);
> +       }

Ditto.

> +
> +       return 0;
> +}
> +

[...]

> +
> +static int bst_sdhci_reallocate_bounce_buffer(struct sdhci_host *host)
> +{
> +       struct mmc_host *mmc = host->mmc;
> +       unsigned int max_blocks;
> +       unsigned int bounce_size;
> +       int ret;
> +
> +       /*
> +        * Cap the bounce buffer at 32KB. Using a bigger bounce buffer
> +        * has diminishing returns, this is probably because SD/MMC
> +        * cards are usually optimized to handle this size of requests.
> +        */
> +       bounce_size = SZ_32K;
> +       /*
> +        * Adjust downwards to maximum request size if this is less
> +        * than our segment size, else hammer down the maximum
> +        * request size to the maximum buffer size.
> +        */
> +       if (mmc->max_req_size < bounce_size)
> +               bounce_size = mmc->max_req_size;
> +       max_blocks = bounce_size / 512;
> +
> +       ret = of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
> +       if (ret) {
> +               dev_err(mmc_dev(mmc), "Failed to initialize reserved memory\n");
> +               return ret;
> +       }
> +
> +       host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
> +                                                &host->bounce_addr, GFP_KERNEL);
> +       if (!host->bounce_buffer)
> +               return -ENOMEM;
> +
> +       host->bounce_buffer_size = bounce_size;
> +
> +       /* Lie about this since we're bouncing */
> +       mmc->max_segs = max_blocks;
> +       mmc->max_seg_size = bounce_size;
> +       mmc->max_req_size = bounce_size;
> +
> +       return 0;
> +}
> +
> +static int dwcmshc_probe(struct platform_device *pdev)
> +{
> +       struct sdhci_pltfm_host *pltfm_host;
> +       struct sdhci_host *host;
> +       struct dwcmshc_priv *priv;
> +       int err;
> +
> +       host = sdhci_pltfm_init(pdev, &sdhci_dwcmshc_pdata,
> +                               sizeof(struct dwcmshc_priv));
> +       if (IS_ERR(host))
> +               return PTR_ERR(host);
> +
> +       pltfm_host = sdhci_priv(host);
> +       priv = sdhci_pltfm_priv(pltfm_host);
> +
> +       err = mmc_of_parse(host->mmc);
> +       if (err)
> +               goto err;
> +
> +       sdhci_get_of_property(pdev);
> +
> +       /* Get CRM registers from the second reg entry */
> +       priv->crm_reg_base = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(priv->crm_reg_base)) {
> +               err = PTR_ERR(priv->crm_reg_base);
> +               goto err;
> +       }
> +
> +       err = sdhci_add_host(host);
> +       if (err)
> +               goto err;
> +
> +       /*
> +        * Silicon constraints for BST C1200:
> +        * - System RAM base is 0x800000000 (above 32-bit addressable range)
> +        * - The eMMC controller DMA engine is limited to 32-bit addressing
> +        * - SMMU cannot be used on this path due to hardware design flaws
> +        * - These are fixed in silicon and cannot be changed in software
> +        *
> +        * Bus/controller mapping:
> +        * - No registers are available to reprogram the address mapping
> +        * - The 32-bit DMA limit is a hard constraint of the controller IP
> +        *
> +        * Given these constraints, an SRAM-based bounce buffer in the 32-bit
> +        * address space is required to enable eMMC DMA on this platform.
> +        */
> +       err = bst_sdhci_reallocate_bounce_buffer(host);
> +       if (err) {
> +               dev_err(&pdev->dev, "Failed to allocate bounce buffer: %d\n", err);
> +               goto err_remove_host;
> +       }

FYI, I will be awaiting a confirmation from Arnd to be with the above
hack, before I queue this up.

> +
> +       return 0;
> +
> +err_remove_host:
> +       sdhci_remove_host(host, 1);
> +err:
> +       sdhci_pltfm_free(pdev);
> +       return err;
> +}
> +

[...]

Kind regards
Uffe

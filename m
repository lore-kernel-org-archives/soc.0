Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37112C433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 21:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF0CFC385BD; Tue,  3 May 2022 21:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C388BC385B3;
	Tue,  3 May 2022 21:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651614156;
	bh=UK8gM7hcz2L7sEEGiaT6aIZY+1gR7TSgBzLU98dnaZo=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:Cc:From;
	b=uUvTIsopnc1GwLdSSCMbV/9BFWl+ktMV8w42kxIq9JxWnq8ywEkzct2FlKMNLHEM+
	 7IRB5cdOnBrJKM9vY7f7g/Z4kzVJc3Z1O1Q4W1AEzcAWFzs8SvWzxvPHJSgFyB0NGz
	 yUNYobW/vgx7r0nCTAPatHaslDutt8UkNhGRnyWyDssDrbKn+BIBopqA+P//uHK/bw
	 OITBimEtWYrG/qJb1cq+Qh4c2luov/RThS+iRGnd6lplP8aAvyueVs5sYUgVz+CdIo
	 7Jx2hsflMck3pgns1WVWdBaKF1eIG1pNCrxmcpPj4h1q8C+uPDkO50/+F9aH7ZIYft
	 ZG3EQqebDv7Pg==
Received: by mail-pf1-f179.google.com with SMTP id a11so15797941pff.1;
        Tue, 03 May 2022 14:42:36 -0700 (PDT)
X-Gm-Message-State: AOAM533Uc4KhTDuPCUB0yP/lgDeFSkO0tXsRzd2jIjPi9N+2f8GOUKVg
	NirGxoaAL91yROHyF9InULCdsknOavaB0WrJug==
X-Google-Smtp-Source: ABdhPJwif6K+hf8APaY1ruMbTWbTOXKyxCerYvfRwFWXsT7Y43hfgwpqyfnRkGYtn5eyXE9+v0qlY0+rMGhWSJUdWC4=
X-Received: by 2002:aa7:8893:0:b0:4fb:10e1:8976 with SMTP id
 z19-20020aa78893000000b004fb10e18976mr17684246pfe.36.1651614155999; Tue, 03
 May 2022 14:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220503211954.1428919-1-frowand.list@gmail.com>
In-Reply-To: <20220503211954.1428919-1-frowand.list@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 May 2022 16:42:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKqBWKWzQC1qXABuiC6b3OgwfO+c5-fpGz=AgSUSCHCcA@mail.gmail.com>
Message-ID: <CAL_JsqKqBWKWzQC1qXABuiC6b3OgwfO+c5-fpGz=AgSUSCHCcA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] of: overlay: rename overlay source files from .dts
 to .dtso
List-Id: <soc.lore.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>, SoC Team <soc@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Tim Harvey <tharvey@gateworks.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, 
	Michal Simek <monstr@monstr.eu>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Michael Walle <michael@walle.cc>, 
	Alex Marginean <alexandru.marginean@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 3, 2022 at 4:20 PM <frowand.list@gmail.com> wrote:
>
> From: Frank Rowand <frank.rowand@sony.com>
>
> In drivers/of/unittest-data/:
>    - Rename .dts overlay source files to use .dtso suffix.
>    - Add Makefile rule to build .dtbo.o assembly file from overlay
>      .dtso source file.
>    - Update Makefile to build .dtbo.o objects instead of .dtb.o from
>      unittest overlay source files.
>
> Modify driver/of/unitest.c to use .dtbo.o based symbols instead of
> .dtb.o
>
> Modify scripts/Makefile.lib %.dtbo rule to depend upon %.dtso instead
> of %.dts
>
> Rename .dts overlay source files to use .dtso suffix in:
>    arch/arm64/boot/dts/freescale/
>    arch/arm64/boot/dts/xilinx/
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>
> Testing by arm64 people would be much appreciated.
>
> Applies on branch dt/next, commit 4fb74186cee8 of Rob's kernel.org tree.
> git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
>
> version 1 patch:
>    https://lore.kernel.org/r/20210324223713.1334666-1-frowand.list@gmail.com
>
> changes from version 1:
>    - rebase to 5.18-rc1 plus many patches already accepted by Rob
>      Applies on branch dt/next, commit 4fb74186cee8 of Rob's kernel.org tree.
>    - Add new overlay source files in:
>       arch/arm64/boot/dts/freescale/
>       arch/arm64/boot/dts/xilinx/

I can't apply these. They need to be applied separately. And probably
at end of the merge window or right after rc1 (IOW, coordinated with
SoC maintainers in advance). Or we support both forms for a cycle.

[...]

> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> index d072f3ba3971..df2ca1820273 100644
> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile
> @@ -1,38 +1,58 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-y += testcases.dtb.o
>
> -obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
> -                           overlay_0.dtb.o \
> -                           overlay_1.dtb.o \
> -                           overlay_2.dtb.o \
> -                           overlay_3.dtb.o \
> -                           overlay_4.dtb.o \
> -                           overlay_5.dtb.o \
> -                           overlay_6.dtb.o \
> -                           overlay_7.dtb.o \
> -                           overlay_8.dtb.o \
> -                           overlay_9.dtb.o \
> -                           overlay_10.dtb.o \
> -                           overlay_11.dtb.o \
> -                           overlay_12.dtb.o \
> -                           overlay_13.dtb.o \
> -                           overlay_15.dtb.o \
> -                           overlay_16.dtb.o \
> -                           overlay_17.dtb.o \
> -                           overlay_18.dtb.o \
> -                           overlay_19.dtb.o \
> -                           overlay_20.dtb.o \
> -                           overlay_bad_add_dup_node.dtb.o \
> -                           overlay_bad_add_dup_prop.dtb.o \
> -                           overlay_bad_phandle.dtb.o \
> -                           overlay_bad_symbol.dtb.o \
> -                           overlay_base.dtb.o \
> -                           overlay_gpio_01.dtb.o \
> -                           overlay_gpio_02a.dtb.o \
> -                           overlay_gpio_02b.dtb.o \
> -                           overlay_gpio_03.dtb.o \
> -                           overlay_gpio_04a.dtb.o \
> -                           overlay_gpio_04b.dtb.o
> +# Generate an assembly file to wrap the output of the device tree compiler
> +quiet_cmd_dt_S_dtbo= DTB     $@
> +cmd_dt_S_dtbo=\
> +{                                                      \
> +       echo '\#include <asm-generic/vmlinux.lds.h>';   \
> +       echo '.section .dtb.init.rodata,"a"';           \
> +       echo '.balign STRUCT_ALIGNMENT';                \
> +       echo '.global __dtbo_$(subst -,_,$(*F))_begin'; \
> +       echo '__dtbo_$(subst -,_,$(*F))_begin:';        \
> +       echo '.incbin "$<" ';                           \
> +       echo '__dtbo_$(subst -,_,$(*F))_end:';          \
> +       echo '.global __dtbo_$(subst -,_,$(*F))_end';   \
> +       echo '.balign STRUCT_ALIGNMENT';                \
> +} > $@
> +
> +
> +$(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
> +       $(call if_changed,dt_S_dtbo)

Humm, this belongs in scripts/Makefile.lib.

I don't think we need a different section name with __dtbo_* instead
of __dtb_* if that simplifies the Makefile.

> +
> +obj-y += testcases.dtbo.o
> +
> +obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
> +                           overlay_0.dtbo.o \
> +                           overlay_1.dtbo.o \
> +                           overlay_2.dtbo.o \
> +                           overlay_3.dtbo.o \
> +                           overlay_4.dtbo.o \
> +                           overlay_5.dtbo.o \
> +                           overlay_6.dtbo.o \
> +                           overlay_7.dtbo.o \
> +                           overlay_8.dtbo.o \
> +                           overlay_9.dtbo.o \
> +                           overlay_10.dtbo.o \
> +                           overlay_11.dtbo.o \
> +                           overlay_12.dtbo.o \
> +                           overlay_13.dtbo.o \
> +                           overlay_15.dtbo.o \
> +                           overlay_16.dtbo.o \
> +                           overlay_17.dtbo.o \
> +                           overlay_18.dtbo.o \
> +                           overlay_19.dtbo.o \
> +                           overlay_20.dtbo.o \
> +                           overlay_bad_add_dup_node.dtbo.o \
> +                           overlay_bad_add_dup_prop.dtbo.o \
> +                           overlay_bad_phandle.dtbo.o \
> +                           overlay_bad_symbol.dtbo.o \
> +                           overlay_base.dtbo.o \
> +                           overlay_gpio_01.dtbo.o \
> +                           overlay_gpio_02a.dtbo.o \
> +                           overlay_gpio_02b.dtbo.o \
> +                           overlay_gpio_03.dtbo.o \
> +                           overlay_gpio_04a.dtbo.o \
> +                           overlay_gpio_04b.dtbo.o
>
>  # enable creation of __symbols__ node
>  DTC_FLAGS_overlay += -@


> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index dff55ae09d97..1d3c170d95db 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1423,12 +1423,12 @@ static int __init unittest_data_add(void)
>         void *unittest_data_align;
>         struct device_node *unittest_data_node = NULL, *np;
>         /*
> -        * __dtb_testcases_begin[] and __dtb_testcases_end[] are magically
> -        * created by cmd_dt_S_dtb in scripts/Makefile.lib
> +        * __dtbo_testcases_begin[] and __dtbo_testcases_end[] are
> +        * created by cmd_dt_S_dtbo in Makefile
>          */
> -       extern uint8_t __dtb_testcases_begin[];
> -       extern uint8_t __dtb_testcases_end[];
> -       const int size = __dtb_testcases_end - __dtb_testcases_begin;
> +       extern uint8_t __dtbo_testcases_begin[];
> +       extern uint8_t __dtbo_testcases_end[];
> +       const int size = __dtbo_testcases_end - __dtbo_testcases_begin;
>         int rc;
>         void *ret;
>
> @@ -1443,7 +1443,7 @@ static int __init unittest_data_add(void)
>                 return -ENOMEM;
>
>         unittest_data_align = PTR_ALIGN(unittest_data, FDT_ALIGN_SIZE);
> -       memcpy(unittest_data_align, __dtb_testcases_begin, size);
> +       memcpy(unittest_data_align, __dtbo_testcases_begin, size);
>
>         ret = of_fdt_unflatten_tree(unittest_data_align, NULL, &unittest_data_node);
>         if (!ret) {
> @@ -3009,24 +3009,24 @@ static inline void __init of_unittest_overlay(void) { }
>  #ifdef CONFIG_OF_OVERLAY
>
>  /*
> - * __dtb_ot_begin[] and __dtb_ot_end[] are created by cmd_dt_S_dtb
> - * in scripts/Makefile.lib
> + * __dtbo_##overlay_name##_begin[] and __dtbo_##overlay_name##_end[] are
> + * created by cmd_dt_S_dtbo in Makefile
>   */
>
> -#define OVERLAY_INFO_EXTERN(name) \
> -       extern uint8_t __dtb_##name##_begin[]; \
> -       extern uint8_t __dtb_##name##_end[]
> +#define OVERLAY_INFO_EXTERN(overlay_name) \
> +       extern uint8_t __dtbo_##overlay_name##_begin[]; \
> +       extern uint8_t __dtbo_##overlay_name##_end[]
>
> -#define OVERLAY_INFO(overlay_name, expected)             \
> -{      .dtb_begin       = __dtb_##overlay_name##_begin, \
> -       .dtb_end         = __dtb_##overlay_name##_end,   \
> -       .expected_result = expected,                     \
> -       .name            = #overlay_name,                \
> +#define OVERLAY_INFO(overlay_name, expected)               \
> +{      .dtbo_begin       = __dtbo_##overlay_name##_begin, \
> +       .dtbo_end         = __dtbo_##overlay_name##_end,   \
> +       .expected_result = expected,                       \
> +       .name            = #overlay_name,                  \
>  }
>
>  struct overlay_info {
> -       uint8_t         *dtb_begin;
> -       uint8_t         *dtb_end;
> +       uint8_t         *dtbo_begin;
> +       uint8_t         *dtbo_end;

Is this rename really needed?

>         int             expected_result;
>         int             ovcs_id;
>         char            *name;
> @@ -3100,7 +3100,7 @@ static struct overlay_info overlays[] = {
>         OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
>         OVERLAY_INFO(overlay_bad_symbol, -EINVAL),
>         /* end marker */
> -       {.dtb_begin = NULL, .dtb_end = NULL, .expected_result = 0, .name = NULL}
> +       {.dtbo_begin = NULL, .dtbo_end = NULL, .expected_result = 0, .name = NULL}
>  };
>
>  static struct device_node *overlay_base_root;
> @@ -3157,13 +3157,13 @@ void __init unittest_unflatten_overlay_base(void)
>                 return;
>         }
>
> -       data_size = info->dtb_end - info->dtb_begin;
> +       data_size = info->dtbo_end - info->dtbo_begin;
>         if (!data_size) {
>                 pr_err("No dtb 'overlay_base' to attach\n");
>                 return;
>         }
>
> -       size = fdt_totalsize(info->dtb_begin);
> +       size = fdt_totalsize(info->dtbo_begin);
>         if (size != data_size) {
>                 pr_err("dtb 'overlay_base' header totalsize != actual size");
>                 return;
> @@ -3175,7 +3175,7 @@ void __init unittest_unflatten_overlay_base(void)
>                 return;
>         }
>
> -       memcpy(new_fdt, info->dtb_begin, size);
> +       memcpy(new_fdt, info->dtbo_begin, size);
>
>         __unflatten_device_tree(new_fdt, NULL, &overlay_base_root,
>                                 dt_alloc_memory, true);
> @@ -3210,11 +3210,11 @@ static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
>                 return 0;
>         }
>
> -       size = info->dtb_end - info->dtb_begin;
> +       size = info->dtbo_end - info->dtbo_begin;
>         if (!size)
>                 pr_err("no overlay data for %s\n", overlay_name);
>
> -       ret = of_overlay_fdt_apply(info->dtb_begin, size, &info->ovcs_id);
> +       ret = of_overlay_fdt_apply(info->dtbo_begin, size, &info->ovcs_id);
>         if (ovcs_id)
>                 *ovcs_id = info->ovcs_id;
>         if (ret < 0)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f69ecdd7977..b409bec5fa45 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -363,7 +363,7 @@ endef
>  $(obj)/%.dtb: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
>         $(call if_changed_rule,dtc)
>
> -$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> +$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>
>  dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
> --
> Frank Rowand <frank.rowand@sony.com>
>

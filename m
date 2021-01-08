Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408BCC433E0
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 13:22:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEFC423A04; Fri,  8 Jan 2021 13:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6106239FF;
	Fri,  8 Jan 2021 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610112162;
	bh=ENwimHSCI9zbAYsxbag16lOtNRmcxjYA6qlFT+xqze4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=DFhcCw2rcdafoDJl1C/ALSF7Ft6QdragloGbQgylEvvjxennisXLR0OoNbK3C6M2x
	 kX2KVNpwWpI14dNmVB2dWCyEssCckjlV9DyUW2D4c3Dv6GsvF31bNGaR8Eo4Y4cObC
	 2LFiVNnRTfU3rssO3MHR2oHAA9+ijUIeFQCpH1O/XnccOYRMjQM8BlThcMB1LJj/bs
	 6HzGFzyEtdfFnBJPgOZxjY+FVr+g4185eJule4I1hqzngr14BMjpshIvMmH/QrTzib
	 OlgKxLqjhFaTQVo8S1MSpvbfCaN2Re2ABHR1+5nr3RcmRTilpFjgdBr0CeEJP7/zOJ
	 vxcGV9Qb5jUGg==
Received: by mail-oo1-f51.google.com with SMTP id j8so2375866oon.3;
        Fri, 08 Jan 2021 05:22:42 -0800 (PST)
X-Gm-Message-State: AOAM532mIMoshnAPdLRXc7bIbBereKppc3HkT0Qfs/BGVmssyatUdG48
	ShydI7PW4W02g67VRCTTUQfHB3OQz7hNn7UnkOk=
X-Google-Smtp-Source: ABdhPJyMnIB6srcv77f1xQcZ+ZwLiDt7PfzdpbDtYlP0CHA5zs0qHD8hQT0A/B8w52K5hL0KHd3QsjneDWHfl7NB3xA=
X-Received: by 2002:a4a:4592:: with SMTP id y140mr4374980ooa.26.1610112162046;
 Fri, 08 Jan 2021 05:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com> <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 14:22:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
Message-ID: <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
Subject: Re: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:

> +static void write_init_sync_reg(void *args)
> +{
> +       struct init_sync_args *sync_args = (struct init_sync_args *)args;
> +
> +       switch (sync_args->bb) {
> +       case 0:
> +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB0_EL1);
> +               break;
> +       case 1:
> +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB1_EL1);
> +               break;
> +       case 2:
> +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB2_EL1);
> +               break;
> +       case 3:
> +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB3_EL1);
> +               break;
> +       case 4:
> +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB4_EL1);
> +               break;
> +       case 5:
> +               write_sysreg_s(sync_args->val, FHWB_INIT_SYNC_BB5_EL1);
> +               break;
> +       }
> +}

(minor style comment

I think this could be simplified into a single write_sysreg_s() with the
register number calculated based on sync_args->bb, rather than duplicating
the same three lines six times.

> +static int ioc_bb_alloc(struct file *filp, void __user *argp)
> +{
> +       struct hwb_private_data *pdata = (struct hwb_private_data *)filp->private_data;

A slightly better way to write the ioctl command specific functions
is to just give the argument the correct type (struct
fujitsu_hwb_ioc_bb_ctl __user*)
instead of 'void __user *', to avoid the cast.

Similarly, as you don't use 'filp' itself, just pass the struct hwb_private_data
pointer as the first argument.

> @@ -164,6 +386,7 @@ static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
>  static const struct file_operations fujitsu_hwb_dev_fops = {
>         .owner          = THIS_MODULE,
>         .open           = fujitsu_hwb_dev_open,
> +       .unlocked_ioctl = fujitsu_hwb_dev_ioctl,
>  };

All drivers with an ioctl interface should work in compat mode as well,
so please add a

       .compat_ioctl = compat_ptr_ioctl;

> +#define __FUJITSU_IOCTL_MAGIC 'F'

It's hard to find a non-conflicting range of ioctl numbers, but
it would be good to note the conflict in

Documentation/userspace-api/ioctl/ioctl-number.rst

The 'F' range is also used in framebuffer drivers.

> +/* ioctl definitions for hardware barrier driver */
> +struct fujitsu_hwb_ioc_bb_ctl {
> +       __u8 cmg;
> +       __u8 bb;
> +       __u8 unused[2];
> +       __u32 size;
> +       unsigned long __user *pemask;
> +};

However, this structure layout is incompatible with 32-bit user
space because of the indirect pointer. See
Documentation/driver-api/ioctl.rst for how to encode a
pointer in a __u64 member.

      Arnd

Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFB0C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 13:25:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80549239FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 13:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80549239FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rG3FCmTV6FyjKLupMZVh0+h9Serwa1sKNVuJe6LU4AU=; b=CDxz1ay0dt6jm405WqAPXxeC1
	R1J8Gwxo76o6hoqRg3nlogY0mNff6t4Ssb6MnepwMXjAVoH9Khf1F1U8fehJsZw1OOWGs/M64AaCB
	iLII/XHeGqSK54WTajHirUzlmiQntF+UIeRlIzlLQ91UCr1tPKzDaP1iOTP4yNvhQmX0GdzI40wkN
	bfW0lwEw5YLLXRVWk7JQFZQkh/7454dG8cBrr2DQbwjmXqVJCkYAjDB4nMA/AxEMbmfPrP2k9vNTc
	W4lNJB3j8/+Y3dLEvXOALKVDb0eHrKLOOw1tQYECDC4Ngo0d1+ZOtKnjJfoqPQpabwgZnWTQHJKfq
	k7BWHdVDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxrjV-0007iB-5a; Fri, 08 Jan 2021 13:23:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxrj3-0007gj-0s
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 13:22:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C452B2396F
 for <linux-arm-kernel@lists.infradead.org>;
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
Received: by mail-oo1-f47.google.com with SMTP id p72so2369410oop.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 05:22:42 -0800 (PST)
X-Gm-Message-State: AOAM533ZJ2PwaUKGHMYW6TO2vWt+ZWnnapZDVIUkR2vp3/7wMAhjHoDH
 Qk1/L6h+nz0alWxm+svVAE4TIYGL7MAnMmpzrM4=
X-Google-Smtp-Source: ABdhPJyMnIB6srcv77f1xQcZ+ZwLiDt7PfzdpbDtYlP0CHA5zs0qHD8hQT0A/B8w52K5hL0KHd3QsjneDWHfl7NB3xA=
X-Received: by 2002:a4a:4592:: with SMTP id y140mr4374980ooa.26.1610112162046; 
 Fri, 08 Jan 2021 05:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 14:22:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
Message-ID: <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
Subject: Re: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_082245_207838_6B6E7ECE 
X-CRM114-Status: GOOD (  19.35  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108132226.teA3--PMZe-6H2sU1Y0BpCLlC4bhB78YFgfVsyH1Gzw@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

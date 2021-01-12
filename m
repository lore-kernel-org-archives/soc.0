Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBC9C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 12:36:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786BC2310E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786BC2310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7aXY7YTL1F1Am4o9Yp5noJ8AQu0o+l3yJxUKvfgdAmM=; b=MXOIt6mSwqogkO6nS6h2xJEIP
	BldUODjnf8ps+/+QUQCc2a8gI/IKd4XY+FiLHoykdUm/TiI6tmlw2jNqnQJG+OWDLHWOelT4y1EF9
	bVseOwRse05m3WH+3EQnlRW+NJQXxJvBduNptcP7/xE1FiGfpdjFhqfxt2QTkaP2WrxEd4f3ig/jS
	F7gDvGwtZmJPY+MyT6+Lgioyozd0yJnezB/b/P9MFS1FI0SWZGlE6TZAobjxd+/G9/L82D7S2oUnb
	2Fw+21vwYWurUtBEq4hV6a1aPVaMw+Y+u7zVDZoPKQ1AAbzNe9ucUac6Wm2WnvsYaN7ct+Vmpw8wj
	rp4fvrhJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzIsq-0002LZ-ON; Tue, 12 Jan 2021 12:34:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzIsm-0002Jt-I9
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 12:34:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6E6823117
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 12 Jan 2021 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610454882;
 bh=g3IrvRu89s7lfs/2hqzw7ocFewgDpWXpXEOpINnAdzk=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=AvBGWYVFpDxDlTqMTHxc5IZ7lPZ5ZMaQlr6V6B3pMFO6MKx+5UNJVEfH8JMVfCgf9
 nqmQmPALnblK+vd3hNTbHnBpT/tHE54zK9qUH9ZfPmnCRMY27qd4fbFkGtLwD9QhOU
 eIEwlgzkiKiLUzcllc4eOHLN+sp0ktb8B8PZ8tMUzykVfgBVDun8vlmr/Z/8fZ3Vum
 X1w7jwOD47Hg9/2fmh0RNecJ4d9ySOqritHf8YOnTWOLGj+Nkcs7ht3yRzYJLMKyKA
 P4srdqlC40lsu3ewyKoV8m0O7lLWyU8HwILHnhbg9EyNt9amfTbujJ+4EnYx2RzH2M
 J03gIUFGxmDiw==
Received: by mail-ot1-f41.google.com with SMTP id r9so2050795otk.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 12 Jan 2021 04:34:42 -0800 (PST)
X-Gm-Message-State: AOAM531tN2/3xxb1Ev232LpP5JG00CegGSFDE8Viewk+a9qo1YseY1Gw
 KiWdVpj8zADfglzkrTOEOcW1qZcjrFsufSMmdAo=
X-Google-Smtp-Source: ABdhPJxAxO9YMRZ8cVHtUw+FEsUXGZaHiNxtXuSB9jTtZ5GjpLFHXlMFbSOsKNGsE7bGI0UhdO/FdFstMA8zh17bsG0=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2597610otm.305.1610454882061; 
 Tue, 12 Jan 2021 04:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108105241.1757799-4-misono.tomohiro@jp.fujitsu.com>
 <CAK8P3a39ZObFDOdXQCPFyEy_nvoyaE8RBv3W+HMeBs=6OazJ6g@mail.gmail.com>
 <OSBPR01MB458227B345C445CBF342648DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB458227B345C445CBF342648DE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 12 Jan 2021 13:34:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NkyThRA5YYGb=8DczksE7V5uPhfqO1O6TEmdiJ28ZJw@mail.gmail.com>
Message-ID: <CAK8P3a0NkyThRA5YYGb=8DczksE7V5uPhfqO1O6TEmdiJ28ZJw@mail.gmail.com>
Subject: Re: [PATCH 03/10] soc: fujitsu: hwb: Add IOC_BB_ALLOC ioctl
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_073444_682876_2D45F410 
X-CRM114-Status: GOOD (  23.32  )
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
Message-ID: <20210112123425.0jf4HQY3LcZutKCd24a09G5Wn7EugX8aNvJsEOh1kA8@z>

On Tue, Jan 12, 2021 at 12:02 PM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> > On Fri, Jan 8, 2021 at 11:52 AM Misono Tomohiro
> > <misono.tomohiro@jp.fujitsu.com> wrote:
> >> >
> > I think this could be simplified into a single write_sysreg_s() with the
> > register number calculated based on sync_args->bb, rather than duplicating
> > the same three lines six times.
>
> I think msr/mrs instructions needs register names at compile time so
> it cannot be calculate dynamically. Or am I misunderstood?

You are correct, I didn't realize it was implemented using a string
concatenation macro and that an inline function version would be
tricky.

> > > @@ -164,6 +386,7 @@ static int fujitsu_hwb_dev_open(struct inode *inode, struct file *filp)
> > >  static const struct file_operations fujitsu_hwb_dev_fops = {
> > >         .owner          = THIS_MODULE,
> > >         .open           = fujitsu_hwb_dev_open,
> > > +       .unlocked_ioctl = fujitsu_hwb_dev_ioctl,
> > >  };
> >
> > All drivers with an ioctl interface should work in compat mode as well,
> > so please add a
> >
> >        .compat_ioctl = compat_ptr_ioctl;
>
>
> A64FX does not support 32-bit mode (aarch32 state).
> So I think unlockd_ioctl is enough or is it better to use compat_ioctl anyway?

It's a good point that this is not supported, but I would suggest adding
it anyway out of principle. It's better to always write code in a portable
way even if you do not expect to need the portability.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

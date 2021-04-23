Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703A1C433B4
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 19:52:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 431786145F; Fri, 23 Apr 2021 19:52:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 296C6613D7
	for <soc@kernel.org>; Fri, 23 Apr 2021 19:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619207570;
	bh=8/qaAjuetChn4RkThVd5XPQCvNQW1OoLUozwK7CPZAM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JjqAogkaIgO8lZgNSSMpd4eEjjViSex8bF/BxzvRtRZzvM/C6jg5y2+4eawgbRWPm
	 n3+A1j7YOeKzv+h/dv4T+NmkWRDYF+f6xr9pjJ+U+FhUbz+s+80e739Y+d/6mwWwub
	 TbYED4RQC5d1qdWLAdpGnIcpJ6cSIbdVssfDdBddc8ufEYSVrfKINhlaiR+F3+DbMs
	 SsHKA1wsfTfY1b0DmR5g9vRRuXl1hkLltv6r7t6x4UzOLqRUrs9J3mFkYb/ekgLoQ+
	 DPkG/dLC9FuBxVWeeLDIIiI0zIpOwqNhd7T80KhaB2n+whcVHpN17+DeOsCVHOSP+7
	 M1kRJL9HJfOmA==
Received: by mail-wr1-f51.google.com with SMTP id h4so40431847wrt.12
        for <soc@kernel.org>; Fri, 23 Apr 2021 12:52:50 -0700 (PDT)
X-Gm-Message-State: AOAM5314K1JrcI0BpHRB0dnhXm3Bdcu93Xzx0bnx5Y0dJOOmq+H5OPFJ
	QL/4XwY3+iZImlTbmzGeTfB0x3j1PKM1BuiKIxw=
X-Google-Smtp-Source: ABdhPJyUP57K22FG/sxMFwCAmGH7AkhAMLPYZ6VubbfRUPAlFSYOA0xz0YZ+bkanWK3I0hZCsh2QjtVjMdRAsgkbuBI=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr6781235wrg.165.1619207568825;
 Fri, 23 Apr 2021 12:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210422140945.4131092-1-daniel@0x0f.com> <20210422140945.4131092-2-daniel@0x0f.com>
 <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com> <CAFr9PX=QeON1C_25tyNK1rWGm3A_Kc2Ad5qLUCfunmdHQUsv_g@mail.gmail.com>
In-Reply-To: <CAFr9PX=QeON1C_25tyNK1rWGm3A_Kc2Ad5qLUCfunmdHQUsv_g@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Apr 2021 21:52:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fxvH_DrxtrCDOwjzx1zvw09E4K7eFC697FH0je9=tmw@mail.gmail.com>
Message-ID: <CAK8P3a3fxvH_DrxtrCDOwjzx1zvw09E4K7eFC697FH0je9=tmw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ARM: mstar: Add header with macros for RIU
 register access
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 4:03 PM Daniel Palmer <daniel@0x0f.com> wrote:
> On Fri, 23 Apr 2021 at 22:48, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > The __iomem token comes after the type, so this should be 'void __iomem *'.
> >
>
> Bit of copy/paste fail. Fixed.
>
> > > +       return readw_relaxed(reg + 4) << 16 | readw_relaxed(reg);
> >
> > This should probably be using 'readw' instead of 'readw_relaxed'. If you
> > absolutely need to use one of the relaxed accessors somewhere,
> > better add both sets and make sure drivers use the non-relaxed version
> > by default.
>
> I'll add a relaxed/non-relaxed version of each.
> Because of the heavy memory barrier to access one 32 bit register
> we'll hit the barrier twice in the non-relaxed version.
> And we don't need to hit the barrier at all because it doesn't
> actually matter for IO. Is there something better I can do there?

I think you can do the heavy barrier only once in this case. For writel,
the barrier comes first, so you can do writel();write_relaxed(), and the
reverse for the read side, doing readl_relaxed(); readl();.

> > Maybe both types of accessors can be in a single header.
>
> That makes sense. I'll merge them. Would this header be something that
> could go in alone without anything that uses them in mainline right
> now?

I don't care much, I can provide an Acked-by for merging it along with
whatever driver change first needs it, or I can merge it after
5.13-rc1 through the soc tree.

          Arnd

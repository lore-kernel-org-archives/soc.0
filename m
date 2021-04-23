Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8817C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 19:54:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5693E61425
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 19:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5693E61425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=36gNbW6novcDPdn84kRx6LXm+Rz65r61N3McigTGP48=; b=dHjacbFfpILFfabiHo8qoklfG
	RDxTg8h0B5G/P5JsXpnrr0rhwS2XE3N8CoKbspovYkp/5jpgHkgPlUMbhREpVkMbr5sQQKnRThF6N
	210Uf7HHj7Avrbbaykm3BPZWcNXZaM3d41OOXcU8t8Bq8LlVyjevwVgGjiuTkYDBBhga8LEfxiw66
	GFtYAhSzJN8SbHt0kIEcoAKUhal7roNlCeTAKHRdVF2yuds8NduXQKIIITPsq4mmBKG7fGU3P94Rw
	eQOxDLzwk7frpOi6Oqzj1wJmqUk2gyxAf18FH7ZpzjkTCYhrwHOQ0YYXm3KSD4gqpuSRh7RChsrn7
	XG0K54xzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la1rH-002FNt-1K; Fri, 23 Apr 2021 19:52:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1rB-002FNZ-6g
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 19:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Zlodq18kRFcXBkIqo+pMCLOcETyuEVKMnpGs8zqnlCc=; b=SghUBd85rkGEiickbyf8BAO9pQ
 CR1rnc6qV/P4BjOjZMgOEur0bvN7rIjpQdfLKpoDqKZf3fYhDM9x2tWov+W9RBtemXp6+qf91PpSm
 si/0tfgV8L58sgFdCW+28aFy62XN3JJlWXI/JkllSMl/FVA6HkvwT29WMv4eftoD6HUC6w5x2UvtK
 WWFWsOST23TKEbcAiapBQEwI7Z59+xhVs0+3gdanyBP2O8/UCeDbEyXMy8wkiOHnUNcBH+4bdBT/p
 itR6vLpsCHa7ekljTJPNXWbFCA9/wrV0AVLH/vd+DuQiX8wWH2235CouHT/HDXa1xbXXczSVDlQPB
 I+Rcx3mA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1r8-00Efab-LO
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 19:52:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3213461425
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 19:52:50 +0000 (UTC)
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
Received: by mail-wr1-f46.google.com with SMTP id g9so33455921wrx.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 12:52:50 -0700 (PDT)
X-Gm-Message-State: AOAM530A5kYbA/D+gEQjNLLrwe7Tl8yLZe8XitZe2rJbo6yjTHuE16qy
 FGYITJjBRbRNTB0c7slCSCK2pyNJ99+H0aUGbzo=
X-Google-Smtp-Source: ABdhPJyUP57K22FG/sxMFwCAmGH7AkhAMLPYZ6VubbfRUPAlFSYOA0xz0YZ+bkanWK3I0hZCsh2QjtVjMdRAsgkbuBI=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr6781235wrg.165.1619207568825; 
 Fri, 23 Apr 2021 12:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210422140945.4131092-1-daniel@0x0f.com>
 <20210422140945.4131092-2-daniel@0x0f.com>
 <CAK8P3a3fkjy2YYwhmsFQt-MSyOh=1zf1wqzQB7usjsHbUBWdtQ@mail.gmail.com>
 <CAFr9PX=QeON1C_25tyNK1rWGm3A_Kc2Ad5qLUCfunmdHQUsv_g@mail.gmail.com>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, Willy Tarreau <w@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_125250_745865_9AB3C0EB 
X-CRM114-Status: GOOD (  20.62  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210423195225.GSwYMutJGPtLzYgjCAcdyh1lwleAB8xj2sQYpv5lfNs@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

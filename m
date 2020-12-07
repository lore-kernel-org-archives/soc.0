Return-Path: <SRS0=s/rV=FL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6E7C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 20:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17A7F2311A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Dec 2020 20:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17A7F2311A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yl/quvRr4xxNr9I95Lb3ZNnhoeGXrR5d/qJzMGksOOA=; b=A3tutW5sskoauV69zKdW1UNwp
	mjYPMicfLekCX+Mop1uY15DZ/+iprCyrm2rLmu4SNRjzRCH5F6YfNUJrin2nMOfQ2zaxlSriqtd95
	st2u9GdBpN8rETh8vH6rd1dXOfEf3g/f0/KxgckMOS1G1azzoBx7xXfHnKYKfwNx5LaEp5s3ABpvO
	LDzk+y0ubovm+Poh5nFpyPW+Oj1/2JCSxVDFTQQusF9Mom5U4aPOn8qlUvbiuBsjAYCAuT7eaW88z
	uCKJflykl7CKvt2+W+lIXu9w6dlkHmyEZyC3JOGHXooOxqc/Lhtkgxh4Qc24k2N69xkIL2KE2GJ3X
	zI0DM6eOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmMzQ-0005Sd-6o; Mon, 07 Dec 2020 20:20:08 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmMzM-0005Ry-M9
 for linux-arm-kernel@lists.infradead.org; Mon, 07 Dec 2020 20:20:05 +0000
Received: by mail-ot1-f67.google.com with SMTP id i6so7656430otr.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 07 Dec 2020 12:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8fj10nDje2x93+KcCvXW7CIv2lqtiTGkIsq3PGAkpQ=;
 b=gk1Zl2xEiIzZN0M/InIRrmo1RIE/mVntEy1u6VQssxBTR3BzuCOeueOtzi/YqVNcZC
 LiEROcbUF7QNiei5ECKwHaAI5JEXOQWXftpBGbckYbv4JAeX2g7QnLOvuc5QfdVp1vY/
 wT1005sW1KYk2ZElTGlYltW7gy1JWHzAJq9FQmrYYlcV+88GYAT0ugXtvT1GmduI6X6m
 rPO3uWuvL3Rrmzg+2Va0QQisxLmytq5Jl+fvfb1TaE73S4NQMAGt4a7mTJWbhF0/jSFM
 W1M4oD8l1M4KpaqbvnJl5Iu2ZhVxrvWsmuZSYZvIJYLtH7q0mk1BvGQ8aB+LMTLpb4me
 3hEg==
X-Gm-Message-State: AOAM531LgOjK6JSbHauJmiNGMcKZkFh52bx5YB0g/1tmX2W+eOrh4Z23
 /DgxltkZvDAQfNIeRIhR/9NBRgDo3QVBDsW0ZO4=
X-Google-Smtp-Source: ABdhPJy2xXJ31q/f+prT+1t1V3CRJwLEpaT1rJWaISAdMh4ZqnS5NVqYeodB/wICppPMsAb4jFStHycuOjYZ7aK37g8=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr14394879oth.250.1607372403410; 
 Mon, 07 Dec 2020 12:20:03 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
 <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
 <CAPDyKFp9L+L9VeUD038G3mBTLBuPJsMtv7JhxCcSGb3iY=eq5A@mail.gmail.com>
 <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1Va_xJzk8qqJM1VBWfSKpomKbQh_NpPO20aoORoe0SWQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 21:19:52 +0100
Message-ID: <CAMuHMdUT83EkE-phUX2Z431AtGPfZvXeKwQriDKEHJKfr2R40A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_152004_777063_0087D525 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201207201952.Ijn1xAlBDZf1qQ7ceRgkTtD3oDvqaXSny5ONjF7IPR0@z>

CC devicetree

On Tue, Dec 1, 2020 at 3:06 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Dec 1, 2020 at 12:39 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > So, I think we have two options. If people are willing to move to
> > "disk labels" or to patch their DTBs with mmc aliases, things can stay
> > as is. Otherwise, we can revert the async probe parts of the mmc host
> > drivers, but that would still leave us in a fragile situation.
>
> Can you reliably detect whether the mmc aliases in the dt exist?
> If that's possible, maybe the async flag could be masked out to only have
> an effect when the device number is known.

IMHO DT aliases are not a proper solution for this.

Yes, you can detect reliably if an alias exists in the DT.
The problems start when having multiple devices, some with aliases,
some without.  And when devices can appear dynamically (without
aliases, as there is no support for dynamically updating the aliases
list).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

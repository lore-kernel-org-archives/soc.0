Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4B3C64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D01206E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJPaiShh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OpbVqC/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D01206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+JZsxFwbosTBE61WuhKMLItJ3zWVh1mxm9xW+IUHH6E=; b=gJPaiShhIXT07sRmW9WQ22V6Z
	6DBRIh5IlIqfAYyVlTKJSh946OXt7n9r9sSl3XqMaBrJvoK3IBMBuKvsUBNowBD0lnU9t21HOxA2u
	+nTJTrLcZVsJGumHrRfOZxvTr4J5O82AYXwMOMmg4klpBCWXa58Aqie8rUFMdgAnh2A5L7fLrJ/fN
	mnJidUI/FL/0HYSDbiq6wjNutkY5vqMHjPLYbwcUPLzDIN9oYMVsJLLxIRd6SMOX0V7VRYAN6Yojw
	7tkW3kQhmXWGz/YXUIs9Go4H4ddTIUOgeXkTJtkQ4juy7h0pvATt3/R+C+n8Fq8xrgcKxGD+4rdxU
	qD8Xv3wYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjnDw-0004Zq-FX; Mon, 30 Nov 2020 17:44:28 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjnDs-0004Z2-M9
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 17:44:25 +0000
Received: by mail-lf1-x143.google.com with SMTP id s27so23238553lfp.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 09:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hGGnCVO25VOQfg1PzcbDjqG+MdPgry8c2i2t7+r3Ezo=;
 b=OpbVqC/70CdGr9YEoMNyq56qEVPpQmbjvAsLgtlaJoyII6eswjqe7S4biOHSMstc3n
 YUniZkwX7b1I+uUfHDRpPTPw6l9kKhL20qsHluB+J4/sDH3RuD+1IjpWNP6qBnTTMw50
 sHR3xPzr7wC9l6SkL4QQkuixNxBs9xBM105nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hGGnCVO25VOQfg1PzcbDjqG+MdPgry8c2i2t7+r3Ezo=;
 b=DU4yXyLEByOHc20cgw2DfB8gbu/GX9PzEna0xbZWOHXUhXY66GVJkMf84e7z48ECO8
 boFax+V1HklLDtUcbk0MwLsn0gYHqaAru7RSGSYg/hhIPyolWJbgUPMUfn7sNuc7Pg8z
 NPzgy67236abYZE0bhFvsvK6XYYamipExtC6FLugiy4utU2wPHKfj1J12NhdOlT/AdMx
 3UYoiFrbyC+ywvI/S2WN+wH1irOUA+H5VLSR0179eEEMEKaSX7pNSuk4rotGzv9JTZn+
 MNKcv5pZxvlDV+9PQjedH6vyCVc0fIfGrgdwwkLIblf+fzLtb8tF6O9trNZz0ZWFbg/K
 SK4Q==
X-Gm-Message-State: AOAM533uchP5m+7bA7p8/CtM4uGmV/tR3WlwU2z6ef8Yga8E0MUZFe4O
 ZFhL2GX/k2uKxwoYoJQ1n8GKG+QuXdC6Dg==
X-Google-Smtp-Source: ABdhPJxA3EoXDotNCorSYVigMCaYMLCUneZbiDdNjvRPF1kjmovOJE/JpDSJ/SaOU8HB/BB+rEKFiQ==
X-Received: by 2002:a05:6512:3690:: with SMTP id
 d16mr10705691lfs.321.1606758261201; 
 Mon, 30 Nov 2020 09:44:21 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id c14sm2528383lfr.105.2020.11.30.09.44.19
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 09:44:20 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id j10so19252344lja.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 09:44:19 -0800 (PST)
X-Received: by 2002:a2e:50c:: with SMTP id 12mr9985564ljf.371.1606758259392;
 Mon, 30 Nov 2020 09:44:19 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Nov 2020 09:44:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
Message-ID: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Doug Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_124424_841073_F7E5B053 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130174403.ojrvTK74Era9s-xuXGmI5fzrDVcUL4XofwkuBaKVMJE@z>

On Mon, Nov 30, 2020 at 9:04 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Without static assignment, maybe we could do numbering of MMC devices
> in some type of a pre-probe routine?  Is that what you're suggesting?

Yes.

So basically, the way the async probing works for say SCSI is that we
have multiple "layers of asynchroniety". We have the usual "init calls
done asynchronously", but then within the init calls themselves you
can start sub-scans asynchronously.

In order to get reliable ordering between multiple controllers, the
PCI bus is probed in order in pci_init() (or whatever), so each SCSI
controller gets called in a fixed order.

That then gets to scsi_scan_host() does that async_schedule() thing to
actually scan the SCSI buses on that host.

> If so, it seems like it might be a pretty big change to figure out how
> that ought to work (if it can be made to work).

Try to start out doing discovery synchronously, but then any extra
work (actual IO like partition scanning etc) with an "async_work()".

> Just to confirm, I assume you are specifically excluding all block
> devices attached via USB, right?

I have this memory that we tried to scan the root bus in order, just
because people will have internal USB devices that way, and it makes
it *much* easier if they show up in predetermined places.

Note that it really is only the internal devices that matter. Once you
start plugging in an external USB hug and random devices, ordering
clearly won't be reliable.

So this is not a "everything must be ordered". But people who think
that that then means "everythinbg can be random" are wrong. It's
really really inconvenient, because things like disk labels and
various device IDs are not reliable either, and can be very confusing
when two otherwise identical machines look different before you've
installed a full system on them, for example.

So you should strive very hard to make everything that is directly
connected to one SoC always come up in the same order, for example.

And storage devices are special. As Dmitry points out, it doesn't much
matter in what order something like a mouse is scanned. Who cares? If
you have multiple pointer devices, you'll either use them
interchangably, or you'll have some other way to identify them. But
storage is a _lot_ more basic than basically stateless input devices
are.

And no, disk labels really don't always exist. Never ever say "but but
but disk labels".

               Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

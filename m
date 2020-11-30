Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95307C63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:12:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 191152074A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gWGjUe8P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZXrbIa/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 191152074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBtkN4e61rYfsNLhL+ltUASdmsimNbSg9Fy8jij8l60=; b=gWGjUe8PF2uyuQEzdZJufeYBD
	GCR7Eu3NP3Q3WHKtdVqHtbDRc/nbLKLcYAAEHwPIY8fu7HRxLajhuBuQgWf3wWPPOJufJDR9Gr5aE
	RxLL7cGJDsdy/+7qGSD2FkF2roJY+lOuJevrrbV7s3upd/0gz/qvrBGZuLtF32UzgGtnnb0FqXNLK
	uXQ8WiBCXS/JJv3josFF0LlUlRukdYrkXFXnrRq7U+b53ijasIJuChUbjRO+BznTEq+gppEyNdu+n
	JxmFBR4n2z5KiUq24ttqDWGlJ4sbUfjwuOwA+byEMCYjhCUvH6se3lvHfLlFHNs5A1EX4CSXnxWWR
	1kwRbHvqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjneE-0000vm-8z; Mon, 30 Nov 2020 18:11:38 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjneB-0000uy-1w
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 18:11:36 +0000
Received: by mail-vs1-xe33.google.com with SMTP id z16so2447113vsp.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 10:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Dq7wgs7NqFyUi65GhuLYJFO9sNtbbe65SBXiBnvq+4=;
 b=ZXrbIa/8DaIaxmun2H25fsWAS8RLe2N5gq5Imr/04QzbQ609MMqEkHkKQVTlL3DDdN
 LUe/cPX1bzXE0eBBl/Is1JV0qVGOzczWmxGBmmS31c1P20iMuERtLDJzbD/4Hgk3a9TT
 ock7ND/J5damPnyRysPzK8apdxzkIZDbtNqOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Dq7wgs7NqFyUi65GhuLYJFO9sNtbbe65SBXiBnvq+4=;
 b=UwnwD3rZ7/O+mqSqT8Etu7Hwb1wJaxzwtKepdT/TfruOgpuo3l0j1XXK2z9os2TA37
 M2gTKWz2hzZKC/uHjyamC5lOzHdtd4MNb/5JS92Me6p30bfKRAGAX/bfZMiD0RmcRuDP
 SXiArGkhdoVzIuWqH+IlCeudLH0eEGPoWOxqe1Ujl9RyNbkTQy2dN2vUFLrIvSp9JcSF
 6ebXFqYcMsiEMOEMaHK2Ppq9W1TA4TA78Xgqb3qp0qUAJkPhzPQMqFTcw3JdaDOZ0ofc
 uyfv0x17NnseyM4TRnI8nuVTFVxf7U2oKUmvfvp9D/7gBnPX+bOWllq7er5IRbmPnUJc
 bhvQ==
X-Gm-Message-State: AOAM532MTiplk1C5ae4ujKF4FwXfxDVY5HT8FqT3P1+zZV/8kgByOzV/
 npUzwT9fUBG9gX1zvucyL3MKiqpaMtaGoA==
X-Google-Smtp-Source: ABdhPJyjt26eMKb8SF3hm3TXRtxTdV2YRYf3efwOVYMC7OS0Ese/lsN9f3OAWdrQ+vz1Sk7ii9i2Yw==
X-Received: by 2002:a05:6102:1173:: with SMTP id
 k19mr16602179vsg.51.1606759892309; 
 Mon, 30 Nov 2020 10:11:32 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id p82sm3881706vkd.46.2020.11.30.10.11.31
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:11:31 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id y186so3087123vsb.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 10:11:31 -0800 (PST)
X-Received: by 2002:a67:4242:: with SMTP id p63mr16948698vsa.34.1606759890976; 
 Mon, 30 Nov 2020 10:11:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
In-Reply-To: <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Nov 2020 10:11:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
Message-ID: <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_131135_147816_CDE3624C 
X-CRM114-Status: GOOD (  30.49  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130181119.md7Y9MONN9mMVBJX7L2Tsgw-ZWu29_WFIfScDxIbeAY@z>

Hi,

On Mon, Nov 30, 2020 at 9:44 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So basically, the way the async probing works for say SCSI is that we
> have multiple "layers of asynchroniety". We have the usual "init calls
> done asynchronously", but then within the init calls themselves you
> can start sub-scans asynchronously.
>
> In order to get reliable ordering between multiple controllers, the
> PCI bus is probed in order in pci_init() (or whatever), so each SCSI
> controller gets called in a fixed order.
>
> That then gets to scsi_scan_host() does that async_schedule() thing to
> actually scan the SCSI buses on that host.
>
> > If so, it seems like it might be a pretty big change to figure out how
> > that ought to work (if it can be made to work).
>
> Try to start out doing discovery synchronously, but then any extra
> work (actual IO like partition scanning etc) with an "async_work()".

Right, so basically this is like how MMC did it before my patches.  I
was just trying to save the extra 40 ms.


> > Just to confirm, I assume you are specifically excluding all block
> > devices attached via USB, right?
>
> I have this memory that we tried to scan the root bus in order, just
> because people will have internal USB devices that way, and it makes
> it *much* easier if they show up in predetermined places.
>
> Note that it really is only the internal devices that matter. Once you
> start plugging in an external USB hug and random devices, ordering
> clearly won't be reliable.

I guess that's more of a heuristic though, right?  There may be
computers with an internal USB hub before the storage.  There may also
be computers (small embedded raspberry-pi-type-things) where the
primary storage for the system is expected to be an external USB
device, possibly connected through a hub.


> So this is not a "everything must be ordered". But people who think
> that that then means "everythinbg can be random" are wrong. It's
> really really inconvenient, because things like disk labels and
> various device IDs are not reliable either, and can be very confusing
> when two otherwise identical machines look different before you've
> installed a full system on them, for example.
>
> So you should strive very hard to make everything that is directly
> connected to one SoC always come up in the same order, for example.

So I guess the answer here is: strive very hard but you don't have to
guarantee that every corner case is covered?


> And storage devices are special. As Dmitry points out, it doesn't much
> matter in what order something like a mouse is scanned. Who cares? If
> you have multiple pointer devices, you'll either use them
> interchangably, or you'll have some other way to identify them. But
> storage is a _lot_ more basic than basically stateless input devices
> are.

Yes, storage devices are special, but the point I was trying to make
is that with SoCs there may be a whole lot of devices (with complex
dependencies) in the path of storage devices.  They can need clocks,
regulators, GPIOs, etc and any of those things could be slow to probe
and we might want to speed up boot by making them async.  They also
could be parented on busses that could be slow to probe or might
themselves have dependencies on clocks, regulators, GPIOs, etc.  It
won't always be obvious which of these things are in the path of a
block device.

In a traditional PC I think there are fewer dependencies?


I guess the question is: why is static assignment of numbers not an
acceptable solution to the problem?  It gives us the desired fixed
numbers and automatically avoids all weird probe ordering / dependency
problems.

-Doug

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

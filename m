Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9247C63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:17:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312CC207F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXJvEthL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eXzgCuN7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 312CC207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zup5wuWfThxnyL7eiJPX2aC4OQJx/ZXcZWEJ8/lgjQY=; b=JXJvEthL8uIT/r2/hUFGrpgTU
	yQ2I6wt176yPL6QRfaDuAXzb+y5Ih9sLX7d2aol/UumTIjQvuhLz4xgOslMA7Za4ixpwR7w8DhqoS
	C9mZl22qnOT7thKzLDPOT5HZzoYgZMoEqNw62Q/ZQgwpGsUW2lh8Ta2YB8R3RcqkNCX4xLGsbY6zF
	Bxzi/uAGvSrXool5A9VNT2QkVZWSaXp7Lw7mVZJmoLVvohTa69kVTPBBYGz+HuCINNAiDrpnp/sj8
	SNYjeE0Bg8j4ulOzH4WEp0OBy4LReHmgLSD3dL/tps9tdJaLeLDqhOH0dE3/d2NLc6+nUxK9ivy0n
	zULeU9M1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjniK-0001XO-Ep; Mon, 30 Nov 2020 18:15:52 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjniH-0001Wt-OY
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 18:15:50 +0000
Received: by mail-lf1-x143.google.com with SMTP id t6so23406959lfl.13
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 10:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H93VChb+sVDTZJCSL0yt9I/1R/7Lu+WEYlaSl0sXgTA=;
 b=eXzgCuN7073pTNG0csTzX/DdnH7UPcUOnbwk6PaAVilE/XN5tq15kUHWr+pOO1gOnH
 qp97XkMGlfswR8jtOJQIcLCC6iRSBQXSw5z6gNL1p6WjoFI3JhOhaDsAZiZxOTT5ZNif
 /dANSWfNakGAJAYTp9w8DgQ/8/5XMhUFXSJtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H93VChb+sVDTZJCSL0yt9I/1R/7Lu+WEYlaSl0sXgTA=;
 b=OX1M/+xSjAX8gfmfbEzRXNUOSyYOihKgAah5nqm1dM6BterZxbdfQ2lXIDZ55i6Zkw
 0M6H/SHf3r6JV+J+gHXewZug1RCBEwCrvlQNhNLV1dYUmiRxDwfgqybIZ97N7opfnhnX
 z1GBQeCDQMo+S1Qun9jpTeBB3su9pldZ4BdTg9kEcOEN9uHzTTbzj6MU7CTB7CBs8oZU
 cTYjfXIRPpwLSuYOlcsfWL1w/X/HKjbRlGxUlgTgiEEulo8LnMRNK+9JVDJDgK7tonN2
 TwW+Q63OyAv+D6rqL5OiQyslQgZ5nlgSHKrQaduWo1VreXgPcYPVUI+HGrg8JoyPBduC
 Sfpw==
X-Gm-Message-State: AOAM530z97LHUWYIHkErwD62JyFmlPYbNhVC6VXqRAGANvWkYHyr6rqy
 wcRUC/ocYRnjg7eEGcgx39zmGeRXzEzrgQ==
X-Google-Smtp-Source: ABdhPJxtDC6TvsJ5sTzGs6UNFmojnu2Zj5BC0OBhpH5xqou4hN2KYvL5y4VNcCaVGz7hcaCd8zpZog==
X-Received: by 2002:a19:e215:: with SMTP id z21mr10249619lfg.414.1606760148060; 
 Mon, 30 Nov 2020 10:15:48 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id q7sm2992281ljh.79.2020.11.30.10.15.46
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:15:46 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id d20so23397434lfe.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 10:15:46 -0800 (PST)
X-Received: by 2002:a19:ed0f:: with SMTP id y15mr9347723lfy.352.1606760145852; 
 Mon, 30 Nov 2020 10:15:45 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <20201130180523.GZ1551@shell.armlinux.org.uk>
In-Reply-To: <20201130180523.GZ1551@shell.armlinux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Nov 2020 10:15:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgZhkMu5UFgmD2Yt96S_nrhMzTTXfqOwgBe4nsg0R_M6Q@mail.gmail.com>
Message-ID: <CAHk-=wgZhkMu5UFgmD2Yt96S_nrhMzTTXfqOwgBe4nsg0R_M6Q@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_131549_954209_EA8442AB 
X-CRM114-Status: GOOD (  17.65  )
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
 Doug Anderson <dianders@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130181529.eZOWayIdy2Fd9FN4SjU0m1Hf0oQNgxN_0rlK7vWQ8LM@z>

On Mon, Nov 30, 2020 at 10:05 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> If you think that /dev/sda for example is always the machine's internal
> HDD, that is wrong.

Yes. See the whole part about

 "Note that it really is only the internal devices that matter. Once you
  start plugging in an external USB hug and random devices, ordering
  clearly won't be reliable.

  So this is not a "everything must be ordered". But people who think
  that that then means "everythinbg can be random" are wrong"

in my email.

And the key word here is:

> I have a HP Pavilion laptop with its internal HDD with a Windows
> installation. Because I didn't want to destroy that in any way, I
> bought an external USB3 SATA enclosure and SSD, and installed Debian
> Stable on there.

.. but it will still generally be stable with the same hardware
configuration, and not fluctuate randomly from boot to boot when the
hardware is the same.

Is it a guarantee? No. External plugged in hardware can change things.
In fact, when you have things like Thunderbolt involved, since it just
looks like PCI, even the PCI probing order won't be the same with or
without the plugged-in device.

But again: avoid randomness. The difference between non-random and
random is that one is predictable and one is not.

Predictability is good. It's not necessariyl always achievable, but
it's very much something we should strive for VERY HARD.

Predictability and reproducibility help debugging enormously. It means
that things like "git bisect" work a lot better. It makes user reports
much more understandable when two users with identical hardware see
identical issues.

Seriously. Anybody who argues against reproducibility is so far out to
lunch that it's not even funny.

You seem to argue on a complete technicality.

            Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

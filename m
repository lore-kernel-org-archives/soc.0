Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02347C63777
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ECB9206F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 18:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CetOb2CM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T3JHFa6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ECB9206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wrho3CwMoMYesKC2V+aarAugaNOZ9M7Ae7rMzxUW5SI=; b=CetOb2CMXYN49SxnZwYytRIZe
	5fwB6bmKmGpB5S7rdvsRmZx4zUhwXVTl88Xx/Y2gH66IqMGfJAyvUl0B3vNEuh7I0mHsnjCwujzEf
	VmpsrfMH5VvwR720e0um8r90lr/bB2jp3xAqLCljR+zB+nuyUlNfHSCcSSW3r3RWtmhx5DUxgmvWk
	K0OKIpNx0If18vQ0IiP4ikM7btfZnKvXkZ8P3bsRB37XmYfw2dkCCLZAz8ySTMHKzt21uy8ztoyoi
	9Y93l+sHUbY22HgSu2wsouSseR+2HM3I+FO33TCrBielOBMjTaq/rEXbQVkUbEcx6JNGr8EBbIw5o
	n7GFFy1AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjnpY-0002RB-Gr; Mon, 30 Nov 2020 18:23:20 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjnpW-0002Qk-G1
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 18:23:19 +0000
Received: by mail-lf1-x143.google.com with SMTP id l11so23520959lfg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 10:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3wsPs7gnC3/t/rTahaWNN74dCjJuviyFHSHKHhvgoAY=;
 b=T3JHFa6MTkq+VOk0GAbb3Hdo++K9Cf6gCbjyoUak9gPGSfjnbUXNChVlLfPmr6VD80
 sx+p1+g3CNmEyeSgqaqqDxjcC3VE6QGe9DAfNtjRjGt8UgxptHZBv2aWCdpfx1MX9Bof
 wglxUVF2HbnRMwq1on9b36hH9zdcb3fjSSpE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3wsPs7gnC3/t/rTahaWNN74dCjJuviyFHSHKHhvgoAY=;
 b=X9qMo0zSKZVlh0/pBxdN6z1aDKg9AEcByPsaHfruit7LngCKUsx0HnqTZkN7FnNvrM
 1iha8w3u4LkCdxUQp52/sHd6Ja6ryvNM3J8pGCRmbLpsqwPGRvPyAcQHh/GQlIo1NlLI
 mK6jlTB5gPGXg85x0r4jfXg2BDjOKYyax3mS5R5+SxaYZQXHdGKQR1fsCYrJjzhGiNMe
 53IVWPoDujXuaQqAdle67MVsIcV8Xp24iqdWaFOlcJMntN4oJ84mZORBFT41Fulqj5Ms
 uPT0jGEZydsXLZS8UayX2WObK6ZpjRpGqgd80G9KpHLdkiBCuJpL3dfpdQztDQt29fcp
 yXgw==
X-Gm-Message-State: AOAM532AuxdidnG2k+SUWNPVnEOl6geBZ/QPuZPEpNzE+rekxsDvGrJL
 BtoAeNOYVeTD6rQtdm4IfGfDX8CEg7Q1yQ==
X-Google-Smtp-Source: ABdhPJxltlQaWTb0DAGvsKBIg5MsPS85fHFFh3Yz0PKFOicC7YVpR+CB6YUk0pLuvU0mj+Y4LpZlmA==
X-Received: by 2002:ac2:5a49:: with SMTP id r9mr10340983lfn.381.1606760596652; 
 Mon, 30 Nov 2020 10:23:16 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id p15sm2553105lfk.111.2020.11.30.10.23.15
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:23:15 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id r24so23470595lfm.8
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 10:23:15 -0800 (PST)
X-Received: by 2002:a19:c301:: with SMTP id t1mr9587473lff.105.1606760594943; 
 Mon, 30 Nov 2020 10:23:14 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
 <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
 <CAHk-=whtySEgkH+VFy9oW8Q-+iuivGBo0hOUcee3DvrsBAQUrA@mail.gmail.com>
 <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
In-Reply-To: <CAD=FV=Up-JW8RtMLQ_pAG3e0d8NnpT+rDiguxcz3DnVUz_7Jbw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Nov 2020 10:22:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
Message-ID: <CAHk-=wi2CQwAnKucLwE8vNZgXxyRy6L+DcgjGqxKHwbacKgaMQ@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Doug Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_132318_681449_5D186C42 
X-CRM114-Status: GOOD (  18.03  )
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
Message-ID: <20201130182258.sJFt3R5mIbQgQ4UCJ9Mo_hV4TO4UztyxhNzH_gxuXqE@z>

On Mon, Nov 30, 2020 at 10:11 AM Doug Anderson <dianders@chromium.org> wrote:
>
> So I guess the answer here is: strive very hard but you don't have to
> guarantee that every corner case is covered?

Yes. Covering every possible theoretical case is basically impossible.
I mean, it can be something like "the firmware glitched for whatever
reason, and didn't set up a device, and it didn't show up at boot at
all until you did something explicit".

(Example: airplane mode wireless switches, but also possibly things
like just slightly unreliable USB hubs etc - I bet we've all seen
those).

So the rule should be that you strive very hard to make boots have
reproducible behavior as far as practically necessary, and avoid
obvious timing-induced ordering issues.

> In a traditional PC I think there are fewer dependencies?

I'd say that they were "different", not necessarily "fewer".

> I guess the question is: why is static assignment of numbers not an
> acceptable solution to the problem?  It gives us the desired fixed
> numbers and automatically avoids all weird probe ordering / dependency
> problems.

I think that if this had been done originally, it would probably be fine.

But I still have this - possibly unreasonable - expectation that the
promise of DT was that it wouldn't be 1:1 tied to the kernel all the
time. That was always the promise, after all.

So the whole "add DT markers because the subsystem now screws up
ordering" smells really bad to me.

             Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

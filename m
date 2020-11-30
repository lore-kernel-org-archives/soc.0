Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C393C64E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:29:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16D12076E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x+O5c0+z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPx1RZXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16D12076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LshZdP/uRxjAmQ+iUnD0QN9vi2FeoSqEugvGAhp7l54=; b=x+O5c0+zTe227LZTKs7uzc8g2
	CK0sZZPq06t/6wvn3cOqadLGO9Ggb0ByAyh6FubTqIsAybuoJpGmJ+MnViKFVvn73iIMoH9cmyMyd
	zj4vCKzslOLCHsBVOHWX03B6Aj0EDjyg9rvmmk1ZiaD5u8zmso4qg/a6jnakIMuMKyH4Fb5cZYD9p
	kJBhBGnfsPJhiTlNk9ycJIaQye5PSDe2zp2+Ao5ycTvnuQ6ruAi7StpJePZX1Kl9HgrNiiPUqmO5K
	a1FbOF4MPtjEbEIe+w9lpJO3XksxV042YLavtgtR4r/U9bXLfkqAmcJf5/aFcQYHBK8NqTXXCpKTP
	7e0yq6rfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjmxo-0001ah-8J; Mon, 30 Nov 2020 17:27:48 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjmxl-0001Yg-Ou
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 17:27:46 +0000
Received: by mail-il1-x141.google.com with SMTP id z10so3614444ilu.3
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 30 Nov 2020 09:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c1Vd/fR6g8wKCZaURanPYDdeMR44y3LFyKTjW1Typqg=;
 b=HPx1RZXZNsy8M//eK/7kOCaSUaWAAX7fONUWyezM24Q2XUD0+BKVnoisJ0C4vGJAHb
 dpSYTjfScL0RG8De+OgMc4aBzQgOeaAScILDnBnSbZ6IYY5M5FdoGUJO9AhN24u8PqJ2
 //nIYs1U1gwGRjsRz8mWlNYQSuv+a0JUT/FUlar/szHwD5pMn525jAyIj0Lh4ISmrrnR
 yV+YjJNmM3Vg+8AiOLhZ3h3eX2eq+JKwdkaeElXR4FgkS57ZidtEVyXXTgRDDGKbX1wk
 +T6CJB8C4eCz6+7TxiF5ht0jijdg+yTIDFYbBsjIrOGSgLf2cGFPDFQHc7JpIp4QUdsQ
 7MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c1Vd/fR6g8wKCZaURanPYDdeMR44y3LFyKTjW1Typqg=;
 b=LBIGA4rngwHI9mw0l+iG0dXwFcMLQKNp0rKHi22yXsXlQ+gyCjn6ouDKWtSu8e5fwV
 iTGeL5IY/2fnGLBT9hkfSc3ZQlhdH+9a9YEGSIrA7pOyFmS7bsxqjg1vPv6ZMuBRnSc/
 1+vrePF9YYfU7/U0Bn4RJPd3QTLHoXPgdBQnwA+xMI3oS5J4Pi0qWmaj9Dd2UKfgBJQc
 ErNDt25+PnMYFVyLgCekqSYQzzSyn5xn57GRn8pgRcijxPUeuVrkkDQ4Dk1AuDqbBloA
 fxG/ik0Zao7/jBmPDUeeL8zMYs7LWzr9N/hTlOrkWXU+U31Xpvm3aSUH2xQpvy7ynLA1
 XLvA==
X-Gm-Message-State: AOAM530NX1HnT7oOgMxowx8WXP33aZRFGFenANYRHcriVC3gInkp9nDy
 uintrr+WWdxunRFj87/wmYZNUEd5AtPaRlkeeKo=
X-Google-Smtp-Source: ABdhPJzc1TmhusDdrQNhIh4x01OuKc5+8edgdoreT8fMqA8YQZsrXmqQSAslZWMfzsvzZ3iuByUoOGEhdE/6dOkpDm4=
X-Received: by 2002:a92:d203:: with SMTP id y3mr19643539ily.206.1606757261315; 
 Mon, 30 Nov 2020 09:27:41 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
In-Reply-To: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 30 Nov 2020 09:27:30 -0800
Message-ID: <CAKdAkRRq=GK7N1PDJ4zLfJVSsrd1BB=u69aXtJHh=sW4vn5LOg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_122745_821375_A6911FE8 
X-CRM114-Status: GOOD (  20.39  )
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
 Douglas Anderson <dianders@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130172730.o6Jk1BkV0CRX4hckmL9uQvVGpCRV1iLs3l7oJDUnqaw@z>

Hi Linus,

On Fri, Nov 27, 2020 at 3:02 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> >  - Some DT patches for the Rockchip RK3399 platform,
> >    in particular fixing the MMC device ordering that
> >    recently became nondeterministic with async probe.
>
> Uhhuh.
>
> I didn't realize this MMC breakage happened.
>
> That's just an MMC bug. Other subsystems have been able to do async
> probing without making device ordering be random.
>
> So this really smells wrong, and I just never realized.
>
> Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
> behavior appears broken.
>
> You basically should do the device numbering synchronously (or better
> yet - asynchronously, but single-threaded for the subsystem), and then
> asynchronously probe the actual device details after you've numbered
> them reliably.

Generally speaking it is either unnecessary for a lot of devices where
we do not care what number they get, harmful (why do I need to probe
i2c touchscreen and touchpad sequentially if I do not care which one
comes first but my boot will take 0.5 seconds longer if I serialize),
or impossible (if device is hit-pluggable). For many years userspace
has been moving away from static device assignments and we should not
be going back.

There are some devices that are special because it is hard to deal
with devices shifting during early boot, and for them maintaining
static ordering might be beneficial for now, but they are exceptions.

>
> This is not something new - we do this for pretty much all the other
> block devices, and MMC is just doing things wrong.
>
> See SCSI probing for the traditional horrible cases (where just
> spinning up a disk could take tens of seconds).  "Slow probing" is not
> an excuse of "random ordering".

And still my external USB disk will get a "random" /dev/sdX depending
on when I plug it in relative to all other USB sticks.

Thanks.

-- 
Dmitry

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

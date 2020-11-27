Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9BCC3E8C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 22:58:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF9522228
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 22:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WV6No88o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YJi2Oh06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF9522228
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yi3Rcu3wvAhhjmLLuJJqy0sEDyS5uYsMkhNvX3YQyn0=; b=WV6No88oNrQQ3aEb/TCq8ry7c
	5VZ89tW143PD5i1JYDUWK7AAGZh++YrTgmHxt4isZIDk4kF/wyCeJN4T2RteP8TG6gokkEAf6UgMI
	ECSO4kY8zTtRVeBZmx3Sj8n74vOANLgNKUyxW1mBDp208V2ALg2II1N3/SzavbLqbbbG6/O0MEIQb
	PYZzMTLJs/kzTUODxymUhsA1GANLOCGjXNnKhzVK20NDeKMs4pOqlxQsetLDyyaWH5YSC/WrvTDhe
	6E87OjNuB43ml1CIVe3j/ijJ0Og+X+ftcJoB0OtdbDQdNacv6Lk6k5Y0LT2dpj7v+koHAARUnkRxr
	b7ncTmmrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kimfk-0001k4-3t; Fri, 27 Nov 2020 22:57:00 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kimfg-0001iq-5N
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 22:56:58 +0000
Received: by mail-lf1-x142.google.com with SMTP id j205so9069897lfj.6
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEgXuLgFFzflMIWu+IVyNpreE9VNoLiTG5aY7t2AQp4=;
 b=YJi2Oh06MyyGpLhe+AmMQCgYMmgqSCD7S2kZLK8zqo9j65RnK/mBoJJW4dzgwUXvAJ
 U2eQMkq0jAxgRs0GvBfqfPFkpNBWDeFVfQseoeKJwCShaw41PMvcBHtF4sbEY3LH2GIj
 A/ru4rUm7qsKXuDC2Jdhkep9uzhy//aLQ6/+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEgXuLgFFzflMIWu+IVyNpreE9VNoLiTG5aY7t2AQp4=;
 b=Tc4nj8N/PWIrXkzMDbEsL0LS3UGL/73BTQft6+JNpgzbw5cSSOgFCWoOJkXsPEYAzy
 ygarxxrnhfaKxHAWOgQu05PDQLuNXA8P5JXivjRvq/an+TAXTmk6gc8bs7/dGKUy9cAG
 jkU+pQepFxJ7i76q2GLit3kmQUCeVMWbMmjlhmmg/mjZGYvUIU4xYpMILO2U0zSF0YJQ
 oQFeIHbMPs4wpnpqh0IK9xWSgCNO5myo/977v9uklJRg7rtuCVq9uUCUUzSo695lddFX
 QvUs/gc3kYPIPPev8/NsQ2W9YM7HTFLxMNW0mPtVydBTre3lfBnLc1/35owlQjMw5NGm
 iLEw==
X-Gm-Message-State: AOAM531J5BXzkP/CZzne3HtPILgCQj7sjiGJG4UKFxKhLKEzdb0szM2T
 lydSeKyYXfXwTMinfqlE+i+gmSl8kvKGEQ==
X-Google-Smtp-Source: ABdhPJxkFwpmPuG1bx3vVOXmowz15oRqOR1jPeOIHJ8WLn3QJWKvmuq3dLFCdkxrPLQ7Zg95cA5aVg==
X-Received: by 2002:a19:4915:: with SMTP id w21mr4734376lfa.57.1606517812450; 
 Fri, 27 Nov 2020 14:56:52 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id w21sm874682lff.280.2020.11.27.14.56.51
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 14:56:51 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id l11so9099793lfg.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 14:56:51 -0800 (PST)
X-Received: by 2002:a19:c301:: with SMTP id t1mr4235349lff.105.1606517810846; 
 Fri, 27 Nov 2020 14:56:50 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
In-Reply-To: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 27 Nov 2020 14:56:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
Message-ID: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To: Arnd Bergmann <arnd@kernel.org>, Douglas Anderson <dianders@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_175656_333399_A76840D8 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127225635.utGiKgeu5oKDCMarIkDRZF2zCswvPie4MIUp3bIjxEY@z>

On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>  - Some DT patches for the Rockchip RK3399 platform,
>    in particular fixing the MMC device ordering that
>    recently became nondeterministic with async probe.

Uhhuh.

I didn't realize this MMC breakage happened.

That's just an MMC bug. Other subsystems have been able to do async
probing without making device ordering be random.

So this really smells wrong, and I just never realized.

Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
behavior appears broken.

You basically should do the device numbering synchronously (or better
yet - asynchronously, but single-threaded for the subsystem), and then
asynchronously probe the actual device details after you've numbered
them reliably.

This is not something new - we do this for pretty much all the other
block devices, and MMC is just doing things wrong.

See SCSI probing for the traditional horrible cases (where just
spinning up a disk could take tens of seconds).  "Slow probing" is not
an excuse of "random ordering".

Behaving randomly is simply not acceptable.

             Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

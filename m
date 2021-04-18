Return-Path: <SRS0=VTwl=JP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F38BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Apr 2021 19:26:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B82B8610CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Apr 2021 19:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B82B8610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jjCKnpvURsXXtODAMwml3zfS4bhEH6p192g+Z8xCHgQ=; b=panXI2Z4OiP8Glwj8VlXt2L51
	26/3zwNOgJ7tCAXKtly/Da4SXZq+S7DhcLpB1Xg1nykFhwjkg8wLq5Rk+lF0y6D6v6K+BEOLfFdZv
	+j8YU4JBLRObFRUvafaY2yrMRiPYcQiHMzqgspsDNtGucSarhcrH+U1D+xKUhBJW2DDs76qoLPLap
	oTfYaPPi3cg4k/8OHfyRHiwpGZfERkZOrvcu4TD/0wP3t7KJMX0Jh0lhYRlu/g3T4f4GBJOSseb6j
	NaPZssQXfnu57Ls0UgJroXFh+XhZgEUa/OsQI+gsnKyLRwfyuL4wJQ21/9KytzVTCTTF4CpW/jyj+
	tkbBqywcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYD2H-008T5T-9X; Sun, 18 Apr 2021 19:24:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYD2F-008T5L-Td
 for linux-arm-kernel@desiato.infradead.org; Sun, 18 Apr 2021 19:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1swf5xPNu1iJRk8GdncptQiYf4RzG6bV0gHzM/9LAWo=; b=3GvbLtf6HxW7LeQ8SISbSfS0cV
 2UhxSFqRe0qu4r4SOzWuTthANRBn0lBmVUqlqMYmHlneuETjnN1oQStKrLrEqiHBu4UkiYM2j3rLf
 wA9OebF3lYcXyt/ZEYEJPJutld0WBU5LFj6HXGI2nq7FMGpJ9SVFMN/u1CpuAB/w5Fd5FKEdu6HMO
 EdTEkpbtort95iSebZMA/fBMapxytOwxC97h21jifPLehxcF/6pjKhbpbghwKtfYsUL9dEGVaKMNr
 MZEyQAGCEligotwWzEvLsqCNofctPfyV0I79D7r8H4b5poew38HezfzQiw0yDiNjGhiB/sj5KDWzU
 ZMXMDJmw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYD2D-00AcYC-Fj
 for linux-arm-kernel@lists.infradead.org; Sun, 18 Apr 2021 19:24:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2CFC610EA
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 18 Apr 2021 19:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618773884;
 bh=4Se/bEEETibAB00qp1t/rKwtQoxtk+0b3mGt76pulPk=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=OMp8LkIjCM5uUvdf5CMGk3k5v3I25L60xFZeEN0hGuUEHpwLKrXKnVn3UoN5zEZhL
 SScfaXvUgHjrw0+FgklZpW0uJwkiCFJaEC3Bm53RqS6100eGXn7soWbL78nFVZRfnc
 2oVASMIHzCgubDnW39b4AdPY+a99r2cqO4WEJ1m973sVlsFjiYnf/9C1/bGNzXwECm
 Yjan5VuRygYZ5hO3hXqOkI42Lr6MbJKjx9ecZCVjnJXMvCzDogiRmsrGt4OoLu83MB
 Dcwc/R4FPNuxTHjsV5h0S0Ry4AdHEfglW5e4eTX1ZZgmghDjnFCbcAmbEVaqn4YCNJ
 vh/18WDJprOYQ==
Received: by mail-wm1-f45.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso6998593wmq.2
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 18 Apr 2021 12:24:44 -0700 (PDT)
X-Gm-Message-State: AOAM531m5kUZaxawzIPAiiuqCFrZkp4MuNq737ADANLE8I/4paqKTUmd
 EFVr4StLH+ny/gEJnlFl7uY6/RLDGXI68lSPZKw=
X-Google-Smtp-Source: ABdhPJw60C3cNf2STVU/AoQJg0Y5c/7RngznPFd6F3lwHWK44L/t6UsO78u2X9+QWvvz2igoPVq7rnMavwBP+0JdEKc=
X-Received: by 2002:a05:600c:4149:: with SMTP id
 h9mr7114451wmm.43.1618773883527; 
 Sun, 18 Apr 2021 12:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
In-Reply-To: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 18 Apr 2021 21:24:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
Message-ID: <CAK8P3a3oQm7P=Mj2xU=8v=g82mN-OXk7yrPmFMcK0XpMpwRctg@mail.gmail.com>
Subject: [GIT PULL] Re: ARM SoC fixes for v5.12, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_122445_566820_C11449F2 
X-CRM114-Status: GOOD (  18.17  )
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
Message-ID: <20210418192427.RBb9kEHP2XjCcBKjy0e8myi9MsS-TpkcBhJ_pd9R7eA@z>

I forgot to add the '[GIT PULL]' in the subject line, replying to myself
here to ensure it hits the right email folder.

On Sun, Apr 18, 2021 at 9:23 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:
>
>   Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-fixes-5.12-3
>
> for you to fetch changes up to b9a9786a13ea158ee3b23614217f2e3158178421:
>
>   Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
> arm/fixes (2021-04-08 17:56:09 +0200)
>
> ----------------------------------------------------------------
> ARM SoC fixes for v5.12, part 2
>
> Another smaller set of fixes for three of the Arm platforms:
>
> TI OMAP:
>
>     Fix swapped mmc device order also for omap3 that got changed with the
>     recent PROBE_PREFER_ASYNCHRONOUS changes. While eventually the aliases
>     should be board specific, all the mmc device instances are all there in
>     the SoC, and we do probe them by default so that PM runtime can idle the
>     devices if left enabled from the bootloader.
>
> Qualcomm Snapdragon:
>
>     This bypasses the, recently introduced, interconnect handling in the
>     GENI (serial engine) driver when running off ACPI, as this causes the
>     GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard
>     and touchpad.
>
> Allwinner:
>
>     One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine,
>     some MAINTAINERS maintainance, and a clk / reset switch to our headers.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

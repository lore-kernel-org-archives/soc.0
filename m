Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E34C5519F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 20:11:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D20F021973
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 20:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKYzJmxY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IanKyMvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D20F021973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pFSMna3zrcePxUK00gnm+mSCUnZDfXoYuJbuYBkBCBQ=; b=cKYzJmxY6tXsakeZp3gHHLyRU
	KJuUn3ES65oGBH/rHoSnT3jT8pTgLFZ0qUeIR7A+n80oiL+rJ+CjExwjzcf2+WFf9HE9vHZqh8di7
	RMe0EgxUC9onpaKBlqDtXuzPFA3sYXleVPh04ozqUBztA6emFgbCf30DT54YS8x7dvCp0Zgwna043
	Eeb3WO8IiZewEa2LdUK7vjF9CIC4pLIr89+g2Sh9Yp5LBQU3nLFFO3/bH2rkxof2eZN6SFBkTkSId
	VH8T1Y1RfoQfTqF3WhZxM0qfLdLk0TaKc27BvbZPjTubzWzpSJ77+BH85XVX8yyE/9iIoO+B6Vz2x
	XIXheE3aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kik3w-0007rN-0P; Fri, 27 Nov 2020 20:09:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kik3t-0007qv-Bs
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 20:09:46 +0000
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E675206D9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606507784;
 bh=xjkHz9LU09u19AHW6KW9MzWfb2YsS3rWnAT4/GCrQhA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=IanKyMvdNv5mUOKTw22O2cuKiTFR45lN8HizXRY2Ml7kY89UuUuLkvwihfMEMk2ha
 EEaAYtVCe8nh4zjJi8fxQPXSR2of1N+J89tte4+5jXpEojIOPtTnje9TBS4pSf7ck+
 lG2gjOUGIjdvCs7RtQ8L43e4zyaOr0UvnrGagCKA=
Received: by mail-ot1-f54.google.com with SMTP id o3so5651134ota.8
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 12:09:44 -0800 (PST)
X-Gm-Message-State: AOAM532Ps+fAzz584vSBP0TbZkbxQe5ev8b6CjxNLTakSUsenC5kvcrn
 slWRv+8ljvikRYU8EB3XMezF2d7ilZDooZvLPG8=
X-Google-Smtp-Source: ABdhPJwA9ea8MXWuapY3zEriuULbtZBo7olT5s8nw9s1eotIg7jG5HhjvMb1CMTlrG6XScHncBcY2XX4VHfwBCZmjoU=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr7537248otk.251.1606507783711; 
 Fri, 27 Nov 2020 12:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20201124122412.22386-1-sudeep.holla@arm.com>
 <CAK8P3a3xN70zumQ-gwiBxGwoia2bkfGF-c5r=KY3ihhXy4F89g@mail.gmail.com>
 <20201127100007.iu657u63jnoeg6g2@bogus>
In-Reply-To: <20201127100007.iu657u63jnoeg6g2@bogus>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 27 Nov 2020 21:09:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a07J7dUxd4v9ks0uV6RB5gbzC84f1rBRpuXVrtbXSE9mQ@mail.gmail.com>
Message-ID: <CAK8P3a07J7dUxd4v9ks0uV6RB5gbzC84f1rBRpuXVrtbXSE9mQ@mail.gmail.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.11
To: Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_150945_505288_19B44D61 
X-CRM114-Status: GOOD (  24.69  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
 SoC Team <soc@kernel.org>, ARM SoC Team <arm@kernel.org>,
 Olof Johansson <olof@lixom.net>, ALKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127200927.ZJG1RwbUY58-H6cDFWzSSuTYBV8_Vhc3v7PUfd0WajA@z>

On Fri, Nov 27, 2020 at 11:00 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Thu, Nov 26, 2020 at 09:54:50PM +0100, Arnd Bergmann wrote:
> > On Tue, Nov 24, 2020 at 1:24 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > >
> > > Hi ARM SoC Team,
> > >
> > > Please pull ! The tag is based on v5.10-rc2 to avoid conflicts with
> > > the fixes that got merged in -rc2.
> >
> > Is there no way to avoid this? I would really prefer not to have to backmerge
> > rc2 into my existing branch if it's just about the bugfix.
> >
> > I tried rebasing your branch onto -rc2 and only got a trivial conflict
> > in one line, and even that could be avoided by merging in your
> > bugfix branch instead of the whole -rc2.
> >
>
> Unfortunately the branch/tag I shared with Mark Brown to merge the voltage
> regulator part is also based on -rc2. I might have to drop those patches
> from this pull request if I need to rebase on -rc1. If that's OK, I can
> send fresh/new PR based on -rc1. Sorry for the trouble.

I ended up doing the backmerge of v5.10-rc2 into arm/drivers and merged
your tag on top of that. I'll have to remember filtering out the changes
when I send my pull request to Linus, but otherwise this seems like
the lesser evil.

     Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

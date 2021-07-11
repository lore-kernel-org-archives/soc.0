Return-Path: <SRS0=hrpO=MD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C3CC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jul 2021 01:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7345F61278
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jul 2021 01:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7345F61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gv8fNih1EJ8AAwh5EQ+knd38Ad7RPy+tXpAdd4VwdHs=; b=ahn9ZejBOCVXOE
	iT5UcXUsfQ3zzhof5I2UsI8YsCiyyGfbp/NE6b4Jn/J+sqdD6m3QPJXcsdpBMiFFAw545eNkwD6hZ
	T66/D8gsd5iWWFoBN1p+bE4xkVBad/4S21RtbeDOObZ+HOSjU9jSQaJCIh7qjLp53bCRMFpDQm/sg
	rgeRcOxCxd9bxA6oNxCWGoJDyXf1x+qz0fRvCZ/iL7neZxysa+DMeW/Q/UkrnGN3m+lXway0aAFZ1
	Uxo4Ucv4dc5ejO1v2v+8lyN+kY5FRR8AhALFiQcb3T4pRJi3Sm6v9c3dv5wSYcHvqGx8BzkN1wTNR
	eCocDtfuBFRtT2vSjdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2OTv-004Tph-6Y; Sun, 11 Jul 2021 01:42:07 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2OTr-004Toq-KM
 for linux-arm-kernel@lists.infradead.org; Sun, 11 Jul 2021 01:42:05 +0000
Received: by mail-io1-xd35.google.com with SMTP id l5so17639464iok.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 10 Jul 2021 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DviByeW/MRd4o8QAxjQbNiyDl13TlKgHIeZcYevPf8U=;
 b=aEKYNlLyKmBIhtj2zpIjSnRJ+Qd4EOAwRFeseUtJvCj6OD+ekcsQK39PN/zn6cNbHl
 WGSEQ2S8qlVvBsOEXTGLUc/zrTpNltS/TXx2jqMA41Jqqjmj/Af+gcz+Wfc2H871qsbD
 kKOMiwfZo5T7EKQAU1PHMq4l/nkGMMHdValSnpEVrSptiF7e6jcC1kJ19HoiU7LfIZkF
 /XwH6CJ/JhwJf3FzqaXGVRZUtIzo6ZiOIzO6wkbPoi+W9jHLWPTMvUOdtbP8FR5nZFlA
 lC/t59OmgEJe5VGRTKxlrBEtrR3vgxjt1E3MV5HMMAyFnqCO9LazZ+8fTjSIz9M7RjA3
 IFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DviByeW/MRd4o8QAxjQbNiyDl13TlKgHIeZcYevPf8U=;
 b=nLSVtOU5bikbM1sZQ0vG5bl3BvHVkwnhT/mQhMqF2OjyC21+o4siAZZXD4ye8NPj8r
 4gyd+kNZme/PhAzgwvtgpPmiQx198F0K2v18mIjicVzw9IQVKJIc4j9qdNPamUKCj4te
 c+N3XGkQ6TqD+I8fjeaaalYXAzxkdJT31JS/AhECqSz0maYqRocygIOIw6gXjeLz5u1r
 r0i4Q1+5xy3ceNXHODYoyCmaNo81w3qSFhGV6qb9gpi/U5AR8GYRuYflIIQ6vxmcmUTS
 b67hf0XoHbrAlUbIdZicirYwUzCyRwbbFaWTnE5ABVczctxmOqPGB0vZpJYClGNiWRvf
 7USQ==
X-Gm-Message-State: AOAM533JRZN6w9qVQREAE8+8U7XNkmsrmbcYbJIu58h+Ke7/g+9R2QF5
 BO+YVUKEh+z3l9YohKkH3BoeC65TvzswIomE3uDFyQ==
X-Google-Smtp-Source: ABdhPJx+rpq4HSXSp6jfp7UQ0J9hdUAfM226zfK6hZLavZmabddYLhfL+ajhRe1PyVE3+Be8kXbBeehdncaxRpDO7es=
X-Received: by 2002:a5d:9051:: with SMTP id v17mr33836994ioq.81.1625967721832; 
 Sat, 10 Jul 2021 18:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210709234054.10288-1-olof@lixom.net>
 <20210709234054.10288-2-olof@lixom.net>
 <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
In-Reply-To: <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 10 Jul 2021 18:41:50 -0700
Message-ID: <CAOesGMjzU7bgX97_N08sLPsEew_6iHeQAi4EKgFK9EZVmMP+sQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] ARM: Devicetree material for 5.14
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_184203_762520_8F338817 
X-CRM114-Status: GOOD (  17.61  )
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
Message-ID: <20210711014150.wiA1uMtOTIgbYK8kIosDsGfyImlUJU115sPrCuzI4ps@z>

On Sat, Jul 10, 2021 at 9:45 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What?
>
> My shortlog matches yours, but my diffstat isn't even close.
>
> You show 554 commits, but then your diffstat as not a single file from
> arch/arm*/boot/dts, and says:
>
> On Fri, Jul 9, 2021 at 4:41 PM Olof Johansson <olof@lixom.net> wrote:
> >
> >  97 files changed, 8428 insertions(+), 5174 deletions(-)
>
> while mine is very different indeed:
>
>  552 files changed, 24060 insertions(+), 3691 deletions(-)
>
> I suspect you got the diffstat from something else entirely, because
> mine looks a lot more believable and matches the commits listed in the
> shortlog a lot better..

Yeah, this was an operator error at my end due to the workflow I have
when I generate the pull requests. Thanks for noticing, and as you saw
on the 3rd branch, the info was swapped between them.

For more detail in case anyone is interested:

I merge the set of pull requests one by one on top of your branch, and
then run a script that generates the pull requests. At least when we
started out, git request-pull got confused and generated wrong info
when we had complex merges.

This time around I generated them backwards: Merged all 4, then
generated the last pull request email, reset back to the next head
(with the previous branch), generated that, etc.

The mistake here is that I mixed up the order of the two middle ones.
So I specified the tag (and got the commit message from it), but
obviously the diffstats and the shortlogs ended up generated from what
was in the working tree, i.e. the other branch.

My bad, and something I'll double check for in the future or add a
sanity-check for in the script.


-Olof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

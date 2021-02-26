Return-Path: <SRS0=yS1I=H4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CF8C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 20:49:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9B464F0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD9B464F0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ijov5sxyZp56ZhPau8Doqz0ck1RT2uTyRYHp/yAZ8dY=; b=ws6dSRS2GU77tDKXUO9Cg4hpC
	Yws7FTW2ngoHdi9yQCUpl0DB3Dj3dSEpzXrgXTdriI7D712BBQ4xzS0tGkmkqcNMOAAxzyWMPoNit
	TY2nT3YZyFkkbt31WXmkNQNIfF05fVMlZBbmE8j9gyP4t007WfUB6v+LGZnegUDg+91w0VQ75tXpx
	XDjLO9bmASKuNXiRaK02aUpRXxJkwTU1wqR6hOB3vevRZzMIDVQXV3tQCrP/cEvundE+z4o1yHhpv
	puQaRIhx0ATvXN0vv5F2YtugTc/cytNpFHMpORuzpSBwtwWl8FPhRKCXWP1vxN7P3St9LbpfWOxu3
	GxVwKe7RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFk19-0005wX-KN; Fri, 26 Feb 2021 20:47:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFk16-0005vv-Bh
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Feb 2021 20:47:17 +0000
Received: by mail-lj1-x229.google.com with SMTP id u4so12127913lja.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 26 Feb 2021 12:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o5m09NeCFmgUIFbH6bFaGd//EU34vmPkiCWl7hgRUY0=;
 b=VmMtrwsfm54uLBaQBt/sYsvvIUQW1YOTdLhZo+8pFV6kESOp8e7MhrVbaHqaf616En
 PmCNqmmP4lasf/xD5V84Q8u2vvJnuFd+SinildC07UzxKLSm+4fcwDPstHjSipBI5D/I
 Pkddvx8VKR1JCKmAFPYszvJ6xQ0PVlULvsbZNIx8Y9SX7fwdYm3KuMH6VCbvFLDkbpmY
 UeNG8n6d+eRdOwY6vU0UCdCeMOc0+wajVbeWHSdf9unXNKRSztsKcKk/0m+Rwum0wQjU
 afe5fqbHCOrFLncWVjLrapTYWklRdwMEsCNZrO1ZzSUfsEy+PM8W1P7we3eMR9lcpvk3
 QTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o5m09NeCFmgUIFbH6bFaGd//EU34vmPkiCWl7hgRUY0=;
 b=etDBwOMOzchHjLWfDh0nWWwffHoPtU/ys4/LMK8ZiEErzAlwiQfWIrT9m8bEevEAbY
 HJdMEgGvKzTgnEnVteYA/vd6/vDFbN08dk1O+e0bC8Wb/H0zBwsTBiI7Gj3RHZUYUVTf
 QQ1RJcpIx70VyozNrDoQ6DkG56pv/kyYrOJgcMDpmq9W6+e3UGhhfFPJ8WanPjZhUHdv
 5A2VzId7Bb/b0K3tr6daSDI+mjeJyudSd+ibSvv1N3QyiS3v9LB8E1myZ2Fy3xa4mNjm
 AUEI+6/xnWfe7JCXlglbxLW1i6YAKxC6KjpiEUntW3K9XfKV5mVxSzeDiFUaizoQlFhG
 /Itw==
X-Gm-Message-State: AOAM530CsrSV2J6tC3fxa78XtZK4J21qT+mGQjvd76hY0RnPpENmnDbo
 q7qoj5RXfQVaHvsNa0nu7SFMwJqDwU/m85Od5sfdZw==
X-Google-Smtp-Source: ABdhPJwyZ0K/gVAo6hRYhdVki43elIu4FeI/sEG+cCftVnIHI7FVMnMXRcLmbi9duRt/aF4I1R91Q/UZcg1UWzBBX1U=
X-Received: by 2002:a05:651c:2042:: with SMTP id
 t2mr2568526ljo.233.1614372434754; 
 Fri, 26 Feb 2021 12:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org>
 <141f3098744ea8d1cc39abcdce89c0e513bfbc70.camel@gmail.com>
 <BYAPR01MB5621DC2003DA49EA64AD46A0D09D9@BYAPR01MB5621.prod.exchangelabs.com>
In-Reply-To: <BYAPR01MB5621DC2003DA49EA64AD46A0D09D9@BYAPR01MB5621.prod.exchangelabs.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 26 Feb 2021 12:47:03 -0800
Message-ID: <CAKwvOdkW6bctowgCrLakWJ7pj1uxEZ9T8TPiANFu9dhcHYYc0A@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_154716_467418_5DC0AD41 
X-CRM114-Status: GOOD (  21.79  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "soc@kernel.org" <soc@kernel.org>,
 Hartley Sweeten <HartleyS@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210226204703.XErNG-z1AbPG-SaJCeccBEEA9kjT4IrU-lGtE7DfMJ8@z>

On Fri, Feb 26, 2021 at 11:32 AM Hartley Sweeten
<HartleyS@visionengravers.com> wrote:
>
> On Friday, February 26, 2021 12:23 PM, Alexander Sverdlin wrote:
> > On Fri, 2021-02-26 at 17:43 +0100, Arnd Bergmann wrote:
> >> Randconfig builds with ep93xx fail with the clang integrated assembler
> >> that does not understand the maverick crunch extensions:
> >>
> >> arch/arm/mach-ep93xx/crunch-bits.S:94:2: error: invalid instruction
> >>  cfstr64 mvdx0, [r1, #0] @ save 64b registers
> >>
> >> It is unclear if anyone is still using support for crunch: gcc-4.8
> >> dropped it in 2012 when it was already too broken to be used
> >> reliabled. glibc support existed as an external patch but was never merged upstream.
> >> We could consider removing the last bits of the kernel support as well.
> >
> > This was my impression already in 2006, that Cirrus is not going to work on Crunch support. From my PoV it's OK to remove the support in the kernel completely.
>
> Martin Guy did a lot of work trying to get the maverick crunch working but I was never able to successfully use it for anything. It "kind" of works but depending on the EP93xx silicon revision there are still a number of hardware bugs that either give imprecise or garbage results.
>
> I have no problem with removing the kernel support for the maverick crunch.

Either way, please consider adding a

Link: https://github.com/ClangBuiltLinux/linux/issues/1272

tag. That will help us notice when/where this lands in order to close
out the issue. Thanks for the patch.

(if we go with this rather than removing the driver:)
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

(I'm also fine with removing the driver; my ack is not conditional on
one way or the other).
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

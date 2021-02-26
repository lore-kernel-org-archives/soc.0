Return-Path: <SRS0=AB20=H4=google.com=ndesaulniers@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766E9C433DB
	for <soc@archiver.kernel.org>; Fri, 26 Feb 2021 20:47:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 48C4864F17; Fri, 26 Feb 2021 20:47:17 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D7B64EDC
	for <soc@kernel.org>; Fri, 26 Feb 2021 20:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D7B64EDC
Authentication-Results: mail.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ndesaulniers@google.com
Received: by mail-lj1-f172.google.com with SMTP id a17so12115787ljq.2
        for <soc@kernel.org>; Fri, 26 Feb 2021 12:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
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
        b=Y5n2qmHMOv3lYOzUdhKx9NnuptZlm+45JuXSU+htvD7IW18z8z6kRVfpA03KCDBtE9
         WXKj9+KSk2xxvzWHTNoy0BmIClVEHti1RnKnesyo7JIKKzNa5iV9MPLb90cj4JAOlFBB
         3TmuRNkf9KAt7h9UYXIdMPf3eb55Zq8m+vq8wlbQr4PcyNgArX7rybwSyiPOHtN7lGEy
         OwT8UlFdBVCI4ay0mFXunTMZExGmn3HPp+JRGU4e20JwlwQD4Z+qaCSuHFXjXcrd6Rzw
         LgNjRVJSRoT7aGtjXrWde2/++pmgQlEswrH5G/VMfH4HssRv+KlcotecIfdiaV5wS4NA
         J2aA==
X-Gm-Message-State: AOAM5328wgWkWS3V1VQR+vymh6mV7/9dyvXUUTisURF0vRYTtymRqvpE
	9dSB1muXx7g+Sa2WHRCknHO6DxvJ5x4PvSA+n8NnB6n00ANMKw==
X-Google-Smtp-Source: ABdhPJwyZ0K/gVAo6hRYhdVki43elIu4FeI/sEG+cCftVnIHI7FVMnMXRcLmbi9duRt/aF4I1R91Q/UZcg1UWzBBX1U=
X-Received: by 2002:a05:651c:2042:: with SMTP id t2mr2568526ljo.233.1614372434754;
 Fri, 26 Feb 2021 12:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org> <141f3098744ea8d1cc39abcdce89c0e513bfbc70.camel@gmail.com>
 <BYAPR01MB5621DC2003DA49EA64AD46A0D09D9@BYAPR01MB5621.prod.exchangelabs.com>
In-Reply-To: <BYAPR01MB5621DC2003DA49EA64AD46A0D09D9@BYAPR01MB5621.prod.exchangelabs.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 26 Feb 2021 12:47:03 -0800
Message-ID: <CAKwvOdkW6bctowgCrLakWJ7pj1uxEZ9T8TPiANFu9dhcHYYc0A@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, "soc@kernel.org" <soc@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
	Nathan Chancellor <nathan@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, 
	Hartley Sweeten <HartleyS@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
> >> reliabled. glibc support existed as an external patch but was never me=
rged upstream.
> >> We could consider removing the last bits of the kernel support as well=
.
> >
> > This was my impression already in 2006, that Cirrus is not going to wor=
k on Crunch support. From my PoV it's OK to remove the support in the kerne=
l completely.
>
> Martin Guy did a lot of work trying to get the maverick crunch working bu=
t I was never able to successfully use it for anything. It "kind" of works =
but depending on the EP93xx silicon revision there are still a number of ha=
rdware bugs that either give imprecise or garbage results.
>
> I have no problem with removing the kernel support for the maverick crunc=
h.

Either way, please consider adding a

Link: https://github.com/ClangBuiltLinux/linux/issues/1272

tag. That will help us notice when/where this lands in order to close
out the issue. Thanks for the patch.

(if we go with this rather than removing the driver:)
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

(I'm also fine with removing the driver; my ack is not conditional on
one way or the other).
--=20
Thanks,
~Nick Desaulniers

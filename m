Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14E2C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 11:03:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54EDE64E67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 11:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54EDE64E67
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o1mF3cKnfypQNomgxmH1nqCJlnLLd6TZbW0LPGUVLkY=; b=Ix3yEqUJx3PVKxEhZBfIo2axb
	5PkfEamJM4De5X1EWSZpldDPwdQVdUT0ToRHp7IedtMgZKz+tvAZRMxN6IhGTh3kqNs08xH5Lf8T2
	weOfEdK0swvOeIMjDYTlLg6ySVK8LlojJAOcSdoAVBkTazBMRN3Ksbm/IlHKdl1dXwBNCYdpB5dcB
	l8zihyC7FwdgqnkydkBHUNGSoq6xibnPyomQ2G5REdiu5QMzNJLTV/R2w0JrgWSIEpBaQUPXmKFG2
	L4we5okmr8DNu8IuGnlPPLfSgCoLkj+/bjjrR2yZpDrqKVnU/xZe375YHE+vwp+KqJixEt/1gbl9M
	+wAF1eRrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHlhC-008PUm-4q; Thu, 04 Mar 2021 10:59:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHlh5-008PU9-Gf
 for linux-arm-kernel@desiato.infradead.org; Thu, 04 Mar 2021 10:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fTfxnG9jSrLtZAF5ylIRh4KVTitF0dez/rrfte1Xpqw=; b=svhJbLN4iHMGXjEdK3NRJcJrme
 LyaU2dBhS98pHSm1gw4QOz/+W55PynwHCsB7I3FO2Z3oc0KFqUnEIHCKPZ1ljN90x9k/ZO8OkqKR8
 4gqT5mDc2tjFyo3uH/Ig9luxsVTwSaobFTRYgTYH6ioXxCYZeFheHrSwKa3WeB+KHdwJRs7K4vdbi
 YWhzHl/z7jqvqJaKXRJqyoXWbT+JH/JX3QJ0XKpZqP2cv8fWbexEfc0LEuMFhwVTSW1KOn1KBxI9p
 1At4Lk2vWjV8tH2THYfwYDkmEwLT2ciaTAcBYEmfZKEiHrZGkLe9mKLoFN1GIt+t2+qcKRMGIO3yn
 NxdYfsmw==;
Received: from mout.kundenserver.de ([217.72.192.74])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHlh1-006hsG-1f
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Mar 2021 10:58:57 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfpGR-1lxg1W1vRp-00gIdW for <linux-arm-kernel@lists.infradead.org>; Thu,
 04 Mar 2021 11:58:47 +0100
Received: by mail-ot1-f41.google.com with SMTP id f33so26775988otf.11
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Mar 2021 02:58:45 -0800 (PST)
X-Gm-Message-State: AOAM532s6TpegTDeqpWny57n+X84rW32BkTtoGe9NqKfUO4FYa7hgyBo
 KqkV1l8SqKNrsKQlJZL2pdOOvNxySOkwsp0TUzY=
X-Google-Smtp-Source: ABdhPJz1isN7a4ehcF9HHNeG9q7qKHd8/FFXnPMY8/CvMfpnQJJ0Yqd+ln/usQiWPlqPIG7JB8bFXpj71N5eEjpvbrc=
X-Received: by 2002:a05:6830:1b65:: with SMTP id
 d5mr2952747ote.305.1614855524811; 
 Thu, 04 Mar 2021 02:58:44 -0800 (PST)
MIME-Version: 1.0
References: <1614764303-34903-1-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <1614764303-34903-2-git-send-email-tan.shaopeng@jp.fujitsu.com>
 <CAK8P3a0VUoixMKg5UmF8agAZUXoMT8_SbCiWBdStbZ+_yAYNjA@mail.gmail.com>
 <OSAPR01MB2146DC8A26F6EBD1CF11D9748B979@OSAPR01MB2146.jpnprd01.prod.outlook.com>
 <20210304104650.GA20843@willie-the-truck>
In-Reply-To: <20210304104650.GA20843@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 4 Mar 2021 11:58:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
Message-ID: <CAK8P3a2pFcNTw9NpRtQfYr7A5OcZ=As2kM0D_sbfFcGQ_J2Q+Q@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: fujitsu: Add cache driver code
To: Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, 
 "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>,
 James Morse <james.morse@arm.com>
X-Provags-ID: V03:K1:EW5iZ0FeikJEWiO9h8AjuOZGbs/pYA1jHPvCEYteQE7cc9GjUBH
 6zESZ/4jmEsuCogeTbSOCgi8m3sbASKewNip8tbkkZv6KefVaIAcLJA60vw5IILpip0kBlD
 xCQIscRq7KPjdu1DrFzQNEtUOBSmchVExrVvLarROe1Brfek/e+CCW+6yc/igolCsEk5/aO
 f2/5RbPVJ70SjSplcCCow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cPKaIvgc7hs=:Q1/lRA3WgL5p5vyDdV/oiC
 DrYbYiiVf+UTpFKtZu7+mtvaU5At2mI8bhA5r666q9NMSmhOfaJU12pum+G20iysJYyaQv/YS
 h/AeIFOo9gQrySquRfJXkDeYQii+Zcurvt214F4miXEn098LavY8ppfcTN8Q5WSCvnYAUbegU
 fksYeW3rMcLhdk00+mAqW2qo5cbKARPLny+3kaJbXGJ2sE9p5cw0h5A9KnffNcDf4HQXfqwE1
 lbu2ABavG+FBeljs3rtV5Kl0oVEz1DxSVxefnDSRBCbDCWPZg4hqYw785cTjh5L9FGb+N9P8u
 noMFBXUmLRZkjOk0WZu7sWDIXCujtECdgj3o8dQehG6VvtqDPCOlFEakkh4wmwiB8/KsZ69rg
 pODneQF0qo4mqgEc9ANspeJUD+TFEF2hBcZLA7bsovjVvCsWdauUM+1zwuGhf6CErv8qRgLYp
 xpEicAoI8HqtCY3pltFQHQWTT6bsUWj81LE2+0A5kK3IZJuDqyE+XLi2LNGQp05XrUXCAlzLX
 YWfLKz+tIqBHoJZvuZJ8coUG9YX+j1Jz5ng9V2YrbNMO3hvb+PlxzWpx3d4BduPsA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210304_105857_015806_625EF36F 
X-CRM114-Status: GOOD (  23.90  )
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

On Thu, Mar 4, 2021 at 11:46 AM Will Deacon <will@kernel.org> wrote:
> On Thu, Mar 04, 2021 at 10:34:43AM +0000, tan.shaopeng@fujitsu.com wrote:
> > > On Wed, Mar 3, 2021 at 10:38 AM tan.shaopeng
> > > <tan.shaopeng@jp.fujitsu.com> wrote:
> > > > +
> > > > +config FUJITSU_CACHE
> > > > +        tristate "FUJITSU Cache Driver"
> > > > +        depends on ARM64_VHE || COMPILE_TEST
> > > > +        help
> > > > +          FUJITSU Cache Driver
> > > > +
> > > > +          This driver offers cache functions for A64FX system.
> > > > +         Loading this cache driver, control registers will be set to enable
> > > > +         these functions, and advanced settings registers will be set by
> > > default
> > > > +         values. After loading this driver, you can use the default values of
> > > the
> > > > +         advanced settings registers or set the advanced settings registers
> > > > +         from EL0. Unloading this driver, control registers will be clear to
> > > > +         disable these functions.
> > > > +          When built as a module, this will be called as "fujitsu_cache".
> > >
> > > My feeling is that this code should be in arch/arm64/, as the cache
> > > is generally considered part of the CPU, rather than part of the wider
> > > SoC design, or something that can be controlled separately from the
> > > core kernel and memory management code.
> >
> > Thanks for your advice. I also would like to hear the opinions from
> > other soc&arm maintainers, and then consider whether to add this to
> > arch/arm64/.
>
> Given that all of this is outside of the scope of the architecture, I don't
> think that arch/arm64/ is the right place for it. Perhaps this would fit
> into the resctrl rework that James has been doing for MPAM?

Indeed, that sounds like a good starting point. I don't understand enough
about either of the two to be sure, but it sounds like there is some overlap
in functionality, and ideally we would have one user interface that can
deal with all the hardware implementations (intel, arm, fujitsu and any
future ones).

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

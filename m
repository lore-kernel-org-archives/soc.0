Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BC3C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 12:26:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E49C2371F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 12:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E49C2371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YsY5EZv+3C16Cu5F5wDzWTRwJQY9LSK+lbFRf4XFm7k=; b=ibH02hQtQEiLYL81ftj2WJ8RT
	kBnK0yyDEphg2hQFSG9Tlu6VDq2jRLhiDbjiv+Yrnh9584OAaVP0yVQsf5WchoRQd9MhN8hcBbGg/
	1lZ5EEb5of7rY/zGdz+I3p/cGDrIKU6wMzRBKGKuWAVMAkL5QOpNul9aVWOAI8am6ZVcGXnktyEBf
	NOPJFQeRGDcTJe/vF/LSh/P7ksQjahr2ucBtmaToZtT04t/FxVos7ug8qcHvmAa8T3rRzae+LEmT2
	0asYcuueKQv/XF2BKvbLvOmHVREBnsciSBzeQelDNLkxUbFI1scMskpNbnpSa+D8Pc78v58hO2h3Q
	Cq8WBG05A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0OA4-0003wc-7i; Fri, 15 Jan 2021 12:25:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0OA1-0003vn-PU
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 12:25:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAC842256F
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610713500;
 bh=/IpNCV8YI9pkl+MFJ7alq6YV8W+cOJxbklCxk3O173o=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=YMWV2Z6Gqb2n3EpARZAPp6N5HEsJ5mMkolz89xHM6apcz78IwxthADtUgqniw5k/a
 K7X77dNp0vnQtVofaqbVvUyX9TPf1JWys9LqwVFatsp0dVp+U9czO8NnP3Gz6qrH+Z
 H0gJ+QRC82WdbP3aXgfmvpcLQN4vvhoAICrKveTRNvKaqnujVUd28kRdsSqi4c0qvU
 jl2uQzqfIbjT8daOKWYAYFFxe+BrNfEmK5iQOos6JrGcNNgkPNUlO6HwZgv7bkphMB
 sItbrR0pfM3JEL94ZtmNRdfC+717r/hZPWIwhJhxvvnxaSemap6b3xIwECXmwrUtxX
 yV2CGL8/ZkUnA==
Received: by mail-oo1-f44.google.com with SMTP id j21so2128679oou.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 04:25:00 -0800 (PST)
X-Gm-Message-State: AOAM5323MoKgJp9QJy3QAEv285KoqNH/a0/2S7rmKMlVLXs1pDw6r51Z
 eltFmerSoN1vpyEk91buUsWCVuX8BJW45Rd6PYg=
X-Google-Smtp-Source: ABdhPJxDN2beoohD9wNjeMD+PLZKH5mnAKtog/sxKIbb7GQpBAcusrTk3CnAtgnshM1v1kKgrGsRDB4oHCSCwQx7mSo=
X-Received: by 2002:a4a:2cc9:: with SMTP id o192mr8063179ooo.66.1610713500094; 
 Fri, 15 Jan 2021 04:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20210108105241.1757799-1-misono.tomohiro@jp.fujitsu.com>
 <20210108125410.GA84941@C02TD0UTHF1T.local>
 <CAK8P3a34aPUwjAXoh20E-PT6vG6gbW_itAXVQAYrhsHZbzqRsQ@mail.gmail.com>
 <OSBPR01MB4582283E56A13D03A778150FE5AA0@OSBPR01MB4582.jpnprd01.prod.outlook.com>
 <CAK8P3a2BbCtZG=+fi1mtrhMtBKHcaZa=gvfiKJVdnsq6N3yG4A@mail.gmail.com>
 <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB45821D2CFA8285A3FFDE6B1CE5A70@OSBPR01MB4582.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 13:24:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
Message-ID: <CAK8P3a0Oxvm=VTnPAwxSQ-od4Q0rqMq45633pMyTcV8Adet-Lw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier
 driver
To: "misono.tomohiro@fujitsu.com" <misono.tomohiro@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_072501_959001_A935F9C7 
X-CRM114-Status: GOOD (  32.89  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115122443.awg1eSCcD0Kz6sOt1GPN8m8_d4dF-NtF1F6XYgXyBJM@z>

On Fri, Jan 15, 2021 at 12:10 PM misono.tomohiro@fujitsu.com
<misono.tomohiro@fujitsu.com> wrote:
> > On Tue, Jan 12, 2021 at 11:24 AM misono.tomohiro@fujitsu.com <misono.tomohiro@fujitsu.com> wrote:

> > > Also, It is common usage that each running thread is bound to one PE in
> > > multi-threaded HPC applications.
> >
> > I think the expectation that all threads are bound to a physical CPU
> > makes sense for using this feature, but I think it would be necessary
> > to enforce that, e.g. by allowing only threads to enable it after they
> > are isolated to a non-shared CPU, and automatically disabling it
> > if the CPU isolation is changed.
> >
> > For the user space interface, something based on process IDs
> > seems to make more sense to me than something based on CPU
> > numbers. All of the above does require some level of integration
> > with the core kernel of course.
> >
> > I think the next step would be to try to come up with a high-level
> > user interface design that has a chance to get merged, rather than
> > addressing the review comments for the current implementation.
>
> Understood. One question is that high-level interface such as process
> based control could solve several problems (i.e. access control/force binding),
> I cannot eliminate access to IMP-DEF registers from EL0 as I explained
> above. Is it acceptable in your sense?

I think you will get different answers for that depending on who you ask ;-)

I'm generally ok with it, given that it will only affect a very small
number of specialized applications that are already built for
a specific microarchitecture for performance reasons. E.g. when
using an arm64 BLAS library, you would use different versions
of the same functions depending on CPU support for NEON,
SVE, SVE2, Apple AMX (which also uses imp-def instructions),
ARMv8.6 GEMM extensions, and likely a hand-optimized
version for the A64FX pipeline. Having a version for A64FX with
hardware barriers adds (at most) one more code path but hopefully
does not add complexity to the common code.

> > Aside from the user interface question, it would be good to
> > understand the performance impact of the feature.
> > As I understand it, the entire purpose is to make things faster, so
> > to put it in perspective compared to the burden of adding an
> > interface, there should be some numbers: What are the kinds of
> > applications that would use it in practice, and how much faster are
> > they compared to not having it?
>
> Microbenchmark shows it takes around 250ns for 1 synchronization for
> 12 PEs with hardware barrier and it is multiple times faster than software
> barrier (only measuring core synchronization logic and excluding setup time).
> I don't have application results at this point and will share when I could get some.

Thanks. That will be helpful indeed. Please also include information
about what you are comparing against for the software barrier. E.g.
Is that based on a futex() system call, or completely implemented
in user space?

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

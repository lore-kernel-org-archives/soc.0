Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6B0C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:14:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EAD464E08
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EAD464E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8hGimSKDwzHaPcSiB21khAuyyu4fLI7g9NRU+31ZYwE=; b=xzlbAJarAwt6gsnel0p1sTwK6
	ODPhL40Cq1QVxsI0e1sPjR/un68T7JMn6Aa3htX0Ilzsf+t2kLr7Xb3EpURurE2DhlZP/AkNbgNSc
	uXh/hmTUZf+lET12MOyLVotRt8B4apyP8T3631F32jqlE/dzASi00r8bNdqdiJorpknJI1cvKuZPC
	jeTWf7kiXDskENbpxVh5LAlsAiuLaBs5P8XUoD9eYUL/QCx5dR3nv5leQ8s1qkOrdGaltFnmt/WOT
	dWkijwNwugJC3hiK+7tEZR/xNs1X6zPtESmHv9OmR/jtQewQbJ1EzcJf0+hIsoT7KD9bCgbX/ptg6
	oh4G/aFUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zFE-0004Zw-6p; Tue, 02 Feb 2021 17:13:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zFA-0004Yl-Su
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:13:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C730064E08
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  2 Feb 2021 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612286015;
 bh=Yzgi/lqzGKBBv/XBXFstqgZQ204zzMmlRFOTXG/iEe8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=lzC06x6PIqureLJaXjHhGr7yBlv7y950k3H1CLbYreoNwwdA+FZXuE4xF9Q3uKtzD
 bA3zAvoEqP8knga2okNxcepYQk4DHsWmgcHFNncq3pYsKIWHP0+G4ESBYu9iiNoY3t
 8pmeCQ3oWHf0zX6uqPxSAcHoqtJ5aWrkBZ4zPhPgiQByh+4s7TnoGMPSLlv5+Zglpo
 xgetSRgE9fFKMbXt5JMbD1KdLF/m6hE4GdYA2oSClUiHgiFxxXwAyo6W9kVHW1hH2l
 aKma24CE1FrjJDrdb+S7aWS8IXlncCyvGvEYElOrIemNIq227x9F+z9x5m6ODcb2Y/
 aaqi9uF4HeTvA==
Received: by mail-oi1-f174.google.com with SMTP id d18so23558756oic.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Feb 2021 09:13:35 -0800 (PST)
X-Gm-Message-State: AOAM533Gmw2ubXzaqO1mJbew2Xdfj/ZcW6fYz97mld8n5/LcB0LwbCZd
 mhBtDixSjxGbLlGaJqlnIGJtiFXOWsk2u1QwdHY=
X-Google-Smtp-Source: ABdhPJzsKtKC5cAyzOUnVPeZQ3CF4a9+qrldJJ6VTyNTkB1sIHubldU4c7t3nVtOYvnbMHskh/FSzDNODF1AK3N8jwY=
X-Received: by 2002:aca:e103:: with SMTP id y3mr3368110oig.11.1612286015070;
 Tue, 02 Feb 2021 09:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
 <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2Ub0w3v_H_0F84MPdQZ28vUgxdYNii7eVY0o9a_sg7DQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 2 Feb 2021 18:13:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
Message-ID: <CAK8P3a0h8r+K3cKKRJD6-rZ9H=F8ciKgkN6+XEF61scLbEqGOw@mail.gmail.com>
Subject: Re: ARM: dts: mmp devicetree updates
To: Lubomir Rintel <lkundrak@v3.sk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121337_021496_721767D5 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171318.K19EyYBbe_-GmVVlD3vHHCn1NMYA43cv1m2jaD3aOuA@z>

On Tue, Feb 2, 2021 at 5:41 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Jan 22, 2021 at 3:09 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > >
> > > chained to this message is a handful of patches related to MMP device
> > > trees and bindings. Please take a look and consider queueing them for
> > > for 5.12.
> >
> > These all look good to me, but I notice that a lot of them seem to be
> > bugfixes, so please have another look and decide if any of them should
> > go into v5.11 and perhaps backported to stable kernels as well.
>
> Hi Lubomir,
>
> not sure if you missed my earlier mail. To clarify, I have not applied
> any of the patches so far. Can you recheck if some of them should be
> part of the v5.11 release so I know which tree to apply them to?

Nevermind, I just found your earlier reply in my spam folder. Applying
the patches now.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

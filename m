Return-Path: <SRS0=fFfY=LJ=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39253C48BE5
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 15:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0C6BC61601; Tue, 15 Jun 2021 15:22:05 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB03261621
	for <soc@kernel.org>; Tue, 15 Jun 2021 15:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB03261621
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-lf1-f48.google.com with SMTP id v22so27734131lfa.3
        for <soc@kernel.org>; Tue, 15 Jun 2021 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ICIAWSq5Krpfs9+8pM47fNoow5b/bl38CHr2u42K0m8=;
        b=cFISYhUsn1NZMoeCzk+Rv4fM4VBWfCuieQ5cecBFdAdXnbHTENQYf3VJZBakL8LyRJ
         5ULfF5l7pyuf5lXzgDdCfaqirk3OyKtumx1OZ/gCTO06882AA8L4mSWIJn366bAtllTT
         m01oGordVZKxny12pyu2P25BN7FLTGWugV0VEFatOwI9u40JT1rygCWhld1+9+5BH0ly
         GZgJm3WulG9vHPSkhgImFulhfLfW6tQ+tWPceZ35ISf9iyUUf182shikwMtMnq9D52Hv
         GoS7LdA+EqGfz6tzZLuF8a5J2KO9oFNHZv8XWAduzCH+oRZmpxOxFWH0lTErD1kyvBQY
         1Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ICIAWSq5Krpfs9+8pM47fNoow5b/bl38CHr2u42K0m8=;
        b=BUFKe6Fx/0F31r8AcnuwEEFU/rD94VEjqjlQGgN6+rOlpfLF1wYCQHhkXNrq1KKhW0
         AdnhKs/oBb0wmnLdyWxa7iT/uvig6DIT7AIClruU1rZc+Lf1xXWjhzN+vpt5Q+aEXos5
         O4gR8fA6XvpkIb58LAiezif+NEnTg/NhEd68nt0NJ0S9yuP7l/XmD7ETWsgIsPhvRhr2
         8OC75d/+vFDomVapigqAavVuwWSWnATTTWiUO5LkZBe6ai9v4EPVIws+asu5tTQujCPP
         WDfY76hnrIEbljZmN7T4gid3LBdFuPwi4+juGlCbLcY+msqjuaK9JlE25qKFmsvEHoXX
         aBew==
X-Gm-Message-State: AOAM530ITuZHTgdec9fD8rzyeGZZ5avYyvlOTyfsyQWeSPiY7g93fG5+
	+h2ctBCJfAftRiF7n89Jqennmw==
X-Google-Smtp-Source: ABdhPJwjtECBUQTA6PaG5F64vPTLi70W0DvSK/6b8AUgp8vwhvSY9UKRO+VUiPRo+/M7UfvRy/nLDQ==
X-Received: by 2002:ac2:4f89:: with SMTP id z9mr16439525lfs.46.1623770522972;
        Tue, 15 Jun 2021 08:22:02 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id a23sm809807lfr.22.2021.06.15.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 08:22:01 -0700 (PDT)
Date: Tue, 15 Jun 2021 08:21:49 -0700
From: Olof Johansson <olof@lixom.net>
To: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL] firmware: arm_ffa: Initial support for v5.14
Message-ID: <20210615152149.GB11724@lx2k>
References: <20210601095838.GA838783@bogus>
 <20210614170856.rs7jrke3gvpmu4km@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614170856.rs7jrke3gvpmu4km@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

On Mon, Jun 14, 2021 at 06:08:56PM +0100, Sudeep Holla wrote:
> Hi Olof,
> 
> On Tue, Jun 01, 2021 at 10:58:38AM +0100, Sudeep Holla wrote:
> > Hi ARM SoC Team,
> > 
> > Please pull !
> > 
> > This is a new driver pull request. One of the arm64 patch is being
> > pulled from a stable arm64 branch for-next/ffa as the other patches
> > are dependent of the same.
> > 
> > Background
> > ----------
> > This has been on the list for almost a year now with changing requirements.
> > Initially Arm KVM wanted to use this via userspace interface in VMM to
> > communicate with VMs. But it was later dropped in favour of arch-agnostic
> > interface[1].
> > 
> > Also there was some discussion on the dt-bindings which was dropped
> > completely. Though we need to workaround the lack of full discoveribility
> > in v1.0 spec, it is now being fixed for the next version of the spec.
> > 
> 
> I see that you have pulled quite a lot of drivers and other SoC code
> including my scmi and juno ones that were sent more recently than this
> one. Just thought of checking if this is still in queue ? Sorry for the
> nag but this has been on a list almost a year. We missed v5.13 due to
> DT binding controveries(for good reasons) and we really don't want to
> miss v5.14

I held off because I wanted to spend a few cycles on looking into it before
blindly merging it.

Are there any implemented users of this (on either side) today? We normally
don't merge a framework in the kernel without having at least one user of it
also available.


-Olof

Return-Path: <SRS0=fFfY=LJ=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9429DC48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:03:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6AEEF61490; Tue, 15 Jun 2021 16:03:37 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE2861465
	for <soc@kernel.org>; Tue, 15 Jun 2021 16:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE2861465
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-ed1-f53.google.com with SMTP id r7so37422857edv.12
        for <soc@kernel.org>; Tue, 15 Jun 2021 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ds7scC8Pj046kGHWvqN+Gb1T/TTqW6FsBuVSLf41t9M=;
        b=eBCT9SjYcB+i7DBUkm4q6lmtBbVVxe7GY1h5mgDBvsAJEGyP1w0HnwaiP84SvrSq2C
         RlYLXGa6aUvMSwaUx48nZ2OA/c78uwpVrRWVvjW5KIqh70txCFUqLiYrSerjhAejQvex
         0lZCkl50UZmfG2Lv0vxnIi693w04iOhNzawzVl1OFctxTz6aLTbXPqU2UgVXaq2YFYhX
         EBWqO+nhYqIQVC0p7a38KkA1yK7uAuOV3E3SHeYP7cpcUWrQUq5L+M2mUROjZBxIcsIJ
         /ZWVUaVF7GYZZX3mxMO0WT1qyY/wEV0YSiMTPR2V5Ai0gncCryUBaQAAV2Wpgfr9l/RX
         gjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ds7scC8Pj046kGHWvqN+Gb1T/TTqW6FsBuVSLf41t9M=;
        b=ddZ1iD7aocIZZDfq0O3Zr4lQj2mO5YTtXDeNZrilLKi5Pox6n27sr3ROzhugJFR4y0
         M0/qHZ7wVCpRymwqVzQpDtxzuVbYMdlhYVniIjIMaaJkgyKMsJEdacp/gwSUIpoNy2aj
         6bxoBnlOGK5roGWHarL7w1W+wy2+vCxj2WgDJvDIlsy0HNf0EcOdWBfKB9u9BDXxLlTc
         pbWBZ9Qhb+ZnBGynPvwGOKN9I86CE66sE+uKw7XSE1cr0G59Qn9cIS6UL7zEX9beHHzj
         E9jIV34cS+A+30xm0NDn7G4HmO6UquCUDUOmPjJUffweUms/Y6m9mQ0c08oDdYSs3zbt
         ip1A==
X-Gm-Message-State: AOAM530590tld8/uJbPnNqupeecn2u0JCiQ5CZWdbsfUU7d4TvMWJBY+
	/SsJMElVuCmAkwNqSEOuJdyzeVdjU3UKpjNbSzpD1Q==
X-Google-Smtp-Source: ABdhPJzS0kyJZM92AbMMzk0As5PtF3WFaVk1rdjdjo68Ucq1q8xo6X6hQnUYeIwJJmwC4w6saK9fIF9OihkCxTKcHRY=
X-Received: by 2002:aa7:cb45:: with SMTP id w5mr202254edt.170.1623773015755;
 Tue, 15 Jun 2021 09:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
 <20210615152840.GD11724@lx2k> <CAFr9PXkeqryzutzpV6woskee_SwbDMJFgxPtspvTk0-VS6A5xA@mail.gmail.com>
In-Reply-To: <CAFr9PXkeqryzutzpV6woskee_SwbDMJFgxPtspvTk0-VS6A5xA@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 15 Jun 2021 09:03:24 -0700
Message-ID: <CAOesGMiu2+dN0_q7X_5p3pc-Lz=SMGiaRQkOBag+dqH2tatZgg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14 v2
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Mohammed Billoo <mohammed.billoo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 9:01 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Olof,
>
> On Wed, 16 Jun 2021 at 00:31, Olof Johansson <olof@lixom.net> wrote:
> > This time it seems like you based your branch on 5.14-rc5, which is a newer -rc
> > than what we have the rest of our trees on. The general rule of thumb is to
> > base it on the oldest meaningful rc for the release (rc1 or rc2, most of the
> > time). We normally base our tree on rc2 or so, in this case I went forward to
> > rc3 earlier.
>
> Sorry, I hadn't even thought of that but it makes sense.
>
> > (Maybe you had the same base last time around, and I missed it -- my tooling
> > failed out on the S-o-b checking before I noticed)
>
> Last one was rc5 too.
>
> > To avoid another roundtrip here, I'll apply the two patches directly, but
> > please keep it in mind in the future, especially once you have more material
> > for a cycle.
>
> Thanks for doing that and the hand holding. I think I can manage to
> get it right next time. :)

Yeah, no worries. More or less every single maintainer has made
similar mistakes at some point or other, especially during ramping up.

> I have one DTS patch I would like to get into 5.14 for the watchdog
> driver that was recently accepted.
> Is it still ok to send a PR for that one or is it too late now? I
> think I read the cut off is around rc6.

You can still send it, either as a patch or as a pull request - your choice.


-Olof

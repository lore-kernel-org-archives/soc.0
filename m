Return-Path: <SRS0=b5ND=LJ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80C4C48BE5
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:01:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C0AE361467; Tue, 15 Jun 2021 16:01:46 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D18461465
	for <soc@kernel.org>; Tue, 15 Jun 2021 16:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D18461465
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-qk1-f179.google.com with SMTP id u30so42470753qke.7
        for <soc@kernel.org>; Tue, 15 Jun 2021 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7C7EVveR2N28ai5r9/J+2yOqz+gY5pQumT6AbxDu9NQ=;
        b=BMDmDwevRAQ/jZtfGP7p38zmpe9NJVDCl+GWwBgJ4KO/Ve2LeGgmD7Qj6TTdeSUewV
         rmTwm91IMkKMHCOrZXNL0KEmd1YUcfnCR6Y18iF/KIN6Y0mnI+Fh4YURVYOn071j2bTw
         FJF8aUtMSOX4S+wBwhW/LG3zFECq46pFpONoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7C7EVveR2N28ai5r9/J+2yOqz+gY5pQumT6AbxDu9NQ=;
        b=AVtG/yUxMIOLRYVVTiZf6dNMeYBidTROE8mFt8C2YJrT2UT7HMcqfuGfyBu+qsVVfF
         ZyQ6giKrGkNUclSFSzTQz1senFUqEaE8+k5WkzVzWVeImHPWF12WCpYAcDMYBhdfZaBS
         1bID4ds7Y0hxJEPe8IsSfumf7dz3YzLdZVgdpHNL+ip4ABme6GxkKXl/vmwDoVYscJPd
         m3TRBQmGKa2JQ9DDh8kZ8hIdBYgJxId/mRmiRJgnCZGhbayHkToSoF/NTX5WphY3kbGp
         bqRi+Ty4mQvugLtrBpBXYD8UT6DSswIW15RPj5iZHI1FuZo/U59BTdek9OqtDtqR4Zdh
         PuVw==
X-Gm-Message-State: AOAM533hB50aJeiSfINnn5qwy7UorufERHpEEDTAkpTQeMEL+9YMwNLG
	JpZmqomfOD3ex/sPU3xrTB7kw60/9ErQ+yZoCQuNTw==
X-Google-Smtp-Source: ABdhPJwMhLK3ojmLgXGBYK7lXx8LuQWFcV18TBkTwaLl6+qHJap0zIeFZXk+ggFYSjpX/FOfrM6i9m3q1kO7mfCsLi8=
X-Received: by 2002:a05:620a:a87:: with SMTP id v7mr340087qkg.468.1623772905288;
 Tue, 15 Jun 2021 09:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
 <20210615152840.GD11724@lx2k>
In-Reply-To: <20210615152840.GD11724@lx2k>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 16 Jun 2021 01:03:49 +0900
Message-ID: <CAFr9PXkeqryzutzpV6woskee_SwbDMJFgxPtspvTk0-VS6A5xA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14 v2
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Mohammed Billoo <mohammed.billoo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Olof,

On Wed, 16 Jun 2021 at 00:31, Olof Johansson <olof@lixom.net> wrote:
> This time it seems like you based your branch on 5.14-rc5, which is a newer -rc
> than what we have the rest of our trees on. The general rule of thumb is to
> base it on the oldest meaningful rc for the release (rc1 or rc2, most of the
> time). We normally base our tree on rc2 or so, in this case I went forward to
> rc3 earlier.

Sorry, I hadn't even thought of that but it makes sense.

> (Maybe you had the same base last time around, and I missed it -- my tooling
> failed out on the S-o-b checking before I noticed)

Last one was rc5 too.

> To avoid another roundtrip here, I'll apply the two patches directly, but
> please keep it in mind in the future, especially once you have more material
> for a cycle.

Thanks for doing that and the hand holding. I think I can manage to
get it right next time. :)

I have one DTS patch I would like to get into 5.14 for the watchdog
driver that was recently accepted.
Is it still ok to send a PR for that one or is it too late now? I
think I read the cut off is around rc6.

Thanks,

Daniel

Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89653C64E7B
	for <linux-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26EA420725
	for <linux-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 17:05:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jiz89VUf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbgK3RFM (ORCPT
        <rfc822;linux-kernel@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgK3RFL (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 30 Nov 2020 12:05:11 -0500
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AF0C0613CF
        for <linux-kernel@vger.kernel.org>; Mon, 30 Nov 2020 09:04:31 -0800 (PST)
Received: by mail-vk1-xa44.google.com with SMTP id i62so2871871vkb.7
        for <linux-kernel@vger.kernel.org>; Mon, 30 Nov 2020 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4msmqDOfKObIFWARrlUIAyeyp98c2WbJXAojFWVjL5Q=;
        b=jiz89VUfVeu6ZDf1HTb9VDFHMU/JtuGtS7QbPW+TCJsD5d7Ktvd3+evJiC5uQzeHQ6
         iW/+sn42aeXM9qqI8VyKe00YdzXPlXKqyAY0r4Dq46nXjsDxbhLeaB0ayB1PPttRqdv+
         FFF92mLkFds4vC356CH15VY01XN4vX5nd2HRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4msmqDOfKObIFWARrlUIAyeyp98c2WbJXAojFWVjL5Q=;
        b=YboZAGMvyLbLrxDzYnROgAZ6yZxdeVzptUWQP1uN6KWI9j9a9zuv5+XliM7EJHEK+l
         wq0nAKzlOkt6lNiLRjG58VP4i1LwRHSpU5OzA8dDkVotwbHMSY08tjf0kPtuj9De6RtE
         z0AoG1N9RUdXqPw3B4MaBJT4VX0lpeMfNc+omVoHM3JkTTfo/tXXmbXgXCWyM9bfzlMW
         ZmBkzJUe3mgx9TMJ2EXda+O/WsEVZ3hB45Okkz4abI3SIrt8cMs97mGnumRYhSQzplB2
         BH1g+dgpNq70ZpZANe8QnIQPATG9gL4WMzlMjV3faYtO3id09sSFi4roC1ZRlK9Cu0LH
         9Evw==
X-Gm-Message-State: AOAM531MHfJPdyHEP83Dn2ZLmOAsPvLmnK/0kIU5RXHG7hRLqV8CMqCg
        0EVXAsKoyZQwgHffufKyveohBjUP6iA7cQ==
X-Google-Smtp-Source: ABdhPJyaSWS3ald7w5F1jfvEtD+gxXg4rTFswtxV8vv0M2h4SDr42g7Lqktaui8rgzokSRq1zjdkJA==
X-Received: by 2002:a1f:9987:: with SMTP id b129mr15896413vke.5.1606755870306;
        Mon, 30 Nov 2020 09:04:30 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id m14sm3940402vkk.17.2020.11.30.09.04.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 09:04:30 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id r23so3974904uak.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Nov 2020 09:04:29 -0800 (PST)
X-Received: by 2002:a9f:36a1:: with SMTP id p30mr14987150uap.64.1606755867146;
 Mon, 30 Nov 2020 09:04:27 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
 <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
In-Reply-To: <CAHk-=wjA2Der39e_SWZ6S-DoVCJTu-Zwf6jn2wxmGTKzNPV1Dw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Nov 2020 09:04:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
Message-ID: <CAD=FV=Vow5_jv=-O=f2v4_5Nb4DiOUB1sQUx6r=-y5A-6rP4hw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
To:     Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
Message-ID: <20201130170415.N6e5kLeQV5leLun0g76pXZYb5Y-whSg5YprwbEOb_EQ@z>

Hi,

On Fri, Nov 27, 2020 at 2:56 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 12:51 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> >  - Some DT patches for the Rockchip RK3399 platform,
> >    in particular fixing the MMC device ordering that
> >    recently became nondeterministic with async probe.
>
> Uhhuh.
>
> I didn't realize this MMC breakage happened.
>
> That's just an MMC bug. Other subsystems have been able to do async
> probing without making device ordering be random.
>
> So this really smells wrong, and I just never realized.
>
> Added Douglas Anderson to the cc - the whole PROBE_PREFER_ASYNCHRONOUS
> behavior appears broken.
>
> You basically should do the device numbering synchronously (or better
> yet - asynchronously, but single-threaded for the subsystem), and then
> asynchronously probe the actual device details after you've numbered
> them reliably.

+Ulf too

IMO if a sane/consistent ordering is needed for MMC devices that the
correct solution is that they should be assigned statically and not
rely on the happenstance of which drivers happened to probe in the
system in which order.  Assigning numbers statically is exactly what
we can do now in the device tree and I believe that the patches you
were merging from Arnd were doing exactly that.  To me it feels like
this is the correct long term solution here.

Without static assignment, maybe we could do numbering of MMC devices
in some type of a pre-probe routine?  Is that what you're suggesting?
If so, it seems like it might be a pretty big change to figure out how
that ought to work (if it can be made to work).

If numbering is done by a probe routine then I think we can't
guarantee order.  Among other things, I think EPROBE_DEFER could cause
us problems, like in this example:

1. A regulator driver starts probing, but runs async to allow other
drivers to load.

2. The MMC driver's probe routine runs.

3. In the MMC driver's probe routine, we try to get the regulator.
Depending on how far the regulator driver has run (which may depend on
external factors), we might get it or we might be told EPROBE_DEFER.
Let's assume EPROBE_DEFER.

4. A second MMC driver's probe routine runs.

5. The regulator finishes loading.

6. The first MMC driver's probe routine runs again and works this time.

In this case the first MMC driver's probe routine ran _after_ the
second MMC driver's probe routine even without the MMC drivers being
async.

I believe there are other examples.

Now, of course, it should be noted that on a given board with a given
kernel configuration it might be impossible to ever hit a case where
the order was inconsistent.  However, I believe that there are
legitimate cases where the order would have been inconsistent.  Also
note that code changes to other parts of the system (like adding async
to the regulator subsystem) could suddenly introduce different
ordering even if it was previously impossible.


> This is not something new - we do this for pretty much all the other
> block devices, and MMC is just doing things wrong.

Just to confirm, I assume you are specifically excluding all block
devices attached via USB, right?  I believe that, by its very nature,
it's nearly impossible to guarantee the ordering of USB device
enumeration especially with complex USB hierarchies, but I certainly
could be wrong.  Until devices are enumerated, we can't necessarily
know how many block devices will be provided.


> See SCSI probing for the traditional horrible cases (where just
> spinning up a disk could take tens of seconds).  "Slow probing" is not
> an excuse of "random ordering".

It's odd that you say that.  I actually fought for static numbering
years ago and one of the arguments _against_ allowing static numbering
for MMC devices [1] was that, to quote:

> Exactly the same issue arises if you have more than one ATA or SCSI
> adapter in your PC - things can be probed out of order and end up
> in different /dev/sd* slots.

That was over 4 years ago now, so perhaps things have changed in the
meantime, or perhaps the person who said that was wrong.

Ah, I just re-read more of the old thread and you're probably talking
about what Peter refers to [2].  I guess, though, that must rely on
all parent devices (like PCIe) doing their probes in a fast enough and
synchronous way, right?  ...and I guess it relies on parent devices
not running into problems like the EPROBE_DEFER problem that I talked
about above?  Specifically, someone could have a MMC or SCSI adapter
in a PCIe slot, right?  Until we probe the PCIe slot we don't know if
it provides any block devices.


> Behaving randomly is simply not acceptable.

Agreed, which is why I'm a fan of the static assignment solution.


In the end, I believe that we could revert my patches and go back to
numbering being consistent for most (but not all) use cases.  Even
before my patches, MMC already did most of its slow stuff async and my
patches only save ~40ms of boot time per MMC device, so the solution
you talked about for SCSI was already there, but I wanted to save the
extra 40 ms.  If we revert, though, I'm not sure how we will ever get
to the goal of "async probe by default" then, but maybe that was a
pipe dream?  ...presumably we'd also agree that we'll be limiting how
much async work can happen at boot in general since anything in the
path that might lead to a block device needs to be synchronous /
ordered, right?


In any cases, I'm interested to hear thoughts from you and others on the above.


[1] https://lore.kernel.org/r/20160429181248.GW19428@n2100.arm.linux.org.uk/
[2] https://lore.kernel.org/r/5723FCE3.9070308@hurleysoftware.com/


-Doug

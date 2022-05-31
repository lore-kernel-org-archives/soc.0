Return-Path: <torvalds@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3818C433F5
	for <soc@archiver.kernel.org>; Tue, 31 May 2022 16:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76FF6C385A9; Tue, 31 May 2022 16:41:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3DE5C3411D
	for <soc@kernel.org>; Tue, 31 May 2022 16:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3DE5C3411D
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f51.google.com with SMTP id t5so18336997edc.2
        for <soc@kernel.org>; Tue, 31 May 2022 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2w/DuMKGkCId0IhL+87Rlw/4m47o1ovVQT6DsHSgIE=;
        b=CjjCxMkG9BjYxKYLC9ComQadGerm0pG7maothy8LMYDfIBQ12DEXm8VahwPd0mZNx8
         v3YImB6YIt4mYYLyzpggxjSKvsKNJF/G32PfqlVOhn2iPGRIukb0lSsOPrkKTbno6a2F
         NHCRaxjzPZuwuhN/j0E7W+vBxTRDLSGYdAdCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2w/DuMKGkCId0IhL+87Rlw/4m47o1ovVQT6DsHSgIE=;
        b=N04VYTeKs5H0DujGeDbKwt/ur0UqxYFkMt+BFJhj7t6/kmTIbcyU62riRUzbgaqoTJ
         Soamc7huPuEamvGsSB5RBrGY2YZaQIeJPaxPQsL8Q/djsuDFESyJmugnDD3o4dh4SnQm
         tv6FkzHwisGyltJjOuXOBNrU84++MPZXXtvi1vtnCvJxOwWjV2eNDODmOlXzkQbADY8O
         q2AYpon24Cu94JX29dW1JolOiNKgFWBFpYE/JRpuFDOR6Plez7pHLCoJr989Il4SlFc/
         hAPBUe7UaM0C4Tb74orwPHro3bmHFpcs5vkjmkFK7y6xhMLcZs0mcJ/LXt+gVKffKbW7
         7Qng==
X-Gm-Message-State: AOAM532oVMN574hwXui1Jpm9UnXIyLd8YRknYNPz3B1jV79B0p/wUQ+9
	+KmReMMtqlNqMhH9DIS65X9ES7RLFJtwlESh
X-Google-Smtp-Source: ABdhPJxeJuGCSJlrXLiMzLX6uOG1QkzbFLW0FatVUEfk+cul1s9k52sOEYjVy/DYzr7e1D57yUKDqg==
X-Received: by 2002:a05:6402:2712:b0:42b:476b:6c71 with SMTP id y18-20020a056402271200b0042b476b6c71mr53341357edd.413.1654015302931;
        Tue, 31 May 2022 09:41:42 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id q18-20020a056402519200b0042be14040c1sm8553170edd.86.2022.05.31.09.41.40
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 09:41:41 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id p19so8349222wmg.2
        for <soc@kernel.org>; Tue, 31 May 2022 09:41:40 -0700 (PDT)
X-Received: by 2002:a1c:7207:0:b0:397:66ee:9d71 with SMTP id
 n7-20020a1c7207000000b0039766ee9d71mr24513934wmc.8.1654015300146; Tue, 31 May
 2022 09:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr> <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
In-Reply-To: <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 May 2022 09:41:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
Message-ID: <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Jani Nikula <jani.nikula@intel.com>, 
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 1:04 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> As an experiment: what kind of results would we get when looking
> for packed structures and unions that contain any of these:

Yeah, any atomics or locks should always be aligned, and won't even
work (or might be *very* slow) on multiple architectures. Even x86 -
which does very well on unaligned data - reacts badly to sufficiently
unaligned atomics (ie cacheline crossing).

I don't think we have that. Not only because it would already cause
breakage, but simply because the kinds of structures that people pack
aren't generally the kind that contain these kinds of things.

That said, you might have a struct that is packed, but that
intentionally aligns parts of itself, so it *could* be valid.

But it would probably not be a bad idea to check that packed
structures/unions don't have atomic types or locks in them. I _think_
we're all good, but who knows..

            Linus

Return-Path: <SRS0=sFsy=3V=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9889C433FE
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 09:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD53EC433D7; Mon, 21 Nov 2022 09:44:08 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DFC9C433D6;
	Mon, 21 Nov 2022 09:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DFC9C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id z6so6910187qtv.5;
        Mon, 21 Nov 2022 01:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieZjlpZ3qak0sadfZHGHEvvE6+oSvPeWOGhOtNL2sHo=;
        b=4sSugn8Y2Vpr79w0uaZikaBe9LY4FJ9lM48kjVKwMHInl6WrrBldsWjyyBLm16BIk9
         OGZbc0iMBzt6OPQNqVbS9Ye+lRr9x+usjAoN9jpPis4Gf9njiqS9q0nVjpepXCj0ASnf
         wPPYB7obXOlsoF4aEgyM3Bsh7du1pdyijTbz3T7lZ+qoe/rbPhy9QsAL8pDqxPpyJ0fq
         0ly5rxMHl7hDkwVsQPFXZy2qDQC52DmcQWnCnIuK/fzi1B+I6+z/+Mhyc3MP4wrsmaVY
         9+myDqUFrCxLOBIdelEpSx/LQgKKPP4S0s1nqoLk+r9+x8lhwwfqYbs63NCr8w/+H0Ed
         WL+A==
X-Gm-Message-State: ANoB5plEhkgXdCOmlqqDR7P371b3ISHkPun9ggmA5IpsWtjp4i+NbbJI
	mhPzFvgjX7QcFB+r5kV4jUh+UxaYa7IqFA==
X-Google-Smtp-Source: AA0mqf4FhtxW3hHQsdMong2X51uMFa3DwT+/qjhjRZEtY7OqFNYAk7fWcrWY+NkxNMd5nqbjSnvx2w==
X-Received: by 2002:ac8:7615:0:b0:3a5:1be7:3603 with SMTP id t21-20020ac87615000000b003a51be73603mr16711148qtq.168.1669023846403;
        Mon, 21 Nov 2022 01:44:06 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id y28-20020a37f61c000000b006fa22f0494bsm7667888qkj.117.2022.11.21.01.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:44:05 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id n189so507443yba.8;
        Mon, 21 Nov 2022 01:44:05 -0800 (PST)
X-Received: by 2002:a5b:24b:0:b0:6ca:3b11:8d76 with SMTP id
 g11-20020a5b024b000000b006ca3b118d76mr16342904ybp.202.1669023844963; Mon, 21
 Nov 2022 01:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20221118211103.GA1334449-robh@kernel.org>
In-Reply-To: <20221118211103.GA1334449-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2022 10:43:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUM9e3mvfRV2jTBgPH7Xp=wW-k_JrAr5vuZ=PJ-JmjSqw@mail.gmail.com>
Message-ID: <CAMuHMdUM9e3mvfRV2jTBgPH7Xp=wW-k_JrAr5vuZ=PJ-JmjSqw@mail.gmail.com>
Subject: Re: [GIT PULL] Stable branch for .dts to .dtso rename
List-Id: <soc.lore.kernel.org>
To: Rob Herring <robh@kernel.org>, soc@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Davis <afd@ti.com>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, 
	Frank Wunderlich <linux@fw-web.de>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Rob, soc-people,

On Fri, Nov 18, 2022 at 10:11 PM Rob Herring <robh@kernel.org> wrote:
> .dts files for overlays are getting renamed to .dtso. The kbuild support
> for that in in this stable branch. The .dts patches that depend on this
> are here[1]. There's also some new .dts overlay files posted[2].
>
> I'll leave it to the SoC and sub-arch maintainers to decide how you all
> want to handle it from here. Either SoC maintainers can take this branch
> and dependent rename patches or each sub-arch can. In any case, I would
> like it converted over in 6.2 so we can remove .dts -> .dtbo build
> support ASAP and not be carrying both.
>
> Rob
>
> [1] https://lore.kernel.org/all/20221024173434.32518-1-afd@ti.com/
> [2] https://lore.kernel.org/all/20221118190126.100895-12-linux@fw-web.de/
>
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
>
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/dtbo-rename
>
> for you to fetch changes up to dcad240c15c10bebdccd1f29f1a44787528f2d76:
>
>   kbuild: Cleanup DT Overlay intermediate files as appropriate (2022-11-18 14:45:30 -0600)
>
> ----------------------------------------------------------------
> Andrew Davis (4):
>       kbuild: Allow DTB overlays to built from .dtso named source files
>       kbuild: Allow DTB overlays to built into .dtbo.S files
>       staging: pi433: overlay: Rename overlay source file from .dts to .dtso
>       kbuild: Cleanup DT Overlay intermediate files as appropriate
>
> Frank Rowand (1):
>       of: overlay: rename overlay source files from .dts to .dtso

Thanks, pulled into renesas-devel for v6.2, with the "renesas"
patch[1] applied on top, for a special late pull request for soc.

Alternatively, the soc people could just apply [1] directly, if they prefer
doing it that way.

Thanks!

[1] https://lore.kernel.org/all/20221024173434.32518-6-afd@ti.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

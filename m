Return-Path: <SRS0=ibnF=IU=gmail.com=geert.uytterhoeven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB75C433DB
	for <soc@archiver.kernel.org>; Mon, 22 Mar 2021 12:17:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 11A5D6198D; Mon, 22 Mar 2021 12:17:45 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1DC6198B;
	Mon, 22 Mar 2021 12:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E1DC6198B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=geert.uytterhoeven@gmail.com
Received: by mail-vs1-f42.google.com with SMTP id l13so7309153vst.8;
        Mon, 22 Mar 2021 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPgEpzU1+EhZmQwMgoUtTQpTOrmK2g2nAYsCnP+ZK2w=;
        b=TGrV8JB9rRk3IXbuqngWyM/5XX9KcFnLAiYu7SokLrvEfNzLG46fNe8lU/D5rRW57a
         p8kRrGhI+Bv/MaRj5IkJeBCJmaTTQSXIpgcrya/oe2X6b76nZEUqQzfHLQYXWabCb1bx
         3iFy75ucfB+9kwiD7KvJLN7BIs+nuuw73MZzE64nMDAFy3hyC6YqaCNABtxkudpCkH27
         oVTMcvKbbo4L5+yDb8jJQIFV25kLwoB6cn/R4f0jAU5dBTycnUuCT+mhKPfldomNadtF
         bmasCY9UPW7FgXR2j9ZdGqwSeMi9o7wP3wDxCx4HaQv2G8jEnCx6G8WK3Ytd9AC7ailC
         IWHQ==
X-Gm-Message-State: AOAM531U78fr4M3eTYmUV5xvcEdQ60BfqSIQg/IYN/BNtw1VL+iWWF14
	zdaBT4rgklB6Alk153sEzCCP5+OZF5kIoVhPlU8CI6br
X-Google-Smtp-Source: ABdhPJwVpWGzwO18L28qFPoAsIXhxBH6cwNId9V4e47Iag3AKYxFvIfKgJVUUZMsFRnCrLQwRjfrVXfpCs5zgCYtcVg=
X-Received: by 2002:a67:8883:: with SMTP id k125mr8816445vsd.18.1616415463497;
 Mon, 22 Mar 2021 05:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210319085146.2709844-1-geert+renesas@glider.be>
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Mar 2021 13:17:31 +0100
Message-ID: <CAMuHMdXEhw2ZWBk0mw+dENs0TAurHnvt35s6bMX19oQJMhHdXg@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM SoC updates for v5.13
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 19, 2021 at 9:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.13.
>
> It consists of 2 parts:

Oops, 3 parts.  Sorry for that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

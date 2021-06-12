Return-Path: <SRS0=3YLA=LG=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E05C48BCF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:15:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B7CAB613BF; Sat, 12 Jun 2021 16:15:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5422561357
	for <soc@kernel.org>; Sat, 12 Jun 2021 16:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5422561357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=olof@lixom.net
Received: by mail-pf1-f172.google.com with SMTP id k15so7047688pfp.6
        for <soc@kernel.org>; Sat, 12 Jun 2021 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FIBH+1ri25R4Uf47pQvWLvTfi6oNPVbawYQKpiQ2b/A=;
        b=DeqTqzAAowohCmPiS8IGsqYIV4fl3weH6H3Aayb3mamD2WfIZaDoxzlkxl6BnIupGP
         z0EZpCZUdfXVaQu5C6ETuuG0g4Dyu1s59QURB10k1Qv410KqruM/aQQs7f3cv6iAtpP+
         O0XtfhZilEZMJ7DsoNIcJseodaozutKRR6n+kGLAxqatqJSgNj16hUSQ9PtjcA71Cra1
         apI09KFnEvciYpNuCM46vWeU5WBnfVk9zJZSroChKcWmD0hZACW6IddqOUck2k+9d3VV
         ebj9sjebAXjm1wTR4cai2uqtMyzZlRaBzEV5UcjplqKaSh/u9lGRRGGX8w486jXKarWC
         ToDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FIBH+1ri25R4Uf47pQvWLvTfi6oNPVbawYQKpiQ2b/A=;
        b=BjSffPPt29rzA2wffKNvh3klxfZgo+5K2/OJ+VPlBRA3YF+tEosehlwQD49Xq8ngTk
         afVaA9gR+Jz0ck/gkM4snO1NsR3zqn/Uat+rMWDNJS4oMy0Eq26HU0dQWQTA/waSn9j3
         vQFdIzzXQLc4Pagu+ZECmBb8o8RnNocN+9p9Dq+gh3jjqHBx84D8yJ5PXCHptcTqbULP
         B26rMKwlRKMka4mIkEUTokSz0hUdTjrL/Cn15JxgJOrJWBZzvHeokyPdgfpAU3bLmnf9
         dNd1C18Vl+Ldn06IWe+77RJ70IH32wWf9vOoIlEfFXIo7VQI6P78fB0XKjbD3TOHnwb8
         pD1w==
X-Gm-Message-State: AOAM533YVr5LuMCiijBOHzeZCBL2xPM8XHAT5UvMjF9xXVhloRyuyoiC
	dd0lh+ek3dsY+95cBnUho3t4vA==
X-Google-Smtp-Source: ABdhPJyiBAGmfnUsIsMJ4Tosdz2bsA2gkBH/70GI6i/lfX2OyIy9PEWu7tVreMYcTWxjUnP/a7hjFQ==
X-Received: by 2002:a05:6a00:1629:b029:2ef:f4de:244f with SMTP id e9-20020a056a001629b02902eff4de244fmr13756636pfc.6.1623514548939;
        Sat, 12 Jun 2021 09:15:48 -0700 (PDT)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id z6sm8706626pfr.99.2021.06.12.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 09:15:47 -0700 (PDT)
Date: Sat, 12 Jun 2021 08:59:53 -0700
From: Olof Johansson <olof@lixom.net>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
	SoC Team <soc@kernel.org>, Romain Perier <romain.perier@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Mohammed Billoo <mohammed.billoo@gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14
Message-ID: <20210612155953.GA11724@lx2k>
References: <CAFr9PXkMSDvks+DeCNJ6iKf6zDH0VaOL6msirR3g2K7BNL8YkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXkMSDvks+DeCNJ6iKf6zDH0VaOL6msirR3g2K7BNL8YkQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

On Sat, Jun 12, 2021 at 12:09:56PM +0900, Daniel Palmer wrote:
> Hi Arnd, Olof,
> 
> This is my first time doing this so apologies in advance if I've messed this up.
> Anyhow, we have two very small patches for 5.14.

Overall this is the right way to do it, but my tooling spotted a miss: You
didn't sign off on at least one of the patches you applied (the UART one). Make
sure you do 'git am -s' or similar so you have a S-o-b entry when you're the
one applying the patch.

Mind respinning the pull request with that corrected, so we avoid getting an
email from Stephen Rothwell about it too? :)

Beyond that, keeping an eye on how you sort patches when you have more
material: In particular we keep DT, soc, drivers and defconfig updates in
separate branches as much as we can -- sometimes dt-bindings need to be in both
DT and driver branches, for example. That doesn't apply to this pull request,
since the MAINTAINERS entry and the other one fix are fine to bundle (they
would end up in the 'soc' branch at our end).

We can tweak that over time as you get more familiar with how we separate
the streams of patches.


-Olof


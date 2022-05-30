Return-Path: <SRS0=vHxv=WG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAADC433F5
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 06:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90AB2C34119; Mon, 30 May 2022 06:59:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0213FC385B8;
	Mon, 30 May 2022 06:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0213FC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlwJv-1nW62M3FQp-00j4Ux; Mon, 30 May 2022 08:59:05 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-300312ba5e2so100425007b3.0;
        Sun, 29 May 2022 23:59:05 -0700 (PDT)
X-Gm-Message-State: AOAM530XLhXbVUeLotiEplJGRwoaPeiLKVW0Q+emnXWziUjbOXR1o1mU
	SxBysOBV+bUjjXnZLk+u2Ke1pfJUmsLdh8tQOQQ=
X-Google-Smtp-Source: ABdhPJxUw44ZxZjLw4bJuR6gTaVgYPR/zf2umvBRrFctapNjZG+QSh8cQbisCMhP+USKPzZc22esKiCBCM85C4wtFyk=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr57702118ywf.347.1653893944463; Sun, 29
 May 2022 23:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <YpRiZpZU3kH2xprC@linux-8mug>
In-Reply-To: <YpRiZpZU3kH2xprC@linux-8mug>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2022 08:58:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2A_KHKWN3O2Wcy66yCC+T0eBsK8pNcGuLHN-BVeQ1ymw@mail.gmail.com>
Message-ID: <CAK8P3a2A_KHKWN3O2Wcy66yCC+T0eBsK8pNcGuLHN-BVeQ1ymw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: s32g changes for v5.19
To: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Matthias Brugger <mbrugger@suse.com>, s32@nxp.com, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:oPWQgG7jlucf6SRvYGZyIu6lmWfqjlbLkkslxO0m5ZplLByOKEC
 RNGlHCA6/MeL895elU8wd7rs5E64kdojTDvni4k/17jgxuBSFBIUO0CEXEsVd8/R4eTgv4N
 DWO57yjVQ/6MkNflCfu+LkgX9j9z3GdtNXTLLsaUHen9kZ/ZEZkAS8U5yEe3P0zScX/ERJ1
 Wg02dLLVzoZQkqANjYuEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TakvchiQDa0=:y3+WVeNWERW5vkzIH9/4Gh
 dNjil6E7PUrTR74WB+SjtUCkaMIwwe8AKTtoDOE/DAy/5Ekm1Uh1PvHJ4dhgj7qteGPggPthb
 2HoG5gnMtuQfln18htrovp47tKuYVzOe7+gOn+qwCq/DqGsjV22aa/FCzhfXdlaO0lHkFnQx7
 p8MulD+D/BXSCi+NNRRKoX518/KxGDQKML8wnOGF85ntUVAvVx+s0BKnKfWO4Dfj/QnvoI7YF
 EfzQwFoirweWrrqmScg/etAwXtgpY/gAt2xiAY1rmFnTqgo18zutCMDhIq/2a1eEfO3EA3C+d
 xHSJpb3C/hAEdviOnSExV8lnB4fcDOE7q9JOjp9whSjIuzNjqIQwA4FHDdhTH0As83DByH8qU
 /mksOpdP4IvbzqGFGmICf5RPZKcVxFQ4v3hLIlQMz8/nCgOHF1JT6YkEsSEyEQ2qoO2owayhT
 bKZlOzS6eWgVMK1EYXdHmmDcW/2M9TTy6HxqFOGBBa9oT5aosAbfCDLFh07NDnWG2Z21AJGjS
 Rgqu+tQraYxIlK6P5A8J/kGHouaduDihw0+1/yOWQac5Vocm1vX3nCaMeW3Ve/f+mccXVMveF
 97mtoXGy+aLiXa/UZomBFyMhgGUD0+Fy8HNNfAX2pZYgCMcjeS7lGslgVF9s9XTwt9XixLqL/
 CN8GUjxR+Jldq98aSxe925FATYk2d7/k5b0iFs74l3UXGsAu67ojhilF06bHQ9/baaquUbQPo
 rCK/N4qm91z0eI5JNN/oaGNFHVYAh6bmvgT7aiwvLWSIVlz8fmy5U7JGb+16wln9BrFhinLlW
 nycogbGY9Y/EMWyNHBnhLazQDgNo3AgcKUGC1dFQGUuw17slaETvEAypsFLdzJKv0OOCp+0JA
 XGshUVN2FWP1q4C5uPyA==

On Mon, May 30, 2022 at 8:21 AM Chester Lin <clin@suse.com> wrote:
>
> ----------------------------------------------------------------
> s32g changes for v5.19
>
> ----------------------------------------------------------------
> Chester Lin (1):
>       MAINTAINERS: add a new reviewer for S32G
>
> Fabio Estevam (1):
>       Pass unit name to soc node to fix the following W=1 build warning:

The patches look fine, but there are a few minor problems with the
submission:

- The branch is based on top of a random commit from the mainline repository,
  you should instead always base this on top of an -rc tag in order to not
  clutter up the git history or make bisection unnecessarily hard. My 'arm/late'
  branch is currently based on a random commit 16477cdfefdb ("Merge tag
  'asm-generic-5.19' of
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic")
  as well, but this is an exception and I will explain it when I send the pull
  request ;-)

- The tag description is only a single line, there should be at least some
  content in here. Please have a look at other merge commits to see what
  you can put in here. For a small number of independent patches like
  these two, you can also just forward them to soc@kernel.org as
  individual emails without a tag.

- The subject lines of the individual emails should have the right namespace
  listed in them, e.g. 'arm64: s32g: ...'.  Fabio's patch originally had
  this, but it looks like the entire subject line got lost.

- The subject for the pull request indicates that this is meant as your normal
  submission, but this is the wrong time for that, because the merge window
  is currently open. At this point, only bugfixes get merged, but I do classify
  MAINTAINERS changes as bugfixes, so this is actually ok, just change the
  subject.

Please address these and resend.

         Arnd

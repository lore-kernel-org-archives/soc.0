Return-Path: <SRS0=cUWt=OE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96D3C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Sep 2021 13:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B84B6108B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Sep 2021 13:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B84B6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUDafGtItZVPXcPnNnZNic6w1+6QVkZhvepMp0Ot480=; b=0s3YtmIK5GaTgT
	sOgVncFxHBgLKVzsV5qEeSN3nD0t53HrskhcLljqKdOytt9A2RgSajwXA+UcmDBdBgWaoJB7bK3V8
	GqaxX1M44jOqQ3jgUgRG3ThatHZWFoDtq4fNCkME25aGx7ZB+BEnjcVVHbgZH+F1/dLvOPR4bz2Ay
	YJPhYPAxLmHzBlDlXKR1YOCHGYdLV02DLCxc+gj9W9rSTr8nB9o/PKGJbjGxQ0sFG9I0ZOGDaOeTU
	D1tUFxmpkdR0D1kA/uZL56Wuprq/UiAonZ76C3xe1U4SpRDkwNEh5f2vYtTMfAQyp2qI2urEZdsEl
	sAdmPJzpoI0wNjbQJE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ8tW-005uXM-QY; Tue, 14 Sep 2021 13:54:42 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ8tF-005uSG-Kh
 for linux-arm-kernel@lists.infradead.org; Tue, 14 Sep 2021 13:54:29 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9WiK-1mVfCb1Imq-005VcR for <linux-arm-kernel@lists.infradead.org>; Tue, 14
 Sep 2021 15:54:21 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso2616786wmd.5
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 14 Sep 2021 06:54:21 -0700 (PDT)
X-Gm-Message-State: AOAM531km9kYFtlwfba6i6tsnTq7J5YvEH1RAx991WvOg1szHKOqvm7c
 YRAbuG5Z6z3sq/WQI5sVWIYeRoB0TT47giUZpQA=
X-Google-Smtp-Source: ABdhPJzfYT9N1FW1riy+N/kpM3JaauBvGO+lf0r+4PKV8dK91NMoj2dnMEb7hSJi/AoxQAwHMqJzn9JWuELlwpKaDNo=
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr2356251wmp.173.1631627660743; 
 Tue, 14 Sep 2021 06:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-5-romain.perier@gmail.com>
 <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
In-Reply-To: <CAFr9PXnLZC1zfs4e1GqZU4UU3knU-BwREe0-abrWNq7akrTntw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Sep 2021 15:54:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
Message-ID: <CAK8P3a24NTmkyh01OEzDQ8=oTWpUnDtwWQgUUxUbW2wxsgAFeA@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: Add myself as MStar/Sigmastar Armv7 SoC
 maintainers
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Romain Perier <romain.perier@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:+uHvJrOvZX2ySqad2p5xKkrh25CxZcgS8Bah1LQaZzZbxVjkl7v
 a7vme0YHGhOIXh7IvUr3l74O9pXNRBqHkk5g9ysJ4hMgPcoEUb13M1apm8rKx9R2WViTiol
 VRtgCKRe6J8pC43yx7JZ0QCJLZmVjAGP+R8/HgGTEX3yCrJuH+rXyTp3Adp83cfmIh2Ecg2
 YUPzuFEY/h/iqqIb5p0HA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dBWOPYTk2Jo=:y87hWXeYWBHolS8p3+KW1N
 0vRp871bYx7+xcZgJUWuz2DJ6yJvcmL28MGJaJLV/uxCwhw0ViGsg3C0JbdoCODsF4q3FbBOU
 XNgq0Q8OLLux72h6u1Jdtol87B/70hRVG2BMmJKXGb9FDaYvq6QkWOLTudFOnsot8sqOBAzlF
 polab8IclRLhHQh4sUm1zB40/eKVbf3nv7YJZXg1YsjbR7vcOP6g6jP+GjMknvQ8MbU7z5CkZ
 tknZ9VkCpTm3HhehAGoKVKO+J3SS2pZHSRhES/wPQKuN3iAfORwer1qOfrwFEVk4Bx9BF6qrz
 /HNiiJDeh4HKpCBrGu+xIxwiuPDCuNWpbbaS8eLcw/LDbttm6kEEKls7rJozBxwy0FKCgQE1p
 XTzxlyGRp6xrNsHFektW5YTPOIwm5PplVGC2/zF1VGyx9aBe43gQpw4xCKFhNnO0/SzOQiVHB
 JF6RQS+iQ8oHAVeKOXcEvTZbcNzD3uoSec6FUOa+z2hWleg1pSFtzWiSi7WIMKzAFadLNhgHt
 N3z4e8jVfnhYKzQ8KKfBsR2wh9H5hyjPe22a0FfsSH4RxHo1Xet4uIzdw7OVRVJ7tXm+Az0AA
 r5bU+Fn4dmuM3pfP1XT9vrMqSPsW7P9BkB3tO9U/6y0Oq9uoSwIHJldJ8PEp4tmSAlJUOGRzD
 DBN7TlP/nN66PfZZWrVD670XMnAVj0AFnjNjXbhZVUXBouURUeLZH/7kfDW6X9EBdCvhOOl77
 yy5tPv/jhAv59/E31WwQw3ATzjlkVLW7mhDRhZXsL2oCKkPTLBPTwJyvAyp7Xmr9nJ63Y5Y3u
 2PfnJyaCuc0ADG+NWFC5La6BG/1wdLU0fZF0Q9y7Nrca+pfEvczluLUbpkdnImjc5khejsMqC
 heg+wh0uq6MykerCjsgA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_065426_032041_51AB1B44 
X-CRM114-Status: GOOD (  26.01  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210914135404.sU3SgUIVmXy-eKlMo7YpzMEaOxhI3idFIzhgE0HY_RM@z>

On Sat, Sep 11, 2021 at 4:57 AM Daniel Palmer <daniel@0x0f.com> wrote:
> On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
> >
> > As proposed by Daniel, I am going to help him to maintain the platform,
> > so add myself as co-maintainer.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a9a7cbf9456..ad1a0e5a5425 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2231,6 +2231,7 @@ F:        arch/arm/mach-pxa/mioa701.c
> >
> >  ARM/MStar/Sigmastar Armv7 SoC support
> >  M:     Daniel Palmer <daniel@thingy.jp>
> > +M:     Romain Perier <romain.perier@gmail.com>
> >  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:     Maintained
> >  W:     http://linux-chenxing.org/
> > --
> > 2.33.0
> >
>
> Acked-by: Daniel Palmer <daniel@thingy.jp>
>
> For everyone else: For MStar/SigmaStar I have a ~350 commit backlog
> that makes almost everything work on these machines.
> It's impossible for me to finish up working out the hardware and clean
> up and push patches without the whole process taking years.
> Romain stepped up to help out and has been pulling out patches,
> cleaning them up and pushing them. He deserves to be listed as a
> maintainer.

Sounds good to me.

One process issue though: These emails were sent 'cc:soc@kernel.org', so
they end up in patchwork, but I'm guessing they were not actually meant
for us to apply from there. I'm happy to take merge these patches (or
a future version of the series) directly from patchwork if that's what you
both had in mind, but for clarity please either

a) drop soc@kernel.org from Cc for patches that are meant for review
and will be part of a pull request.

or

b) put soc@kernel.org in the 'to:' field after they have been reviewed
and you want them to get merged.

Or even better, add an explicit sentence below the '---' line asking
for the patches to be merged directly into the soc tree when this
is what you want.

FWIW, I'd suggest merging the MAINTAINERS file change as a
bugfix for 5.15, it's generally better to do these as early as possible
to make sure any patches reach all the right people.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

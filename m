Return-Path: <SRS0=oAPY=JR=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ABEC433B4
	for <soc@archiver.kernel.org>; Tue, 20 Apr 2021 07:11:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 37EEF613B0; Tue, 20 Apr 2021 07:11:16 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72ED6135F
	for <soc@kernel.org>; Tue, 20 Apr 2021 07:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A72ED6135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qt1-f169.google.com with SMTP id j7so28002242qtx.5
        for <soc@kernel.org>; Tue, 20 Apr 2021 00:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=;
        b=Gx++tH4AZWupH+et5Effwkd0iMutrH8tdoiYP7yEr25VGnFXkssJlvBalJCttRrMp4
         gNScOAIXzH2AwqjtaYOdCbemU5IHr4byYrk0cifVfsT3BDuoGAjTAOYc9xIOMxwR6Nom
         UhBes4t0y4otC5W3lLl6pVmAoeEA4pE8yygXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DyGio9SalvX0/PlzfEkjduQC/y5WfEdpA8EplVfOAKY=;
        b=lOcuzWxH9NPkfm+hT63eQfxyzBximEerFF4ifqc54v4d56KK/Z7L4igSbL00Ip7VMl
         aiiTCjt3gYT7qlOdTrvvCu38Gm2n2RyZK1LeHDRcYw0gs2Q9DNCF1hyxUGXmlF4lJbCW
         JPWLM4pEgLWX24b5TnbEaL6fyxBR+85oJ3mT7rbU7i+uI001lcgINLk1KviFZVrQWex8
         Km0NEsTkPlP+pNf7cfPwhoPUyyHzwESR2lYIUzY0WuxHVOwviGuZ0UdohZnqOFycLeoZ
         sStPO3jwtXFHF1jaoON+PBOzB5WCuVH3RK+sDfGSdkwfo2EBETQCXMm7yF6M977+FTfZ
         MVuA==
X-Gm-Message-State: AOAM531+gSi5FH0kwhYHNkdWZvyOvCKMozVwloAKZsqge6RAgE+LSe1Y
	5Ls6SPGz++eYp7QZ/2E4EMSlCEi5T/G2Ep1aCrKyt3qrOoo=
X-Google-Smtp-Source: ABdhPJzRM0jLdBC1S6f8WwRWuDOdWL0MF6ILvix9Rcgs8unRf15jqAmHD7u9NAj5MuihLO9nz3BlyRgykR9CJm+2GqY=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr15120825qta.135.1618902674177;
 Tue, 20 Apr 2021 00:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xeet50bqWAY0jG_GRkgvKvFn94XtGDaq1gaVYVkyV_JUQ@mail.gmail.com>
 <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
In-Reply-To: <CAK8P3a1rG6qKjVvr86G=6cgkhReQUbsvQAkdxg7A2HsJ7n499A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Apr 2021 07:11:01 +0000
Message-ID: <CACPK8XfkSQpMz9J+8xN7DP9Wabv=+DAgmX6NGL9742Ss3HsehA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: bmc: devicetree changes for 5.13, v2
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Apr 2021 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Apr 16, 2021 at 5:27 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello Soc maintainers,
> >
> > Here are some fixes for the changes that have already been merged for v5.13.
> >
> > I also merged some changes that came in later. If you would prefer to
> > not take them then I can send a pull with just the fixes.
> >
> > The following changes since commit f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
> >
> > for you to fetch changes up to f0145db24e65f6cf13347a90ffb86e5ef2ff2ca2:
>
> Hi Joel,
>
> something about this pull request doesn't add up, and 'b4' refuses
> to pull it since the 'since commit f0145db2' and 'up to f0145db2'
> references refer to the same commit.
>
> I assume this is just a copy-paste error on your end, but it would
> be nice if you could double-check and resend the pull request
> based on the ee33e2fb3d70 commit that I merged.

Nice catch. It looks I've generated pull requests incorrectly from
v5.5 onwards, and this is the first time we've noticed. My bash
history shows I started generating them like this:

 git request-pull tag url tag

v5.4 was the first time I'd sent a second PR for the same branch, so
when it came to generating the next one ctrl+R'd myself into the wrong
syntax and continued doing so ever since.

I'll try sending this one again now.

Cheers,

Joel

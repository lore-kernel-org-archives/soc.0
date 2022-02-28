Return-Path: <SRS0=M0Ae=TL=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCFFC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 05:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4340CC340F1; Mon, 28 Feb 2022 05:52:49 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61E85C340E7
	for <soc@kernel.org>; Mon, 28 Feb 2022 05:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61E85C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id bc10so8062329qtb.5
        for <soc@kernel.org>; Sun, 27 Feb 2022 21:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LrukX6XuAExN6DS+A748ipHnszpJnU5/xeoTyFh+5FE=;
        b=QJqrOXmnnt8dXzx3vbEr4LllK2vm/4kchgsHqIbiK+j1GJo5lrBO2LlN8g8EMMLdbC
         GhZnXmt4F+BDB3/xJblkL7YLy1zUjkFwPI7dAkCMsqV/zNodjs2/33gTeO9StYB4y2qB
         Bxd0UhV0qlZ+YNLtUfUw6U01hGPDCPqHuy1xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LrukX6XuAExN6DS+A748ipHnszpJnU5/xeoTyFh+5FE=;
        b=g06n1tFe9g/RGU7SaJQig9Nx4ZWgMkTyZ+V3S1jqsZXUDOsdW4ZKXqkJ8BjnU0Z+hY
         CmYrsEJDNi5xj10xC7kVnvDxmqhMUaRJzfl8pC/g7W5Vak/gf5+0TgS0Fdjc5/o5iRS7
         qGs+0C1XR+2XwKzGuxMiRkgGy7CYGYotNLS8JxyhakYs0g7R4olzP7ouYZ7RDnyBr96/
         bpX2ZBDDXt4gcj1wgFMReucPRps6sjU6wuzmNon/e+WjLyC6dxNIrwdf4zCDA0ugWwUb
         9Ma6q3fqeOIkWg8pA8+u/friQovDz8jpcvraC8IvEn7v446ghGvWkKXMTOA+ai9QkiKN
         W8eQ==
X-Gm-Message-State: AOAM532YeoFOFgMRg6UxXo0WjJ3avjOlggXu5+ghJ7OCNAbep2bkyvxn
	WfkqSLHNGva3HioDeMvaBdik58ZAlJmca6xeiFs=
X-Google-Smtp-Source: ABdhPJzslGO3+BoncCaVwGhHKRxKEWa0ZEfksh/00spANaq9+RgKHbYr3XP8TDb7VmoNC7+qm++bxxZrvKJ2jM7MCJc=
X-Received: by 2002:ac8:5d89:0:b0:2df:f357:c681 with SMTP id
 d9-20020ac85d89000000b002dff357c681mr8622008qtx.475.1646027566328; Sun, 27
 Feb 2022 21:52:46 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XcLpAA7b_hGea-Wc8H5eu9=YpPZ9b75nYF7rqMzDcMw9w@mail.gmail.com>
 <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3eXgHSX8wUX030rzvMtnqaEjjKqCeX3=uJEK59iTLtEQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 05:52:34 +0000
Message-ID: <CACPK8XcxuoF8U0ruwBakTLKxXzfW66tL7taK=y011LxSE1=uSg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.18
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Feb 2022 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Feb 21, 2022 at 9:57 AM Joel Stanley <joel@jms.id.au> wrote:
> > ----------------------------------------------------------------
> > ASPEED device tree updates for 5.18
> >
> >  - New machines
> >
> >   * Quanta S6Q AST2600 BMC
> >   * Facebook's Bletchley is not new, but has a large update
> >
> >  - Small clenaups and additions for Everest, Rainier and Tacoma, and th=
e
> >    flash layout
> >
> > ----------------------------------------------------------------
> > Jonathan Neusch=C3=A4fer (8):
> >       dt-bindings: arm/npcm: Add binding for global control registers (=
GCR)
> >       MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM arch=
itecture
> >       ARM: dts: wpcm450: Add global control registers (GCR) node
> >       ARM: dts: wpcm450: Add pinctrl and GPIO nodes
> >       ARM: dts: wpcm450: Add pin functions
> >       ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and button=
s
> >       ARM: dts: wpcm450: Add pinmux information to UART0
> >       MAINTAINERS: ARM/WPCM450: Add 'W:' line with wiki
>
> It looks like you tagged the wrong branch, these are the same contents
> as in the nuvoton branch, but the description is for aspeed.
>
> I assume you have the correct branch somewhere local, so please resend
> the fixed pull request

I did! The correct branch was pushed to korg, but I tagged the wrong
branch. My bad, I'll send a v2.

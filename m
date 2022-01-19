Return-Path: <SRS0=GX8l=SD=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784ADC433F5
	for <soc@archiver.kernel.org>; Wed, 19 Jan 2022 16:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 362D1C004E1; Wed, 19 Jan 2022 16:53:20 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08CE8C340E6
	for <soc@kernel.org>; Wed, 19 Jan 2022 16:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08CE8C340E6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pj1-f48.google.com with SMTP id w12-20020a17090a528c00b001b276aa3aabso7091257pjh.0
        for <soc@kernel.org>; Wed, 19 Jan 2022 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+RdjTOUEbyGxqpzNJfmpiBGT/Qva80FiHw/y1GbjwPA=;
        b=VC++GBBKZxSlQK1MeJ8/adrnCrR+HqC5AjgaJ87sV6yQwv6UNd9+EfBLAbQq25/IpZ
         COIQfU/sNNt8DiuWzMfZMSDjcqZIkReC+MU/rlTDP4usJAxA6JhDmeUbzXDzdSfXj9H/
         KKuifvveVFlYsPghSlU5vIeChPL16OsbnDGCGwgCDlRLwCleGK+Dfagzr+hT7zi9svy0
         8sPkUpPh9Y5+CNHRCZ9QtJTaomL2De/w+r2UTO6dqSE+BObGH/sw/N3ZTlA4t1FuIlt3
         3SFQt0mNQ+QsDQkfXobnZfNBRxHmh+D5wtA6Tgu+UJRasDpCVv/j1N4kGx3W0AQwAnFD
         +bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+RdjTOUEbyGxqpzNJfmpiBGT/Qva80FiHw/y1GbjwPA=;
        b=1MVeQCHqWAudk86PN+0ffHzELPCFz/oBdlmq/WhzQ4dZjQkrhLuyERPg+ikPtDlwRW
         rIPCfLx9+lsv7Eru6t1+muLKfnKkJmma0pnj6CTvPv0Irqxh2RVcC9dS5KaOZiy70q2b
         AMS9BaF6pJw0kJ/q+BFCowpo9TQCK0ZWBz5Dh5Vi9az2n7lkZT8E3rXTvtPjcmc6Ijtz
         gxD3quuiPM4bM/zS4qWrVh+uzb+p28Mb6LYgLgedhwk+ZTX62ZsPAjfDrQibDc30TroD
         PS/+h6JM54eRU1GXCI8K3bzmfVbzWDCIry6Ltpzzb86YirvoDvtT51LGdtHPuEVGZiBw
         qCLw==
X-Gm-Message-State: AOAM533ZwQZmJMbvg53DAGEc6t2q6If7Sf5vS+gsYgTB9HXOS7Sw1TVv
	BlDDGz3TJybGpotvLjQ1nbOGNpJhOgnap3P+gWwqkw==
X-Google-Smtp-Source: ABdhPJx+TbATIF4nHmGFZOPmddAbhmsVuTuIxbk1yLpFJzNPz12fXYYOKY+MiX3okodET0I2JmpVeX0B+YvZ5tgCzzU=
X-Received: by 2002:a17:902:ce8e:b0:14a:6938:c925 with SMTP id
 f14-20020a170902ce8e00b0014a6938c925mr34346856plg.46.1642611197416; Wed, 19
 Jan 2022 08:53:17 -0800 (PST)
MIME-Version: 1.0
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com> <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
In-Reply-To: <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Wed, 19 Jan 2022 08:53:05 -0800
Message-ID: <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 19, 2022 at 8:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
> > On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> >
> > Hi Olof, Arnd,
> >
> > Just want to check if it's possible for those patches to be applied in
> > v5.17? Sorry for the noise, but that's important to me.
>
> I can see that Olof merged merged this into the "arm/late" branch in
> the soc tree,
> so I assume he still plans to send it in the next few days.

Yep, will be sent up today most likely.

> With the timing over Christmas, I sent out the large bulk of the
> contents (anything
> I merged before Dec 23) last year, and Linus already merged it, the rest ended
> up in the "late" branch.
>
> As usual, there is no guarantee that late changes make it in, but I have seen
> no indication of any problems so far.

Correct. Been sitting on it for a while in case there were fixes
coming in for the first pieces that got merged, but in traditional
fashion I'm guessing those will start to show up a few days after the
late branch gets merged. :)


-Olof

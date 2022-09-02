Return-Path: <SRS0=fnla=ZF=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BBAECAAD5
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 13:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40C35C43470; Fri,  2 Sep 2022 13:26:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 183A0C433C1
	for <soc@kernel.org>; Fri,  2 Sep 2022 13:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 183A0C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id bj12so3818717ejb.13
        for <soc@kernel.org>; Fri, 02 Sep 2022 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ZF/uMwTcnfyz2qEE7xRsLAhPm27QsIK3fVdRMITh1go=;
        b=mtCXZWdp9QgmrYW++Cea2CEB1DgoyAJM1tlVGEe5YBBxfrhzbIOh++mMUvheALAnUJ
         qglEpw7YAZAqrT0t19/ZFVIhClLwiJuoc+Gc2atWP13qPCL2scgmjjlzWm+XD5L5t84b
         pDE519WHl1qfcZnXOQxXEsiQfqsGdayCi14KO0qLt1ZVPU7SLwI0KPFrWqryauaiJf19
         BxwZTV44yNf/DLXwCaIiwcaftVf4ADpFA8ky6TvhyLS5z7cT3imLS15KDFLk04iJvh8i
         hK8dmoA99XTyG2NO5reAVYM8gTNza6KFWvKuN3AKeOZjjUvJGrGduYP6puiDVkMG6CSe
         MzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZF/uMwTcnfyz2qEE7xRsLAhPm27QsIK3fVdRMITh1go=;
        b=Mr3oquvAAYOjDEZkQxIc1Jt17hiI9ICnH6Xm4AnZzcPOtjFhhisx55h5VDue35fquN
         XrZy9EMpeYVUquWXIUoFRHHV9Fff5+A/inTmJosQ9DHRRsfTdvd8LJDPLm833m+4Vf9a
         hVy0JLFVsQO1KZe2YlYRHDY4vw4wgVvKB5zAavU+/BrM0hSuWnd3bwZpVVcDdbDJMO1G
         SJcJG4rOAFLl+GYAGWVUZHkSHoqHp0bMkrSA/r1YY6XSrH0VdgSM6vDLD5dyJG0p6xnw
         YLvAs0UyzvfgAVSgYzAK4y66v0rjbzCtOCuOzpnUizCmQBIpnAMhiExekI9fP1x94JB6
         r3qg==
X-Gm-Message-State: ACgBeo3pg9dFXWddwoEgdAWSnReSfik8vqmQLRR28RSmY1JRB28dCj7N
	RrN2yPdJhOu0lNOCphSu6/UvTySwl8e8UWkz6vhRpA==
X-Google-Smtp-Source: AA6agR6uVeydIrFZMSXhTDDYS4+Yng+f3hQTQnzA1QcrBi8I6dCnkKtn5QHHr9QNmRCaKQoIFPtEWdFKnqttE3hhFYA=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr21506072ejc.208.1662125177323; Fri, 02
 Sep 2022 06:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
 <CACRpkdb25ikL4F499NDCrv1kf2FGvJxqDW2wk9GNQCqrbX9kKQ@mail.gmail.com> <bb4804c0-04d2-6e0c-b9db-1243828ca515@gmail.com>
In-Reply-To: <bb4804c0-04d2-6e0c-b9db-1243828ca515@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 2 Sep 2022 15:26:06 +0200
Message-ID: <CACRpkdZwkhvM7JGeisdAyh4Bg2hx5E+dSG89Psb=13hD+wkjoQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for i.MXRT1170-evk
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, 
	stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, 
	olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, 
	dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, 
	leoyang.li@nxp.com, sebastian.reichel@collabora.com, 
	cniedermaier@dh-electronics.com, clin@suse.com, 
	giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 2:57 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> On 9/2/22 04:06, Linus Walleij wrote:
> > On Thu, Sep 1, 2022 at 8:33 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> >
> >> This patch contains:
> >> - Update to imxrt_defconfig
> >> - Devicetree
> >> - Clock driver
> >> - Pinctrl driver
> >
> > No it does not, I already merged that.
> >
> > I think you should probably split up your series per-subsystem so the
> > clock bindings and changes can be merged separately etc.
> >
> > Then the DTS files can be added to the ARM SoC tree as a final step.
> >
> > When you send everything in one bundle like this subsystem maintainers
> > don't know if they can merge e.g. just the clock patches separately
> > and be done with their part (like what I did with pinctrl).
>
> Do you think its possible to add Docs for Device tree compatibles that
> aren't added yet?

Bindings and drivers are orthogonal, we only submit them together
to provide context for reviewers.

It is also possible to submit device trees with compatibles and entire
nodes without bindings because there essentially is no real police for
this. Of course it is not recommended.

If you are confident that bindings and device trees will come in the
same merge window it is fine to merge them separately through different
trees.

Yours,
Linus Walleij

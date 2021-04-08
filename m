Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88042C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 21:55:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24626610E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 21:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24626610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qiMwWfeTenZa6ClEwGhr/bG/oQzhgAfXTdSXABZnxy8=; b=LDkwD++CggGuo6MZ7F6DEpaRx
	7zUjHn/BSa8gpHyL5O+UFi/OhgLteg0Sbfoe86cya9E+6YBBFlL7KpIdUiZnxPgP520FGkUt4Zow9
	pjJVCzw/9vKrHwgeHc6py13kUcMNmWHw6EPNskrQGlZxMvXnxobgK1UIj1wdJBjeLjtEBgUGjSzz+
	WSFXI9QUJFNC072KJTsgK94GJCOcq3Jbf9zIVkup5ByohrS3LnYX6ir/DzPpg/iMywxB4N3TjDvr6
	Sw3QKHqb/9CdUwyabiqOCQSUiipQNPvu1BZ58CKcpniWo7u5ztwD+5i9A9wg+SvvcifmrD1HgY4uf
	18Vo7/ciQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUcah-009L4E-1z; Thu, 08 Apr 2021 21:53:31 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUcab-009L3G-Cj
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 21:53:28 +0000
Received: by mail-qt1-x832.google.com with SMTP id y2so2671543qtw.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5g1l8xifarnGFKZcfnX8WD2aF8Apzj6HD5egcyeUh8=;
 b=vaG2KBh189d7TZmUuvPHgxCJvrL7amxUPUc71iQ/utCzeDOi1HhJnVZZ1eT4/aKxQq
 LcDpwKA/93MWV5MLbATVwcP9LygPP3KGNBj5JkRSvfCvqDpOQK9YnLIkrv4EkYlecESb
 8eVkj882/feUO1nOujrywbsC+RxU5IGYfzzQOKNgf1YhjYSLBtN8ahzLXmhb2ib4s/G+
 iz8LSf+gJeD92JDc1U0cSgXROYw7dx170PtdpH0hidMSm6GzWkzFa3h8U/9PmhE/M7Mr
 bkcAGXSejjfmyxLMa9Y/9qBdrpLrOb03V+MzLUeyaouqBnRPsp/obm1EpL67KKT6/99M
 /vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5g1l8xifarnGFKZcfnX8WD2aF8Apzj6HD5egcyeUh8=;
 b=ZJcH26rZSBsmedvFTT382Ow+5fkeZdgyz2xQHZW1Z+lSABAplrN4yV9sgeBja8yMIk
 A+4ynUjote/hUBCG/rMN2cwfVGwwJ1vs+Q63aN57j+v+/NxKQ/8iOlowRZgFFmfRHT4Y
 nzmr6tcO379SrnSiJoQIOPxycxMwcjshaRX/oe646hLRpmt5EpIKJ18zhGUzkctj/zks
 pysxwAuACBQdtgeO8yvIk/pY77Nq5Z9KrRJ9VYgJ4gR5+pFTCcmoTwUHhgxjp0X83/Qp
 jiobxgqNbonAoy5psZuIq6lwptXKMYVs/VAMoRwa+0TgKiGUuwiE7vkzAUecI9TdiMvo
 V+RA==
X-Gm-Message-State: AOAM531xWJnSq2u8PXvIEZzjlJtDN3rUXTnIYHiXIgieF7xMpX5i/wvk
 lfCf1YOgZi0NSdKFqV7wGnC8IY+KnVvyZak2jOGhiQ==
X-Google-Smtp-Source: ABdhPJwazj9FWuSPV9bHxG8ukv+3bBFs/5s4EePYj0/79a4vdUFo+2UxV8RU8gK+M9NIUTF1Ek/hqPP1sKhPeo53OuM=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr9398597qta.135.1617918803348; 
 Thu, 08 Apr 2021 14:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de>
 <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
In-Reply-To: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Apr 2021 00:53:12 +0300
Message-ID: <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jack Pham <jackp@codeaurora.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Kevin Hilman <khilman@baylibre.com>, Rajendra Nayak <rnayak@codeaurora.org>, 
 Sandeep Maheswaram <sanm@codeaurora.org>, Robert Foss <robert.foss@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
 Andy Gross <agross@kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 satya priya <skakit@codeaurora.org>, 
 Abhishek Kumar <kuabhs@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Shawn Guo <shawn.guo@linaro.org>, 
 Alexandru M Stan <amstan@chromium.org>, Maulik Shah <mkshah@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_225325_546126_A78BA853 
X-CRM114-Status: GOOD (  18.38  )
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
Message-ID: <20210408215312.O3h2ku7xrEyzP-2urV7HAugi0GTWj8d281Awszxex2c@z>

On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > >
> >
> > I'm about to send you a another set of pull requests with some more
> > goodies that was lingering on the list. I will take a look to see if I
> > can follow up on that with some fixes for above warnings - and take
> > another look at incorporating dtbs_check in my workflow.
>
> Ok, sounds good. As I mentioned, I'm also just learning how to use
> dtbs_check properly. Unfortunately, it takes ages to run on a
> non-parallel build,
> and using 'make -j32' as I normally do means the output gets reordered
> with every run.
>
> It's probably ok if you figure out how to only run it for the files you
> actually change in the Qualcomm tree.

Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
less painful.

-- 
With best wishes
Dmitry

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

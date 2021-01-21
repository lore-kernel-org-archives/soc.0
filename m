Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7BFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:04:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A1B7238D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A1B7238D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OUUeC56vX5zSH4/6RYE0yAG5skyzNwyeHi2h/xmLBYo=; b=iHTSoMludJj0E4ZdgoSexdXm4
	+8gtSMzBVWooReM47vjhnqeE05xoGBrkwKfm5p1XH5ojs3lZUa5ihqpnp3tJ8gMlzdn+vyE9UIs5c
	10nKO1VEywCkEHLuMfXZgYz8FabPstvy/LfjUaNVVH314H7F4MRIUjr2ufgsAdp7gchX0iEXDCSVH
	ycK+gn35u3/RDzLqQICOu4iSr2m5mQfrmQN+h+edYdSmdhi+4wyiHShqEd3l2d+T7vVDXjBsq3p/+
	OJ0ej97wjBM7ipof9cUPzhvbfSL01L26IruFpWes3mkOo29Jnfz+OXgpuhqYRcF4z/bqIvfHNNm3l
	5dvBrhYbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Wna-0001I2-Un; Thu, 21 Jan 2021 10:02:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2WnX-0001HY-T4
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 10:02:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 955E22399A
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Jan 2021 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611223358;
 bh=0g1Qyr+c0075Y5vEhiNGpW/8oK0y2CtwQYj0OvCHfs8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=qPzQd3mvNkB50G7USYawjUgisB+MSiLOkhUerV0JV+HiOID8wmgybGcOAEwmLFtb3
 nWsfhfXXH8e/RhbGr5ZXYw/A1yJUqr7WCmnkBLUZmfHk6ZLbWuZCwQ9mpRJAvkcNP7
 LpeBSS6MJsGHpWZLB1sy5nV+RbQDACxv1neukRuwBNN4zw9lsLwu4FjJCN/AlTDDcq
 nFhGw2Zg3Z7kZJtb8m7WAt8s8cFMwuRwCLwjfL7l3JGVC8Rz5UiN7IlRGO5mAUTrz9
 fbofZxcKtkCtcXWEQVk16HJM8l3eIXa+FI05yU1UUQ8KXSXRzmOyOayhNjVjdD+TRG
 nrItLch7obm8A==
Received: by mail-ot1-f42.google.com with SMTP id h14so1071807otr.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Jan 2021 02:02:38 -0800 (PST)
X-Gm-Message-State: AOAM530jMbhiL7gn0KnJjhnsoSlkdY2YhnnZvoexSHtVgZTrt8+VMwsq
 3MFQX5/BMUsV0xZ1MX0N7u0RNFqc/Dy0QxR2ntg=
X-Google-Smtp-Source: ABdhPJxu5gTSXAh66TG6pp98dbKpmSWbbtFerQ1SryF100skSDX3YtoYt1B2xrPW7rBFkA3uXs3CMFkviwD563OZ8rw=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr10174614otc.251.1611223357853; 
 Thu, 21 Jan 2021 02:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20210120124812.2800027-1-arnd@kernel.org>
 <20210120124812.2800027-6-arnd@kernel.org>
 <CACRpkdaMZdUebQy7KOeAQz9wqGUWW3_PJUcD8N500NQZ0wXX2Q@mail.gmail.com>
In-Reply-To: <CACRpkdaMZdUebQy7KOeAQz9wqGUWW3_PJUcD8N500NQZ0wXX2Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Jan 2021 11:02:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0CTquq6vzVV37xHUwNH+TtRJPQbqAk4NMz+yai66a+fg@mail.gmail.com>
Message-ID: <CAK8P3a0CTquq6vzVV37xHUwNH+TtRJPQbqAk4NMz+yai66a+fg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: remove u300 platform
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_050240_025537_0B54F420 
X-CRM114-Status: GOOD (  23.45  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121100221.N0Ly8u09ZfxWv5JsqhdQz8Rb8rEHeU5mtaY7S3vcZ3o@z>

On Thu, Jan 21, 2021 at 9:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jan 20, 2021 at 1:48 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The Ericsson U300 platform was one of two ARM929 based SoC platforms for
> > mobile phones in ST-Ericsson after the merger of Ericsson with ST-NXP
> > into ST-Ericsson, the other one being the ST Nomadik.
> >
> > The platform was not widely adopted in Linux based systems and was
> > replaced with the far superior ST-Ericsson U8500 in 2011, but Linus
> > Walleij kept maintaining the code for the whole time.
> >
> > Linus continues to use the Nomadik machine, but decided to drop
> > u300 from the kernel as part of this year's spring cleaning.
> > Thanks for having maintained it all these years.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Link: https://lore.kernel.org/lkml/CACRpkdbJkiHR9FSfJTH_5d_qRU1__dRXHM1TL40iqNRKbGQfrQ@mail.gmail.com/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I was planning to do this but you got there first :)
>
> The reason I cannot work on it anymore is that the device
> requires a special signing server to flash new kernels and
> I don't have access to that, and we never created a U-boot or
> similar for this device so anything needed to go in through
> that flashing tool.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Will you queue the patch for ARM SoC?

Yes, I'll pick up the five patches in this series directly, while the
drivers should go through the other subsystem trees, so please
apply the pinctrl/gpio patches to your respective tree.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

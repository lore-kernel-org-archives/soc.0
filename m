Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EB1C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 22:22:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E72B239D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 22:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E72B239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=64QQUxW/NA2IyUphoitOZWAfbsYAZlv6qAp8bEjGGF0=; b=C7vitDjUQGUqVDxVnDxMkyHhO
	4oLfQSLaU5wE3uu6ywhq8/eR5YJhlkQbG1Q15nkl3rhBcAYCs8FhGLFUTZfx1bPoBarJ1WHrtl/oI
	QObZ+Khyl8mttrNvM8XQxLQUx+W4Qd09ZK0NBPB9zgaAHXqfhD5W3XY3SPTKYwrObWkrhsg9EzmXU
	PxRZNXs18QTUfuVhCDKdZcL5DdnwVLUIFADPYxfciXDR6uMcvhVsicGLJ3Qi+BtuMGbDkz3V8RQsF
	YkhKD3WJAELraTnKJwCm74GrTn+JOc1x0eZ6V2aIWg5EUdFqVQQyskAT85Akshm369P9abXWoXPkq
	BAe/nh9cA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0XT8-0007rR-54; Fri, 15 Jan 2021 22:21:22 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0XT4-0007qs-TS
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 22:21:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id v24so8783222lfr.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 14:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P5tRwFZpJtVF/buhxZcoEoFQtvw2RmFYD11GvJuVe9E=;
 b=OyyLbfx9J1qLgRci7wZTIyT4U9KdlUzetkeHVvVxvlw82fsYYml+Fkzsds7VfcTzaW
 ehrV2wHLPbV/yX/eT/taKe0AFrnkF2wixHO9J6lqy7pVfo+hN6IcC7kH/umPa0X7sPGd
 0i+VKkhYyV2PWy+1o/gARg6hLaQxh3nyCTo/KNdhebVl9unlWNBHegnqlGXh/XcgVgiX
 bHabjLBC4Ctnx/IwRjH3tyap8bs7CXZMGO9jLSJnsDM809Jvg/3H1KFr4Nz9b+U5tjOm
 ogxjejK4qkMRDhnzinWDTKVjSLxF8nbKFD7923Pi4wYq+FTMgD11wNL2r5+J681PBlbY
 2GwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P5tRwFZpJtVF/buhxZcoEoFQtvw2RmFYD11GvJuVe9E=;
 b=UsQqkuA12E9k7McGdS0XlhgdB8WQVixqmbLU9/bWMb8WqrpDf2BwpC8zSwaaQRVLD3
 IGpIC0aU0YIwoAD1UfQEUaVWF+88KcO3KmYcsgrATd2h+T11U0id90aRZ8/BNE/0ZiI3
 JZ7b4fSlGZPG1dHTAqEkxlk4iHNetmbNb8KKXL/J27B2CEIL+EOfziZYaslwgQsYBBq3
 hr2B7xP3Ul4cpRZlNnbo3bSONTunJeA76v9sUBgkGtQmQgfdoejRAUujvCVgfDHmjcfD
 v3wddzOIsHB+kK/223U3tCChJLMlsQ9R979Wg7u4CxVv9o6bIIG5VPRQsTZHMZ/+YF3y
 UM3g==
X-Gm-Message-State: AOAM532Il1z7OlGeAMhkE9tY72HtObSzKS68/qA85uzJYFauMDyS5yOL
 mXHfkTnzTZ+DtKt8cbrpSIILCGHCORi57b4EnKCAVQ==
X-Google-Smtp-Source: ABdhPJyazJTE6p8cMWOgUToD0TsF4sKXwlDtfVufaAh9yZKxEA2JGi2DzJU7Cr9YjXQFjerZ5jjJjROYo+ci5pns4VQ=
X-Received: by 2002:a19:495d:: with SMTP id l29mr6235978lfj.465.1610749275587; 
 Fri, 15 Jan 2021 14:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20201213225517.3838501-1-linus.walleij@linaro.org>
 <161073123818.625238.784153877114947970.b4-ty@arndb.de>
In-Reply-To: <161073123818.625238.784153877114947970.b4-ty@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 15 Jan 2021 23:21:04 +0100
Message-ID: <CACRpkdZBMxjBbUXFEa=ByGMKQ189=JHR=CxBBdZ5ejPVuQ_c1A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: ux500: Reserve memory carveouts
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_172119_263981_4A971340 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
 stable <stable@vger.kernel.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115222104.4WBQBUu719oCYOij8pAZq2N6WQ6jCvQo4Wn6PZeBpVk@z>

On Fri, Jan 15, 2021 at 6:22 PM Arnd Bergmann <arnd@kernel.org> wrote:

> I had mistakenly not applied this last year before the merge
> window, as I misread the description as being not very urgent.
>
> On second look, this seems important enough for the v5.11
> fixes branch, so I applied it now.

I was just thinking about it while cooking dinner!
- Hey what with that critical patch now again...

Thanks a lot!
Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

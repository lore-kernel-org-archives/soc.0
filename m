Return-Path: <SRS0=Yq3b=MC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C4EC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 16:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08A961107
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jul 2021 16:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08A961107
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYVZ23uQOcglvjaHxo0tl41UeqbnvX7kf6JGur+UVHg=; b=Ol8g2rYih/GrfL
	zI3O02xtp//tw2l2GO02C1W7ZzR0W/Q2swGgGvK38VktUsbbwc925sWN1Op3EGe1LUlwgCNEDxgLp
	pLE57sWB5Xq0uaV6VZgoYwgcQLODB5511sID8lMPzDjeXplUDPSdhvGQBax6QuE5SdlRrdxJsFww+
	Z344a2r3n+PW6KxPTgbHw5SOnVRhvGi1b+q3256QcdNZQkeYuAlG6w/SzhuD4RRd191m4R28lPuYF
	uVAiv2o9ls5GRA5LZVG6dJWQI+yM6OsTr6UfhV6XHBwpiziVXL6cGCjIAmo3XpL3gc438sm3EjbpO
	gAk//jk91n2G43M6V5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2G6h-003th6-Hb; Sat, 10 Jul 2021 16:45:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2G6d-003tfj-Ob
 for linux-arm-kernel@lists.infradead.org; Sat, 10 Jul 2021 16:45:33 +0000
Received: by mail-lf1-x12c.google.com with SMTP id v14so30651146lfb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 10 Jul 2021 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LccKoa1zF1Ue87qbczvb+yg8Tc9aMl+Aop1Gel1Zx9c=;
 b=O2rBjXyzWsIJVf0JQAX3asSn1W5GsNf2YvRAj4999quiWviTiUb2LwFQTnmx7w7OD8
 Z186pcU6lv0FdMdCYP5TLYoKSpqifwnIMGHTAfITbnhSYPBdsALl5I8WaxIbE1GDLeNB
 UeAOwHMHcUI+qvE3Yy5tYxXcyNPm/x0yWofbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LccKoa1zF1Ue87qbczvb+yg8Tc9aMl+Aop1Gel1Zx9c=;
 b=WQAd+fFQfvrYu0d+dt8YxNg2RuMw8cllZg/b+HbF7Eda2vpnf+59uBPoXFKXTDK2Xd
 VIPBmlMnZTCsKFLn7gKm/+k9zVHBoJujAZnVI1oICpqw9Pcb3Ie/dfQK/q0Y71Dta2Tg
 ohZ8GNLGrz2kSnwlGue/BODc2IhYizbkle9c6/iX8r3P5jNHKqw2mIBZP/ocba7dg/18
 ZnSCd2tmexwaahvPFSGgzoMGGhki3LjxbZwfV0B+jeqNSkZY3Y9KQUDK3bpGm4FaD5Ke
 fpQYC5rHofFtcMNi3LtcoSLEAIA5P/lIwDg1/Ki+0HBECQF8DpRePFg9gzC5izcqlHz0
 y9yA==
X-Gm-Message-State: AOAM5309VoAqI9oOsTz3PuSVsQuMcMOfRh7uzDtWhXR/rwHFL62uKKoe
 FuOxQ1m+AgJRa9LVDO0HQiAxhoaowTsh2qFu
X-Google-Smtp-Source: ABdhPJzQMAANdEHrCQDxjoShs6b7GKRPzL6LPMNEPo3mAR5jbp2C3WXS7ED9bXM1WBh3XUu2rBYvag==
X-Received: by 2002:ac2:5297:: with SMTP id q23mr8051789lfm.223.1625935528930; 
 Sat, 10 Jul 2021 09:45:28 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id e12sm962942ljo.32.2021.07.10.09.45.28
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 09:45:28 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id v14so30651056lfb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 10 Jul 2021 09:45:28 -0700 (PDT)
X-Received: by 2002:a05:6512:2347:: with SMTP id
 p7mr3528712lfu.253.1625935527966; 
 Sat, 10 Jul 2021 09:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210709234054.10288-1-olof@lixom.net>
 <20210709234054.10288-2-olof@lixom.net>
In-Reply-To: <20210709234054.10288-2-olof@lixom.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Jul 2021 09:45:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
Message-ID: <CAHk-=wg2G+4K=wCnHBsiFX2HXH+zN5X_VhmMa9-RsFLL+xMFyg@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] ARM: Devicetree material for 5.14
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: ARM SoC <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_094531_881889_77BCAC99 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210710164512.B1_nQx1ssZg2EYHAMzSc9E9NyYrYzOOMsEzLcks5eW0@z>

What?

My shortlog matches yours, but my diffstat isn't even close.

You show 554 commits, but then your diffstat as not a single file from
arch/arm*/boot/dts, and says:

On Fri, Jul 9, 2021 at 4:41 PM Olof Johansson <olof@lixom.net> wrote:
>
>  97 files changed, 8428 insertions(+), 5174 deletions(-)

while mine is very different indeed:

 552 files changed, 24060 insertions(+), 3691 deletions(-)

I suspect you got the diffstat from something else entirely, because
mine looks a lot more believable and matches the commits listed in the
shortlog a lot better..

              Linus

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E94C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 20:24:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6858A613B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 20:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6858A613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gClcalAowfu2AZ5thTbcPm3RtjLpdGI9qzcyjtgELQ8=; b=OXzlAp+aUHTEk5
	GrdDIgFZQgZsfBkFqfIEwmhePm5a8OyAg36FGohJ79TkWc5CwuQHWXs/+nSzDuEnNUIStpWcoBZy5
	UGloUMV4dnJXmR6h6kzhl/Atjl1wSYqblLxRviycr9PrB1h7SsaS4GKPujFGDknGVLafyzrnd1W7B
	M0oDcjKzh+7gTzRQrgsOhWhpJmdZTHEbXg4cyxJRDfYIu7Lccwc4971+OWOL5kpwQSsW10Hfju7yH
	Ys3WAzuxlXrEZz0YGywkmWsDHD/hLaZ0QJYAkpBD9NvYRGcNmhe9rb8R7sM9NJH/p1gyJ0t0a6e4X
	2KG4Fiv85j2RzINmfWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFaA-002lHR-M3; Tue, 15 Jun 2021 20:22:47 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBVc-001Bp4-BK
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 16:01:50 +0000
Received: by mail-qk1-x731.google.com with SMTP id j184so42482680qkd.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7C7EVveR2N28ai5r9/J+2yOqz+gY5pQumT6AbxDu9NQ=;
 b=BMDmDwevRAQ/jZtfGP7p38zmpe9NJVDCl+GWwBgJ4KO/Ve2LeGgmD7Qj6TTdeSUewV
 rmTwm91IMkKMHCOrZXNL0KEmd1YUcfnCR6Y18iF/KIN6Y0mnI+Fh4YURVYOn071j2bTw
 FJF8aUtMSOX4S+wBwhW/LG3zFECq46pFpONoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7C7EVveR2N28ai5r9/J+2yOqz+gY5pQumT6AbxDu9NQ=;
 b=nhDlCI5dQMR5xxDv5p9SNyiN9CvokQmrb0HQNu5qI4DqPwsG6/s9mwT3lzygYSDCl1
 vGx/dQLfkui1BwHS5kMZVo0OUA+GDOgmbFd3pTgqo4F+iUx17ac9qO6k8jfbNa81ePFj
 i6JXUyLuXcB4F51pnEHhi39RHVX74nl9kgP1ElsQbetfnHZSjPv53Yw6ihcysBz4ZX/u
 yNol7KaOapVbYKaAUc8bAEG66mQOxAOmA/BdF1VU/gVhV05xzbudimxf7YqCcgGNHYYU
 2uRdzDJNAcex9MFhWDbpUH5+b4p5td9HF74nSd33N0JL8rwHPJI0gdH2jan/iHNeycyK
 8cNg==
X-Gm-Message-State: AOAM533Oplcb//FhKfIfXXttzKS2B6bzhiGABIs0ukYnNQKcKLGrhpgg
 fNuOXgD3vqAMqDWsMGDaaPBap8yoS+eGjG9nzDzW4g==
X-Google-Smtp-Source: ABdhPJwMhLK3ojmLgXGBYK7lXx8LuQWFcV18TBkTwaLl6+qHJap0zIeFZXk+ggFYSjpX/FOfrM6i9m3q1kO7mfCsLi8=
X-Received: by 2002:a05:620a:a87:: with SMTP id
 v7mr340087qkg.468.1623772905288; 
 Tue, 15 Jun 2021 09:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
 <20210615152840.GD11724@lx2k>
In-Reply-To: <20210615152840.GD11724@lx2k>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 16 Jun 2021 01:03:49 +0900
Message-ID: <CAFr9PXkeqryzutzpV6woskee_SwbDMJFgxPtspvTk0-VS6A5xA@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14 v2
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Romain Perier <romain.perier@gmail.com>, 
 Mohammed Billoo <mohammed.billoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_090148_561372_728DBC43 
X-CRM114-Status: GOOD (  20.09  )
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
Message-ID: <20210615160349.95WsestcZN0eLDqQU6iMEMxxomNwqVb6QbHN5aCQbUQ@z>

Hi Olof,

On Wed, 16 Jun 2021 at 00:31, Olof Johansson <olof@lixom.net> wrote:
> This time it seems like you based your branch on 5.14-rc5, which is a newer -rc
> than what we have the rest of our trees on. The general rule of thumb is to
> base it on the oldest meaningful rc for the release (rc1 or rc2, most of the
> time). We normally base our tree on rc2 or so, in this case I went forward to
> rc3 earlier.

Sorry, I hadn't even thought of that but it makes sense.

> (Maybe you had the same base last time around, and I missed it -- my tooling
> failed out on the S-o-b checking before I noticed)

Last one was rc5 too.

> To avoid another roundtrip here, I'll apply the two patches directly, but
> please keep it in mind in the future, especially once you have more material
> for a cycle.

Thanks for doing that and the hand holding. I think I can manage to
get it right next time. :)

I have one DTS patch I would like to get into 5.14 for the watchdog
driver that was recently accepted.
Is it still ok to send a PR for that one or is it too late now? I
think I read the cut off is around rc6.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

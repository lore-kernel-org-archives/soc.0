Return-Path: <SRS0=55Mi=IU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808B4C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Mar 2021 12:19:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8BC6198E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Mar 2021 12:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8BC6198E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OXPlJbuTyiRmlF/YLuhnPzN5l0toQAeTfYjzA8EuVTc=; b=Y39QjlsATj8WajP4WcRWZJfMD
	dtBsqZTHnumwnGMTjCb4KxToe6Nq6rT7+DsPCP3lbtZBWxgaq2JZB8GYMFj7rSC5UYRpx72NBgCLy
	tl1c/arW7/Wgkoj/PD5+kj1nP+LJ9pw6RrM0klH60cOpxeKW/lsE33a/G8g+I3v3PhfHB1Mh9ei/p
	MRoTrx6xDeb5BGXKuqFjtgf69rIPeC+zZMKkf4dXA0fPNE6eV1NPdekiFdI4imuHQJMOZcOeC2U6y
	Lol6Pk8W41fQxVnzIy9r9KEaeCRcWhGxnqfaSGtRfD+/TMrDmTbIqu4GSAtd4ps0OrIH/0pCdkY7J
	jR4X55zXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJVH-00BYRp-D0; Mon, 22 Mar 2021 12:17:51 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJVC-00BYQy-8k
 for linux-arm-kernel@lists.infradead.org; Mon, 22 Mar 2021 12:17:48 +0000
Received: by mail-vs1-f49.google.com with SMTP id h25so7317221vso.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Mar 2021 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPgEpzU1+EhZmQwMgoUtTQpTOrmK2g2nAYsCnP+ZK2w=;
 b=XF49Om+G3npz+EKJ5RcT5onkOc3MXM8n0La1hZ66F5rdhpOZGnBRyBgZk6iIrRHmeC
 gl97fRzIh/YDjAKWvCGTsyojKNPFnGh+hA35NyDJv5S7wwIMkf5XR3pb9YiGDBEQ2+uX
 Deg2blMqxk4VhQ2E5zTNHNOqRXgq23mJBXs1FsK06y8x12H5f+fnWsGhJdR5JhUZ2WEk
 twGTYEYs/VFdxSpH+XcMFc/jrgq0txgMzVuVt242akqU00WmCm/PmQYsEQ/+jBjHPNG6
 gttWQo9kaGM8QtQIgQvYyIf2i/NyV8wiCMG2CsDIU1H6mVBqTa9rvrxiHgc/E8yuyk2S
 SJxA==
X-Gm-Message-State: AOAM533JKtrhPJpZL4ZvF8jDaPJmySfbKC2Tz+fE6hj1oZ3x8WWXaxda
 rbD6jI1Ps+tNISDFcat2wICls1j63m0K+RD69LY=
X-Google-Smtp-Source: ABdhPJwVpWGzwO18L28qFPoAsIXhxBH6cwNId9V4e47Iag3AKYxFvIfKgJVUUZMsFRnCrLQwRjfrVXfpCs5zgCYtcVg=
X-Received: by 2002:a67:8883:: with SMTP id k125mr8816445vsd.18.1616415463497; 
 Mon, 22 Mar 2021 05:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210319085146.2709844-1-geert+renesas@glider.be>
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Mar 2021 13:17:31 +0100
Message-ID: <CAMuHMdXEhw2ZWBk0mw+dENs0TAurHnvt35s6bMX19oQJMhHdXg@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM SoC updates for v5.13
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_121746_674384_C8962EFF 
X-CRM114-Status: GOOD (  17.29  )
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
Message-ID: <20210322121731.6kVgJShaf0AuVw3KRKBpgtn4ESTpeFvRzRa1ebrBi5E@z>

On Fri, Mar 19, 2021 at 9:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.13.
>
> It consists of 2 parts:

Oops, 3 parts.  Sorry for that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9492C48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 20:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F87C613B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 20:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F87C613B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOlsrCTukxuqeqoTAfruLtun94PACg5dKOeGHByjQ0s=; b=dfMtUkIEPknq6u
	khb93b1zRTfvI6RpSRVwhtHKugYFLz7etPdRfJ31a/lurWurGF1nin+JDB5OKYMneJJ61bvq0ic2m
	rZ/ZVik7EOXIOtZfZseT1An7+NhitfjcwmyHUUeOTajXjB63+TvpDC1pfrwpYZ1q4Ru4qs713M5pN
	j6trpVpYqCmKtQGg9zcBeclD9BHHVdYCHYRckx9m1CVnDv4ilUQ2mbbp7nAQHqwyDlxnIXwOXpBUI
	U6QUecajCTyDvBKVyfN3abKssxGL7tiDiatTB8qegfy36urErczEEcfbHu/oemaHWn4Qnm964YwPt
	3xJPJa8SMQPwTkIWyUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFb2-002lYn-KX; Tue, 15 Jun 2021 20:23:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBXN-001CSA-LU
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 16:03:39 +0000
Received: by mail-ed1-x52a.google.com with SMTP id dj8so51840364edb.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 15 Jun 2021 09:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ds7scC8Pj046kGHWvqN+Gb1T/TTqW6FsBuVSLf41t9M=;
 b=eBCT9SjYcB+i7DBUkm4q6lmtBbVVxe7GY1h5mgDBvsAJEGyP1w0HnwaiP84SvrSq2C
 RlYLXGa6aUvMSwaUx48nZ2OA/c78uwpVrRWVvjW5KIqh70txCFUqLiYrSerjhAejQvex
 0lZCkl50UZmfG2Lv0vxnIi693w04iOhNzawzVl1OFctxTz6aLTbXPqU2UgVXaq2YFYhX
 EBWqO+nhYqIQVC0p7a38KkA1yK7uAuOV3E3SHeYP7cpcUWrQUq5L+M2mUROjZBxIcsIJ
 /ZWVUaVF7GYZZX3mxMO0WT1qyY/wEV0YSiMTPR2V5Ai0gncCryUBaQAAV2Wpgfr9l/RX
 gjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ds7scC8Pj046kGHWvqN+Gb1T/TTqW6FsBuVSLf41t9M=;
 b=QIxesCkhBEZ6rMAiAgilwmk3JHvgHjFn8MShRxg/6KOVeaX8DV34zGcs7payIJI4+s
 ZEh6rgAMoye4LK932QfHPHQqUs40TK8YVACu+2p3iBYXJpvZYgCePQMtnR294pwlbFP0
 zs4s6uifKeJRkU6jTliodAR0lOVYgnciNToEQ7bfhaRwHSj47G7GXMjLaFxKBxbKIxlH
 ZMAXeyHWxrO9WY4rkPabfNb0nUxSCBv2PL8ZXDiGsNb7BGXTWVZerkXJEpMth6s/ffp1
 jSoJMMPtvcZfQsBgqh/as88MT9MNq2xA/evHMaNj57cv5shIl/n8MHoQxwLhQMlcGca9
 llow==
X-Gm-Message-State: AOAM5319ro3q97dFvHQjDJwasVsKlWFFl8A+FgtRBBgsEqGd+gGqvc5g
 lJOc1isWxtO9SG6c4ytK+1mHqahcCtpk3GfPlOQy11mVlPduqg==
X-Google-Smtp-Source: ABdhPJzS0kyJZM92AbMMzk0As5PtF3WFaVk1rdjdjo68Ucq1q8xo6X6hQnUYeIwJJmwC4w6saK9fIF9OihkCxTKcHRY=
X-Received: by 2002:aa7:cb45:: with SMTP id w5mr202254edt.170.1623773015755;
 Tue, 15 Jun 2021 09:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAFr9PXnBb7OmOAMumDodC+0usWqRT-RXwC+YUHZ2Y43Xe_uTQQ@mail.gmail.com>
 <20210615152840.GD11724@lx2k>
 <CAFr9PXkeqryzutzpV6woskee_SwbDMJFgxPtspvTk0-VS6A5xA@mail.gmail.com>
In-Reply-To: <CAFr9PXkeqryzutzpV6woskee_SwbDMJFgxPtspvTk0-VS6A5xA@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 15 Jun 2021 09:03:24 -0700
Message-ID: <CAOesGMiu2+dN0_q7X_5p3pc-Lz=SMGiaRQkOBag+dqH2tatZgg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: mstar for v5.14 v2
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Romain Perier <romain.perier@gmail.com>, 
 Mohammed Billoo <mohammed.billoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_090337_765808_F013C3E4 
X-CRM114-Status: GOOD (  28.74  )
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
Message-ID: <20210615160324.WyAvqZc63nxX1bUpZkT2vJchiuynO64wm7ZxCpe8ik0@z>

On Tue, Jun 15, 2021 at 9:01 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Olof,
>
> On Wed, 16 Jun 2021 at 00:31, Olof Johansson <olof@lixom.net> wrote:
> > This time it seems like you based your branch on 5.14-rc5, which is a newer -rc
> > than what we have the rest of our trees on. The general rule of thumb is to
> > base it on the oldest meaningful rc for the release (rc1 or rc2, most of the
> > time). We normally base our tree on rc2 or so, in this case I went forward to
> > rc3 earlier.
>
> Sorry, I hadn't even thought of that but it makes sense.
>
> > (Maybe you had the same base last time around, and I missed it -- my tooling
> > failed out on the S-o-b checking before I noticed)
>
> Last one was rc5 too.
>
> > To avoid another roundtrip here, I'll apply the two patches directly, but
> > please keep it in mind in the future, especially once you have more material
> > for a cycle.
>
> Thanks for doing that and the hand holding. I think I can manage to
> get it right next time. :)

Yeah, no worries. More or less every single maintainer has made
similar mistakes at some point or other, especially during ramping up.

> I have one DTS patch I would like to get into 5.14 for the watchdog
> driver that was recently accepted.
> Is it still ok to send a PR for that one or is it too late now? I
> think I read the cut off is around rc6.

You can still send it, either as a patch or as a pull request - your choice.


-Olof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

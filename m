Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E7BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 12:37:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C07D235FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 12:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C07D235FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vKK8ZUIhy97BH7BssYkogF705JqotO/xROYzRLFxMjM=; b=dQhkuFAsLWVaaYhiTBgwijSj4
	7ozbwY3Y4W7LXRNxD4T5RO1GE48zBM4+dn9e0XfpkbTXtSHEoc0KsSrNVH0VPQ+IW4ZRW0OJxMd9/
	jYEG9vMQVldrp7IZGJUUq3nv6mpYmiAcyNJXuyOd0kvXIoSmGgo20b83O8Na1boYDP4MNBfSWXCX0
	smtgIQXwTrGp259liVoi7fLgBzjGEUSVBnFwqiG4uIS+7FaefK15GhUpBxgmIf6YagV2SeFMZww1h
	DA/x5MTR6kuymfT+2f9RzlOacwgHBD8D+GMQ0+/l+gRrIuRmAXkI/Ya5HYIu4kAeSYqYpfvnK4hJk
	zLr6e+QEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxqyB-0006iG-PO; Fri, 08 Jan 2021 12:34:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxqum-0005MZ-51
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 12:30:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 043C6239FC
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610109047;
 bh=Ja5WumJNYYF3GiM2fjvXHc+0JMUiD+4+ROqFLlil7r8=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=sUpSIHxdP/YN8CEHOAibt0IqfP1SR+b9Xw34PU1OMisxHhu2s8PgGYoFrT7rGFtG4
 XuMkv2n3cImlK3Msc/WmzrAghDBmek/tBRmAa95q1fGsppfZvQ2RzoGIszCOnQ/Ida
 cUkUV/obv6sxOrWonp73ts58bDrGf/hZZVuDJFddc6J1y1J+NdGKRFGJh1kCTph9kv
 S50EpVwCVXy6aNGYzrbeD1uBLeS8r5GNi921YQZp9ys7xePfEj1FJukj43+k/DJOUA
 kseSUY5vI4W7MIddsuk2/zn7onNpz+B3GQqEiIuQ0acm6At21UrutZx3dZdyK4nvTZ
 LR3Og0DC6ZCuA==
Received: by mail-ot1-f45.google.com with SMTP id b24so9546896otj.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 04:30:46 -0800 (PST)
X-Gm-Message-State: AOAM533cFNfxL2Td+f2f00eXpm+JN1ZmF0789Z0/XTloNjNvd+XRMB3N
 UMMH0FhIRKWSc6Bzrok0IV26rSBOtUwuZtgAkDs=
X-Google-Smtp-Source: ABdhPJysXAXNEOfDICgD4h3HRTqqV3EqtHWOdw0EOX8Yx2ygIsqKgJLyD6MfnvdE3ipzagkzNo24qqXrGWoua1flZcY=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr2387041otm.305.1610109046167; 
 Fri, 08 Jan 2021 04:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
In-Reply-To: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 13:30:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1TxK_+gX1wNBEi_h664YS2Nw57MECknbZEkZQRiuCQVw@mail.gmail.com>
Message-ID: <CAK8P3a1TxK_+gX1wNBEi_h664YS2Nw57MECknbZEkZQRiuCQVw@mail.gmail.com>
Subject: Re:
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_073048_325011_3E56318C 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108123030.EDgsjPlKSKSBiz9_mu8KmI8kjxF_7dh2NEnIu1cfhZ0@z>

On Fri, Jan 8, 2021 at 11:32 AM Misono Tomohiro
<misono.tomohiro@jp.fujitsu.com> wrote:
> Subject: [RFC PATCH 00/10] Add Fujitsu A64FX soc entry/hardware barrier driver
> [RFC]
>  This is the first time we upstream drivers for our chip and I want to
>  confirm driver location and patch submission process.
>
>  Based on my observation it seems drivers/soc folder is right place to put
>  this driver, so I added Kconfig entry for arm64 platform config, created
>  soc/fujitsu folder and updated MAINTAINER entry accordingly (last patch).
>  Is it right?

This looks good as a start. It may be possible that during review, we
come up with a different location or a different user interface that may
change the code, but if it stays in drivers/soc/fujitsu, then the other
steps are absolutely right.

>  Also for final submission I think I need to 1) create some public git
>  tree to push driver code (github or something), 2) make pull request to
>  SOC team (soc@kernel.org). Is it a correct procedure?

Yes. I would prefer something other than github, e.g. an account
on a fujitsu.com host, on kernel.org, or on git.linaro.org, but github
works if none of the alternatives are easy for you.

When you send a pull request, make sure you sign the tag with
a gpg key, ideally after getting it on the kernel.org keyring [1].

       Arnd

[1] https://korg.docs.kernel.org/pgpkeys.html

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

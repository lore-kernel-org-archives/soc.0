Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B542C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 15:50:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D39723CD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 15:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D39723CD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zq1r1I4mMm0RaEKv8yLZhkEPfWSKI0GvvLXNJexN72s=; b=ruQi8rKOrgP0vI72v2anFtZ14
	aozVBAxuABHXmDX44zCwZiy3wsMsJwUqgYKmjBOVuQ71MwJ3mmyOJ5Cn9GRhD+O5tgbIChGDe645b
	owQtI8LbZPvYmfQ5SRS2aq26KIuvCAcX+E5bY/a2H/ui87cMnlpVePtJp5ThvTrVT6y+0f5jjRNb2
	TjAbOjAWhUbiC/zbmsTd3ixpZx6QOCOKcEtshPImCF26gHpmD7Hqxke0H6eFjs7U8dwyljZ9t0uWo
	2ykAIp3FG909sEwvQ6jgTUGqYoPoBmSzzTYWZqXY2W6QAkmAqU17tRcetl4p/Kek9yZXHp8FlW9Ud
	nL/7HK8Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knOBz-0002Uw-Ds; Thu, 10 Dec 2020 15:49:19 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOB8-00020s-GX
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 15:48:27 +0000
Received: by mail-qk1-x741.google.com with SMTP id d14so4501582qkc.13
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 07:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jg21SZZlFp2nXg015Qdy7Ey+4o9sWgsPDLbyCKehNlo=;
 b=dy5DU5wCTwtfk7ljGOi1L73ppuP+Z+I6LgYKef020Y7kmWfzLih5jpQXgRkzcM0eqY
 AcUP1c3cS2dG0/ibj39VhwpX3gtu8+jhhJMSKjm3C8NqCP+cW0QlR7Oi/KKcRFSqZz1I
 Lb5iRPAYHYA243SA+1PdA/xrMKPBCb3rr28pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jg21SZZlFp2nXg015Qdy7Ey+4o9sWgsPDLbyCKehNlo=;
 b=EwoBwGFx1Yu9hZzT9l67gaO1Fch/dtDZr4w9Dl0ycZdhQg/MeUmchuCZ2rUglrSQUY
 vyMPau+RG8oho5C2aA9PArkr5ijHPq+U35C0/0BF1L19alIx3Ua3dbK5EmCgDLd90muf
 3/cSiaHGW/mOgpVDV5E5tZFZ9bfzXnuOZ0rs67iIGVKkivNZryR2RTTj8GLqAitTBwJW
 zmOSsNNnvAlebaTNY6rlbhTT4jwwQA6fhhypMrJ3rgDwaq7W0cQVJqvuEB+EDFXNIZ8I
 KewDbQU2p1yDt0A+pfI7zeYAoao9YKbjvg8GNr/DxzRwipeSuTL5DFSoxzodgA10WkF9
 qh+A==
X-Gm-Message-State: AOAM531TDdy3TCkAJRYA/jxumvKZS7LcBQh9Exrp7KwukZZbTziQ60PG
 5TqRUDLfPP6n2iUHCgvzqO0oHQoxwQFk7PLX7iJq4A==
X-Google-Smtp-Source: ABdhPJyGA4IsN0DyvYeav6TuGz8fI63Z8eB2r82GLqP6jFmdsiKRYyqDFTZHzh4jhRC0raXKyTa1O58NpDKhOQ1MMqM=
X-Received: by 2002:a37:2742:: with SMTP id n63mr5466883qkn.390.1607615304710; 
 Thu, 10 Dec 2020 07:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-4-daniel@0x0f.com>
 <CAK8P3a2DGLfkOEm3JeXN-jWvDfxberaXXqOtu4wKdtYzqDWiNQ@mail.gmail.com>
 <CAFr9PX=fhKiZF80iKaGeBWOONm3VpwtzgbB+yBHk8MHdTotaHg@mail.gmail.com>
 <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
In-Reply-To: <CAK8P3a0zCa0Dq8uUDoSbu64sGLeNWrSk=6i4pKzgwerRseXfnA@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Dec 2020 00:49:04 +0900
Message-ID: <CAFr9PXnGF1PV8vnCpdCuSB-z9ns5BPDjhJvPg7b+rUC0GrjhqQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] gpio: msc313: MStar MSC313 GPIO driver
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_104826_597955_2E538546 
X-CRM114-Status: GOOD (  22.58  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Willy Tarreau <w@1wt.eu>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210154904.702lwCr9iZHviY0Zm6gyiNFdHkr1rUUq6mYsPzu4i-Y@z>

Hi Arnd,

On Thu, 10 Dec 2020 at 23:28, Arnd Bergmann <arnd@kernel.org> wrote:
> > I did think about this and I did this with the clk mux driver I
> > haven't pushed yet. In that case there is a random lump of registers
> > with some muxes mixed into it so I decided to make the lump a syscon
> > and then have a node for each clk mux in the lump and some properties
> > for the muxes within. The driver is certainly less complex but the
> > device tree is pretty unmanageable as there are probably 30 or more
> > muxes.
>
> Right, for clk drivers, the trade-off is often different, it's not
> unusual that they are a bit of a mess and require a separate driver for
> each cheap.

I will try to clean up the additions for the ssd202 (the smp enabled
chip) this weekend and send a series for that.
If it still seems wrong after adding that I will can that series and
refactor this before lumping more on top of it.

> > > It would be helpful here to replace all the readb_relaxed/writeb_relaxed()
> > > with normal readb()/writeb(). Don't use _relaxed() unless there is a strong
> > > reason why you have to do it, and if you do, explain it in a comment what
> > > the reason is.
> >
> > The reason is that readb()/writeb() will invoke the heavy memory
> > barrier even though it's not needed for peripheral registers.
> > I guess it doesn't actually make all that much difference in reality.
>
> Ah, I forgot you had that heavy barrier. It depends a bit on what you
> use the GPIOs for then. For most uses I think the overhead does not
> matter, but if there is any bit-banged I/O it might make a difference.

Bit-banged buses are likely to happen I think as there is a lot of
gpio compared to hardware peripherals.
Anyhow, I'll add a comment for the readb_relaxed()/writeb_relaxed() usage.

Cheers,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

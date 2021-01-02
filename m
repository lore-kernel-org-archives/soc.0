Return-Path: <SRS0=5DOh=GF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D75C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Jan 2021 10:56:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830D721E92
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Jan 2021 10:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830D721E92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XNIRmETHyjaA6TiWCYrheQBU6jhDvRg51G+GpsxgJuc=; b=APVuR9oVRfBRpusZ6TZhvUT8D
	Z/MLDcBiGGVzoXL1AQ3BqLmh0pqH3XQj41pAmEv0Yn7IJ4ctm5jFlX0iUUPepk3Ptvq0tbGfWLDg5
	xVTAvd7PgOWWkfQQicLNJEbHz+KvprbHfaJFqSq9ZhcqJ1LUJi3dd8TXXg6MAU7lbksA0ivIAxfg2
	rAwLO8S4iefCH1jNCiEglNcql4dkyLZjhNfcKEO0sM3B1/dr2dXWP+IJ3adsZfaSXvszB0gY+uTws
	lpBAgtn0FRLW5gYiN67w00zrdITFu9O9yf8RIxx/Fox6QW+wrhPpBnczF0MrJwvimn2REa7sU2Jad
	arbgydx3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kveYO-0002x8-UK; Sat, 02 Jan 2021 10:54:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kveYM-0002wf-5t
 for linux-arm-kernel@lists.infradead.org; Sat, 02 Jan 2021 10:54:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8DA021E92
 for <linux-arm-kernel@lists.infradead.org>;
 Sat,  2 Jan 2021 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609584871;
 bh=Dd0RhzVe753ptbAnU/DKnNBiKaGd4G8T9libPh9kYb0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=k18cya+wyuhpTq4koP4LZwrQPZ6sNuR0pzXi6IQNDmNKHOhW5vHJExbETYAhuF/yX
 L+HuJYeQ3GodkpQpGAQeUYGPdNw5LRBr6i7ZDAOwWjaM9Z++F1ZO9jnm6/DRwaQtjv
 Y/aLQdKKgIniPVyhqMOFqXlGF43VAaSvEjMcu6YSrW8ZNW9aRGZdNe/Hu4NTbGMSqL
 YfdqEDPeb4GemZdJJ+yA5wh/pnVnUakh2nEyRFiQH7my75nJMQwWIhQxQETMa68X84
 H0SPRMvkh0j32Li1iwXGueHPhg75vPMIHJuxZgX4F5jzNc7k0ML5En6M4Bt8WY+Qse
 mguoX9WfXaQAA==
Received: by mail-ot1-f47.google.com with SMTP id q25so21673858otn.10
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 02 Jan 2021 02:54:31 -0800 (PST)
X-Gm-Message-State: AOAM532BhnY+AqrbvIJoT5koi3QGcwp3zOPMQxVEjV/x4DcyaJHS9zNv
 ZUBKzUk7IYwSXaURl22e1HMuoCrEaVC1QyJ3FsQ=
X-Google-Smtp-Source: ABdhPJwc6VzfJ78btekZr0kxGEgNwOABdjiYJBKAYs+Zm1qRAAH1QcbrSl1Yueg0v7qhcI93I/l6Z2b2a8VoxKQ0nD0=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr47221743otm.305.1609584871197; 
 Sat, 02 Jan 2021 02:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20201230152010.3914962-1-arnd@kernel.org>
 <20201231124946.GA2918779@willow>
In-Reply-To: <20201231124946.GA2918779@willow>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 2 Jan 2021 11:54:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3TR3qzJ2JP8-mFHtEA0sqDYeuG5vR6W1_XGzWF-S0-YA@mail.gmail.com>
Message-ID: <CAK8P3a3TR3qzJ2JP8-mFHtEA0sqDYeuG5vR6W1_XGzWF-S0-YA@mail.gmail.com>
Subject: Re: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
To: Jamie Iles <jamie@jamieiles.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_055434_386166_9233531A 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210102105415.afZOx-QE3CLsbgnIUjnjK3wGb29oNyOY0-O_D3v5UUw@z>

On Thu, Dec 31, 2020 at 1:49 PM Jamie Iles <jamie@jamieiles.com> wrote:
>
> Hi Arnd,
>
> On Wed, Dec 30, 2020 at 04:20:05PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > dtc points out that the interrupts for some devices are not parsable:
> >
> > picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
> > picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
> > picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
> > picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
> >
> > There are two VIC instances, so it's not clear which one needs to be
> > used. I found the BSP sources that reference VIC0, so use that:
> >
> > https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Rob has a series to remove Picoxcell as there's no active development on
> this anymore and Intel have stopped producing the chips.

Right, I am aware of Rob's series. My patch was a little older but I only got
around to submitting it now. I'd still like to merge it as a bugfix for v5.11
though and have it backported to avoid the warnings with new dtc on
stable kernels, while doing the platform removal for v5.12.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

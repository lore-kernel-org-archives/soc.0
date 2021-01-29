Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D076CC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 22:13:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7FD64D9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 22:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7FD64D9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=v3.sk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMbismlK92iRQ1ivsHsYRtQL/KK4pqFp4oI7I55H1GA=; b=uuswFC888ULqEN/3klRewGiky
	rl9dbcJwlPI+s7aD2QxMpGaEKDh6eNLU4yyId889fYwVO/+N9iO+euTtdb17/hSBhggNlj+j/TV51
	qzM/rOevwCmo/8noGQUD3qwgUBR/4CIvdFQP8kjL/2BwnNu4jkoePzYCOZFdq+3WKm6H5i7tRvsZX
	Sg0GqT5zCSWIvsEu2UVD97Mhi4eiPOq5RArx3SnJYKlFBoQ2Rh8hTEyxFPdg6OYdr9bN8uYzlq6Ux
	EWpHFVutOep8B0ku/+Ku6rjx9FkpWx9V2LleU9xobrfg40o7riap9HU2osMOGXlop/xHrs/CuY2qE
	6HTbnADyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5c00-0002Gp-1G; Fri, 29 Jan 2021 22:12:16 +0000
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5bzx-0002GH-7a
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 22:12:14 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 6FADEE0B4F;
 Fri, 29 Jan 2021 22:08:03 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WVW95jXP8lLx; Fri, 29 Jan 2021 22:08:02 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 90B8DE0B4C;
 Fri, 29 Jan 2021 22:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SBoZVgSkdasp; Fri, 29 Jan 2021 22:08:01 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 3BAA3DF932;
 Fri, 29 Jan 2021 22:08:01 +0000 (UTC)
Date: Fri, 29 Jan 2021 23:12:07 +0100
From: Lubomir Rintel <lkundrak@v3.sk>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: ARM: dts: mmp devicetree updates
Message-ID: <20210129221207.GA77366@demiurge.local>
References: <20210121034130.1381872-1-lkundrak@v3.sk>
 <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2DYX3c-AMX9URSyrcQckY2UaRRTmnOwe=4q3P4cJ-t5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_171213_378290_3C337443 
X-CRM114-Status: GOOD (  15.08  )
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
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129221207.1g8RxENy4WwNTY-Baw92XK-KFAPpI29zlqYh6AyKjXw@z>

On Fri, Jan 22, 2021 at 03:09:14PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 21, 2021 at 4:41 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> >
> > Hi,
> >
> > chained to this message is a handful of patches related to MMP device
> > trees and bindings. Please take a look and consider queueing them for
> > for 5.12.
> 
> These all look good to me, but I notice that a lot of them seem to be
> bugfixes, so please have another look and decide if any of them should
> go into v5.11 and perhaps backported to stable kernels as well.

I'm not sure any of these are worth backporting to stable. I believe
actually only these two are bugfixes:

  [PATCH 06/12] ARM: dts: mmp3: Extend the MPMU reg range
  [PATCH 12/12] ARM: dts: mmp3: Fix the CCIC interrupts

The first one only affects the audio, but the MMP I2S driver doesn't
work on MMP3 yet. The second one affects the camera, but the only board
DTS shipped at this point doesn't have one. Therefore both are somewhat
inconequential for older kernels.

> 
>        Arnd

Thanks
Lubo

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

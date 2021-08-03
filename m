Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F751C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 15:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE07260F93
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 15:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE07260F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AFSeNBi23NMh6dPzvRefEi1E8qYzlHcF6lay9CpLdlI=; b=ocTm77c1AkovCMouDK2e4vjOgs
	RuC8wGXW841YtY3ID/jZ2bkHn9lq/CQ2mfzH3zg3qwrd/yg66JKcmM3WsfSljEJU+Iur2Sh70PKx6
	mPXQiT9LpRRQp/2BWbB6jloJmaooDb6TTlaImtn2Wvj7acwE7/LdJVKm5GY9DELPrbmpnPXqWR2Ue
	PvjDO2u2YP9BxR5PWP7Z+pXIntKg6fIO8PLYnMqhYx4lBqEwYA7Em0TVBbuZq2ARbVLJkse4p2m43
	8wVWsBxSz6uL35DYrAgbLhwAhQETIpoHg4dV5jxdT27Y7pXNUMa7sLoVSyr5qlpOrKdxkwSX0e+ac
	CACxYw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwiI-003SqY-QH; Tue, 03 Aug 2021 15:52:18 +0000
Received: from mail.savoirfairelinux.com ([208.88.110.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwiE-003Spd-Su
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 15:52:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 897E09C0C99;
 Tue,  3 Aug 2021 11:52:10 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id D5cXTajtjGVF; Tue,  3 Aug 2021 11:52:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 178419C1908;
 Tue,  3 Aug 2021 11:52:10 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ko32_KOWxwba; Tue,  3 Aug 2021 11:52:09 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id CD2A59C0C99;
 Tue,  3 Aug 2021 11:52:09 -0400 (EDT)
Date: Tue, 3 Aug 2021 11:52:09 -0400 (EDT)
From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: martinwguy <martinwguy@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 SoC Team <soc@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
 Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
 Hubert Feurstein <hubert.feurstein@contec.at>, 
 Lukasz Majewski <lukma@denx.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
Message-ID: <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
References: <20210802141245.1146772-1-arnd@kernel.org>
 <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
 <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.15_GA_4101 (ZimbraWebClient - GC92 (Linux)/8.8.15_GA_4059)
Thread-Topic: ep93xx: remove MaverickCrunch support
Thread-Index: AhRjygBp3+fyk/ZVaeE61BpHQHrtaA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_085215_067939_70D018E1 
X-CRM114-Status: GOOD (  19.79  )
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

On Aug 3, 2021, at 7:58 AM, Arnd Bergmann arnd@kernel.org wrote:

> On Tue, Aug 3, 2021 at 1:41 PM Martin Guy <martinwguy@gmail.com> wrote:
>>
>> I forward opinion from people currently producing and supporting EP93XX boards:
> 
> Thanks a lot for bringing them in. I definitely don't want to remove support for
> something that is actively being used, and we don't have to merge the patch
> if they currently rely on MaverickCrunch on older platforms.
> 
> It does sound however like Jerome's customers are using a normal (softfloat)
> Linus distro on EP93xx, rather than one using the original MaverickCrunch
> FPU instructions. There are no plans to discontinue EP93xx support, there
> is actually a good amount of recent work going into updating the platform.
> 
> Jerome, please let me know if I understood you correctly here. If your
> customers do rely on MaverickCrunch support in user space, I would
> leave that in the kernel for as long as ep93xx itself is supported, and instead
> require building support with the GNU assembler to avoid having to
> add support to the clang integrated assembler. If you don't know of anyone
> using MaverickCrunch, I would go ahead with my patch to remove kernel
> support.
> 
>      Arnd

Arnd,

You are correct on assuming usage of softfloat toolchains and not
using the MaverickCrunch unit. AFAIK, I am not aware of active users
of this FPU on recent setups.

 Jerome

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

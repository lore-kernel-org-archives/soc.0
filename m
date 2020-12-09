Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF98C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 19:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470B123C92
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 19:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 470B123C92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KksCpFCAlrISmnr7e6iXRoStdNSt1kC7/ETgNqAPbBE=; b=S4zwvsf6ww1HQnYNcw4ueEQ2T
	OroinUsYzOZfoI8mvDd+GcbJAmBYBWzNezb1l2FjPnlEvFI1ers/3j6gAK1YyKml4Lh3A5RmVTR/E
	OBJMxHMLSd+MoNWGAYuh5Lher/DgVwKEMES+lvR130VZl4EMUghVc93W75C7uwgjdKvxtWnbbOGPl
	0m/ngpKxvvOZMAgjIOQuiwvPOYaRDYV/6C+ojD9KApa1F1dI/Ulz8g14/MQRSD+8qB+alIl/0yFs5
	5RKc7Mt3bJx9wROT/nieYAsyztZmmIK3uZ+WcjBkAJxMaLTS+JwUOZBucNxLJQ8V1/LKLRTDhxl3Z
	02YktJsmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn5GB-0005qY-4Z; Wed, 09 Dec 2020 19:36:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn5G8-0005qC-Qf
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 19:36:21 +0000
X-Gm-Message-State: AOAM532kWTavXco+Te/A5XZodZUFRwsSpkzrrCghUagzQ6b7BTLiFnnc
 0+cFgzBOq7DDB1GHa1hX2SoC9l56q7hzvPOsDBw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607542579;
 bh=VqGnt0gnCBq2XFTaHCtcBoF5qU7wh0Pq+jlJJEnM1D0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=pCKZMZqh9+eNW1OkQlphxJG++lxcGERwyyf401tbuNyW6Ek4RG98BcdxAqlNXiME4
 q+0yrp+rcy+41G56QmOVsFbz6zP6JWMetgVybocGNbwtAIvIXYEC6aVWcpdyuJkMPV
 WalUL3yJ9YsLreRrlqd99UVxvs5eDh0wNBznOUoaY+eyHXyfK4i8kl3/iKhUuwJ8vy
 gTpQ/I5frddVoBonQD6ZQATgTfwJw8vPfc/NQNbKOxouS58ltssL6hKCql+L5R0eun
 uVDIx0mLFipPUGQMJjQck2ntCf4Sh0gEGJ/0uAzo7AREnNSzwia3DJ7N3KMa3T9eQX
 JutQ8i6gnyfhQ==
X-Google-Smtp-Source: ABdhPJy0fnvTfPUHgyjQjSXPQbPYmkD+dDgA2AMXpY1gS7GmNLTl0gYSwe/kDO3lbQAbVZjgo4aD42ahalIRatN/waE=
X-Received: by 2002:a4a:3b81:: with SMTP id s123mr3207354oos.15.1607542578978; 
 Wed, 09 Dec 2020 11:36:18 -0800 (PST)
MIME-Version: 1.0
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
 <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
 <ee069c7c-c86d-2fa7-ab44-243483fdf108@monstr.eu>
In-Reply-To: <ee069c7c-c86d-2fa7-ab44-243483fdf108@monstr.eu>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 20:36:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1C_hrRV4WW+K_dHfnZCaC8bnteSe-a78eOM3fcoiT2Qw@mail.gmail.com>
Message-ID: <CAK8P3a1C_hrRV4WW+K_dHfnZCaC8bnteSe-a78eOM3fcoiT2Qw@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
To: Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_143620_946054_78530D14 
X-CRM114-Status: GOOD (  17.81  )
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
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209193602.KwPJ1BAH_d-6BwbTDzaWpQDOy1zLlASIDm57f3tnVMQ@z>

On Wed, Dec 9, 2020 at 7:06 PM Michal Simek <monstr@monstr.eu> wrote:
> On 09. 12. 20 18:01, Arnd Bergmann wrote:
> > On Wed, Dec 9, 2020 at 3:51 PM Michal Simek <monstr@monstr.eu> wrote:
> >>
> >> Hi,
> >>
> >> please pull the following changes to your tree. The tree is based on
> >> zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
> >> Use hash-table for api feature check") which went to v5.10-rc6.
> >
> > Is it necessary that this is based on top of the bugfix? This means
> > I'd have to do a backmerged of -rc4 into my dt tree, which is something
> > I would prefer to avoid.
>
> The patch from Zou Wei is fixing the hash table patch merge in rc6.
> If you think I should drop it and send it after rc1 I am fine with it.
> Just let me know which way you prefer.

Ah, I see. I thought you meant this was a bugfix that was already
merged in -rc6 and you based the other patches on top of the
bugfix.

Since it's technically a regression fix, I'll cherry-pick this one for
v5.10.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

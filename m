Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810D0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BE9664F4F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BE9664F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9+YaYmA7DIHBZr4g75k7Oyp2tABLixuKXXN1qo6HjE0=; b=PlNAfXi3wEpsudW5Uqxqnta24
	l/vHhu2rRfQlm9wN8/hNPx1SgdpRcGUCbgg1fF65arrl9p159A8eGovf9e6saYRGNSNHhkL2RjZsH
	j3bdl9t9v3OEEJSROX61kS5ysldkbsaeyp4mmNjz1rVFhf2sNM1Vc8o8kjJJgQpQUn4otYupqQl55
	oR4yoxLDCCnGgDRDhKLG2TTVMzfNDMdhjvlVIaCv8vjzUGrG+nX8ckCCKzvJSihAtXVSff1qMU939
	aL7hDq5+eUG58nLaKQo/sAK1JJKKCrwl1Ou8dLp0acrXOuAy66O22orzl6yUaGw+l+J5Ru1HiPtQh
	K0HGJmGog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADdh-0007df-S0; Thu, 11 Feb 2021 15:12:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADdf-0007dC-Bd
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:12:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C25A64F4F
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Feb 2021 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613056334;
 bh=G5O9X8lLfCw+5orVdXQ5BL6xgTpGfxqJMDGWNR/SHk0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=q1OOKkhnhYXCJS/JLa9K10QgvEuIglm7ceQowNYjPQfhsw5fP/qRyRCrqNSIKVVrA
 7uVtnqryo9mlXkikHyqwQHrzaqEXGt6bwzSX3cNlKZ6uLQHSa3bolmZyFBgoSfHhl6
 tc7JxLzKAeo2bEUQ9g1nb9rwVmSTPwhYdrMsWHEnCPnI2xLOP2UcuO2zDUf30v3Job
 WsfBMYHwqXgLbpWaEM3+6mBFwvux5x8L6B05WkGfR4OrSd1ZjTxjiR/wU/Pspmf4MY
 KSAsS4wlukD+yWLCWToVO7MHVv/VEzTRKPyovmgEb21Fy9aacX6Q2e2kawBKF4PikM
 oq4VSIHILFi0A==
Received: by mail-ot1-f41.google.com with SMTP id o12so5375363ote.12
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 11 Feb 2021 07:12:14 -0800 (PST)
X-Gm-Message-State: AOAM53145J/f9PrWt8A5H8WLkaEzZofpk0nkTiSOsCYXULR/AUIG0yHQ
 2Bp6xRb5yyyEM8i0dAnVWUgZ8jwytW/FHtv11VI=
X-Google-Smtp-Source: ABdhPJx4uR1mBjP/Z3xRy9O2P87ajcGa7rO0KcGBMmIxt15WLAjClElnBM1gVBXiLhVZpgSUnSC4BI9HGSJxJVk9iT0=
X-Received: by 2002:a05:6830:18e6:: with SMTP id
 d6mr6135363otf.251.1613056333830; 
 Thu, 11 Feb 2021 07:12:13 -0800 (PST)
MIME-Version: 1.0
References: <19e0e0c9-1bed-bba5-6c80-6903937b3d96@xilinx.com>
 <161305573925.259289.17212813544897085950.b4-ty@arndb.de>
 <bd383faf-b615-329b-1357-1d1f2ef1f9d1@xilinx.com>
In-Reply-To: <bd383faf-b615-329b-1357-1d1f2ef1f9d1@xilinx.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 11 Feb 2021 16:11:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2PiJr4pw0TymTH0sRucJRoWJcOoYoOP+-okha30iLZSQ@mail.gmail.com>
Message-ID: <CAK8P3a2PiJr4pw0TymTH0sRucJRoWJcOoYoOP+-okha30iLZSQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] ARM: dts zynq: Xilinx DT changes for v5.12
To: Michal Simek <michal.simek@xilinx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_101215_486938_B146414F 
X-CRM114-Status: GOOD (  16.29  )
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
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211151157.SQgjtO0TQksCVl0-wKvEilS13T-Ap5AYH4w8d7UVbPE@z>

On Thu, Feb 11, 2021 at 4:07 PM Michal Simek <michal.simek@xilinx.com> wrote:
> On 2/11/21 4:04 PM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > On Thu, 11 Feb 2021 12:33:01 +0100, Michal Simek wrote:
> >> please pull the following DT changes to your tree. The major part is
> >> adding one new board and qspi dt binding conversion.
> >> I have dropped one patch based on communication with Arnd.
> >>
> >> Thanks,
> >> Michal
> >>
> >> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> >>
> >> [...]
> >
> > Merged into arm/dt, thanks!
> >
> > merge commit: 78155527283ddb04bb4a5b78320c861e1035d357
>
> I see that you have there toshiba/dt-2 which is my v1 pull request.
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/
> Maybe better to clean it up.
>

Yes, I noticed that already and removed it a few minutes ago.
It now points to the correct contents.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

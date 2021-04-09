Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA5AC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 06:19:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D25161168
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D25161168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6qAnl5BkAFB1hDvdni2q8jtlpmbQyTZrdk87bS0g59s=; b=nYpNrItf1HJvoUOa53D5Wt48jK
	9KSppjWa9wL79syCcoIqNE9jg8fbaJ7k/1vJDZX8MA2cHMJNaMSATIz0x14dxyts/Hxs7aSNxd49Q
	NagZWYAV8W+Y8MlWAFz/5LPaZa0Ec7j4kuCvJfZZrwKTy4/nCp8jJhaGiCRpHp6Ier+6xaaDn7Lj4
	L2LdYv0FROkffYanaLKdfZlF949IrZymjb6BOkr0LaMvQ3ooEH9jaNq5kTDSZPKOeWYkSRzRvg6XB
	D8lVyJmgAoe7JEBLMIl8RhsdUbQrySMOj7QW4ExKpa2hJZ26tuZAv3oEldgnL8kVNIa6nIHaHrnn5
	fn55d40w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUkQB-00AHBJ-OR; Fri, 09 Apr 2021 06:15:12 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUkPh-00AH7g-Le
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 06:14:45 +0000
Received: by mail-qk1-x72a.google.com with SMTP id x11so4792131qkp.11
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FRZO+HCHZaJtI6l3DQpMewHRTRciapnJj+KPs9srAYQ=;
 b=B67LEXXfgUlYFemvN+DJR7IYbvMH3mkXnOcevWgTrbqUc0CCPaMU+JYsg6zlQQ39tg
 CqOlZAHS8pilJzDBQQdxg8x53R3TWbJIxRmaXY9ScNs63C8XEMDtt3JF6910/nkjF00m
 gTRpG9uVnxB0d1EubDsXdNDqK/7r2lczBaPP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FRZO+HCHZaJtI6l3DQpMewHRTRciapnJj+KPs9srAYQ=;
 b=VTZXjibAfPfuTSk3fWZtpR0rEQFcEVkKzyndqA3hWCWQYr94mlcVwnxRlI/DleV+lV
 dJJCbPBM6vyr0HOcykpYWcy4olGIhbFMg57HZ3Kbno2FClo14PYtxdMn0XOTZs3VLX8R
 sEi+75xd/gccaDSu2My0W11x2NXuSsLMc+zqWIxAl8uvt4gpSAVz7U06FQxZez3rlDtZ
 BSyx7EOkOAHdsj9gtgtXdckIcV6PnDbvYjuisCAVxU2iCbsSTCs/EE0I7yx0Jp0u1ywn
 5YgE6JN0ftHSi47i0FAvKaGZ1DQzxdY4GhwFj+q9BT493827N3ip4tY5oCcfpMFWi66w
 2z6w==
X-Gm-Message-State: AOAM533ehm8BulhS+J4TmjpI7aHZA55v51Bz3aBN+egp+oR92iujl8eq
 AfhmaGGVH+LUjVwbmo+s4TXe3HV1dqh5X8iZLw8/FE+bGks=
X-Google-Smtp-Source: ABdhPJx2tT32pLMBe/ETq04appLjgR5JqaPIOwjjPXDIviNZnJEEKdWtCGh+Ko6rd/Bw2dFAt/4A9EMFCeGXfn9YOE4=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr12431122qki.487.1617948880016; 
 Thu, 08 Apr 2021 23:14:40 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 06:14:27 +0000
Message-ID: <CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com>
Subject: [GIT PULL] ARM: bmc: devicetree changes for 5.13
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_071442_275813_8A9A73E2 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210409061427.-2bwcwf1XdboWHIgBfLTj8WoIhyaLj_3QxIt955BHik@z>

Hello Soc maintainers,

Here's a pull request from me for the ASPEED and Nuvoton changes
targeting the v5.13 merge window. As you can see I've chosen to
arrange the pull request as one single "BMC-related" set of changes.
If we choose to continue with this, in the future I will cover the
ASPEED, NPCM and soon to be merged WPCM (legacy Nuvoton) systems.

The following changes since commit ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/bmc-5.13-devicetree

for you to fetch changes up to ee33e2fb3d70267de00f7c0b09e7e3b309a686df:

  ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree (2021-04-08 11:21:05 +0930)

----------------------------------------------------------------
BMC device tree updates for 5.13

The ASPEED and Nuvoton pull request now comes as a combined BMC pull
request.

 - New machines

  * ASRock E3C246D4I, an AST2500 BMC for an Xeon E-2100/E-2200 mini-ITX
    system
  * Quanta GBS, an NPCM730 BMC for an x86 server

 - Power10 BMC updates for Everest and Rainier

 - GPIO line names for Mihawk

----------------------------------------------------------------

Alpana Kumari (2):
      ARM: dts: aspeed: rainier: Add presence GPIOs
      ARM: dts: aspeed: everest: GPIOs support

Brandon Wyman (2):
      ARM: dts: aspeed: rainier: Add gpio-keys-polled for fans
      ARM: dts: aspeed: everest: Add power supply i2c devices

Eddie James (7):
      ARM: dts: aspeed: rainier: Add additional processor CFAMs
      ARM: dts: aspeed: rainier: Enable fan watchdog
      ARM: dts: aspeed: rainier 4U: Fix fan configuration
      ARM: dts: aspeed: everest: Add FSI CFAMs and re-number engines
      ARM: dts: aspeed: everest: Add RTC
      ARM: dts: aspeed: everest: Enable fan watchdog
      ARM: dts: aspeed: Add Rainier 1S4U machine

George Hung (1):
      ARM: dts: nuvoton: Add Quanta GBS BMC Device Tree

Jim Wright (1):
      ARM: dts: aspeed: everest: Add UCD90320 power sequencer

Joel Stanley (2):
      ARM: dts: aspeed: rainier: Add missing fan nodes
      ARM: dts: aspeed: everest: Add size/address cells

Matthew Barth (2):
      ARM: dts: aspeed: everest: Add max31785 fan controller device
      ARM: dts: aspeed: everest: Add pca9552 fan presence

Nichole Wang (1):
      ARM: dts: aspeed: mihawk: Add GPIO line names

Priyanga Ramasamy (1):
      ARM: dts: aspeed: everest: Add I2C components

Vishwanatha Subbanna (1):
      ARM: dts: aspeed: rainier: Add directly controlled LEDs

Zev Weiss (1):
      ARM: dts: aspeed: Add ASRock E3C246D4I BMC

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=GSTU=FE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759E4C5519F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 06:43:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8BC4206CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Nov 2020 06:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLGhAkBx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="l6bODzPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8BC4206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nv4YqGAZXU+FgrGb3Hy4Jb3ICfcqF7nmtKlTMo/ezUc=; b=mLGhAkBxULHS3OtOlciwe45Z9n
	IwOCmS54fY3zU2182O3AW0maupjmsHBQ1KTkR9TCX5sSTGI0nqPAIIZhRg8iJfwhR+qnCKDP3XpnE
	CDvkteGKPeSqFyypKIL3UgOz+TCZvsBYRjL0tupkTNfBVcQUBg/4tvtiOBOW5kQSs2a8Il17ZZFMV
	pFdISxyLY7+eOWmySA9jro6LqJSI0oDBHiWZ8Q6d/AsrmqqvaCGeGNFhSR5oLALgZwTY6MKHN8Z7A
	9sx7Nmvu/6pUxQ3MRorgGD8DqbffiLs71Adq1g2wJ1YMsDrM57iemKWXi/LXsY1mWkojKkYacUToO
	X8BBWDTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjcsh-0001Bm-Ad; Mon, 30 Nov 2020 06:41:51 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjcse-0001BO-W3
 for linux-arm-kernel@lists.infradead.org; Mon, 30 Nov 2020 06:41:49 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id cv2so5096449qvb.9
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 22:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CdHx5KiLyaEyJOC9X9oNjng2qNlznD6EoCcuDCWrNT8=;
 b=l6bODzPGxrdcLVgrkechssNiqLkRpX9WT8LeswM/031xZokPqcNgulSTnmyVeosJtJ
 +p4niSgGUL3kf8ugVnFCEAMAFktMyu5W0sejbPS/OW9MSDzIgEk0t12JqwE352+1Q1UM
 tJj2nQskac0vytch8rLOPsoJdCwufHdXO1l44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CdHx5KiLyaEyJOC9X9oNjng2qNlznD6EoCcuDCWrNT8=;
 b=mOcFRDuttCkvz7sWPQctFBBYk6uJafH5kqPNHwmT4qSOD10KQhRssbOLTjIFvF4zrt
 DUL3MSnN9D6wUaZvcYeToB6nf1PylMznhSk121Hvwt1cgghplsSusPE3ZRW9WaHtUJ++
 K7NbN+Sar15jqGhOG32MoHXi07AGGQo0FfzHueoGwmN3ac2OtMKEk7G9UVMjkqoM7MnX
 mOuqmNCccatE02VIqNxzdrOnO466DvfzI72IoCtKFCQKMtvxeUecRWQontYNEoNCI0Wc
 tpj/rKE2B0K/7mEjmYcg8+i4xHpk9SSQWKMgqdr/TKDQsTgeP6YJPM6Wyc356NuA/HHw
 N49A==
X-Gm-Message-State: AOAM533b7WgzClCTMZPM82SOvZvZmxC3Z8C5tE/83aSz/KsYUWMAzpN9
 YY/oY1/C2gSxeikHns+tQtDfOcIRVxBOxBjvw0bPrtTA/Rx2RQ==
X-Google-Smtp-Source: ABdhPJxa/Le1uLRFRYP53fUxHYNmUKAq37dxseEtROHnYq1o89Km+OP/pXw2TYoyxUv2xqW7yinMpFianyxDaV+jmtU=
X-Received: by 2002:a0c:aed4:: with SMTP id n20mr20713780qvd.16.1606718506893; 
 Sun, 29 Nov 2020 22:41:46 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:41:35 +0000
Message-ID: <CACPK8Xe=9ezhyWRMqVOEQr7SU1YoYfVBGGdGzjmE4SiBr--vJQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: actually the soc changes for 5.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_014149_059930_6DFEE19B 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201130064135.r0H5HRX1ztt6Zy7CyjixFFsFGIUrh08D7hXzmJcTdAk@z>

Hello Soc maintainers,

Here are some ASPEED SoC changes for the v5.11 merge window.

These are mostly the 5.10 changes without the XDMA driver, which I
didn't get a response on my question about where we wanted that to
live[1]

https://lore.kernel.org/linux-arm-kernel/CACPK8XcLOopkx0k14k25puD3YkwHzZS0+3TLcEL43xbxCZBphA@mail.gmail.com/

The following changes since commit 4da595ddc06909d9ba8fcedcce0c4e1e0a4c3244:

  soc: aspeed: Enable drivers with ARCH_ASPEED (2020-11-19 23:01:36 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-soc

for you to fetch changes up to 4da595ddc06909d9ba8fcedcce0c4e1e0a4c3244:

  soc: aspeed: Enable drivers with ARCH_ASPEED (2020-11-19 23:01:36 +1030)

----------------------------------------------------------------
ASPEED soc driver updates for 5.11

New drivers:

 - SoC info driver to expose revision information

New features:

 - AST2600 support for the LPC control driver. This includes
   setting the LPC2AHB bridge up in a backwards compatible manner.

Cleanups:

 - LPC control
 - Kconfig
 - Bindings updates for AST2600 strings

----------------------------------------------------------------
Andrew Jeffery (1):
      soc: aspeed-lpc-ctrl: Fail probe of lpc-ctrl if reserved memory
is not aligned

Brad Bishop (2):
      dt-bindings: aspeed-lpc: Add AST2600 compatible strings
      soc: aspeed: lpc: Add AST2600 compatible strings

Dan Carpenter (1):
      soc: aspeed: Fix a reference leak in aspeed_socinfo_init()

Joel Stanley (8):
      soc: aspeed: Improve kconfig
      dt-bindings: aspeed: Add silicon id node to SCU
      soc: aspeed: Add soc info driver
      ARM: dts: aspeed: Add silicon id node
      soc: aspeed-lpc-ctrl: LPC to AHB mapping on ast2600
      soc: aspeed-lpc-ctrl: Fix whitespace
      soc: aspeed-lpc-ctrl: Fix driver name
      soc: aspeed: Enable drivers with ARCH_ASPEED

Tom Rix (1):
      soc: aspeed: remove unneeded semicolon

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

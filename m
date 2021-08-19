Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D89C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 05:33:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B2260EFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 05:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51B2260EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wsgg3RpQ17WjiMeadxLe62gV56co1sdwtprRfB7rVZk=; b=FyONIInSkieqMF
	lbpRVV5RTZ/bpOCsy6Sk+p3A863g0SOsctnLlu0oZfO9sUMfeH1H5CDdqmKE++KIWtuGf4pm3tHxj
	O0JrprTRP7HJh12Gm+irtCt3iT/7EYxuWWNeO4aK2IS6Pn66isluAuKlupZOl0gaN/epjMlV8NqUi
	0ps+hRVocAdzcEvLnVpBZxwm38PuLA4mx7AfgCe3opPTqP3aH5INLA42YKEyOwgTHqBeVj3CZP+1G
	L+0bc6GEOEt+rtwcGAebjgxMxGOFeBVqAdfGqyk9BA4APtxV+wHN1PJ4Szg51lpPUM7DhbI+0x4Ai
	KkNMTF849/bd0E0FJLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGaey-007Gv8-E3; Thu, 19 Aug 2021 05:32:12 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGaes-007GuA-Ia
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 05:32:10 +0000
Received: by mail-qv1-xf33.google.com with SMTP id cu12so1432118qvb.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 18 Aug 2021 22:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=uILcPJJOM+zztrksljRpH+JlVIrsNLx0rX4deMIyXRw=;
 b=Q/Y/nlRa3gEiP7D2ymRx62azW9Y6xeo9lyO/AyKtMLlwqTq8h2QILIobGMGe/vrlaw
 fenV/Ztp0pjXGLnsDKO18cy9CdYcRxG6fQwVrTUh+Gc673s6oNO8UZx19CuYqLjNzJkB
 l20vwXerZDkzbXzll7qKsnKp1uSgJ6Ks8Z8qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=uILcPJJOM+zztrksljRpH+JlVIrsNLx0rX4deMIyXRw=;
 b=J6PkFM6E8BZvW08t61kEZmCDHqjQx71gSW1P48wiIFgfVQUvemrhRq0qGYXANizyiR
 wsJok/JV0t1sXiZYuzyGx5dObBUAumfZDgh5fs5gR5/i3K07uHacuuhapoEnCeIa/I4w
 WPa77KGF8dUons3nYQzbzLSr7eEVP3CvZkXESO/feQL4c6gAwoP4mWCSYjxPq9fHlpnH
 2jfRymJY7UFATfw+9ewwB57COcgD+6wd282CuT5beP4QWymXo0+w8veVCni8fvcUvxMw
 QAVU1mNTJ/tx00KeYaD+SvSwcJ+gaMc3wGmk6gxCV+iFmbWSwiSPsm2l2nCSUGggi9B1
 9tuQ==
X-Gm-Message-State: AOAM530Gx8ADo7b2OjFaZdnx0O0iOoyNde0HGho8hrmetIQ/Nt2fh/B1
 6+bAvh5u6xQgq6JfX95Wv+Bt7ZpWkeqTR13EYTU=
X-Google-Smtp-Source: ABdhPJyLFV4R3lBRTBpqUa3Y8sHajJUfmKf6QmuJrccBRv2MtowA33NMOZbJWKhHPTCr6fsQDVZ68YPQgciEMa+Lemo=
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr13006026qvb.61.1629351124799; 
 Wed, 18 Aug 2021 22:32:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Aug 2021 05:31:53 +0000
Message-ID: <CACPK8XdyT0rCkoeE7x2EQyvFy1Z7ZwFNdm1SQfCG9yC_Z7UbxA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_223206_793415_267B0969 
X-CRM114-Status: UNSURE (   9.31  )
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
Message-ID: <20210819053153.bkdnDk951NAvJTcOWI0e9DbP0cIVT2H72ObDL-NBEh8@z>

Hello Soc maintainers,

Here are some soc changes for 5.15.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-soc

for you to fetch changes up to 2f9b25fa668218f22a85ebe8c55d1d132fc0019d:

  soc: aspeed: Re-enable FWH2AHB on AST2600 (2021-08-19 13:59:28 +0930)

----------------------------------------------------------------
ASPEED soc updates for 5.15

 * Two fixes for drivers that control the mapping of BMC memory over
   PCIe and LPC

 * Re-enable FWH2AHB on systems that have it closed off by default

 * A new id for the AST2625, an AST2600 variant

----------------------------------------------------------------
Iwona Winiarska (2):
      soc: aspeed: lpc-ctrl: Fix boundary check for mmap
      soc: aspeed: p2a-ctrl: Fix boundary check for mmap

Joel Stanley (2):
      soc: aspeed: socinfo: Add AST2625 variant
      soc: aspeed: Re-enable FWH2AHB on AST2600

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 31 ++++++++++++++++++++++++-------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c |  2 +-
 drivers/soc/aspeed/aspeed-socinfo.c  |  1 +
 3 files changed, 26 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

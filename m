Return-Path: <SRS0=N7fp=HB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBD0C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FAE564DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Jan 2021 11:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FAE564DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pW1eI5Eol94Sf+iE+9coUw4SZ+aohcoSHQ3XvKi5G54=; b=WuFUDIM3GXjrMnaCOlfAlcBbF
	JQRg/dbWDhSdIiQzz8JCXW3MkA6mEmfR/twIWzkRmisfcn9vTYGQEEev7pO0G707vZmPMREZnpFEp
	gEfrEmMK5F4UKnkN/4MtSkuHrrRRMI2fmm0IrFj6Qg4o0s1GYLRM9uFV4Ande5wDPEUNpD5E68tO/
	IiScmr/n4ifgKrTzkWlvPlF68KjmC2d1zRpclgW/xQfTsoecRdUOeN1OE+g3yk8u4xKijDjmVyh6j
	ouDV+nrN/wqx809VTU+BJZwDejfs87puaSvO8qaGhuNQcob9tKVBRxlIyTnabOysiSHxvL95Q/tw5
	Hutkif8hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5oWJ-0001Oc-5e; Sat, 30 Jan 2021 11:34:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5oWF-0001Nc-Gn
 for linux-arm-kernel@lists.infradead.org; Sat, 30 Jan 2021 11:34:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B59B64DE7;
 Sat, 30 Jan 2021 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612006462;
 bh=Bso/4fJToGtAt2kHxrbQGJO9hmxtdFSmmqvFwHPj8wU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=snO1dLtv7dI4cuRf+qKgdPVwHeyGQ4QpSkGJC+3BeAPHwzTzwsQURrhyFixtr4PJI
 SQ+k85eNVIWfvW4k6LFcQ/AOw8xEy33rwOg8RXPl9SccfKnKxRCZRH3MA0XR47wGCh
 0/rXxx4fLACu55t+8NdAzL2SpIR+YUZEgJw06sTRxcqqZG7zTpQ6InZ+TB488HKuYW
 guyzE4H1eZLbSGHbKpeU5JiQmyukTHdM7pcvnhk0IWz88ws+QcTwkoJ61JBzxhMa21
 aF5mrjXiUpXSphY6ftHNowlIVNHLLN2SFU0X6MTtJOYyy5f5Dz8wrytmaDwNxA/hbv
 w8mnzW1Vj8a0A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, arm-soc <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL 1/2] Renesas ARM DT updates for v5.12 (take two)
Date: Sat, 30 Jan 2021 12:34:09 +0100
Message-ID: <161200641665.2316427.877722063324058010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129090815.2552425-2-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be>
 <20210129090815.2552425-2-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_063423_627975_15FA10FC 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210130113409.8Aasg3GgECDJvTzPL_iBSBQIfs66mJvXIe67-dqqbZs@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 10:08:14 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 1f4449e12c5c6682a6f4f8dbc7288c19c1c844f1:
> 
>   arm64: dts: renesas: r8a779a0: Add SYS-DMAC nodes (2021-01-14 12:13:00 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag2
> 
> [...]

Merged into arm/dt, thanks!

merge commit: af91156490c2eee7da65e75c10e2457beb9145d8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

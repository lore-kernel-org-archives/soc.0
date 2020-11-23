Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9748FC2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37ED420717
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAzzNWTu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQgwV3HQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37ED420717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=760sV8EdcA90PsGh+LiHKB5yI7v3A4c84jH44LlcpE4=; b=gAzzNWTu/FsGLHZ+uCGAvPa2U
	GiTb3aOH9WmW3BQvGmyqz9AVyMcLgYZ/9338eUHH+YeeGJNXAHcdwu7epcEEr0eUSLlkthdGJ9suM
	6hey9tJ/P8Yf/nepSVWFvsHIYntw1JLU5UzKctKS+wDBcisr7d5uUeiqTIE6JgXiKf5dLrkbSeTtH
	bq2LYqJVroL17FKq9GB2RyYFAX2lK3zComIfBnOhPEGhCeEHT4coH5yv8Ds2c1h6SiOK/wsW0FYTJ
	DB4OV6G5LuvLWipshqSAGXRIhanTh7POsJeUjCEBoEtuPrRViMPxUuCBjrnNnBzs5mX6wjVTbNFWl
	yi0yzhGNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF3p-0002lX-SY; Mon, 23 Nov 2020 16:51:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF3d-0002hp-Ms
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:51:18 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26B2D208FE;
 Mon, 23 Nov 2020 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150277;
 bh=SSZV533nhoCn0ttN2B4umxPv8o/nC6PYQ0aNgTTDDww=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TQgwV3HQ2C4gvX04UP2FOoXkU3f7Qp7XcWSenD2zTLf+FjKL7+1wmLC1V9ocbA4wb
 s9eq26afhgUT+zbsFSDRQlQsZ356wIBpilXP6kcTiChGRlDEiax9jNkDiPyLd4UB00
 ZwwqCkCRkk20m3EchpfPfdMCzFl07nkdqoo3+p1E=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nishanth Menon <nm@ti.com>, soc@kernel.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2] ARM: multi_v7_defconfig: ti: Enable networking options
 for nfs boot
Date: Mon, 23 Nov 2020 17:51:07 +0100
Message-ID: <160615024268.69722.9413431985122966464.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201030124650.20349-1-grygorii.strashko@ti.com>
References: <20201030124650.20349-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115117_837004_A7819ACE 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123165107.i1qksInx9AyiRLAoMYis-fvYtEVLAZxRYG6-PravP_0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Oct 2020 14:46:50 +0200, Grygorii Strashko wrote:
> Enable networking options required for NFS boot on TI platforms, which is
> widely for automated test systems.
> - enable new TI CPSW switch driver and related NET_SWITCHDEV config
> - enable TI DP83867 phy
> - explicitly enable PTP clock support to ensure dependent networking
> drivers will stay built-in.
> 
> [...]

Applied to arm/defconfig, thanks!

[1/1] ARM: multi_v7_defconfig: ti: Enable networking options for nfs boot
      commit: 8195fceca0316c36c87db25750a5c5db84ded4e7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210FFC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:27:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF100610FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF100610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x910pIAJqaM9f9AamD4ZMxXoDkY3PhJuVU/EZcMhrVg=; b=m/WNBjoc/DCWDJFPy16Hfh49h
	0RNs8EP9qvSjXlZwpCOMTu93MoPgZf1GYit+7oL+IVc/cqOXA05Yni4inJxJyYGooD1QqQ1VpiR45
	fCsCSEZQqG2+ipgoTDVOExOsgU5AXcBX4Xx6FLVhZtDyfW5L/AUfxagWM3Z9OB9/pdhXvXPUbfGXR
	oEofsuSV8fEDEddRlAx3rGsaWhoXZ63lzv3/DU6kDkXJC5pawPvaxKrL5LJGsHjGpDlftRUC8qlAy
	Ef1t0qgmCY02hogoGn8kr0luryNE9BNKOqRnUBeaQsWH1JtLkY7RhmVXBe8CkfgaX9ceFW+C+BXDG
	vSfIqdx5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWXJ-008NZr-N2; Thu, 08 Apr 2021 15:25:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWWe-008NPX-9k
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:24:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3C106112F;
 Thu,  8 Apr 2021 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617895495;
 bh=TLpwdhb+A3hEkJ3+J4LoBWIjpmirFUNIFnFTPkHmz80=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZXbaCPzw9oAOwPa31WJTNbiFqc9g2OHccX5WdEuT808HrTpkph3Ttwqq+pjG+zNcO
 NQYtpZpB4TiXPftGRspN8fLWD3EGU1BOsFX9oEttsxb/xKUqVWYzwdAfrEbJWX38ZX
 6LW6g9UhaE05qHYdTfDduBMvQngyq+CNocyl3St1BdrfeSHnVBj/rQrbNj5hZcx99Z
 vI9BCCYbcM8v8wLaGMBltoGIjMzBzf5vO9bnsoGXGd1xrlsY4JvXTVUQ6UAr6IrPIg
 1F14LpqV7toh8TgDCq7g+jJiwuRwIuEJi/t5i1TjvHyKBJG02j1IvjZi+OrgbnJmIv
 TZOSPcBqMqIWQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.13
Date: Thu,  8 Apr 2021 17:24:24 +0200
Message-ID: <161789462018.1629934.16112481410782715304.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <8a3e3271-bebe-4d27-a9e7-7b7a6311a38d.lettre@localhost>
References: <8a3e3271-bebe-4d27-a9e7-7b7a6311a38d.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_162456_549458_A2D7740A 
X-CRM114-Status: UNSURE (   8.37  )
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
Message-ID: <20210408152424.MSIQxMBinA_YqyGdLZae764MiSX-LQdqmMygrIOpZwo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 2 Apr 2021 15:52:36 +0200, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 0d310a3791f6823cf5dcfec5666c1b8cfe6b149b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE84C43462
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:52:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8AD76113B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 15:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8AD76113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S3POd2RC1a17QioE/TJOdnPV7tqLfZB6cBOvwTPvTTA=; b=enIajnNoiu02A/qm0x+3bkeQB
	iyxd4jKS3MwcsevqOznMBRT4I4cbJJIJ/xPOJStFIrx7SEzFj40BEWE57Wblv8KwaCihweHzfLita
	e+QSEb6h0a5mSKcbeAYEBlIpSVbHyRYv8INI7kV6gIgZJt7w8hTR2naGiIDrR9eniaVLP4sxuuyAS
	BKFL3M5i1buwHrEegjJ1FQRh89t9x6/50UGXxqIAv7DWNwJjTOFpUn2jilmPpiNYdG/qFRn5m3zGM
	6sn7BihjceooQwk4skf693y5o8j5DGhR0gZDvnxXuBjWA2RIixVhMdwIJlls0D0cw6AQgsiviMokU
	R6RQbL0Yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUWvw-008Vak-J3; Thu, 08 Apr 2021 15:51:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUWvU-008VNy-4F
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 15:50:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8136E61107;
 Thu,  8 Apr 2021 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617897034;
 bh=KoY+5HON/Q46tIuLclEUxpT3sK+VtgaqdmsDZ1iaPms=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pik3KF3UH/KdV2vel/b+WGtTmcZMjlVFeB12oU+1dZ49kZSDCK7Suza5xJ8u4ROlj
 S9thmD4Kpnr2pk2WKPh9irl8IXAXepzS8E3v6bEc+zUVRubUSpX/UuNUNpPh37S5jj
 Q8ZR6w2sd0/xbDj6rsqqTldSnX/i13jkgBBFocd/fBA0eMNBdfb9R0dgM4XN2YC2Lg
 n8xo7cLcmEpM2wYSWe8Wenf42q9aJOu1/ovBw6BNalsFFaSUWuu/4EKsD+zsbYWeDo
 gOruvxp2s3MJcOCbYC5D0rYeC7GvMSDOz6i4hiqK5tmtvbAPUGC08NYXsDNz+tKN00
 KNeiPcCfWUtgg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [GIT PULL] Allwinner Fixes for 5.12
Date: Thu,  8 Apr 2021 17:50:24 +0200
Message-ID: <161789701009.1636297.18213875716036354287.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <9972a85e-60b7-49f4-a246-db3396dd4764.lettre@localhost>
References: <9972a85e-60b7-49f4-a246-db3396dd4764.lettre@localhost>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_165036_985244_2E83ED1E 
X-CRM114-Status: UNSURE (   8.51  )
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
Message-ID: <20210408155024.I_Jn4cISuyby2qCSStc2nJlf6f1ZMm7okeTBIYFsWBk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 7 Apr 2021 13:45:29 +0200, Maxime Ripard wrote:
> Here's the fixes PR rebase with my SoB added
> 
> Please pull the following changes for the current release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 974be36e1ca987a1940eb6894a2b5bb631049791

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
